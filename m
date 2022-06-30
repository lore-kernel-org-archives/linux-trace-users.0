Return-Path: <linux-trace-users-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 438CBCCA483
	for <linux-trace-users@archiver.kernel.org>; Thu, 30 Jun 2022 14:13:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236633AbiF3ONb (ORCPT
        <rfc822;linux-trace-users@archiver.kernel.org>);
        Thu, 30 Jun 2022 10:13:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40936 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237281AbiF3OM6 (ORCPT
        <rfc822;linux-trace-users@vger.kernel.org>);
        Thu, 30 Jun 2022 10:12:58 -0400
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A77BA39162
        for <linux-trace-users@vger.kernel.org>; Thu, 30 Jun 2022 06:56:57 -0700 (PDT)
Received: by mail-wm1-x330.google.com with SMTP id l2-20020a05600c4f0200b0039c55c50482so1789605wmq.0
        for <linux-trace-users@vger.kernel.org>; Thu, 30 Jun 2022 06:56:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=MxrSvMD8egFKF8MznpmcU2pBN/DyCU9p44N2OscRYSc=;
        b=mPP0uFT6PR+8EkHFzeGzamj0KWfwgJF/ZPnlDkBO56bbEhSuyPrF2pTta/vzAdLwPi
         f9cdU3kGDL3KCD9nea8Hgfyr/T2toiN5gmRux4v4LZD/CPQrkhhe6ioGuG6eDdIITcNh
         etMud2trbqbRjUSZ31Pd7yqao7tRtoWm5avAZj0WTI+l6sBqnlQTLcqZSjJMyu9654L3
         dyvG8ff/HtZfwmaWtsGOP+kZxLkCUiQRB3LLT/Pr0cREzFPv7awD2SzRvXOHsRs+N9GL
         SLJHdzJ637Lid6Z5S6SU6fCxeb2X27s8rjoDxjJd7/o4dO7JiosPFDgNafJ1bGX08aQn
         m4Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MxrSvMD8egFKF8MznpmcU2pBN/DyCU9p44N2OscRYSc=;
        b=QM1CZCdb9ihUuT5jMLS2S2AuM/lyFeptA7rplbm0vnnLUUnz/phsDnFi5Fgi/Oayxe
         Du3ww3IyYSsUlP2W+6t8gVbfdHY98j0yzE2wwcztj3oatg0Xclg2AvkpYx7Rrzk0JDO7
         VKgQ81HRdMTMNX3SVHW/2Ttc7tPgbvo0PF2U9rzIQ9ucwHluZicI6bEzMbJR0TpiATcw
         i55FGGljdpIeoa77NNWA+SK2Y9ar8VPeQrBiC2dI8oDg3TkIbLSk3CBv3XV1dd2qnTNa
         uD3rTv61hX57z9lTDdpNDbWN7EUU6whmFWlTpiPNOYhN/edu6ckWUvf6/uApwusj8K/Y
         gtyw==
X-Gm-Message-State: AJIora/Ll2AddlKT6cI8WS9O9hlLTzFiLzvqJ1xY5YZeZfwFPMKrd8k4
        x39e5xSL9Ulgw6fDBFcXNqb1iZqEIEsSdwiEj0a4C+Mw
X-Google-Smtp-Source: AGRyM1uosLduKXvMkTYk50gqxPIUo6CZKEztzwh9oD11gDbxPA8sJczNCC1wVbk6tqplNOdZJ3zxpuqR0/BVsH9nVBk=
X-Received: by 2002:a1c:f213:0:b0:39b:ad32:5e51 with SMTP id
 s19-20020a1cf213000000b0039bad325e51mr10172652wmc.72.1656597416029; Thu, 30
 Jun 2022 06:56:56 -0700 (PDT)
MIME-Version: 1.0
References: <CAFZh4h87S5xoYisfN53SVBfXaCHKH1dwao_12L55K6Bq2Gd2Gg@mail.gmail.com>
 <20220630092405.6d842368@gandalf.local.home>
In-Reply-To: <20220630092405.6d842368@gandalf.local.home>
From:   Brian Hutchinson <b.hutchman@gmail.com>
Date:   Thu, 30 Jun 2022 09:56:44 -0400
Message-ID: <CAFZh4h9Kgx2VrJVAFM1tWNub3nuJw8+vTizdYZJ4eTTiw_YHjQ@mail.gmail.com>
Subject: Re: Having difficulty trying to cross-compile latest trace-cmd
To:     Steven Rostedt <rostedt@goodmis.org>
Cc:     linux-trace-users@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-trace-users.vger.kernel.org>
X-Mailing-List: linux-trace-users@vger.kernel.org

On Thu, Jun 30, 2022 at 9:24 AM Steven Rostedt <rostedt@goodmis.org> wrote:
>
> On Thu, 30 Jun 2022 00:20:57 -0400
> Brian Hutchinson <b.hutchman@gmail.com> wrote:
>
> > Hi,
>
> Hi Brian,
>
> >
> > I've been using trace-cmd 2.9.1 from a yocto build but I want to try
> > out the sql synthetic events ultil and it looks like I need to go to
> > the latest to get that.
> >
> > After reading this:
> >
> > https://www.spinics.net/lists//linux-trace-devel/msg08977.html
> >
> > .... thanks Steven for rescuing the orphans but I guess I'm a
> > red-headded step child trying to cross-compile all of this (on Ubuntu
> > 20.04 machine) for a iMX8MM SoC.  And you're right, Makefiles do suck!
> >  Especially ones you didn't write yourself and you try to figure out
> > what others were trying to do.
> >
> > I'm struggling to cross-compile everything.
> >
> > I checked out the latest libtraceevent and that cross-compiled ok (I'm
> > using a sdk I built from Yocto ex: source
> > /opt/poky.3.1.7/environment-setup-aarch64-poky-linux) but the install
> > wouldn't work until I used DESTDIR to point the install somewhere
> > other than Ubuntu directories.
> >
> > I checked out libtracefs and it wouldn't build until I fooled around
> > and set TEST_LIBTRACEEVENT to point specifically to the
> > libtraceevent.pc file in the directory used in libtraceevent DISTDIR
> > path I set.
> >
> > Once I got past that I started having issues with libtracefs failing
> > to find include files (event-parse.h, trace-seq.h etc.) that lived in
> > the libtraceevent repo.  I created a symlink for one of them but then
> > ran into others and gave up figuring I was going about this wrong way
> > and it was time to admit defeat and just ask how you cross compile
> > this without building packages for Ubuntu.
>
> I haven't tried cross compiling in a while, and do not have a setup to do
> so at the moment (no cross glibc on my machines).
>
> But I do try to make it easier for distros to package these. In
> the trace-cmd repo, there's a make-trace-cmd.sh[1] script that sets the
> proper variables. This can also be used on libtraceevent and libtracefs.
>
> Perhaps that can work with a cross compile environment too?
>
> -- Steve
>
> [1] https://git.kernel.org/pub/scm/utils/trace-cmd/trace-cmd.git/tree/make-trace-cmd.sh

Thanks Steve, I'll give it a look.

I could give you my sdk wink, wink ... if you want a shiny (well, it's
a bit dated, but hey, it is a LTS release) NXP iMX8MM toolchain.

I started by trying to update my trace-cmd yocto recipe to just pull
the latest but it ran into not finding the include files too so that's
what led me to just trying to build it outside Yocto manually to
understand how to build it.

Later,

Brian
