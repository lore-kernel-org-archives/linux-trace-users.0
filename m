Return-Path: <linux-trace-users-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 427AFC77B73
	for <linux-trace-users@archiver.kernel.org>; Mon,  1 May 2023 19:38:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233268AbjEATiM (ORCPT
        <rfc822;linux-trace-users@archiver.kernel.org>);
        Mon, 1 May 2023 15:38:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33904 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233252AbjEAThn (ORCPT
        <rfc822;linux-trace-users@vger.kernel.org>);
        Mon, 1 May 2023 15:37:43 -0400
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB07F4EC3
        for <linux-trace-users@vger.kernel.org>; Mon,  1 May 2023 12:35:56 -0700 (PDT)
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-959a3e2dd27so577469166b.3
        for <linux-trace-users@vger.kernel.org>; Mon, 01 May 2023 12:35:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682969755; x=1685561755;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JVdmq26ZTVE8xxccqp+FyOMBZrf9y2f03J8j4FpW6UY=;
        b=DRda5XczVlm8j/570JAl4Hm4BG/T/qRnM5ji5cIWl+eiRJva0d+2LrfSyuB20Fscd5
         gajyeteI2kQLfhjXVCd/JvfiTNCLz+aRp/4QIToeKWLtGU1aTQLHHKyetA6Q3sbl+ryp
         x+y7EMBJA6ZkkftPEWnov64gaNkAWYRAX2+TNQvbDIvRFpbF3+BMhZEZ0wJtHKow3Cda
         Wihd3OJku/wHd332t0+beWhTJNsGwLiAstQA+QpmBCWvepW1bz6nbnii8mFKzK2BqKD6
         d+kbEx4ZyTopOgMNL+ONuc2kpxqgPO6azGFEtib8Nuicp/516Z3kzujR0/3aPEu9D+oi
         iF3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682969755; x=1685561755;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JVdmq26ZTVE8xxccqp+FyOMBZrf9y2f03J8j4FpW6UY=;
        b=KxjOrBNZOXNixsQWwzjBSUoBf9G7GycMgjeW2ZQoxzVxx/yFyCQIhxaH6CttyTNe5t
         9Te/Six5V0eRpVLLx/Q/fqMFXgQSJ/XyZUGWe9C4QfO7cVAHkGeZFKu0/6kRDpc2FOrR
         qYdCGG6WrC/Xtnui2H2ooc5TtUnhCIvxd9FzFjA7Qd+aIcxdlX1ywFVhXCNkiojL6aXL
         bFP85LzZigrzDR4V10TN/KBpOoVlYG9KdSMBtyv1LwhWdSlDtB2eT07Xw3WJ0rIZyNY8
         CWBJN373u9gHPD8eyadDwsKLEoOdRY0UZF9Dbgwi7FtlhTSkSsabxpjHzHnxetuAkbXv
         9F2w==
X-Gm-Message-State: AC+VfDxQo6DDzkQFQ4ZwVpuSR5cvvIcKv/LwaQNBPXabtwbHu4rfECke
        rIAIOAmwWRpNAhFsAsf80e1iqVWsk4mZPoIOpODzDSTonIo=
X-Google-Smtp-Source: ACHHUZ4EeNkh5qD7hwZbk81Kawjzm40DGlEhMQScvH1+FFHaLP4F/syxIdos1GIbit/01mqJ/xw3uts8TaiPL4Dv5HM=
X-Received: by 2002:a17:907:60d2:b0:95e:ce3b:a471 with SMTP id
 hv18-20020a17090760d200b0095ece3ba471mr13049511ejc.55.1682969754799; Mon, 01
 May 2023 12:35:54 -0700 (PDT)
MIME-Version: 1.0
References: <CAFZh4h89N2FedvTePY7cXUjwZw61mpjcy+f9oBu5a54gYiozTw@mail.gmail.com>
 <20230501101753.4c4cf74f@gandalf.local.home> <CAFZh4h_+v7CKUHb86v_MudO5pG8pvBQwEDOzr+Svs2JGgP64kQ@mail.gmail.com>
 <20230501112103.0957b03a@gandalf.local.home>
In-Reply-To: <20230501112103.0957b03a@gandalf.local.home>
From:   Brian Hutchinson <b.hutchman@gmail.com>
Date:   Mon, 1 May 2023 15:35:43 -0400
Message-ID: <CAFZh4h-VT8T5VB2roQEw7ADT9hXTp-xn6nJan_QN3XRs_5tDGg@mail.gmail.com>
Subject: Re: Trying to trace when RT FF & RR threads hit RT Throttle limit (kernel.sched_rt_runtime_us)
To:     Steven Rostedt <rostedt@goodmis.org>
Cc:     linux-trace-users@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-trace-users.vger.kernel.org>
X-Mailing-List: linux-trace-users@vger.kernel.org

On Mon, May 1, 2023 at 11:21=E2=80=AFAM Steven Rostedt <rostedt@goodmis.org=
> wrote:
>
> On Mon, 1 May 2023 11:15:45 -0400
> Brian Hutchinson <b.hutchman@gmail.com> wrote:
>
> > Hey Steve, good to hear from you.
> >
> > On Mon, May 1, 2023 at 10:17=E2=80=AFAM Steven Rostedt <rostedt@goodmis=
.org> wrote:
> > >
> > > On Mon, 1 May 2023 00:42:03 -0400
> > > Brian Hutchinson <b.hutchman@gmail.com> wrote:
> > >
> > > > Hi,
> > > >
> > > > Using 5.10.69 kernel on a i.MX8 platform with isolated cpu's (isolc=
pus
> > > > on cmd line) with RT_RUNTIME_SHARE and wanting to know if (and who)=
 is
> > > > hitting the RT Throttle limit.  Since my kernel does not have a
> > > > tracepoint for this, I used gdb and disassembled kernel/sched/rt.c =
to
> > > > find the address where throttling gets set and then added a kprobe =
for
> > > > it.
> > >
> > > Where exactly did you add this kprobe?
> >
> > It was:
> > /sys/kernel/debug/tracing
> >
> > echo 'p 0xffff8000100a8e38 %x0' > kprobe_events
>
> I meant, where was the exact location that address pointed to in the code=
,
> not where in the user interface did you add it ;-)

Douh!  Ok, sorry, my bad.

First attempt I put it here:

   915                         if (rt_rq->rt_time || rt_rq->rt_nr_running)
   916                                 idle =3D 0;
   917                         raw_spin_unlock(&rt_rq->rt_runtime_lock);
   918                 } else if (rt_rq->rt_nr_running) {
   919                         idle =3D 0;
   920                         if (!rt_rq_throttled(rt_rq))
   921                                 enqueue =3D 1;
   922                 }
   923                 if (rt_rq->rt_throttled)
   924                         throttled =3D 1;
   925
   926                 if (enqueue)
   927                         sched_rt_rq_enqueue(rt_rq);
   928                 raw_spin_unlock(&rq->lock);
   929         }

on line 924.  I'm not the most versed at A53 assembly code so I
guessed which instruction to use (it's always tricky with pipelining
etc.) then cheated and put a breakpoint on line 924 to confirm and
used that address.

Then later I did the same thing:
964         if (rt_rq->rt_time > runtime) {
   965                 struct rt_bandwidth *rt_b =3D sched_rt_bandwidth(rt_=
rq);
   966
   967                 /*
   968                  * Don't actually throttle groups that have no
runtime assigned
   969                  * but accrue some time due to boosting.
   970                  */
   971                 if (likely(rt_b->rt_runtime)) {
   972                         rt_rq->rt_throttled =3D 1;
   973                         printk_deferred_once("sched: RT
throttling activated\n");
   974                 } else {
   975                         /*
   976                          * In case we did anyway, make it go away,
   977                          * replenishment is a joke, since it
will replenish us
   978                          * with exactly 0 ns.
   979                          */
   980                         rt_rq->rt_time =3D 0;
   981                 }
   982
   983                 if (rt_rq_throttled(rt_rq)) {
   984                         sched_rt_rq_dequeue(rt_rq);
   985                         return 1;
   986                 }
   987         }

... and put a breakpoint on line 972 and used that address for kprobe.

When I did this I pretty much got the same results as before but I got
a lot of trace records more quickly (most were "idle") and a kworker
thread showed up in the mix too.

I'm also not a scheduler expert so I don't quite know the differences
between the two places rt_throttled gets set (although it should be
easy from the copious amount of comments ... not!).  I just suspect
the throttle is kicking in which is choking off sched_other OS stuff
and I'm trying to figure out who's doing it and why.

>
> >
> > Your "Fun with Dynamic Kernel Tracing Events" talk in 2018 was cool
> > with all those examples but you never gave examples on how to do this
> > kind of stuff wink, wink, ha, ha.
> >
> > >
> > > >
> > > > When I look at the trace I'm seeing what looks like "idle" being
> > > > throttled in addition to other things.  I "think" my probe is worki=
ng
> > > > as when I look at the trace, the processes that show up look like t=
hey
> > > > have run over the 95% limit of one period (defaulted to 1 second) b=
ut
> > > > I'm confused as to why Idle shows up.
> > >
> > > Are you saying this because it's happening while idle is running?
> >
> > I don't know what I'm saying.  Part of me posting was me questioning
> > if what I'm seeing is even valid ... but it makes more sense now that
> > you point out that it's a hard interrupt happening while idle.  Now I
> > just have to figure out which interrupt.
> >
> > >
> > > >
> > > > I've not ran lttng trace capturing context switches yet to see what
> > > > other processes might be involved around the time the throttle kick=
s
> > > > in, at the moment I'm just trying to validate I'm going after the
> > > > problem and setting it up the right way.
> > > >
> > > > I did identify a patch that enables a tracepoint for the rt throttl=
e
> > > > but it is for RT_GROUP_SCHED and we aren't using that at the moment=
.
> > > >
> > > > I suspect the application I'm trying to debug has some misbehaving
> > > > realtime processes (not using a rt patched kernel) that are being
> > > > throttled so I'm trying to identify them so they can be studied and
> > > > made to behave better.
> > > >
> > > > If anyone has a better idea or advice on how to go about this pleas=
e
> > > > point me in the right direction.
> > > >
> > > > Below is a sample of a trace I captured using the kprobe I mentione=
d
> > > > above when rt_throttled=3D1.  I don't quite understand how Idle can=
 be 3
> > > > levels deep in preemption or why "idle" is even showing up.
> > > >
> > > > CPU's 1, 2 and 3 have been isolated and the application that appear=
s
> > > > to be getting throttled is on core 2:
> > > >
> > > > # tracer: nop
> > > > #
> > > > # entries-in-buffer/entries-written: 592/592   #P:4
> > > > #
> > > > #                                _-----=3D> irqs-off
> > > > #                               / _----=3D> need-resched
> > > > #                              | / _---=3D> hardirq/softirq
> > > > #                              || / _--=3D> preempt-depth
> > > > #                              ||| /     delay
> > > > #           TASK-PID     CPU#  ||||   TIMESTAMP  FUNCTION
> > > > #              | |         |   ||||      |         |
> > > >          <idle>-0       [002] d.h3   508.964800: p_0x00000000223c0e=
95:
> > > > (sched_rt_period_timer+0x1f0/0x328) arg1=3D0x0
> > >
> > >
> > > Note the "d.h3", which means as the heading states, 'd' is interrupts=
 are
> > > disabled, 'h' means it is running in hard interrupt context. That mea=
ns,
> > > even though idle is the current task, an interrupt triggered, and thi=
s is
> > > running in interrupt context.
> >
> > As I said above, makes more sense why idle is showing up now that you
> > pointed that out.  This is an app that was ported from a different OS
> > that used a single core arch and now that's its on multicore arch
> > (quad core A53's) with SMP Linux, I think there are some old school
> > disable interrupts/preempt critical section areas that are going to
> > need to be reworked ... which is one of the reasons I believe it was
> > necessary to pin the apps to an isolated core on the i.MX8 to get them
> > to even run.
> >
> > >
> > > I see it's running sched_rt_period_timer() which calls
> > > do_sched_rt_period_timer(), and if you look at that function, it does
> > > for_each_cpu(i, span), checking other CPUs to see if it should be thr=
ottled
> > > or not.
> >
> > ... about that.  I screwed up and meant to say scheduler features is
> > set to NO_RT_RUNTIME_SHARE in the original post as I've read there is
> > some weirdness on "what" sched_rt_runtime_us means ... a limit on the
> > system as a whole (all cpu's) or each individual cpu. I "believe" the
> > way I'm running it is each individual cpu gets sched_rt_runtime_us for
> > realtime stuff.
>
> Correct. I've ran some tests on rt spinners where if their affinity is
> broad they bounce around CPUs and still maintain 100% CPU resource (but o=
n
> different CPUs). But if you pin it to a single CPU, it will get throttled=
.

I don't "think" anything is moving around here unless the OS is going
against what it's been told to do.  The cpu's are isolated with
cmdline at boot and the affinity of these processes has been selected
when they startup so they should stay where they are put unless there
is something going on I don't know about.  I think I've seen talk
before that the affinity is just a "suggestion" making me think there
are cases where something could move but if that's true I don't know
what those scenarios are.

Regards,

Brian
