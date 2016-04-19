Return-Path: linux-trace-users-owner@vger.kernel.org
Received: from mail.kernel.org ([198.145.29.136]:37375 "EHLO mail.kernel.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S932159AbcDSOhe (ORCPT
	<rfc822;linux-trace-users@vger.kernel.org>);
	Tue, 19 Apr 2016 10:37:34 -0400
Message-Id: <20160419143421.829909157@goodmis.org>
Date: Tue, 19 Apr 2016 10:34:21 -0400
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
Subject: [RFC][PATCH 0/4] tracing: Add event-fork to trace tasks children
Sender: linux-trace-users-owner@vger.kernel.org
List-ID: <linux-trace-users.vger.kernel.org>

This code adds the event-fork option that, when set, will have tasks
with their PIDs in set_event_pid add their children PIDs when they
fork. It will also remove their PID from the file on exit.

Thanks to HPA for suggesting the bitmask over the more complex special
"hash" algorithm I originally had. It simplified the code and makes
it more robust.

Steven Rostedt (3):
      tracing: Rename check_ignore_pid() to ignore_this_task()
      tracing: Use pid bitmap instead of a pid array for set_event_pid
      tracing: Add infrastructure to allow set_event_pid to follow children

Steven Rostedt (Red Hat) (1):
      tracing: Update the documentation to describe "event-fork" option

----
 Documentation/trace/ftrace.txt |  34 +++--
 kernel/trace/trace.c           |   3 +
 kernel/trace/trace.h           |   7 +-
 kernel/trace/trace_events.c    | 297 +++++++++++++++++++++++------------------
 4 files changed, 201 insertions(+), 140 deletions(-)
