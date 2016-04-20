Return-Path: linux-trace-users-owner@vger.kernel.org
Received: from smtprelay0251.hostedemail.com ([216.40.44.251]:39753 "EHLO
	smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1751878AbcDTCaO (ORCPT
	<rfc822;linux-trace-users@vger.kernel.org>);
	Tue, 19 Apr 2016 22:30:14 -0400
Date: Tue, 19 Apr 2016 22:30:10 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Daniel Bristot de Oliveira <bristot@redhat.com>
Cc: linux-kernel@vger.kernel.org, Ingo Molnar <mingo@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Jiri Olsa <jolsa@kernel.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	linux-trace-users@vger.kernel.org
Subject: Re: [RFC][PATCH 0/4] tracing: Add event-fork to trace tasks
 children
Message-ID: <20160419223010.3c46e254@grimm.local.home>
In-Reply-To: <5716E3E8.7000609@redhat.com>
References: <20160419143421.829909157@goodmis.org>
	<5716E3E8.7000609@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-trace-users-owner@vger.kernel.org
List-ID: <linux-trace-users.vger.kernel.org>

On Tue, 19 Apr 2016 23:05:28 -0300
Daniel Bristot de Oliveira <bristot@redhat.com> wrote:

> On 04/19/2016 11:34 AM, Steven Rostedt wrote:
> > This code adds the event-fork option that, when set, will have tasks
> > with their PIDs in set_event_pid add their children PIDs when they
> > fork. It will also remove their PID from the file on exit.  
> 
> That is a nice feature! I tested it and it works. But, look this...
> 
> Set the event-fork, the current shell pid, and enable the trace:
> 
> [root@f23 tracing]# echo event-fork > trace_options 
> [root@f23 tracing]# echo $$ > set_ftrace_pid 

event-fork does not affect function tracing. I'm currently working on
patches to create a function-fork option for 4.8.

-- Steve
