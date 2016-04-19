Return-Path: linux-trace-users-owner@vger.kernel.org
Received: from mail.kernel.org ([198.145.29.136]:37396 "EHLO mail.kernel.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S932174AbcDSOhf (ORCPT
	<rfc822;linux-trace-users@vger.kernel.org>);
	Tue, 19 Apr 2016 10:37:35 -0400
Message-Id: <20160419143725.295928551@goodmis.org>
Date: Tue, 19 Apr 2016 10:34:23 -0400
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
Subject: [RFC][PATCH 2/4] tracing: Use pid bitmap instead of a pid array for set_event_pid
References: <20160419143421.829909157@goodmis.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15
Content-Disposition: inline; filename=0002-tracing-Use-pid-bitmap-instead-of-a-pid-array-for-se.patch
Sender: linux-trace-users-owner@vger.kernel.org
List-ID: <linux-trace-users.vger.kernel.org>

From: Steven Rostedt <rostedt@goodmis.org>

In order to add the ability to let tasks that are filtered by the events
have their children also be traced on fork (and then not traced on exit),
convert the array into a pid bitmask. Most of the time the number of pids is
only 32768 pids or a 4k bitmask, which is the same size as the default list
currently is, and that list could grow if more pids are listed.

This also greatly simplifies the code.

Suggested-by: "H. Peter Anvin" <hpa@zytor.com>
Signed-off-by: Steven Rostedt <rostedt@goodmis.org>
---
 kernel/trace/trace.h        |   5 +-
 kernel/trace/trace_events.c | 221 ++++++++++++++++++++------------------------
 2 files changed, 102 insertions(+), 124 deletions(-)

diff --git a/kernel/trace/trace.h b/kernel/trace/trace.h
index 3fff4adfd431..68cbb8e10aea 100644
--- a/kernel/trace/trace.h
+++ b/kernel/trace/trace.h
@@ -177,9 +177,8 @@ struct trace_options {
 };
 
 struct trace_pid_list {
-	unsigned int			nr_pids;
-	int				order;
-	pid_t				*pids;
+	int				pid_max;
+	unsigned long			*pids;
 };
 
 /*
diff --git a/kernel/trace/trace_events.c b/kernel/trace/trace_events.c
index 598a18675a6b..45f7cc72bf25 100644
--- a/kernel/trace/trace_events.c
+++ b/kernel/trace/trace_events.c
@@ -15,7 +15,7 @@
 #include <linux/kthread.h>
 #include <linux/tracefs.h>
 #include <linux/uaccess.h>
-#include <linux/bsearch.h>
+#include <linux/vmalloc.h>
 #include <linux/module.h>
 #include <linux/ctype.h>
 #include <linux/sort.h>
@@ -471,23 +471,13 @@ static void ftrace_clear_events(struct trace_array *tr)
 	mutex_unlock(&event_mutex);
 }
 
-static int cmp_pid(const void *key, const void *elt)
-{
-	const pid_t *search_pid = key;
-	const pid_t *pid = elt;
-
-	if (*search_pid == *pid)
-		return 0;
-	if (*search_pid < *pid)
-		return -1;
-	return 1;
-}
+/* Shouldn't this be in a header? */
+extern int pid_max;
 
 static bool
 ignore_this_task(struct trace_pid_list *filtered_pids, struct task_struct *task)
 {
-	pid_t search_pid;
-	pid_t *pid;
+	pid_t pid;
 
 	/*
 	 * Return false, because if filtered_pids does not exist,
@@ -496,15 +486,16 @@ ignore_this_task(struct trace_pid_list *filtered_pids, struct task_struct *task)
 	if (!filtered_pids)
 		return false;
 
-	search_pid = task->pid;
+	pid = task->pid;
 
-	pid = bsearch(&search_pid, filtered_pids->pids,
-		      filtered_pids->nr_pids, sizeof(pid_t),
-		      cmp_pid);
-	if (!pid)
+	/*
+	 * If pid_max changed after filtered_pids was created, we
+	 * by default ignore all pids greater than the previous pid_max.
+	 */
+	if (task->pid >= filtered_pids->pid_max)
 		return true;
 
-	return false;
+	return !test_bit(task->pid, filtered_pids->pids);
 }
 
 static void
@@ -602,7 +593,7 @@ static void __ftrace_clear_event_pids(struct trace_array *tr)
 	/* Wait till all users are no longer using pid filtering */
 	synchronize_sched();
 
-	free_pages((unsigned long)pid_list->pids, pid_list->order);
+	vfree(pid_list->pids);
 	kfree(pid_list);
 }
 
@@ -946,11 +937,32 @@ static void t_stop(struct seq_file *m, void *p)
 	mutex_unlock(&event_mutex);
 }
 
+static void *
+p_next(struct seq_file *m, void *v, loff_t *pos)
+{
+	struct trace_array *tr = m->private;
+	struct trace_pid_list *pid_list = rcu_dereference_sched(tr->filtered_pids);
+	unsigned long pid = (unsigned long)v;
+
+	(*pos)++;
+
+	/* pid already is +1 of the actual prevous bit */
+	pid = find_next_bit(pid_list->pids, pid_list->pid_max, pid);
+
+	/* Return pid + 1 to allow zero to be represented */
+	if (pid < pid_list->pid_max)
+		return (void *)(pid + 1);
+
+	return NULL;
+}
+
 static void *p_start(struct seq_file *m, loff_t *pos)
 	__acquires(RCU)
 {
 	struct trace_pid_list *pid_list;
 	struct trace_array *tr = m->private;
+	unsigned long pid;
+	loff_t l = 0;
 
 	/*
 	 * Grab the mutex, to keep calls to p_next() having the same
@@ -963,10 +975,18 @@ static void *p_start(struct seq_file *m, loff_t *pos)
 
 	pid_list = rcu_dereference_sched(tr->filtered_pids);
 
-	if (!pid_list || *pos >= pid_list->nr_pids)
+	if (!pid_list)
+		return NULL;
+
+	pid = find_first_bit(pid_list->pids, pid_list->pid_max);
+	if (pid >= pid_list->pid_max)
 		return NULL;
 
-	return (void *)&pid_list->pids[*pos];
+	/* Return pid + 1 so that zero can be the exit value */
+	for (pid++; pid && l < *pos;
+	     pid = (unsigned long)p_next(m, (void *)pid, &l))
+		;
+	return (void *)pid;
 }
 
 static void p_stop(struct seq_file *m, void *p)
@@ -976,25 +996,11 @@ static void p_stop(struct seq_file *m, void *p)
 	mutex_unlock(&event_mutex);
 }
 
-static void *
-p_next(struct seq_file *m, void *v, loff_t *pos)
-{
-	struct trace_array *tr = m->private;
-	struct trace_pid_list *pid_list = rcu_dereference_sched(tr->filtered_pids);
-
-	(*pos)++;
-
-	if (*pos >= pid_list->nr_pids)
-		return NULL;
-
-	return (void *)&pid_list->pids[*pos];
-}
-
 static int p_show(struct seq_file *m, void *v)
 {
-	pid_t *pid = v;
+	unsigned long pid = (unsigned long)v - 1;
 
-	seq_printf(m, "%d\n", *pid);
+	seq_printf(m, "%lu\n", pid);
 	return 0;
 }
 
@@ -1543,11 +1549,6 @@ show_header(struct file *filp, char __user *ubuf, size_t cnt, loff_t *ppos)
 	return r;
 }
 
-static int max_pids(struct trace_pid_list *pid_list)
-{
-	return (PAGE_SIZE << pid_list->order) / sizeof(pid_t);
-}
-
 static void ignore_task_cpu(void *data)
 {
 	struct trace_array *tr = data;
@@ -1571,7 +1572,7 @@ ftrace_event_pid_write(struct file *filp, const char __user *ubuf,
 	struct seq_file *m = filp->private_data;
 	struct trace_array *tr = m->private;
 	struct trace_pid_list *filtered_pids = NULL;
-	struct trace_pid_list *pid_list = NULL;
+	struct trace_pid_list *pid_list;
 	struct trace_event_file *file;
 	struct trace_parser parser;
 	unsigned long val;
@@ -1579,7 +1580,7 @@ ftrace_event_pid_write(struct file *filp, const char __user *ubuf,
 	ssize_t read = 0;
 	ssize_t ret = 0;
 	pid_t pid;
-	int i;
+	int nr_pids = 0;
 
 	if (!cnt)
 		return 0;
@@ -1592,10 +1593,43 @@ ftrace_event_pid_write(struct file *filp, const char __user *ubuf,
 		return -ENOMEM;
 
 	mutex_lock(&event_mutex);
+	filtered_pids = rcu_dereference_protected(tr->filtered_pids,
+					     lockdep_is_held(&event_mutex));
+
 	/*
-	 * Load as many pids into the array before doing a
-	 * swap from the tr->filtered_pids to the new list.
+	 * Always recreate a new array. The write is an all or nothing
+	 * operation. Always create a new array when adding new pids by
+	 * the user. If the operation fails, then the current list is
+	 * not modified.
 	 */
+	pid_list = kmalloc(sizeof(*pid_list), GFP_KERNEL);
+	if (!pid_list) {
+		read = -ENOMEM;
+		goto out;
+	}
+	pid_list->pid_max = READ_ONCE(pid_max);
+	/* Only truncating will shrink pid_max */
+	if (filtered_pids && filtered_pids->pid_max > pid_list->pid_max)
+		pid_list->pid_max = filtered_pids->pid_max;
+	pid_list->pids = vzalloc((pid_list->pid_max + 7) >> 3);
+	if (!pid_list->pids) {
+		kfree(pid_list);
+		read = -ENOMEM;
+		goto out;
+	}
+	if (filtered_pids) {
+		/* copy the current bits to the new max */
+		pid = find_first_bit(filtered_pids->pids,
+				     filtered_pids->pid_max);
+		while (pid < filtered_pids->pid_max) {
+			set_bit(pid, pid_list->pids);
+			pid = find_next_bit(filtered_pids->pids,
+					    filtered_pids->pid_max,
+					    pid + 1);
+			nr_pids++;
+		}
+	}
+
 	while (cnt > 0) {
 
 		this_pos = 0;
@@ -1613,92 +1647,35 @@ ftrace_event_pid_write(struct file *filp, const char __user *ubuf,
 		ret = -EINVAL;
 		if (kstrtoul(parser.buffer, 0, &val))
 			break;
-		if (val > INT_MAX)
+		if (val >= pid_list->pid_max)
 			break;
 
 		pid = (pid_t)val;
 
-		ret = -ENOMEM;
-		if (!pid_list) {
-			pid_list = kmalloc(sizeof(*pid_list), GFP_KERNEL);
-			if (!pid_list)
-				break;
-
-			filtered_pids = rcu_dereference_protected(tr->filtered_pids,
-							lockdep_is_held(&event_mutex));
-			if (filtered_pids)
-				pid_list->order = filtered_pids->order;
-			else
-				pid_list->order = 0;
-
-			pid_list->pids = (void *)__get_free_pages(GFP_KERNEL,
-								  pid_list->order);
-			if (!pid_list->pids)
-				break;
-
-			if (filtered_pids) {
-				pid_list->nr_pids = filtered_pids->nr_pids;
-				memcpy(pid_list->pids, filtered_pids->pids,
-				       pid_list->nr_pids * sizeof(pid_t));
-			} else
-				pid_list->nr_pids = 0;
-		}
-
-		if (pid_list->nr_pids >= max_pids(pid_list)) {
-			pid_t *pid_page;
-
-			pid_page = (void *)__get_free_pages(GFP_KERNEL,
-							    pid_list->order + 1);
-			if (!pid_page)
-				break;
-			memcpy(pid_page, pid_list->pids,
-			       pid_list->nr_pids * sizeof(pid_t));
-			free_pages((unsigned long)pid_list->pids, pid_list->order);
-
-			pid_list->order++;
-			pid_list->pids = pid_page;
-		}
+		set_bit(pid, pid_list->pids);
+		nr_pids++;
 
-		pid_list->pids[pid_list->nr_pids++] = pid;
 		trace_parser_clear(&parser);
 		ret = 0;
 	}
 	trace_parser_put(&parser);
 
 	if (ret < 0) {
-		if (pid_list)
-			free_pages((unsigned long)pid_list->pids, pid_list->order);
+		vfree(pid_list->pids);
 		kfree(pid_list);
-		mutex_unlock(&event_mutex);
-		return ret;
-	}
-
-	if (!pid_list) {
-		mutex_unlock(&event_mutex);
-		return ret;
+		read = ret;
+		goto out;
 	}
 
-	sort(pid_list->pids, pid_list->nr_pids, sizeof(pid_t), cmp_pid, NULL);
-
-	/* Remove duplicates */
-	for (i = 1; i < pid_list->nr_pids; i++) {
-		int start = i;
-
-		while (i < pid_list->nr_pids &&
-		       pid_list->pids[i - 1] == pid_list->pids[i])
-			i++;
-
-		if (start != i) {
-			if (i < pid_list->nr_pids) {
-				memmove(&pid_list->pids[start], &pid_list->pids[i],
-					(pid_list->nr_pids - i) * sizeof(pid_t));
-				pid_list->nr_pids -= i - start;
-				i = start;
-			} else
-				pid_list->nr_pids = start;
-		}
+	if (!nr_pids) {
+		/* Cleared the list of pids */
+		vfree(pid_list->pids);
+		kfree(pid_list);
+		read = ret;
+		if (!filtered_pids)
+			goto out;
+		pid_list = NULL;
 	}
-
 	rcu_assign_pointer(tr->filtered_pids, pid_list);
 
 	list_for_each_entry(file, &tr->events, list) {
@@ -1708,7 +1685,7 @@ ftrace_event_pid_write(struct file *filp, const char __user *ubuf,
 	if (filtered_pids) {
 		synchronize_sched();
 
-		free_pages((unsigned long)filtered_pids->pids, filtered_pids->order);
+		vfree(filtered_pids->pids);
 		kfree(filtered_pids);
 	} else {
 		/*
@@ -1745,10 +1722,12 @@ ftrace_event_pid_write(struct file *filp, const char __user *ubuf,
 	 */
 	on_each_cpu(ignore_task_cpu, tr, 1);
 
+ out:
 	mutex_unlock(&event_mutex);
 
 	ret = read;
-	*ppos += read;
+	if (read > 0)
+		*ppos += read;
 
 	return ret;
 }
-- 
2.8.0.rc3


