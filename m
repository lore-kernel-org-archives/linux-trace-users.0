Return-Path: linux-trace-users-owner@vger.kernel.org
Received: from mail.kernel.org ([198.145.29.136]:37363 "EHLO mail.kernel.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754753AbcDSOh3 (ORCPT
	<rfc822;linux-trace-users@vger.kernel.org>);
	Tue, 19 Apr 2016 10:37:29 -0400
Message-Id: <20160419143725.473997738@goodmis.org>
Date: Tue, 19 Apr 2016 10:34:24 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: linux-kernel@vger.kernel.org
Cc: Ingo Molnar <mingo@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Jiri Olsa <jolsa@kernel.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	linux-trace-users@vger.kernel.org
Subject: [RFC][PATCH 3/4] tracing: Add infrastructure to allow set_event_pid to follow children
References: <20160419143421.829909157@goodmis.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15
Content-Disposition: inline; filename=0003-tracing-Add-infrastructure-to-allow-set_event_pid-to.patch
Sender: linux-trace-users-owner@vger.kernel.org
List-ID: <linux-trace-users.vger.kernel.org>

From: Steven Rostedt <rostedt@goodmis.org>

Add the infrastructure needed to have the PIDs in set_event_pid to
automatically add PIDs of the children of the tasks that have their PIDs in
set_event_pid. This will also remove PIDs from set_event_pid when a task
exits

This is implemented by adding hooks into the fork and exit tracepoints. On
fork, the PIDs are added to the list, and on exit, they are removed.

Add a new option called event_fork that when set, PIDs in set_event_pid will
automatically get their children PIDs added when they fork, as well as any
task that exits will have its PID removed from set_event_pid.

This works for instances as well.

Signed-off-by: Steven Rostedt <rostedt@goodmis.org>
---
 kernel/trace/trace.c        |  3 ++
 kernel/trace/trace.h        |  2 ++
 kernel/trace/trace_events.c | 84 +++++++++++++++++++++++++++++++++++++++------
 3 files changed, 79 insertions(+), 10 deletions(-)

diff --git a/kernel/trace/trace.c b/kernel/trace/trace.c
index a2f0b9f33e9b..0d12dbde8399 100644
--- a/kernel/trace/trace.c
+++ b/kernel/trace/trace.c
@@ -3571,6 +3571,9 @@ int set_tracer_flag(struct trace_array *tr, unsigned int mask, int enabled)
 	if (mask == TRACE_ITER_RECORD_CMD)
 		trace_event_enable_cmd_record(enabled);
 
+	if (mask == TRACE_ITER_EVENT_FORK)
+		trace_event_follow_fork(tr, enabled);
+
 	if (mask == TRACE_ITER_OVERWRITE) {
 		ring_buffer_change_overwrite(tr->trace_buffer.buffer, enabled);
 #ifdef CONFIG_TRACER_MAX_TRACE
diff --git a/kernel/trace/trace.h b/kernel/trace/trace.h
index 68cbb8e10aea..2525042760e6 100644
--- a/kernel/trace/trace.h
+++ b/kernel/trace/trace.h
@@ -655,6 +655,7 @@ static inline void __trace_stack(struct trace_array *tr, unsigned long flags,
 extern cycle_t ftrace_now(int cpu);
 
 extern void trace_find_cmdline(int pid, char comm[]);
+extern void trace_event_follow_fork(struct trace_array *tr, bool enable);
 
 #ifdef CONFIG_DYNAMIC_FTRACE
 extern unsigned long ftrace_update_tot_cnt;
@@ -966,6 +967,7 @@ extern int trace_get_user(struct trace_parser *parser, const char __user *ubuf,
 		C(STOP_ON_FREE,		"disable_on_free"),	\
 		C(IRQ_INFO,		"irq-info"),		\
 		C(MARKERS,		"markers"),		\
+		C(EVENT_FORK,		"event-fork"),		\
 		FUNCTION_FLAGS					\
 		FGRAPH_FLAGS					\
 		STACK_FLAGS					\
diff --git a/kernel/trace/trace_events.c b/kernel/trace/trace_events.c
index 45f7cc72bf25..add81dff7520 100644
--- a/kernel/trace/trace_events.c
+++ b/kernel/trace/trace_events.c
@@ -474,11 +474,23 @@ static void ftrace_clear_events(struct trace_array *tr)
 /* Shouldn't this be in a header? */
 extern int pid_max;
 
+/* Returns true if found in filter */
 static bool
-ignore_this_task(struct trace_pid_list *filtered_pids, struct task_struct *task)
+find_filtered_pid(struct trace_pid_list *filtered_pids, pid_t search_pid)
 {
-	pid_t pid;
+	/*
+	 * If pid_max changed after filtered_pids was created, we
+	 * by default ignore all pids greater than the previous pid_max.
+	 */
+	if (search_pid >= filtered_pids->pid_max)
+		return false;
+
+	return test_bit(search_pid, filtered_pids->pids);
+}
 
+static bool
+ignore_this_task(struct trace_pid_list *filtered_pids, struct task_struct *task)
+{
 	/*
 	 * Return false, because if filtered_pids does not exist,
 	 * all pids are good to trace.
@@ -486,16 +498,68 @@ ignore_this_task(struct trace_pid_list *filtered_pids, struct task_struct *task)
 	if (!filtered_pids)
 		return false;
 
-	pid = task->pid;
+	return !find_filtered_pid(filtered_pids, task->pid);
+}
 
-	/*
-	 * If pid_max changed after filtered_pids was created, we
-	 * by default ignore all pids greater than the previous pid_max.
-	 */
-	if (task->pid >= filtered_pids->pid_max)
-		return true;
+static void filter_add_remove_task(struct trace_pid_list *pid_list,
+				   struct task_struct *self,
+				   struct task_struct *task)
+{
+	if (!pid_list)
+		return;
+
+	/* For forks, we only add if the forking task is listed */
+	if (self) {
+		if (!find_filtered_pid(pid_list, self->pid))
+			return;
+	}
+
+	/* Sorry, but we don't support pid_max changing after setting */
+	if (task->pid >= pid_list->pid_max)
+		return;
+
+	/* "self" is set for forks, and NULL for exits */
+	if (self)
+		set_bit(task->pid, pid_list->pids);
+	else
+		clear_bit(task->pid, pid_list->pids);
+}
+
+static void
+event_filter_pid_sched_process_exit(void *data, struct task_struct *task)
+{
+	struct trace_pid_list *pid_list;
+	struct trace_array *tr = data;
+
+	pid_list = rcu_dereference_sched(tr->filtered_pids);
+	filter_add_remove_task(pid_list, NULL, task);
+}
 
-	return !test_bit(task->pid, filtered_pids->pids);
+static void
+event_filter_pid_sched_process_fork(void *data,
+				    struct task_struct *self,
+				    struct task_struct *task)
+{
+	struct trace_pid_list *pid_list;
+	struct trace_array *tr = data;
+
+	pid_list = rcu_dereference_sched(tr->filtered_pids);
+	filter_add_remove_task(pid_list, self, task);
+}
+
+void trace_event_follow_fork(struct trace_array *tr, bool enable)
+{
+	if (enable) {
+		register_trace_prio_sched_process_fork(event_filter_pid_sched_process_fork,
+						       tr, INT_MIN);
+		register_trace_prio_sched_process_exit(event_filter_pid_sched_process_exit,
+						       tr, INT_MAX);
+	} else {
+		unregister_trace_sched_process_fork(event_filter_pid_sched_process_fork,
+						    tr);
+		unregister_trace_sched_process_exit(event_filter_pid_sched_process_exit,
+						    tr);
+	}
 }
 
 static void
-- 
2.8.0.rc3


