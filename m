Return-Path: linux-trace-users-owner@vger.kernel.org
Received: from mail.kernel.org ([198.145.29.136]:37384 "EHLO mail.kernel.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S932172AbcDSOhe (ORCPT
	<rfc822;linux-trace-users@vger.kernel.org>);
	Tue, 19 Apr 2016 10:37:34 -0400
Message-Id: <20160419143725.637076387@goodmis.org>
Date: Tue, 19 Apr 2016 10:34:25 -0400
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
Subject: [RFC][PATCH 4/4] tracing: Update the documentation to describe "event-fork" option
References: <20160419143421.829909157@goodmis.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15
Content-Disposition: inline; filename=0004-tracing-Update-the-documentation-to-describe-event-f.patch
Sender: linux-trace-users-owner@vger.kernel.org
List-ID: <linux-trace-users.vger.kernel.org>

From: "Steven Rostedt (Red Hat)" <rostedt@goodmis.org>

Add documentation to the ftrace.txt file in Documentation to describe the
event-fork option. Also add the missing "display-graph" option now that it
shows up in the trace_options file (from a previous commit).

Signed-off-by: Steven Rostedt <rostedt@goodmis.org>
---
 Documentation/trace/ftrace.txt | 34 ++++++++++++++++++++++++----------
 1 file changed, 24 insertions(+), 10 deletions(-)

diff --git a/Documentation/trace/ftrace.txt b/Documentation/trace/ftrace.txt
index f52f297cb406..fdf18485db2b 100644
--- a/Documentation/trace/ftrace.txt
+++ b/Documentation/trace/ftrace.txt
@@ -210,6 +210,11 @@ of ftrace. Here is a list of some of the key files:
 	Note, sched_switch and sched_wake_up will also trace events
 	listed in this file.
 
+	To have the PIDs of children of tasks with their PID in this file
+	added on fork, enable the "event-fork" option. That option will also
+	cause the PIDs of tasks to be removed from this file when the task
+	exits.
+
   set_graph_function:
 
 	Set a "trigger" function where tracing should start
@@ -725,16 +730,14 @@ noraw
 nohex
 nobin
 noblock
-nostacktrace
 trace_printk
-noftrace_preempt
 nobranch
 annotate
 nouserstacktrace
 nosym-userobj
 noprintk-msg-only
 context-info
-latency-format
+nolatency-format
 sleep-time
 graph-time
 record-cmd
@@ -742,7 +745,10 @@ overwrite
 nodisable_on_free
 irq-info
 markers
+noevent-fork
 function-trace
+nodisplay-graph
+nostacktrace
 
 To disable one of the options, echo in the option prepended with
 "no".
@@ -796,11 +802,6 @@ Here are the available options:
 
   block - When set, reading trace_pipe will not block when polled.
 
-  stacktrace - This is one of the options that changes the trace
-	       itself. When a trace is recorded, so is the stack
-	       of functions. This allows for back traces of
-	       trace sites.
-
   trace_printk - Can disable trace_printk() from writing into the buffer.
 
   branch - Enable branch tracing with the tracer.
@@ -897,6 +898,10 @@ x494] <- /root/a.out[+0x4a8] <- /lib/libc-2.7.so[+0x1e1a6]
   	    When disabled, the trace_marker will error with EINVAL
 	    on write.
 
+  event-fork - When set, tasks with PIDs listed in set_event_pid will have
+	       the PIDs of their children added to set_event_pid when those
+	       tasks fork. Also, when tasks with PIDs in set_event_pid exit,
+	       their PIDs will be removed from the file.
 
   function-trace - The latency tracers will enable function tracing
   	    if this option is enabled (default it is). When
@@ -904,8 +909,17 @@ x494] <- /root/a.out[+0x4a8] <- /lib/libc-2.7.so[+0x1e1a6]
 	    functions. This keeps the overhead of the tracer down
 	    when performing latency tests.
 
- Note: Some tracers have their own options. They only appear
-       when the tracer is active.
+  display-graph - When set, the latency tracers (irqsoff, wakeup, etc) will
+	          use function graph tracing instead of function tracing.
+
+  stacktrace - This is one of the options that changes the trace
+	       itself. When a trace is recorded, so is the stack
+	       of functions. This allows for back traces of
+	       trace sites.
+
+ Note: Some tracers have their own options. They only appear in this
+       file when the tracer is active. They always appear in the
+       options directory.
 
 
 
-- 
2.8.0.rc3


