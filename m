Return-Path: <linux-trace-users-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5CC3C433EF
	for <linux-trace-users@archiver.kernel.org>; Thu, 17 Mar 2022 14:02:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233324AbiCQOEA (ORCPT
        <rfc822;linux-trace-users@archiver.kernel.org>);
        Thu, 17 Mar 2022 10:04:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35398 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234928AbiCQOD6 (ORCPT
        <rfc822;linux-trace-users@vger.kernel.org>);
        Thu, 17 Mar 2022 10:03:58 -0400
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 117CC1E3E00
        for <linux-trace-users@vger.kernel.org>; Thu, 17 Mar 2022 07:02:41 -0700 (PDT)
Received: by mail-wr1-x42c.google.com with SMTP id h15so7515067wrc.6
        for <linux-trace-users@vger.kernel.org>; Thu, 17 Mar 2022 07:02:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=uMHArZwhCCmcPWZ1DDBNn/pirIiwlMl0zTu9v2YTdq0=;
        b=NLdg4VLV0tchREV0ft+KDH1LKy2XFaqarZmM6dYntSyNMHg2rGuTws0C0hM2gR4yZo
         2mCEewI5Ix9KHezS3RuXG1oBgvGvGCApBQiKNrnf81pp0B5LSJ98P/Uo0261Rp2D0JFq
         CtToEcTr4tPrLAipVwRi+2FRzE+Nus6rgADq8m3Rai0GSEY7A2RKySlODK9hwvZQxg0a
         WV68he1wJGX5GABpfpr/oomDyyZPN67SQSUrBxhXYoe/zpsEhiet0dkb9vcFbpNzg999
         PegYLLa1RFnmw64Z/d4xwwdPb9AqgbqP3ZJ24P2rDs7J8WdPoZ4SN1GnQVRrmZl7JNVb
         rqmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=uMHArZwhCCmcPWZ1DDBNn/pirIiwlMl0zTu9v2YTdq0=;
        b=x82WDAelCWljvtNLDmmOnrEmymafJoYpOTgTKNz7LHppWGKLhUBlnvG6RSXYpUQ6tW
         rqiqSZVbBkjTq9p2qnKmdtPyLAk2b59o7j2UiU72n2ApbE5qkSQEpB9saRO6mwKOEnFy
         4vXWSTvG0sc3cpunPcpQFPZpaB8ArBZ9YCD6dyAjpN/uWNc6/tXOPGo/wx637zLlLpMZ
         d/pIjuod7IEJxOhz+1y16w0G6ZT9nY/yRs6GfC8FrOWpWploVCuvqojdUB1wqZ/v2Yld
         0R3S/wLnEJGCPy56Mvs8Zmkk9Xq8hinitGmNZL7cudBfBEND8kTxJfj3fkgYbCpLwpHn
         fFzg==
X-Gm-Message-State: AOAM532qctlgZJIOq4hLy1UNKI3Af0BfpgCU4pMv77StarNYnDp4X+t7
        gHGSe27gENkMU4SE1zNe42oF/Uclm6LzBH2R8Rc0fBW3Mt4=
X-Google-Smtp-Source: ABdhPJyNd50dCCBM+SkGa87MZsIhONyGmOjBQIVu6CK8Jl0cwRhlKeli9KJw7r1MVesQlmSD8jT8cM69mMQip7K1/Rc=
X-Received: by 2002:a05:6000:1e12:b0:203:ed33:8981 with SMTP id
 bj18-20020a0560001e1200b00203ed338981mr2093122wrb.525.1647525760348; Thu, 17
 Mar 2022 07:02:40 -0700 (PDT)
MIME-Version: 1.0
References: <CAMZm_C=NR8rmYn_1gnhw5Udx4ypMZy1nwcFucc0=wbYYHhTpHg@mail.gmail.com>
 <1491155105.129307.1646751686676.JavaMail.zimbra@efficios.com>
In-Reply-To: <1491155105.129307.1646751686676.JavaMail.zimbra@efficios.com>
From:   Federico Di Pierro <nierro92@gmail.com>
Date:   Thu, 17 Mar 2022 15:02:29 +0100
Message-ID: <CAMZm_CneZ+Cd4r2Z22KinWzoZYmBrG50SnLUDkize+CZDKyR0A@mail.gmail.com>
Subject: Re: arm64 execve/clone sys_exit tracepoints
To:     Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc:     linux-trace-users <linux-trace-users@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-trace-users.vger.kernel.org>
X-Mailing-List: linux-trace-users@vger.kernel.org

Sorry for the late reply, I had a (very nice!) laser eye surgery last week :)

> I'm not sure about your clone issue, but wrt execve, I know there
> may be some discrepancy when exec turns a non-compat executable into
> a compat one and vice-versa. Do you exec a binary with a different
> bitness, and therefore a different syscall table, on return from exec ?

I double checked, and it seems like we are calling normal 64bit executables.
To test, I just used a simple C script that when run without arguments,
calls itself with execve + 1 argument (to avoid the recursion),
therefore a 64bit executable that calls another 64bit executable.
Unfortunately the issue is still present.
Thanks for the hint though, it was very helpful!

Federico

Il giorno mar 8 mar 2022 alle ore 16:01 Mathieu Desnoyers
<mathieu.desnoyers@efficios.com> ha scritto:
>
> ----- On Mar 8, 2022, at 5:11 AM, Federico Di Pierro nierro92@gmail.com wrote:
>
> > Hi everyone,
> >
> > While testing Falco on arm64 my team and I encountered some weird
> > issues; basically, it seems like execve() exit tracepoint is never
> > called.
> > Moreover, the clone() exit tracepoint referred to the child process is
> > also missing.
> > The issue is present on both the kmod and eBPF probe.
> >
> > I tested on amznlinux2 with kernel 5.10.96-90.460.amzn2.aarch64, but
> > other team members tested on other kernel versions too (down to
> > 4.14.X).
> > I was also able to reproduce the problem using bpftrace tool: hooking
> > on tracepoint:syscalls:sys_exit_execve; no event is received:
> >
> > bpftrace -e 'tracepoint:syscalls:sys_exit_execve { printf("execve!\n"); }'
> >
> > Since sys_enter tracepoints are indeed called, we'd expect the
> > sys_exit ones to be called too, just like it happens on x86.
> > The question is: are we missing anything obvious here?
>
> I'm not sure about your clone issue, but wrt execve, I know there
> may be some discrepancy when exec turns a non-compat executable into
> a compat one and vice-versa. Do you exec a binary with a different
> bitness, and therefore a different syscall table, on return from exec ?
>
> Thanks,
>
> Mathieu
>
>
> >
> > Thank you very much for your time,
> > Regards
> > Federico
>
> --
> Mathieu Desnoyers
> EfficiOS Inc.
> http://www.efficios.com
