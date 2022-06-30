Return-Path: <linux-trace-users-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54A4FC43334
	for <linux-trace-users@archiver.kernel.org>; Thu, 30 Jun 2022 13:24:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234604AbiF3NYN (ORCPT
        <rfc822;linux-trace-users@archiver.kernel.org>);
        Thu, 30 Jun 2022 09:24:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58776 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234600AbiF3NYN (ORCPT
        <rfc822;linux-trace-users@vger.kernel.org>);
        Thu, 30 Jun 2022 09:24:13 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0DF4031506
        for <linux-trace-users@vger.kernel.org>; Thu, 30 Jun 2022 06:24:11 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id C2DB2B827E3
        for <linux-trace-users@vger.kernel.org>; Thu, 30 Jun 2022 13:24:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1657AC34115;
        Thu, 30 Jun 2022 13:24:07 +0000 (UTC)
Date:   Thu, 30 Jun 2022 09:24:05 -0400
From:   Steven Rostedt <rostedt@goodmis.org>
To:     Brian Hutchinson <b.hutchman@gmail.com>
Cc:     linux-trace-users@vger.kernel.org
Subject: Re: Having difficulty trying to cross-compile latest trace-cmd
Message-ID: <20220630092405.6d842368@gandalf.local.home>
In-Reply-To: <CAFZh4h87S5xoYisfN53SVBfXaCHKH1dwao_12L55K6Bq2Gd2Gg@mail.gmail.com>
References: <CAFZh4h87S5xoYisfN53SVBfXaCHKH1dwao_12L55K6Bq2Gd2Gg@mail.gmail.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-trace-users.vger.kernel.org>
X-Mailing-List: linux-trace-users@vger.kernel.org

On Thu, 30 Jun 2022 00:20:57 -0400
Brian Hutchinson <b.hutchman@gmail.com> wrote:

> Hi,

Hi Brian,

> 
> I've been using trace-cmd 2.9.1 from a yocto build but I want to try
> out the sql synthetic events ultil and it looks like I need to go to
> the latest to get that.
> 
> After reading this:
> 
> https://www.spinics.net/lists//linux-trace-devel/msg08977.html
> 
> .... thanks Steven for rescuing the orphans but I guess I'm a
> red-headded step child trying to cross-compile all of this (on Ubuntu
> 20.04 machine) for a iMX8MM SoC.  And you're right, Makefiles do suck!
>  Especially ones you didn't write yourself and you try to figure out
> what others were trying to do.
> 
> I'm struggling to cross-compile everything.
> 
> I checked out the latest libtraceevent and that cross-compiled ok (I'm
> using a sdk I built from Yocto ex: source
> /opt/poky.3.1.7/environment-setup-aarch64-poky-linux) but the install
> wouldn't work until I used DESTDIR to point the install somewhere
> other than Ubuntu directories.
> 
> I checked out libtracefs and it wouldn't build until I fooled around
> and set TEST_LIBTRACEEVENT to point specifically to the
> libtraceevent.pc file in the directory used in libtraceevent DISTDIR
> path I set.
> 
> Once I got past that I started having issues with libtracefs failing
> to find include files (event-parse.h, trace-seq.h etc.) that lived in
> the libtraceevent repo.  I created a symlink for one of them but then
> ran into others and gave up figuring I was going about this wrong way
> and it was time to admit defeat and just ask how you cross compile
> this without building packages for Ubuntu.

I haven't tried cross compiling in a while, and do not have a setup to do
so at the moment (no cross glibc on my machines).

But I do try to make it easier for distros to package these. In
the trace-cmd repo, there's a make-trace-cmd.sh[1] script that sets the
proper variables. This can also be used on libtraceevent and libtracefs.

Perhaps that can work with a cross compile environment too?

-- Steve

[1] https://git.kernel.org/pub/scm/utils/trace-cmd/trace-cmd.git/tree/make-trace-cmd.sh
