Return-Path: <linux-trace-users-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5DE9C77B73
	for <linux-trace-users@archiver.kernel.org>; Mon,  1 May 2023 15:16:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231728AbjEAPQB (ORCPT
        <rfc822;linux-trace-users@archiver.kernel.org>);
        Mon, 1 May 2023 11:16:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45848 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231249AbjEAPQA (ORCPT
        <rfc822;linux-trace-users@vger.kernel.org>);
        Mon, 1 May 2023 11:16:00 -0400
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5CF59187
        for <linux-trace-users@vger.kernel.org>; Mon,  1 May 2023 08:15:59 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-50bc34b98edso2327909a12.3
        for <linux-trace-users@vger.kernel.org>; Mon, 01 May 2023 08:15:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682954158; x=1685546158;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q6Wo3ugHMM5C/sGMt9kI9bbZbDuaeQ0+Ux54EVfUopE=;
        b=N5R0GLmxNbwlQaggUp/phtYm3oiYDfOUpGVctm7lfKk6n3La5iWGHM0X6GGc88pRXV
         1tsRQyWuQCyzEsXgPjmaV4g7bdHjJR6Ivy+0xc9iWWKFo33Hod2UdN/TIrcl4aUv7hXo
         InV6uVgPrzKto4vJKuTdbd7rittaOtVDT9w5NYwiR4o/qMp5J/1AZMZnHVOxBIat1SRf
         xYCCKDQfB+SgBkhrdOIDWTasiixqhFbowyCTQFLJjqw7DxbrukMRoWKYs7g0dABx8EWe
         JWa1VixUm67WcKA4IP0DKFAZO38SyO0GfVzTFyUEAIUwFqJbpy3VqdicyK2cXrsxj0rO
         GTpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682954158; x=1685546158;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q6Wo3ugHMM5C/sGMt9kI9bbZbDuaeQ0+Ux54EVfUopE=;
        b=cVyfWUnGUJeVEqWV1FjWhz41axOQp/JdT4r/xCVWqNw4SFefHTxsO23YXS5ZS7q+rq
         U2UY13q/c6SZbMGFetDsuqGVO55gBLU7hIjrjk7NUVN1mD3dbp/3vzZjyNoHvT0Ql1Vj
         A4TWtBmJ2FOm/eVopJC5Z7+sFyOphwIv/KNuKbDAeiGkde5M2P0UmvDLWHjlp9ilIkr9
         0ig7oBo7v0i2ujnLXTIs0NJCvoN8tS2JjbQ4YhnLw0Tug9CSSa8PW+7fjkpNJkrlGVwk
         Ke6OhyJRmaNe2q1cDwEbJP1n9XFv937SbCNa+e7w9q0YL4YI4Ze+bpd+y0ZT9nUtWxSB
         3/Lg==
X-Gm-Message-State: AC+VfDwDJgx8Q7D1XqJ86zhOmyXN5KL8pZcsT7fQoXrIr9D08m6tXVAt
        sGg+y/6gvjX8MBq8hYuRr3KpfzPwyuUfJp+6ugy6cOWNZ0c=
X-Google-Smtp-Source: ACHHUZ7G0yReWORR1XAjdXtp6YWS7qe8lIM+kos0PWG/z9o/zhViDidAogHzsrIW0Ni5x2kKx9U19mEVDYYjQXhICL4=
X-Received: by 2002:aa7:c246:0:b0:505:34c:eb38 with SMTP id
 y6-20020aa7c246000000b00505034ceb38mr7708169edo.11.1682954157625; Mon, 01 May
 2023 08:15:57 -0700 (PDT)
MIME-Version: 1.0
References: <CAFZh4h89N2FedvTePY7cXUjwZw61mpjcy+f9oBu5a54gYiozTw@mail.gmail.com>
 <20230501101753.4c4cf74f@gandalf.local.home>
In-Reply-To: <20230501101753.4c4cf74f@gandalf.local.home>
From:   Brian Hutchinson <b.hutchman@gmail.com>
Date:   Mon, 1 May 2023 11:15:45 -0400
Message-ID: <CAFZh4h_+v7CKUHb86v_MudO5pG8pvBQwEDOzr+Svs2JGgP64kQ@mail.gmail.com>
Subject: Re: Trying to trace when RT FF & RR threads hit RT Throttle limit (kernel.sched_rt_runtime_us)
To:     Steven Rostedt <rostedt@goodmis.org>
Cc:     linux-trace-users@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-trace-users.vger.kernel.org>
X-Mailing-List: linux-trace-users@vger.kernel.org

Hey Steve, good to hear from you.

On Mon, May 1, 2023 at 10:17=E2=80=AFAM Steven Rostedt <rostedt@goodmis.org=
> wrote:
>
> On Mon, 1 May 2023 00:42:03 -0400
> Brian Hutchinson <b.hutchman@gmail.com> wrote:
>
> > Hi,
> >
> > Using 5.10.69 kernel on a i.MX8 platform with isolated cpu's (isolcpus
> > on cmd line) with RT_RUNTIME_SHARE and wanting to know if (and who) is
> > hitting the RT Throttle limit.  Since my kernel does not have a
> > tracepoint for this, I used gdb and disassembled kernel/sched/rt.c to
> > find the address where throttling gets set and then added a kprobe for
> > it.
>
> Where exactly did you add this kprobe?

It was:
/sys/kernel/debug/tracing

echo 'p 0xffff8000100a8e38 %x0' > kprobe_events

Your "Fun with Dynamic Kernel Tracing Events" talk in 2018 was cool
with all those examples but you never gave examples on how to do this
kind of stuff wink, wink, ha, ha.

>
> >
> > When I look at the trace I'm seeing what looks like "idle" being
> > throttled in addition to other things.  I "think" my probe is working
> > as when I look at the trace, the processes that show up look like they
> > have run over the 95% limit of one period (defaulted to 1 second) but
> > I'm confused as to why Idle shows up.
>
> Are you saying this because it's happening while idle is running?

I don't know what I'm saying.  Part of me posting was me questioning
if what I'm seeing is even valid ... but it makes more sense now that
you point out that it's a hard interrupt happening while idle.  Now I
just have to figure out which interrupt.

>
> >
> > I've not ran lttng trace capturing context switches yet to see what
> > other processes might be involved around the time the throttle kicks
> > in, at the moment I'm just trying to validate I'm going after the
> > problem and setting it up the right way.
> >
> > I did identify a patch that enables a tracepoint for the rt throttle
> > but it is for RT_GROUP_SCHED and we aren't using that at the moment.
> >
> > I suspect the application I'm trying to debug has some misbehaving
> > realtime processes (not using a rt patched kernel) that are being
> > throttled so I'm trying to identify them so they can be studied and
> > made to behave better.
> >
> > If anyone has a better idea or advice on how to go about this please
> > point me in the right direction.
> >
> > Below is a sample of a trace I captured using the kprobe I mentioned
> > above when rt_throttled=3D1.  I don't quite understand how Idle can be =
3
> > levels deep in preemption or why "idle" is even showing up.
> >
> > CPU's 1, 2 and 3 have been isolated and the application that appears
> > to be getting throttled is on core 2:
> >
> > # tracer: nop
> > #
> > # entries-in-buffer/entries-written: 592/592   #P:4
> > #
> > #                                _-----=3D> irqs-off
> > #                               / _----=3D> need-resched
> > #                              | / _---=3D> hardirq/softirq
> > #                              || / _--=3D> preempt-depth
> > #                              ||| /     delay
> > #           TASK-PID     CPU#  ||||   TIMESTAMP  FUNCTION
> > #              | |         |   ||||      |         |
> >          <idle>-0       [002] d.h3   508.964800: p_0x00000000223c0e95:
> > (sched_rt_period_timer+0x1f0/0x328) arg1=3D0x0
>
>
> Note the "d.h3", which means as the heading states, 'd' is interrupts are
> disabled, 'h' means it is running in hard interrupt context. That means,
> even though idle is the current task, an interrupt triggered, and this is
> running in interrupt context.

As I said above, makes more sense why idle is showing up now that you
pointed that out.  This is an app that was ported from a different OS
that used a single core arch and now that's its on multicore arch
(quad core A53's) with SMP Linux, I think there are some old school
disable interrupts/preempt critical section areas that are going to
need to be reworked ... which is one of the reasons I believe it was
necessary to pin the apps to an isolated core on the i.MX8 to get them
to even run.

>
> I see it's running sched_rt_period_timer() which calls
> do_sched_rt_period_timer(), and if you look at that function, it does
> for_each_cpu(i, span), checking other CPUs to see if it should be throttl=
ed
> or not.

... about that.  I screwed up and meant to say scheduler features is
set to NO_RT_RUNTIME_SHARE in the original post as I've read there is
some weirdness on "what" sched_rt_runtime_us means ... a limit on the
system as a whole (all cpu's) or each individual cpu. I "believe" the
way I'm running it is each individual cpu gets sched_rt_runtime_us for
realtime stuff.

>
> It's not throttling idle, but the interrupt running on the idle CPU notic=
ed
> that an RT task needs to be throttled.

The trace all appears to be cpu2 context at the moment.  So now I just
need to figure out how to tell which interrupt it is.

Thanks Steve.

Regards,

Brian
