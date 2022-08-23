Return-Path: <linux-trace-users-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5BAEC32772
	for <linux-trace-users@archiver.kernel.org>; Tue, 23 Aug 2022 20:10:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232882AbiHWUKt (ORCPT
        <rfc822;linux-trace-users@archiver.kernel.org>);
        Tue, 23 Aug 2022 16:10:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48280 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234213AbiHWUK1 (ORCPT
        <rfc822;linux-trace-users@vger.kernel.org>);
        Tue, 23 Aug 2022 16:10:27 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F01A96B8CB
        for <linux-trace-users@vger.kernel.org>; Tue, 23 Aug 2022 12:30:05 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id A7920B820CD
        for <linux-trace-users@vger.kernel.org>; Tue, 23 Aug 2022 19:30:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F00FBC433C1;
        Tue, 23 Aug 2022 19:30:02 +0000 (UTC)
Date:   Tue, 23 Aug 2022 15:30:20 -0400
From:   Steven Rostedt <rostedt@goodmis.org>
To:     Prasad Pandit <ppandit@redhat.com>
Cc:     Daniel Bristot de Oliveira <bristot@kernel.org>,
        linux-trace-users@vger.kernel.org
Subject: Re: About tracing clues
Message-ID: <20220823153020.21a7d16a@gandalf.local.home>
In-Reply-To: <CAE8KmOwuKSaOT-mPeJsV-2uUrF=KNyyfY5tNoPnh_AHnzOYfNA@mail.gmail.com>
References: <CAE8KmOwGONSzSDczNdadyMSvn84qBbqS0wKUMbctnPgio0Uxgg@mail.gmail.com>
        <20220819135047.45243742@gandalf.local.home>
        <CAE8KmOyUyRCCN035ScjbcsD9ftOvsn_Z++piiThyVgy7cwL4kw@mail.gmail.com>
        <CAE8KmOwuKSaOT-mPeJsV-2uUrF=KNyyfY5tNoPnh_AHnzOYfNA@mail.gmail.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-trace-users.vger.kernel.org>
X-Mailing-List: linux-trace-users@vger.kernel.org

On Wed, 24 Aug 2022 00:54:48 +0530
Prasad Pandit <ppandit@redhat.com> wrote:

> Hello Steve,
> 
> On Sat, 20 Aug 2022 at 14:51, Prasad Pandit <ppandit@redhat.com> wrote:
> >>   # trace-cmd agent  
> 
> * For me `trace-cmd agent` in the guest shows =>  listening on @4294967295:823

I need to fix that to be more meaningful. That 4294967295 is (unsigned)-1.

In other words, the creation of the vsocket failed

It means that you do not have vsockets defined for this guest, or you are
running inside a container on the guest that prevents you from accessing
the vsockets.

> 
> >>   # trace-cmd record --poll -M 1E -e all --proxy 2 --name host -e kvm -e sched -e irq /home/test/rt-tests/oslat --cpu-list 1-4 --rtprio 1 --duration 12h -T 30  
> 
> * Running above command with --proxy 4294967295:823 throws an error =>
> guest 4294967295 not found

The rest will not work because the vsocket failed.

-- Steve
