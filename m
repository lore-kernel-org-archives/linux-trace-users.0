Return-Path: linux-trace-users-owner@vger.kernel.org
Received: from smtprelay0067.hostedemail.com ([216.40.44.67]:45553 "EHLO
	smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1752369AbcDVPa0 (ORCPT
	<rfc822;linux-trace-users@vger.kernel.org>);
	Fri, 22 Apr 2016 11:30:26 -0400
Date: Fri, 22 Apr 2016 11:30:19 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Namhyung Kim <namhyung@kernel.org>
Cc: <linux-kernel@vger.kernel.org>, Ingo Molnar <mingo@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Jiri Olsa <jolsa@kernel.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	<linux-trace-users@vger.kernel.org>
Subject: Re: [RFC][PATCH 2/4] tracing: Use pid bitmap instead of a pid array
 for set_event_pid
Message-ID: <20160422113019.5b2d5cc8@gandalf.local.home>
In-Reply-To: <20160422024530.GA1790@sejong>
References: <20160419143421.829909157@goodmis.org>
	<20160419143725.295928551@goodmis.org>
	<20160422024530.GA1790@sejong>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-trace-users-owner@vger.kernel.org
List-ID: <linux-trace-users.vger.kernel.org>

On Fri, 22 Apr 2016 11:45:30 +0900
Namhyung Kim <namhyung@kernel.org> wrote:

> > +	pid_list->pid_max = READ_ONCE(pid_max);
> > +	/* Only truncating will shrink pid_max */
> > +	if (filtered_pids && filtered_pids->pid_max > pid_list->pid_max)
> > +		pid_list->pid_max = filtered_pids->pid_max;
> > +	pid_list->pids = vzalloc((pid_list->pid_max + 7) >> 3);
> > +	if (!pid_list->pids) {
> > +		kfree(pid_list);
> > +		read = -ENOMEM;
> > +		goto out;
> > +	}
> > +	if (filtered_pids) {
> > +		/* copy the current bits to the new max */
> > +		pid = find_first_bit(filtered_pids->pids,
> > +				     filtered_pids->pid_max);
> > +		while (pid < filtered_pids->pid_max) {
> > +			set_bit(pid, pid_list->pids);
> > +			pid = find_next_bit(filtered_pids->pids,
> > +					    filtered_pids->pid_max,
> > +					    pid + 1);
> > +			nr_pids++;
> > +		}  
> 
> Why not just use memcpy and keep nr_pids in the pid_list?

This is the slow path (very slow ;-), and this was the first method
that came to my mind (while I programmed this during a conference). I
could use memcpy, or simply one of the bitmask copies, and then get the
nr_pids from bitmask_weight(). I would not keep nr_pids in pid_list
because that would mean that I would have to manage it in the fast path.

Maybe later I'll convert it to bitmap_copy(), but for now I'll just
keep it as is. I move this code in my queue for 4.8, and don't want to
deal with conflicts unless there's a real bug discovered.

Thanks for looking at this code!

-- Steve

