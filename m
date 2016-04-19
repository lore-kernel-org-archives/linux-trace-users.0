Return-Path: linux-trace-users-owner@vger.kernel.org
Received: from mail.kernel.org ([198.145.29.136]:37345 "EHLO mail.kernel.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754750AbcDSOh2 (ORCPT
	<rfc822;linux-trace-users@vger.kernel.org>);
	Tue, 19 Apr 2016 10:37:28 -0400
Message-Id: <20160419143725.104178074@goodmis.org>
Date: Tue, 19 Apr 2016 10:34:22 -0400
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
Subject: [RFC][PATCH 1/4] tracing: Rename check_ignore_pid() to ignore_this_task()
References: <20160419143421.829909157@goodmis.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15
Content-Disposition: inline; filename=0001-tracing-Rename-check_ignore_pid-to-ignore_this_task.patch
Sender: linux-trace-users-owner@vger.kernel.org
List-ID: <linux-trace-users.vger.kernel.org>

From: Steven Rostedt <rostedt@goodmis.org>

The name "check_ignore_pid" is confusing in trying to figure out if the pid
should be ignored or not. Rename it to "ignore_this_task" which is pretty
straight forward, as a task (not a pid) is passed in, and should if true
should be ignored.

Signed-off-by: Steven Rostedt <rostedt@goodmis.org>
---
 kernel/trace/trace_events.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/kernel/trace/trace_events.c b/kernel/trace/trace_events.c
index 05ddc0820771..598a18675a6b 100644
--- a/kernel/trace/trace_events.c
+++ b/kernel/trace/trace_events.c
@@ -484,7 +484,7 @@ static int cmp_pid(const void *key, const void *elt)
 }
 
 static bool
-check_ignore_pid(struct trace_pid_list *filtered_pids, struct task_struct *task)
+ignore_this_task(struct trace_pid_list *filtered_pids, struct task_struct *task)
 {
 	pid_t search_pid;
 	pid_t *pid;
@@ -517,8 +517,8 @@ event_filter_pid_sched_switch_probe_pre(void *data, bool preempt,
 	pid_list = rcu_dereference_sched(tr->filtered_pids);
 
 	this_cpu_write(tr->trace_buffer.data->ignore_pid,
-		       check_ignore_pid(pid_list, prev) &&
-		       check_ignore_pid(pid_list, next));
+		       ignore_this_task(pid_list, prev) &&
+		       ignore_this_task(pid_list, next));
 }
 
 static void
@@ -531,7 +531,7 @@ event_filter_pid_sched_switch_probe_post(void *data, bool preempt,
 	pid_list = rcu_dereference_sched(tr->filtered_pids);
 
 	this_cpu_write(tr->trace_buffer.data->ignore_pid,
-		       check_ignore_pid(pid_list, next));
+		       ignore_this_task(pid_list, next));
 }
 
 static void
@@ -547,7 +547,7 @@ event_filter_pid_sched_wakeup_probe_pre(void *data, struct task_struct *task)
 	pid_list = rcu_dereference_sched(tr->filtered_pids);
 
 	this_cpu_write(tr->trace_buffer.data->ignore_pid,
-		       check_ignore_pid(pid_list, task));
+		       ignore_this_task(pid_list, task));
 }
 
 static void
@@ -564,7 +564,7 @@ event_filter_pid_sched_wakeup_probe_post(void *data, struct task_struct *task)
 
 	/* Set tracing if current is enabled */
 	this_cpu_write(tr->trace_buffer.data->ignore_pid,
-		       check_ignore_pid(pid_list, current));
+		       ignore_this_task(pid_list, current));
 }
 
 static void __ftrace_clear_event_pids(struct trace_array *tr)
@@ -1561,7 +1561,7 @@ static void ignore_task_cpu(void *data)
 					     mutex_is_locked(&event_mutex));
 
 	this_cpu_write(tr->trace_buffer.data->ignore_pid,
-		       check_ignore_pid(pid_list, current));
+		       ignore_this_task(pid_list, current));
 }
 
 static ssize_t
-- 
2.8.0.rc3


