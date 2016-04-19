Return-Path: linux-trace-users-owner@vger.kernel.org
Received: from smtprelay0245.hostedemail.com ([216.40.44.245]:59546 "EHLO
	smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1753173AbcDSRTv (ORCPT
	<rfc822;linux-trace-users@vger.kernel.org>);
	Tue, 19 Apr 2016 13:19:51 -0400
Received: from smtprelay.hostedemail.com (10.5.19.251.rfc1918.com [10.5.19.251])
	by smtpgrave06.hostedemail.com (Postfix) with ESMTP id 07EA1173080
	for <linux-trace-users@vger.kernel.org>; Tue, 19 Apr 2016 17:13:28 +0000 (UTC)
Date: Tue, 19 Apr 2016 13:13:07 -0400
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
Subject: Re: [RFC][PATCH 3/4] tracing: Add infrastructure to allow
 set_event_pid to follow children
Message-ID: <20160419131307.6e32f9f0@gandalf.local.home>
In-Reply-To: <1887707510.62932.1461084911586.JavaMail.zimbra@efficios.com>
References: <20160419143421.829909157@goodmis.org>
	<20160419143725.473997738@goodmis.org>
	<1887707510.62932.1461084911586.JavaMail.zimbra@efficios.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-trace-users-owner@vger.kernel.org
List-ID: <linux-trace-users.vger.kernel.org>

On Tue, 19 Apr 2016 16:55:11 +0000 (UTC)
Mathieu Desnoyers <mathieu.desnoyers@efficios.com> wrote:

> ----- On Apr 19, 2016, at 10:34 AM, rostedt rostedt@goodmis.org wrote:
> 
> > From: Steven Rostedt <rostedt@goodmis.org>
> > 
> > Add the infrastructure needed to have the PIDs in set_event_pid to
> > automatically add PIDs of the children of the tasks that have their PIDs in
> > set_event_pid. This will also remove PIDs from set_event_pid when a task
> > exits
> > 
> > This is implemented by adding hooks into the fork and exit tracepoints. On
> > fork, the PIDs are added to the list, and on exit, they are removed.
> > 
> > Add a new option called event_fork that when set, PIDs in set_event_pid will
> > automatically get their children PIDs added when they fork, as well as any
> > task that exits will have its PID removed from set_event_pid.  
> 
> Just out of curiosity: how does it deal with multi-process and multi-thread ?
> What events are expected in each case ?
> 

Not sure what you mean by that. This is in-kernel, and it's simply
tasks. That is, any task (process or thread) that creates another task
has its kernel pid checked. That would be the thread ID as well. So it
works the same with processes as with threads because within the kernel
they are just all just "tasks".

-- Steve
