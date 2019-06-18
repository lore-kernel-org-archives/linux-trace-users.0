Return-Path: <SRS0=oy1S=UR=vger.kernel.org=linux-trace-users-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3EAEC31E5B
	for <linux-trace-users@archiver.kernel.org>; Tue, 18 Jun 2019 16:29:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B86CA2054F
	for <linux-trace-users@archiver.kernel.org>; Tue, 18 Jun 2019 16:29:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VASNe892"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729319AbfFRQ3D (ORCPT
        <rfc822;linux-trace-users@archiver.kernel.org>);
        Tue, 18 Jun 2019 12:29:03 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:54363 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729295AbfFRQ3D (ORCPT
        <rfc822;linux-trace-users@vger.kernel.org>);
        Tue, 18 Jun 2019 12:29:03 -0400
Received: by mail-wm1-f68.google.com with SMTP id g135so4004813wme.4
        for <linux-trace-users@vger.kernel.org>; Tue, 18 Jun 2019 09:29:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=jGt1/sdPBLRSCARQuTCvL31FRbq4phDvCQind1TXMh0=;
        b=VASNe892aDygQeizM4nkEaZdfYQfELhOdpEAbOXGs10XU0MjUBF+vZXyGyXbg6swrn
         F5KFmpZtHFvV3DacNHgS53JSaPWRihh/b6VLi6MI15PgXzMRfzvUSKe4wovUgv9UEfpw
         6LS/++W2s/98eRGPLCeA68H16ra1xOM2RInYsaQbVuy75dFk4KzjbWHgJSDJ9CImo+kw
         z0SJse23uDB7HXZJyvkN5H/0MKs2ClSrTzOsCpa2GngjwdxZC4KdLsOSdqiE0zd9IFuA
         zRuq4iXZFcaOlNUfBazuyyeBjBT78nhSDipvocSfOEdw7k2HH6ZwPnT3WwfJIkrNmbm0
         +LTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=jGt1/sdPBLRSCARQuTCvL31FRbq4phDvCQind1TXMh0=;
        b=CnaDe8h6EjQrGKamChavqnrp7cnQQz94RHcGBBh1Jnk6zrWwTVb3nYC9a4cZ19ho17
         KhZxmo5kDNLPR7SseP/zNxq2hrYU7qhIc1oKB2b2FM7CMPJjajyXMxgoixHSBsRGt8np
         QxaefURwqIv8JEupesn8B6fLDf7PUKlWFp0obEN7Uav5IQ7hpzyQlwdmhEkl3/3fGzUy
         y+lWS7Q8lZSbrm7IgD+1KtXxt/2cT3iDuI/WL19lMY6HVO+YWQnvPLH6j39+R+8MTDHW
         uSnkYKsd7zFQKxmH8hQW9M8ATcc12SxXC40LTIqGRnzSva/Q4ETBPlTj518aSjL66eYZ
         aXhQ==
X-Gm-Message-State: APjAAAX+797TsLtkko9LYDp2Cj1Hwys5D2yPKNDKh0lRO1+BF9ldB0nk
        LneSkNPaDGkkKs3opFvxSCWWTXhFR2H9SWKnmu8=
X-Google-Smtp-Source: APXvYqwi1x9h3snCJC1+1cGQ5fSnttiCIrH/VUF+oNiOSS80GxRmjPaIvWt35Eyj8RlBkA8AxwWeHNiDrvvGBTO5k+U=
X-Received: by 2002:a05:600c:2409:: with SMTP id 9mr4172182wmp.110.1560875341562;
 Tue, 18 Jun 2019 09:29:01 -0700 (PDT)
MIME-Version: 1.0
References: <CANpxKHEMjWRSbV8fq_iSR5XAzy7oMuht0xfRTeLtBxajxtW2eg@mail.gmail.com>
 <20190618090235.6a7b5a60@gandalf.local.home>
In-Reply-To: <20190618090235.6a7b5a60@gandalf.local.home>
From:   Naruto Nguyen <narutonguyen2018@gmail.com>
Date:   Tue, 18 Jun 2019 23:28:52 +0700
Message-ID: <CANpxKHF+=LMM7Qnv9NGoPW-t1MbU0etMV_ARrq6Zn=73rq6EDA@mail.gmail.com>
Subject: Re: How to find out which process cause a strange increasing cpu load
 on a certain core?
To:     Steven Rostedt <rostedt@goodmis.org>
Cc:     linux-trace-users@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-trace-users-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-trace-users.vger.kernel.org>
X-Mailing-List: linux-trace-users@vger.kernel.org

Hi Steven,

Thanks a lot for your reply.

It=E2=80=99s higher about 16% usr, 34% sys in top output but as I observe
pidstat has no any process consume this high cpu usage. After reboot
it can happen on a certain core on a certain VM, not fixed to any
core.

For ftrace, I mean function profile tracer by
echo 1 > /sys/kernel/debug/tracing/function_profile_enabled

I will try your suggestion.

Thanks again,
Brs,
Naruto

On Tue, 18 Jun 2019 at 20:02, Steven Rostedt <rostedt@goodmis.org> wrote:
>
> On Tue, 18 Jun 2019 18:40:13 +0700
> Naruto Nguyen <narutonguyen2018@gmail.com> wrote:
>
> > Hello everyone,
> >
> > I have a kvm hypervisor and setup some VMs running OpenSUSE kernel
> > 4.0. After some reboot, I saw that sometime there is a VM that a
> > certain core has higher %usr and %sys than other cores. The system is
> > in ide state. I have some applications running on this VM, but there
> > is no issue in other VMs.
>
> How much higher? And is it always an issue with the same core on the
> same VM?
>
> >
> > If I enable ftrace in kernel or load any debug jprobe, the load is
>
> I'm assuming by "ftrace" you mean the full function tracer?
>
>  # echo function > /sys/kernel/tracing/current_tracer
>
> > back to normal. The pidstat command output does not show the high load
> > on one core like the "top" command. Could you please let me know if it
> > is the problem of "top' report higher usage? Any commands that can
> > help to troubleshoot this issue? I tried "perf" but most of the time
> > the perf output does not show any function that cause the increase as
> > well? Not sure, if the malfunction of top or anything else can add
> > more work load?
>
> I would suggest just tracing sched switches and interrupts. That
> shouldn't affect the load, as it is very low weight.
>
>  # cd /sys/kernel/tracing
>  # echo 1 > events/sched/sched_waking/enable
>  # echo 1 > events/sched/sched_switch/enable
>  # echo 1 > events/irq/enable
>
> And then monitor that.
>
> -- Steve
