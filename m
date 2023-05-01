Return-Path: <linux-trace-users-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07A9FC77B61
	for <linux-trace-users@archiver.kernel.org>; Mon,  1 May 2023 14:18:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232181AbjEAOSA (ORCPT
        <rfc822;linux-trace-users@archiver.kernel.org>);
        Mon, 1 May 2023 10:18:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41572 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229737AbjEAOR7 (ORCPT
        <rfc822;linux-trace-users@vger.kernel.org>);
        Mon, 1 May 2023 10:17:59 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 11153B3
        for <linux-trace-users@vger.kernel.org>; Mon,  1 May 2023 07:17:57 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 9238860EAA
        for <linux-trace-users@vger.kernel.org>; Mon,  1 May 2023 14:17:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7732C433D2;
        Mon,  1 May 2023 14:17:55 +0000 (UTC)
Date:   Mon, 1 May 2023 10:17:53 -0400
From:   Steven Rostedt <rostedt@goodmis.org>
To:     Brian Hutchinson <b.hutchman@gmail.com>
Cc:     linux-trace-users@vger.kernel.org
Subject: Re: Trying to trace when RT FF & RR threads hit RT Throttle limit
 (kernel.sched_rt_runtime_us)
Message-ID: <20230501101753.4c4cf74f@gandalf.local.home>
In-Reply-To: <CAFZh4h89N2FedvTePY7cXUjwZw61mpjcy+f9oBu5a54gYiozTw@mail.gmail.com>
References: <CAFZh4h89N2FedvTePY7cXUjwZw61mpjcy+f9oBu5a54gYiozTw@mail.gmail.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-trace-users.vger.kernel.org>
X-Mailing-List: linux-trace-users@vger.kernel.org

On Mon, 1 May 2023 00:42:03 -0400
Brian Hutchinson <b.hutchman@gmail.com> wrote:

> Hi,
> 
> Using 5.10.69 kernel on a i.MX8 platform with isolated cpu's (isolcpus
> on cmd line) with RT_RUNTIME_SHARE and wanting to know if (and who) is
> hitting the RT Throttle limit.  Since my kernel does not have a
> tracepoint for this, I used gdb and disassembled kernel/sched/rt.c to
> find the address where throttling gets set and then added a kprobe for
> it.

Where exactly did you add this kprobe?

> 
> When I look at the trace I'm seeing what looks like "idle" being
> throttled in addition to other things.  I "think" my probe is working
> as when I look at the trace, the processes that show up look like they
> have run over the 95% limit of one period (defaulted to 1 second) but
> I'm confused as to why Idle shows up.

Are you saying this because it's happening while idle is running?

> 
> I've not ran lttng trace capturing context switches yet to see what
> other processes might be involved around the time the throttle kicks
> in, at the moment I'm just trying to validate I'm going after the
> problem and setting it up the right way.
> 
> I did identify a patch that enables a tracepoint for the rt throttle
> but it is for RT_GROUP_SCHED and we aren't using that at the moment.
> 
> I suspect the application I'm trying to debug has some misbehaving
> realtime processes (not using a rt patched kernel) that are being
> throttled so I'm trying to identify them so they can be studied and
> made to behave better.
> 
> If anyone has a better idea or advice on how to go about this please
> point me in the right direction.
> 
> Below is a sample of a trace I captured using the kprobe I mentioned
> above when rt_throttled=1.  I don't quite understand how Idle can be 3
> levels deep in preemption or why "idle" is even showing up.
> 
> CPU's 1, 2 and 3 have been isolated and the application that appears
> to be getting throttled is on core 2:
> 
> # tracer: nop
> #
> # entries-in-buffer/entries-written: 592/592   #P:4
> #
> #                                _-----=> irqs-off
> #                               / _----=> need-resched
> #                              | / _---=> hardirq/softirq
> #                              || / _--=> preempt-depth
> #                              ||| /     delay
> #           TASK-PID     CPU#  ||||   TIMESTAMP  FUNCTION
> #              | |         |   ||||      |         |
>          <idle>-0       [002] d.h3   508.964800: p_0x00000000223c0e95:
> (sched_rt_period_timer+0x1f0/0x328) arg1=0x0


Note the "d.h3", which means as the heading states, 'd' is interrupts are
disabled, 'h' means it is running in hard interrupt context. That means,
even though idle is the current task, an interrupt triggered, and this is
running in interrupt context.

I see it's running sched_rt_period_timer() which calls
do_sched_rt_period_timer(), and if you look at that function, it does
for_each_cpu(i, span), checking other CPUs to see if it should be throttled
or not.

It's not throttling idle, but the interrupt running on the idle CPU noticed
that an RT task needs to be throttled.

-- Steve


>          <idle>-0       [002] d.h3   508.964815: p_0x00000000223c0e95:
> (sched_rt_period_timer+0x1f0/0x328) arg1=0x0
>          <idle>-0       [002] d.h3   508.964822: p_0x00000000223c0e95:
> (sched_rt_period_timer+0x1f0/0x328) arg1=0x0
>          <idle>-0       [002] d.h3   508.964831: p_0x00000000223c0e95:
> (sched_rt_period_timer+0x1f0/0x328) arg1=0x0
>          <idle>-0       [002] d.h3   509.964801: p_0x00000000223c0e95:
> (sched_rt_period_timer+0x1f0/0x328) arg1=0x0
>          <idle>-0       [002] d.h3   509.964817: p_0x00000000223c0e95:
> (sched_rt_period_timer+0x1f0/0x328) arg1=0x0
>          <idle>-0       [002] d.h3   509.964824: p_0x00000000223c0e95:
> (sched_rt_period_timer+0x1f0/0x328) arg1=0x0
>          <idle>-0       [002] d.h3   509.964832: p_0x00000000223c0e95:
> (sched_rt_period_timer+0x1f0/0x328) arg1=0x0
>          <idle>-0       [002] d.h3   510.964799: p_0x00000000223c0e95:
> (sched_rt_period_timer+0x1f0/0x328) arg1=0x0
>          <idle>-0       [002] d.h3   510.964814: p_0x00000000223c0e95:
> (sched_rt_period_timer+0x1f0/0x328) arg1=0x0
>          <idle>-0       [002] d.h3   510.964821: p_0x00000000223c0e95:
> (sched_rt_period_timer+0x1f0/0x328) arg1=0x0
>          <idle>-0       [002] d.h3   510.964832: p_0x00000000223c0e95:
> (sched_rt_period_timer+0x1f0/0x328) arg1=0x0
>          <idle>-0       [002] d.h3   511.964799: p_0x00000000223c0e95:
> (sched_rt_period_timer+0x1f0/0x328) arg1=0x0
>          <idle>-0       [002] d.h3   511.964816: p_0x00000000223c0e95:
> (sched_rt_period_timer+0x1f0/0x328) arg1=0x0
>          <idle>-0       [002] d.h3   511.964823: p_0x00000000223c0e95:
> (sched_rt_period_timer+0x1f0/0x328) arg1=0x0
>          <idle>-0       [002] d.h3   511.964830: p_0x00000000223c0e95:
> (sched_rt_period_timer+0x1f0/0x328) arg1=0x0
>          <idle>-0       [002] d.h3   512.964800: p_0x00000000223c0e95:
> (sched_rt_period_timer+0x1f0/0x328) arg1=0x0
>          <idle>-0       [002] d.h3   512.964815: p_0x00000000223c0e95:
> (sched_rt_period_timer+0x1f0/0x328) arg1=0x0
>          <idle>-0       [002] d.h3   512.964822: p_0x00000000223c0e95:
> (sched_rt_period_timer+0x1f0/0x328) arg1=0x0
>          <idle>-0       [002] d.h3   512.964829: p_0x00000000223c0e95:
> (sched_rt_period_timer+0x1f0/0x328) arg1=0x0
>          <idle>-0       [002] d.h3   513.964801: p_0x00000000223c0e95:
> (sched_rt_period_timer+0x1f0/0x328) arg1=0x0
>          <idle>-0       [002] d.h3   513.964817: p_0x00000000223c0e95:
> (sched_rt_period_timer+0x1f0/0x328) arg1=0x0
>          <idle>-0       [002] d.h3   513.964826: p_0x00000000223c0e95:
> (sched_rt_period_timer+0x1f0/0x328) arg1=0x0
>          <idle>-0       [002] d.h3   513.964835: p_0x00000000223c0e95:
> (sched_rt_period_timer+0x1f0/0x328) arg1=0x0
>          <idle>-0       [002] d.h3   514.964803: p_0x00000000223c0e95:
> (sched_rt_period_timer+0x1f0/0x328) arg1=0x0
>          <idle>-0       [002] d.h3   514.964818: p_0x00000000223c0e95:
> (sched_rt_period_timer+0x1f0/0x328) arg1=0x0
>          <idle>-0       [002] d.h3   514.964825: p_0x00000000223c0e95:
> (sched_rt_period_timer+0x1f0/0x328) arg1=0x0
>          <idle>-0       [002] d.h3   514.964832: p_0x00000000223c0e95:
> (sched_rt_period_timer+0x1f0/0x328) arg1=0x0
>          <idle>-0       [002] d.h3   515.964801: p_0x00000000223c0e95:
> (sched_rt_period_timer+0x1f0/0x328) arg1=0x0
>          <idle>-0       [002] d.h3   515.964818: p_0x00000000223c0e95:
> (sched_rt_period_timer+0x1f0/0x328) arg1=0x0
>          <idle>-0       [002] d.h3   515.964825: p_0x00000000223c0e95:
> (sched_rt_period_timer+0x1f0/0x328) arg1=0x0
>          <idle>-0       [002] d.h3   515.964834: p_0x00000000223c0e95:
> (sched_rt_period_timer+0x1f0/0x328) arg1=0x0
>          <idle>-0       [002] d.h3   516.964797: p_0x00000000223c0e95:
> (sched_rt_period_timer+0x1f0/0x328) arg1=0x0
>          <idle>-0       [002] d.h3   516.964809: p_0x00000000223c0e95:
> (sched_rt_period_timer+0x1f0/0x328) arg1=0x0
>          <idle>-0       [002] d.h3   516.964815: p_0x00000000223c0e95:
> (sched_rt_period_timer+0x1f0/0x328) arg1=0x0
>          <idle>-0       [002] d.h3   516.964820: p_0x00000000223c0e95:
> (sched_rt_period_timer+0x1f0/0x328) arg1=0x0
>          <idle>-0       [000] d.h3   517.964804: p_0x00000000223c0e95:
> (sched_rt_period_timer+0x1f0/0x328) arg1=0x0
>          <idle>-0       [000] d.h3   517.964820: p_0x00000000223c0e95:
> (sched_rt_period_timer+0x1f0/0x328) arg1=0x0
>          <idle>-0       [000] d.h3   517.964829: p_0x00000000223c0e95:
> (sched_rt_period_timer+0x1f0/0x328) arg1=0x0
>          <idle>-0       [000] d.h3   517.964839: p_0x00000000223c0e95:
> (sched_rt_period_timer+0x1f0/0x328) arg1=0x0
>          <idle>-0       [002] d.h3   518.964799: p_0x00000000223c0e95:
> (sched_rt_period_timer+0x1f0/0x328) arg1=0x0
>          <idle>-0       [002] d.h3   518.964815: p_0x00000000223c0e95:
> (sched_rt_period_timer+0x1f0/0x328) arg1=0x0
>          <idle>-0       [002] d.h3   518.964823: p_0x00000000223c0e95:
> (sched_rt_period_timer+0x1f0/0x328) arg1=0x0
>          <idle>-0       [002] d.h3   518.964831: p_0x00000000223c0e95:
> (sched_rt_period_timer+0x1f0/0x328) arg1=0x0
>          <idle>-0       [002] d.h3   519.964801: p_0x00000000223c0e95:
> (sched_rt_period_timer+0x1f0/0x328) arg1=0x0
>          <idle>-0       [002] d.h3   519.964817: p_0x00000000223c0e95:
> (sched_rt_period_timer+0x1f0/0x328) arg1=0x0
>          <idle>-0       [002] d.h3   519.964824: p_0x00000000223c0e95:
> (sched_rt_period_timer+0x1f0/0x328) arg1=0x0
>          <idle>-0       [002] d.h3   519.964833: p_0x00000000223c0e95:
> (sched_rt_period_timer+0x1f0/0x328) arg1=0x0
>          <idle>-0       [002] d.h3   520.964800: p_0x00000000223c0e95:
> (sched_rt_period_timer+0x1f0/0x328) arg1=0x0
>          <idle>-0       [002] d.h3   520.964815: p_0x00000000223c0e95:
> (sched_rt_period_timer+0x1f0/0x328) arg1=0x0
>          <idle>-0       [002] d.h3   520.964822: p_0x00000000223c0e95:
> (sched_rt_period_timer+0x1f0/0x328) arg1=0x0
>          <idle>-0       [002] d.h3   520.964831: p_0x00000000223c0e95:
> (sched_rt_period_timer+0x1f0/0x328) arg1=0x0
>          <idle>-0       [002] dNh3   521.964811: p_0x00000000223c0e95:
> (sched_rt_period_timer+0x1f0/0x328) arg1=0x0
>          <idle>-0       [002] dNh3   521.964828: p_0x00000000223c0e95:
> (sched_rt_period_timer+0x1f0/0x328) arg1=0x0
>          <idle>-0       [002] dNh3   521.964835: p_0x00000000223c0e95:
> (sched_rt_period_timer+0x1f0/0x328) arg1=0x0
>          <idle>-0       [002] dNh3   521.964847: p_0x00000000223c0e95:
> (sched_rt_period_timer+0x1f0/0x328) arg1=0x0
>          <idle>-0       [002] dNh3   522.964795: p_0x00000000223c0e95:
> (sched_rt_period_timer+0x1f0/0x328) arg1=0x0
>          <idle>-0       [002] dNh3   522.964811: p_0x00000000223c0e95:
> (sched_rt_period_timer+0x1f0/0x328) arg1=0x0
>          <idle>-0       [002] dNh3   522.964819: p_0x00000000223c0e95:
> (sched_rt_period_timer+0x1f0/0x328) arg1=0x0
>          <idle>-0       [002] dNh3   522.964826: p_0x00000000223c0e95:
> (sched_rt_period_timer+0x1f0/0x328) arg1=0x0
>     irq/33-sdma-369     [002] dNh3   523.964811: p_0x00000000223c0e95:
> (sched_rt_period_timer+0x1f0/0x328) arg1=0x0
>     irq/33-sdma-369     [002] dNh3   523.964826: p_0x00000000223c0e95:
> (sched_rt_period_timer+0x1f0/0x328) arg1=0x0
>     irq/33-sdma-369     [002] dNh3   523.964833: p_0x00000000223c0e95:
> (sched_rt_period_timer+0x1f0/0x328) arg1=0x0
>     irq/33-sdma-369     [002] dNh3   523.964842: p_0x00000000223c0e95:
> (sched_rt_period_timer+0x1f0/0x328) arg1=0x0
>     some-thread-758     [002] d.h4   524.964799: p_0x00000000223c0e95:
> (sched_rt_period_timer+0x1f0/0x328) arg1=0x0
>     some-thread-758     [002] d.h4   524.964816: p_0x00000000223c0e95:
> (sched_rt_period_timer+0x1f0/0x328) arg1=0x0
>     some-thread-758     [002] d.h4   524.964825: p_0x00000000223c0e95:
> (sched_rt_period_timer+0x1f0/0x328) arg1=0x0
>     some-thread-758     [002] d.h4   524.964834: p_0x00000000223c0e95:
> (sched_rt_period_timer+0x1f0/0x328) arg1=0x0
>     some-thread-758     [002] d.h3   525.964794: p_0x00000000223c0e95:
> (sched_rt_period_timer+0x1f0/0x328) arg1=0x0
>     some-thread-758     [002] d.h3   525.964810: p_0x00000000223c0e95:
> (sched_rt_period_timer+0x1f0/0x328) arg1=0x0
>     some-thread-758     [002] d.h3   525.964817: p_0x00000000223c0e95:
> (sched_rt_period_timer+0x1f0/0x328) arg1=0x0
>     some-thread-758     [002] d.h3   525.964825: p_0x00000000223c0e95:
> (sched_rt_period_timer+0x1f0/0x328) arg1=0x0
>     some-thread-758     [002] d.h2   526.964793: p_0x00000000223c0e95:
> (sched_rt_period_timer+0x1f0/0x328) arg1=0x0
>     some-thread-758     [002] d.h2   526.964808: p_0x00000000223c0e95:
> (sched_rt_period_timer+0x1f0/0x328) arg1=0x0
>     some-thread-758     [002] d.h2   526.964815: p_0x00000000223c0e95:
> (sched_rt_period_timer+0x1f0/0x328) arg1=0x0
>     some-thread-758     [002] d.h2   526.964823: p_0x00000000223c0e95:
> (sched_rt_period_timer+0x1f0/0x328) arg1=0x0
>     irq/33-sdma-369     [002] d.h4   527.964802: p_0x00000000223c0e95:
> (sched_rt_period_timer+0x1f0/0x328) arg1=0x0
>     irq/33-sdma-369     [002] d.h4   527.964818: p_0x00000000223c0e95:
> (sched_rt_period_timer+0x1f0/0x328) arg1=0x0
>     irq/33-sdma-369     [002] d.h4   527.964826: p_0x00000000223c0e95:
> (sched_rt_period_timer+0x1f0/0x328) arg1=0x0
>     irq/33-sdma-369     [002] d.h4   527.964835: p_0x00000000223c0e95:
> (sched_rt_period_timer+0x1f0/0x328) arg1=0x0
>          <idle>-0       [002] d.h4   528.964803: p_0x00000000223c0e95:
> (sched_rt_period_timer+0x1f0/0x328) arg1=0x0
>          <idle>-0       [002] d.h4   528.964818: p_0x00000000223c0e95:
> (sched_rt_period_timer+0x1f0/0x328) arg1=0x0
>          <idle>-0       [002] d.h4   528.964827: p_0x00000000223c0e95:
> (sched_rt_period_timer+0x1f0/0x328) arg1=0x0
>          <idle>-0       [002] d.h4   528.964837: p_0x00000000223c0e95:
> (sched_rt_period_timer+0x1f0/0x328) arg1=0x0
>          <idle>-0       [002] d.h3   529.964797: p_0x00000000223c0e95:
> (sched_rt_period_timer+0x1f0/0x328) arg1=0x0
>          <idle>-0       [002] d.h3   529.964812: p_0x00000000223c0e95:
> (sched_rt_period_timer+0x1f0/0x328) arg1=0x0
>          <idle>-0       [002] d.h3   529.964820: p_0x00000000223c0e95:
> (sched_rt_period_timer+0x1f0/0x328) arg1=0x0
>          <idle>-0       [002] d.h3   529.964830: p_0x00000000223c0e95:
> (sched_rt_period_timer+0x1f0/0x328) arg1=0x0
>          <idle>-0       [002] dNh3   530.964793: p_0x00000000223c0e95:
> (sched_rt_period_timer+0x1f0/0x328) arg1=0x0
>          <idle>-0       [002] dNh3   530.964808: p_0x00000000223c0e95:
> (sched_rt_period_timer+0x1f0/0x328) arg1=0x0
>          <idle>-0       [002] dNh3   530.964815: p_0x00000000223c0e95:
> (sched_rt_period_timer+0x1f0/0x328) arg1=0x0
>          <idle>-0       [002] dNh3   530.964824: p_0x00000000223c0e95:
> (sched_rt_period_timer+0x1f0/0x328) arg1=0x0
> 
> Thanks for any guidance/pointers.
> 
> Regards,
> 
> Brian

