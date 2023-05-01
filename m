Return-Path: <linux-trace-users-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FC9DC77B73
	for <linux-trace-users@archiver.kernel.org>; Mon,  1 May 2023 15:21:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231438AbjEAPVL convert rfc822-to-8bit (ORCPT
        <rfc822;linux-trace-users@archiver.kernel.org>);
        Mon, 1 May 2023 11:21:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48356 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232301AbjEAPVJ (ORCPT
        <rfc822;linux-trace-users@vger.kernel.org>);
        Mon, 1 May 2023 11:21:09 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2E0910C1
        for <linux-trace-users@vger.kernel.org>; Mon,  1 May 2023 08:21:07 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 3F26460F9B
        for <linux-trace-users@vger.kernel.org>; Mon,  1 May 2023 15:21:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 593D7C433D2;
        Mon,  1 May 2023 15:21:06 +0000 (UTC)
Date:   Mon, 1 May 2023 11:21:03 -0400
From:   Steven Rostedt <rostedt@goodmis.org>
To:     Brian Hutchinson <b.hutchman@gmail.com>
Cc:     linux-trace-users@vger.kernel.org
Subject: Re: Trying to trace when RT FF & RR threads hit RT Throttle limit
 (kernel.sched_rt_runtime_us)
Message-ID: <20230501112103.0957b03a@gandalf.local.home>
In-Reply-To: <CAFZh4h_+v7CKUHb86v_MudO5pG8pvBQwEDOzr+Svs2JGgP64kQ@mail.gmail.com>
References: <CAFZh4h89N2FedvTePY7cXUjwZw61mpjcy+f9oBu5a54gYiozTw@mail.gmail.com>
        <20230501101753.4c4cf74f@gandalf.local.home>
        <CAFZh4h_+v7CKUHb86v_MudO5pG8pvBQwEDOzr+Svs2JGgP64kQ@mail.gmail.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-trace-users.vger.kernel.org>
X-Mailing-List: linux-trace-users@vger.kernel.org

On Mon, 1 May 2023 11:15:45 -0400
Brian Hutchinson <b.hutchman@gmail.com> wrote:

> Hey Steve, good to hear from you.
> 
> On Mon, May 1, 2023 at 10:17 AM Steven Rostedt <rostedt@goodmis.org> wrote:
> >
> > On Mon, 1 May 2023 00:42:03 -0400
> > Brian Hutchinson <b.hutchman@gmail.com> wrote:
> >  
> > > Hi,
> > >
> > > Using 5.10.69 kernel on a i.MX8 platform with isolated cpu's (isolcpus
> > > on cmd line) with RT_RUNTIME_SHARE and wanting to know if (and who) is
> > > hitting the RT Throttle limit.  Since my kernel does not have a
> > > tracepoint for this, I used gdb and disassembled kernel/sched/rt.c to
> > > find the address where throttling gets set and then added a kprobe for
> > > it.  
> >
> > Where exactly did you add this kprobe?  
> 
> It was:
> /sys/kernel/debug/tracing
> 
> echo 'p 0xffff8000100a8e38 %x0' > kprobe_events

I meant, where was the exact location that address pointed to in the code,
not where in the user interface did you add it ;-)

> 
> Your "Fun with Dynamic Kernel Tracing Events" talk in 2018 was cool
> with all those examples but you never gave examples on how to do this
> kind of stuff wink, wink, ha, ha.
> 
> >  
> > >
> > > When I look at the trace I'm seeing what looks like "idle" being
> > > throttled in addition to other things.  I "think" my probe is working
> > > as when I look at the trace, the processes that show up look like they
> > > have run over the 95% limit of one period (defaulted to 1 second) but
> > > I'm confused as to why Idle shows up.  
> >
> > Are you saying this because it's happening while idle is running?  
> 
> I don't know what I'm saying.  Part of me posting was me questioning
> if what I'm seeing is even valid ... but it makes more sense now that
> you point out that it's a hard interrupt happening while idle.  Now I
> just have to figure out which interrupt.
> 
> >  
> > >
> > > I've not ran lttng trace capturing context switches yet to see what
> > > other processes might be involved around the time the throttle kicks
> > > in, at the moment I'm just trying to validate I'm going after the
> > > problem and setting it up the right way.
> > >
> > > I did identify a patch that enables a tracepoint for the rt throttle
> > > but it is for RT_GROUP_SCHED and we aren't using that at the moment.
> > >
> > > I suspect the application I'm trying to debug has some misbehaving
> > > realtime processes (not using a rt patched kernel) that are being
> > > throttled so I'm trying to identify them so they can be studied and
> > > made to behave better.
> > >
> > > If anyone has a better idea or advice on how to go about this please
> > > point me in the right direction.
> > >
> > > Below is a sample of a trace I captured using the kprobe I mentioned
> > > above when rt_throttled=1.  I don't quite understand how Idle can be 3
> > > levels deep in preemption or why "idle" is even showing up.
> > >
> > > CPU's 1, 2 and 3 have been isolated and the application that appears
> > > to be getting throttled is on core 2:
> > >
> > > # tracer: nop
> > > #
> > > # entries-in-buffer/entries-written: 592/592   #P:4
> > > #
> > > #                                _-----=> irqs-off
> > > #                               / _----=> need-resched
> > > #                              | / _---=> hardirq/softirq
> > > #                              || / _--=> preempt-depth
> > > #                              ||| /     delay
> > > #           TASK-PID     CPU#  ||||   TIMESTAMP  FUNCTION
> > > #              | |         |   ||||      |         |
> > >          <idle>-0       [002] d.h3   508.964800: p_0x00000000223c0e95:
> > > (sched_rt_period_timer+0x1f0/0x328) arg1=0x0  
> >
> >
> > Note the "d.h3", which means as the heading states, 'd' is interrupts are
> > disabled, 'h' means it is running in hard interrupt context. That means,
> > even though idle is the current task, an interrupt triggered, and this is
> > running in interrupt context.  
> 
> As I said above, makes more sense why idle is showing up now that you
> pointed that out.  This is an app that was ported from a different OS
> that used a single core arch and now that's its on multicore arch
> (quad core A53's) with SMP Linux, I think there are some old school
> disable interrupts/preempt critical section areas that are going to
> need to be reworked ... which is one of the reasons I believe it was
> necessary to pin the apps to an isolated core on the i.MX8 to get them
> to even run.
> 
> >
> > I see it's running sched_rt_period_timer() which calls
> > do_sched_rt_period_timer(), and if you look at that function, it does
> > for_each_cpu(i, span), checking other CPUs to see if it should be throttled
> > or not.  
> 
> ... about that.  I screwed up and meant to say scheduler features is
> set to NO_RT_RUNTIME_SHARE in the original post as I've read there is
> some weirdness on "what" sched_rt_runtime_us means ... a limit on the
> system as a whole (all cpu's) or each individual cpu. I "believe" the
> way I'm running it is each individual cpu gets sched_rt_runtime_us for
> realtime stuff.

Correct. I've ran some tests on rt spinners where if their affinity is
broad they bounce around CPUs and still maintain 100% CPU resource (but on
different CPUs). But if you pin it to a single CPU, it will get throttled.

> 
> >
> > It's not throttling idle, but the interrupt running on the idle CPU noticed
> > that an RT task needs to be throttled.  
> 
> The trace all appears to be cpu2 context at the moment.  So now I just
> need to figure out how to tell which interrupt it is.
> 
> Thanks Steve.

No problem.

-- Steve

