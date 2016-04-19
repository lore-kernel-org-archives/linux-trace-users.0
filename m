Return-Path: linux-trace-users-owner@vger.kernel.org
Received: from smtprelay0211.hostedemail.com ([216.40.44.211]:55998 "EHLO
	smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1754499AbcDSUuU (ORCPT
	<rfc822;linux-trace-users@vger.kernel.org>);
	Tue, 19 Apr 2016 16:50:20 -0400
Date: Tue, 19 Apr 2016 16:50:16 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc: "H. Peter Anvin" <hpa@zytor.com>, linux-kernel@vger.kernel.org,
	Ingo Molnar <mingo@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Jiri Olsa <jolsa@kernel.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	linux-trace-users@vger.kernel.org
Subject: Re: [RFC][PATCH 2/4] tracing: Use pid bitmap instead of a pid array
 for set_event_pid
Message-ID: <20160419165016.6d230874@gandalf.local.home>
In-Reply-To: <2093660141.63332.1461097049611.JavaMail.zimbra@efficios.com>
References: <20160419143421.829909157@goodmis.org>
	<20160419143725.295928551@goodmis.org>
	<1694657549.62933.1461084928341.JavaMail.zimbra@efficios.com>
	<20160419131947.3c5208b4@gandalf.local.home>
	<4ACF15B6-D344-4647-9CF8-CEDE5BF5EF70@zytor.com>
	<20160419154113.64f146dc@grimm.local.home>
	<2093660141.63332.1461097049611.JavaMail.zimbra@efficios.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-trace-users-owner@vger.kernel.org
List-ID: <linux-trace-users.vger.kernel.org>

On Tue, 19 Apr 2016 20:17:29 +0000 (UTC)
Mathieu Desnoyers <mathieu.desnoyers@efficios.com> wrote:


> Ah indeed, since there is a hard limit to 4194304, that makes the
> worse case bitmap 512k.

Yep.

> 
> We could argue that given a sparse dataset in the PID table (typical
> in our use-cases), a small hash table would have better cache locality
> than the bitmap. But I agree that the hash table does add a bit of
> complexity, so it becomes a complexity vs cache locality tradeoff.
> So I understand why you would want to go for the simpler bitmap
> solution, unless the hash table would prove to bring a measurable
> performance improvement.

We discussed this too (cache locality), and came to the same conclusion
that a bitmask would still be better. If you think about it, if you
have a lot of CPUs and lots of PIDs, tasks don't migrate as much, and
if they do, cache locality of this bitmap will be the least of the
performance issues. Then you have a limited amount of PIDs per CPU, and
thus those PIDs will probably be in the CPU cache for the bitmap.

Note, that the check of the bitmap to trace a task or not is not done
at every tracepoint. It's only done at sched_switch, and then an
internal flag is set. That flag will determine if the event should be
traced, and that is a single bit checked all the time (very good for
cache).

-- Steve


