Return-Path: linux-trace-users-owner@vger.kernel.org
Received: from smtprelay0168.hostedemail.com ([216.40.44.168]:44915 "EHLO
	smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1751808AbcDSWtc (ORCPT
	<rfc822;linux-trace-users@vger.kernel.org>);
	Tue, 19 Apr 2016 18:49:32 -0400
Date: Tue, 19 Apr 2016 18:49:28 -0400
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
Message-ID: <20160419184928.3bcd0d84@gandalf.local.home>
In-Reply-To: <568915868.63547.1461100941927.JavaMail.zimbra@efficios.com>
References: <20160419143421.829909157@goodmis.org>
	<20160419143725.295928551@goodmis.org>
	<1694657549.62933.1461084928341.JavaMail.zimbra@efficios.com>
	<20160419131947.3c5208b4@gandalf.local.home>
	<4ACF15B6-D344-4647-9CF8-CEDE5BF5EF70@zytor.com>
	<20160419154113.64f146dc@grimm.local.home>
	<2093660141.63332.1461097049611.JavaMail.zimbra@efficios.com>
	<20160419165016.6d230874@gandalf.local.home>
	<568915868.63547.1461100941927.JavaMail.zimbra@efficios.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-trace-users-owner@vger.kernel.org
List-ID: <linux-trace-users.vger.kernel.org>

On Tue, 19 Apr 2016 21:22:21 +0000 (UTC)
Mathieu Desnoyers <mathieu.desnoyers@efficios.com> wrote:

> It makes sense. Anyway, looking back at my own implementation, I have
> an array of 64 hlist_head entries (64 * 8 = 512 bytes), typically
> populated by NULL pointers. It's only a factor 8 smaller than the
> bitmap, so it's not a huge gain.

Actually we talked about a second level bitmap for quicker searchers. I
can't remember what it was called, but I'm sure HPA can ;-)

Basically it was a much smaller bitmap, where each bit represents a
number of bits in the main bitmap. When a bit is set in the main
bitmap, its corresponding bit is set in the smaller one. This means
that if you don't have many PIDs, the smaller bitmap wont have many
bits set either, and you keep all the checks very cache local, because
you are checking the smaller bitmap most of the time. But this too
makes things more complex, especially when clearing a bit (although,
that only happens on exit, where speed isn't a big deal). But we
decided it still wasn't worth it.

> 
> One alternative approach would be to keep a few entries (e.g. 16 PIDs)
> in a fast-path lookup array that fits in a single-cache line. When the
> number of PIDs to track go beyond that, fall-back to the bitmap instead.
> 
> > 
> > Note, that the check of the bitmap to trace a task or not is not done
> > at every tracepoint. It's only done at sched_switch, and then an
> > internal flag is set. That flag will determine if the event should be
> > traced, and that is a single bit checked all the time (very good for
> > cache).  
> 
> Could this be used by multiple tracers, and used in a multi-session scheme ?
> In lttng, one user may want to track a set of PIDs, whereas another user may
> be concurrently interested by another set.

I should specify, the bit isn't in the task struct, because different
trace instances may have different criteria to what task may be traced.
That is, you can have multiple buffers tracing multiple tasks. The
tracepoint has a private data structure attached to it that is added
when a tracepoint is registered. This data is a descriptor that
represents the trace instance. This instance descriptor has a flag to
ignore or trace the task.


> 
> Currently, in the lttng kernel tracer, we do the hash table query for
> each tracepoint hit, which is clearly not as efficient as checking a
> task struct flag. One option I see would be to set the task struct flag
> whenever there is at least one tracer/tracing session that is interested
> in this event (this would end up being a reference count on the flag). Then,
> for every flag check that passes, lttng could do HT/bitmap lookups to see if
> the event needs to go to each specific session.
> 
> Is this task struct "trace" flag currently exposed to tracers through a
> reference-counting enable/disable API ? If not, do you think it would make
> sense ?
> 

Nope. As I said, it's on my own descriptor that is passed through the
tracepoint private data.

If you look at my code, you'll notice that I pass around a
"trace_array" struct (tr), which represents all the information about a
single trace instance. What tracer is running, what events are enabled,
and even keeps track of the file descriptors holding the trace event
information. This "tr" has a per_cpu "buffer" section that contains per
cpu data (like the ring buffer). It also has a "data" section for
miscellaneous fields. One of them is now "ignore" which is set when
filtering is on and the sched_switch event noticed that the new task
shouldn't be traced for this instance.

If there's multiple instances, then there will be multiple callbacks
done at each sched_switch. One for each instance.

-- Steve
