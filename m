Return-Path: linux-trace-users-owner@vger.kernel.org
Received: from smtprelay0020.hostedemail.com ([216.40.44.20]:54982 "EHLO
	smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1752725AbcDSRTu (ORCPT
	<rfc822;linux-trace-users@vger.kernel.org>);
	Tue, 19 Apr 2016 13:19:50 -0400
Date: Tue, 19 Apr 2016 13:19:47 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc: linux-kernel@vger.kernel.org, Ingo Molnar <mingo@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Jiri Olsa <jolsa@kernel.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	linux-trace-users@vger.kernel.org
Subject: Re: [RFC][PATCH 2/4] tracing: Use pid bitmap instead of a pid array
 for set_event_pid
Message-ID: <20160419131947.3c5208b4@gandalf.local.home>
In-Reply-To: <1694657549.62933.1461084928341.JavaMail.zimbra@efficios.com>
References: <20160419143421.829909157@goodmis.org>
	<20160419143725.295928551@goodmis.org>
	<1694657549.62933.1461084928341.JavaMail.zimbra@efficios.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-trace-users-owner@vger.kernel.org
List-ID: <linux-trace-users.vger.kernel.org>

On Tue, 19 Apr 2016 16:55:28 +0000 (UTC)
Mathieu Desnoyers <mathieu.desnoyers@efficios.com> wrote:

> ----- On Apr 19, 2016, at 10:34 AM, rostedt rostedt@goodmis.org wrote:
> 
> > From: Steven Rostedt <rostedt@goodmis.org>
> > 
> > In order to add the ability to let tasks that are filtered by the events
> > have their children also be traced on fork (and then not traced on exit),
> > convert the array into a pid bitmask. Most of the time the number of pids is
> > only 32768 pids or a 4k bitmask, which is the same size as the default list
> > currently is, and that list could grow if more pids are listed.
> > 
> > This also greatly simplifies the code.  
> 
> The maximum PID number can be increased with sysctl.
> 
> See "pid_max" in Documentation/sysctl/kernel.txt
> 
> What happens when you have a very large pid_max set ?

I discussed this with HPA, and it appears that the pid_max max would
require a bitmap of about 1/2 meg (the current default is 8k). This is
also why I chose to keep the bitmap as vmalloc and not a continuous
page allocation.

> 
> You say "most of the time" as if this was a fast-path vs a slow-path,
> but it is not the case here.

I meant "most of the time" as "default". Yes, you can make the pid_max
really big, but in that case you better have enough memory in your
system to handle that many threads. Thus a 1/2 meg used for tracking
pids shouldn't be an issue.

> 
> This is a configuration option that can significantly hurt memory usage
> in configurations using a large pid_max.

No, it is created dynamically. If you never write anything into the
set_event_pid file, then you have nothing to worry about, as nothing
is allocated. It creates the array when a pid is added to the file, and
only then. If it fails to allocate, the write will return -ENOMEM as the
errno.

Again, if you have a large pid_max your box had better have a lot of
memory to begin with, because this array will be negligible compared to
the memory required to handle large number of tasks.

> 
> FWIW, I implement a similar feature with a hash table in lttng-modules.
> I don't have the child process tracking though, which is a neat improvement.

I originally had a complex hash algorithm because I too was worried
about the size of pid_max and using a bitmap, but HPA convinced me it
was the way to go.

-- Steve
