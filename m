Return-Path: <SRS0=CYr2=A3=vger.kernel.org=linux-trace-users-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 370FBC433E1
	for <linux-trace-users@archiver.kernel.org>; Thu, 16 Jul 2020 01:04:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 06E4820791
	for <linux-trace-users@archiver.kernel.org>; Thu, 16 Jul 2020 01:04:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1594861469;
	bh=R3WQKO9ff74TDp0o71oyL9/ZiJ5upum8roG9fFyqByU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-ID:From;
	b=MmL9sa5tXCWmhodwA+EyRs87uOXU/vyoP9gD3bWELTGxRJ7JcqNSofA+0xVpDX5QU
	 80FpeHOvLo44d0r0m9UCR7/T2GYnPmGLbXWxaS8/Wt7QqfV8mRTeOr08BlA3mml/+K
	 4efouDkd7QaNiMGhlqos6OCUD56y9JqHIO7Zwktg=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726998AbgGPBE2 (ORCPT
        <rfc822;linux-trace-users@archiver.kernel.org>);
        Wed, 15 Jul 2020 21:04:28 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:38652 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726479AbgGPBE2 (ORCPT
        <rfc822;linux-trace-users@vger.kernel.org>);
        Wed, 15 Jul 2020 21:04:28 -0400
Received: by mail-wr1-f68.google.com with SMTP id z13so5058591wrw.5
        for <linux-trace-users@vger.kernel.org>; Wed, 15 Jul 2020 18:04:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=R3WQKO9ff74TDp0o71oyL9/ZiJ5upum8roG9fFyqByU=;
        b=LxBAq/LUNKgTM9nf20yPIKNVQ0ofWPvPJwT/cEd8BJLugG1gcNLDtszFH+WY0R1n3D
         Xoobpxw8uenj9e4a0wDWmstOgv2fo5KTOo+JcmlRqM3cpJM2T0Q8YZ4T7+qv5RXN5W3j
         Y7ISmSwmfb/sYOP2iO9IsfoePcDFMZk9XtE8exoUFo0v/Hrz2+T2oLMyOVYLZjmcB1En
         F5gJdvuJj1sjAeedh8+Inbo2jBztY71/iMCUVXT1T0CTbxQA44KTgkt3HnH5J7wdxkNL
         5ejs8dw4wHKVXmejbRTWycASanudRXHvlFW+aencirit/+/NQUSJFn1pWATzWcPiklKq
         eYXw==
X-Gm-Message-State: AOAM533l2AgrMZuWbzj7PDCDqNZ/O/5USAVgXEfEU2wA524xBt7Y9p4P
        00Xfayn06wNcZfY9cC2EL/vKt9ZEhbY4nmAWwu8=
X-Google-Smtp-Source: ABdhPJwLxBC8+Wt/qiTVi6+dQvWhvYxZbP9HEPZxfahJ5EHfYrTrPUCURbhwgwMx4vAedGpU87KKtVHlELCXtr/eOjQ=
X-Received: by 2002:a05:6000:1006:: with SMTP id a6mr2167022wrx.332.1594861466727;
 Wed, 15 Jul 2020 18:04:26 -0700 (PDT)
MIME-Version: 1.0
References: <e9c7400ff0075f3beba2863c4432a905@ut.ac.ir> <20200715142849.0bfe909a@oasis.local.home>
In-Reply-To: <20200715142849.0bfe909a@oasis.local.home>
From:   Namhyung Kim <namhyung@kernel.org>
Date:   Thu, 16 Jul 2020 10:04:15 +0900
Message-ID: <CAM9d7chE3WQm2e4EA4i09Q1hOaGt2hrPHoF2d0tjqhciPceB9g@mail.gmail.com>
Subject: Re: Capturing User-Level Function Calls/Returns
To:     Steven Rostedt <rostedt@goodmis.org>
Cc:     ahmadkhorrami <ahmadkhorrami@ut.ac.ir>,
        Linux-trace Users <linux-trace-users@vger.kernel.org>,
        lttng-dev@lists.lttng.org,
        Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
        =?UTF-8?Q?J=C3=A9r=C3=A9mie_Galarneau?= 
        <jeremie.galarneau@efficios.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-trace-users-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-trace-users.vger.kernel.org>
X-Mailing-List: linux-trace-users@vger.kernel.org

Hi all,

On Thu, Jul 16, 2020 at 3:28 AM Steven Rostedt <rostedt@goodmis.org> wrote:
>
> On Wed, 15 Jul 2020 20:37:16 +0430
> ahmadkhorrami <ahmadkhorrami@ut.ac.ir> wrote:
>
> > Hi,
> > What is the most efficient way to capture occurrence of a function
> > call/return of a binary program in userspace?
> > It seems the answer is Uprobes. 1) Am I right?
> > But Uprobes use "int" instruction which leads to a switch into kernel
> > mode. 2) Wouldn't it be better to avoid this transition?
> > I'm looking forward to your reply and will be happy to read your
> > opinions.
> > Regards.
>
>
> Hi, I believe LTTng has utilities that can help you trace user space
> programs.
>
> I think there's also a users ftrace like utility that Namhyung was
> working on. But I don't know where in the development that is.

It's in https://github.com/namhyung/uftrace

Basically it also requires recompilation to add mcount calls for each function.
But it now also supports dynamic tracing without any recompilation.. :)
It's still experimental and has some limitation, but the idea is to copy
first 5 bytes (on x86_64) somewhere and replace it to a call instruction.

Thanks
Namhyung
