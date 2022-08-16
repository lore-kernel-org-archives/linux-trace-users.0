Return-Path: <linux-trace-users-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5828C25B0E
	for <linux-trace-users@archiver.kernel.org>; Tue, 16 Aug 2022 22:05:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237112AbiHPWFA (ORCPT
        <rfc822;linux-trace-users@archiver.kernel.org>);
        Tue, 16 Aug 2022 18:05:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40692 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233253AbiHPWE7 (ORCPT
        <rfc822;linux-trace-users@vger.kernel.org>);
        Tue, 16 Aug 2022 18:04:59 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D76D72EED
        for <linux-trace-users@vger.kernel.org>; Tue, 16 Aug 2022 15:04:58 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id D590FB81B1F
        for <linux-trace-users@vger.kernel.org>; Tue, 16 Aug 2022 22:04:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D59AC433C1;
        Tue, 16 Aug 2022 22:04:55 +0000 (UTC)
Date:   Tue, 16 Aug 2022 18:05:03 -0400
From:   Steven Rostedt <rostedt@goodmis.org>
To:     Alexander Aring <aahringo@redhat.com>
Cc:     linux-trace-users@vger.kernel.org
Subject: Re: stream based live time synchronized tracing?
Message-ID: <20220816180503.319dd3e6@gandalf.local.home>
In-Reply-To: <CAK-6q+hJ4KjhUqNOGT0a046M7t3McbdstJy7xYzUAwHCp4yZRw@mail.gmail.com>
References: <CAK-6q+hJ4KjhUqNOGT0a046M7t3McbdstJy7xYzUAwHCp4yZRw@mail.gmail.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-trace-users.vger.kernel.org>
X-Mailing-List: linux-trace-users@vger.kernel.org

On Mon, 15 Aug 2022 09:28:48 -0400
Alexander Aring <aahringo@redhat.com> wrote:

> Hi,
> 
> I am curious if there is any way of getting time synchronized traces
> in a kind of stream based communication like pipes, sockets, etc. and
> get high level event representation as ?libtraceevent? provides. I
> would like to get all "merged" events from all machines provided by -A
> parameters. I think it isn't required to get them in order, but the
> timestamp should be synchronized.

Are these for guests, or machines on a network?

> 
> I could probably build something like that with libtracecmd to have it
> directly implemented in an application, but I am curious if there
> exists any interest in having such a feature upstream? E.g. having
> additional parameters like '--tsync-interval'.
> 
> A use-case would be live capturing of time synchronized events or what
> I have in my mind to collect stats and doing kernel runtime
> optimizations.

So basically not save to a file? Just record the events live and interleave
them for different machines?

I'm not exactly sure what you are asking for. Can you please elaborate some
more?

Thanks,

-- Steve

