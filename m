Return-Path: linux-trace-users-owner@vger.kernel.org
Received: from smtprelay0179.hostedemail.com ([216.40.44.179]:47838 "EHLO
	smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S933182AbcDSTlR (ORCPT
	<rfc822;linux-trace-users@vger.kernel.org>);
	Tue, 19 Apr 2016 15:41:17 -0400
Date: Tue, 19 Apr 2016 15:41:13 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: "H. Peter Anvin" <hpa@zytor.com>
Cc: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	linux-kernel@vger.kernel.org, Ingo Molnar <mingo@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Jiri Olsa <jolsa@kernel.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	linux-trace-users@vger.kernel.org
Subject: Re: [RFC][PATCH 2/4] tracing: Use pid bitmap instead of a pid array
 for set_event_pid
Message-ID: <20160419154113.64f146dc@grimm.local.home>
In-Reply-To: <4ACF15B6-D344-4647-9CF8-CEDE5BF5EF70@zytor.com>
References: <20160419143421.829909157@goodmis.org>
	<20160419143725.295928551@goodmis.org>
	<1694657549.62933.1461084928341.JavaMail.zimbra@efficios.com>
	<20160419131947.3c5208b4@gandalf.local.home>
	<4ACF15B6-D344-4647-9CF8-CEDE5BF5EF70@zytor.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-trace-users-owner@vger.kernel.org
List-ID: <linux-trace-users.vger.kernel.org>

On Tue, 19 Apr 2016 11:57:32 -0700
"H. Peter Anvin" <hpa@zytor.com> wrote:

> Also, I understand there is one of these bitmaps per ring buffer, and
> the ring buffer is in the tens of megabytes.

Right, there's only one bitmap per tracing instance, which in most
cases is just one (I know of people who make more). And by default, the
tracing buffer is 1.4 megs per CPU.

If you have a pid_max of the max size, I highly doubt you will be doing
that on a single CPU machine. If you have 48 CPUs, the ring buffer will
be 1.4 * 48 megs, making the 1/2 meg bitmap a nit.

I will say, there may be two bitmaps soon, because I plan on adding
this same code to the function tracer logic.

-- Steve
