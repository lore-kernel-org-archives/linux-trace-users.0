Return-Path: <linux-trace-users-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D774DC28B2B
	for <linux-trace-users@archiver.kernel.org>; Fri, 19 Aug 2022 18:05:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349623AbiHSSFC (ORCPT
        <rfc822;linux-trace-users@archiver.kernel.org>);
        Fri, 19 Aug 2022 14:05:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33374 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349184AbiHSSEQ (ORCPT
        <rfc822;linux-trace-users@vger.kernel.org>);
        Fri, 19 Aug 2022 14:04:16 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7BA86641C
        for <linux-trace-users@vger.kernel.org>; Fri, 19 Aug 2022 10:50:36 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 12EBD617E9
        for <linux-trace-users@vger.kernel.org>; Fri, 19 Aug 2022 17:50:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0BBAFC433D6;
        Fri, 19 Aug 2022 17:50:34 +0000 (UTC)
Date:   Fri, 19 Aug 2022 13:50:47 -0400
From:   Steven Rostedt <rostedt@goodmis.org>
To:     Prasad Pandit <ppandit@redhat.com>,
        Daniel Bristot de Oliveira <bristot@kernel.org>
Cc:     linux-trace-users@vger.kernel.org
Subject: Re: About tracing clues
Message-ID: <20220819135047.45243742@gandalf.local.home>
In-Reply-To: <CAE8KmOwGONSzSDczNdadyMSvn84qBbqS0wKUMbctnPgio0Uxgg@mail.gmail.com>
References: <CAE8KmOwGONSzSDczNdadyMSvn84qBbqS0wKUMbctnPgio0Uxgg@mail.gmail.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-trace-users.vger.kernel.org>
X-Mailing-List: linux-trace-users@vger.kernel.org

On Fri, 19 Aug 2022 15:36:03 +0530
Prasad Pandit <ppandit@redhat.com> wrote:

> Hello,
> 
> * While running oslat(8) tests in a guest running on RHEL kernel-rt
> host, I'm seeing occasional peculiar latency spikes as below
> ===
> # trace-cmd record -p nop --poll -M 1E -e all
> /home/test/rt-tests/oslat --cpu-list 1-4 --rtprio 1 --duration 12h -T
> 30

Hmm you need to turn off line wraps when pasting in output like this.
Because the line wraps make it very difficult to follow.

/me fixes it:

> ===
> # trace-cmd record -p nop --poll -M 1E -e all /home/test/rt-tests/oslat --cpu-list 1-4 --rtprio 1 --duration 12h -T 30 oslat V 2.30
> INFO: debugfs mountpoint: /sys/kernel/debug/tracing/
> Total runtime:          43200 seconds
> Thread priority:        SCHED_FIFO:1
> CPU list:               1-4
> CPU for main thread:    0
> Workload:               no
> Workload mem:           0 (KiB)
> Preheat cores:          4
> 
> Pre-heat for 1 seconds...
> Test starts...
> /home/test/rt-tests/oslat: Trace threshold (30 us) triggered on cpu 2
> with 67 us!
> Stopping the test.
> ...
>              <idle>-0     [002]   265.041487: tlb_flush: pages=0 reason=flush on task switch (0)
>            oslat-16074 [002]   265.041489: print: tracing_mark_write: /home/test/rt-tests/oslat: Starting thread on CPU 2.
>            oslat-16074 [002]   265.041490: kfree: (__audit_syscall_exit+0x249) call_site=ffffffff95fb8889 ptr=(nil)
>            oslat-16074 [002]   265.041490: sys_exit:             NR 1 = 53
>            oslat-16074 [002]   265.041490: sys_exit_write:       0x35
>            oslat-16074 [002]   265.041490: user_enter:
>            oslat-16074 [002]   300.576710: user_exit:

Here's where it exits the user app.

Hmm, what's the 24us delay here?

>            oslat-16074 [002]   300.576734: irq_handler_entry: irq=21 name=virtio3
>            oslat-16074 [002]   300.576734: irq_handler_exit: irq=21 ret=handled
>            oslat-16074 [002]   300.576734: sched_waking: comm=irq/21-virtio3 pid=219 prio=49 target_cpu=002
>            oslat-16074 [002]   300.576736: sched_migrate_task: comm=irq/21-virtio3 pid=219 prio=49 orig_cpu=2 dest_cpu=0
>            oslat-16074 [002]   300.576740: write_msr:            830, value fd
>            oslat-16074 [002]   300.576740: sched_wakeup: irq/21-virtio3:219 [49] success=1 CPU:000
>            oslat-16074 [002]   300.576742: read_msr:             819, value 4
>            oslat-16074 [002]   300.576754: irq_matrix_alloc: bit=38 cpu=0 online=1 avl=195 alloc=6 managed=1 online_maps=6 global_avl=1178, global_rsvd=10, total_alloc=28
>            oslat-16074 [002]   300.576755: vector_update: irq=21 vector=38 cpu=0 prev_vector=34 prev_cpu=2
>            oslat-16074 [002]   300.576755: vector_alloc: irq=21 vector=38 reserved=0 ret=0
>            oslat-16074 [002]   300.576756: vector_config: irq=21 vector=38 cpu=0 apicdest=0x00000000

And here's where it enters.


>            oslat-16074 [002]   300.576773: user_enter:
>            oslat-16074 [002]   300.576778: user_exit:
>            oslat-16074 [002]   300.576778: sys_enter:            NR 1 (3, 7fcbb683c300, 65, 0, 0, 7fcbb683b816)
>            oslat-16074 [002]   300.576778: sys_enter_write:      fd: 0x00000003, buf: 0x7fcbb683c300, count: 0x00000065
>            oslat-16074 [002]   300.576780: print: tracing_mark_write: /home/test/rt-tests/oslat: Trace threshold (30 us) triggered on cpu 2 with 67 us!  Stopping the test.
>            oslat-16074 [002]   300.576780: kfree: (__audit_syscall_exit+0x249) call_site=ffffffff95fb8889 ptr=(nil)
>            oslat-16074 [002]   300.576781: sys_exit:             NR 1 = 101
>            oslat-16074 [002]   300.576781: sys_exit_write:       0x65
>            oslat-16074 [002]   300.576781: user_enter:
> ===



> 
> * Looking at these traces it is difficult to see/conclude the source
> of the said (67us) latency spike.
> * Other logs I have for the same host/guest show
> _call_function_entry/exit or timer softirq entries in traces.
> * Peculiar is that these spikes seem to occur when oslat(8) is invoked
> after the guest boot-up.
>    Subsequent oslat(8) sessions in the same guest run over 12 hrs
> without any sign of latency spike.
> 
> * Is there a way to find further clues or conclusively figure out the
> source of such occasional latency spikes?
> 

Since this is run on a guest, the host can obviously cause noise. If you
have the latest trace-cmd (at least 3.1.2) and install that on both the
host and guest, you can do a trace to get more info. You can even start
trace-cmd on the guest and kick off the host. But you need to have vsockets
enabled on the guest.

To get the vsocket CID id, you can run the agent:

  # trace-cmd agent
listening on @3:823

The @3 is the CID (823 is the port).

Hit Ctrl-C on to kill the agent.

Then on the host, run:

 # trace-cmd agent -P 3

Where 3 is the CID of the guest you want to connect the host (the same
number from the 'trace-cmd agent'. That is, if it was @4:823, then use
'-P 4'). The host agent above should also have a:

 listening on @2:823

or something. You'll need the host's CID too.

Then on the guest, run:

[ You do not need -p nop if you have -e used ]

  # trace-cmd record --poll -M 1E -e all --proxy 2 --name host -e kvm -e sched -e irq /home/test/rt-tests/oslat --cpu-list 1-4 --rtprio 1 --duration 12h -T 30 oslat V 2.30

And then when it ends, you'll have two files. One that is trace.dat and one
that is trace-host.dat. If everything worked well, the two would also be in
sync with each other. Doing:

  # trace-cmd report -i trace-host.dat -i trace.dat

Will show the host events happening with the guest events. If the host
caused the latency, you will definitely see it.

If you have the latest kernelshark, you can run:

  kernelshark trace-host.dat -a trace.dat

And then select "Plots" -> "KVM Combo Plots" and in the popup, select the
box for "all".

Then you'll see plots for each virtual CPU and the host thread that
represents it.

-- Steve


