Return-Path: linux-trace-users-owner@vger.kernel.org
Received: from smtprelay0094.hostedemail.com ([216.40.44.94]:45859 "EHLO
	smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1752468AbcDSXGL (ORCPT
	<rfc822;linux-trace-users@vger.kernel.org>);
	Tue, 19 Apr 2016 19:06:11 -0400
Date: Tue, 19 Apr 2016 19:06:05 -0400
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
Message-ID: <20160419190605.37eb52d9@gandalf.local.home>
In-Reply-To: <2099338042.63665.1461106754326.JavaMail.zimbra@efficios.com>
References: <20160419143421.829909157@goodmis.org>
	<20160419131947.3c5208b4@gandalf.local.home>
	<4ACF15B6-D344-4647-9CF8-CEDE5BF5EF70@zytor.com>
	<20160419154113.64f146dc@grimm.local.home>
	<2093660141.63332.1461097049611.JavaMail.zimbra@efficios.com>
	<20160419165016.6d230874@gandalf.local.home>
	<568915868.63547.1461100941927.JavaMail.zimbra@efficios.com>
	<20160419184928.3bcd0d84@gandalf.local.home>
	<2099338042.63665.1461106754326.JavaMail.zimbra@efficios.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-trace-users-owner@vger.kernel.org
List-ID: <linux-trace-users.vger.kernel.org>

On Tue, 19 Apr 2016 22:59:14 +0000 (UTC)
Mathieu Desnoyers <mathieu.desnoyers@efficios.com> wrote:

> ----- On Apr 19, 2016, at 6:49 PM, rostedt rostedt@goodmis.org wrote:
> 
> > On Tue, 19 Apr 2016 21:22:21 +0000 (UTC)
> > Mathieu Desnoyers <mathieu.desnoyers@efficios.com> wrote:
> >   
> >> It makes sense. Anyway, looking back at my own implementation, I have
> >> an array of 64 hlist_head entries (64 * 8 = 512 bytes), typically
> >> populated by NULL pointers. It's only a factor 8 smaller than the
> >> bitmap, so it's not a huge gain.  
> > 
> > Actually we talked about a second level bitmap for quicker searchers. I
> > can't remember what it was called, but I'm sure HPA can ;-)
> > 
> > Basically it was a much smaller bitmap, where each bit represents a
> > number of bits in the main bitmap. When a bit is set in the main
> > bitmap, its corresponding bit is set in the smaller one. This means
> > that if you don't have many PIDs, the smaller bitmap wont have many
> > bits set either, and you keep all the checks very cache local, because
> > you are checking the smaller bitmap most of the time. But this too
> > makes things more complex, especially when clearing a bit (although,
> > that only happens on exit, where speed isn't a big deal). But we
> > decided it still wasn't worth it.  
> 
> Seems like an interesting possible improvement if ever needed.
> 

One reason we decided against it is, if you think about use cases; if
you are tracing a single task, and other tasks are created around it in
the same time period, you will have pids of tasks running that are
close to the pid of the traced task. That means the bit in the smaller
array will most likely be always set, and now you are taking two cache
hits to find the pid you are looking for, and not gaining anything out
of it.

-- Steve
