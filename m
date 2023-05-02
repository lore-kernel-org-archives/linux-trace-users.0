Return-Path: <linux-trace-users-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87D61C7EE21
	for <linux-trace-users@archiver.kernel.org>; Tue,  2 May 2023 20:43:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229770AbjEBUnQ (ORCPT
        <rfc822;linux-trace-users@archiver.kernel.org>);
        Tue, 2 May 2023 16:43:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35282 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229581AbjEBUnP (ORCPT
        <rfc822;linux-trace-users@vger.kernel.org>);
        Tue, 2 May 2023 16:43:15 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1562A1BCD
        for <linux-trace-users@vger.kernel.org>; Tue,  2 May 2023 13:43:14 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id A405D6152C
        for <linux-trace-users@vger.kernel.org>; Tue,  2 May 2023 20:43:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA265C433EF;
        Tue,  2 May 2023 20:43:12 +0000 (UTC)
Date:   Tue, 2 May 2023 16:43:11 -0400
From:   Steven Rostedt <rostedt@goodmis.org>
To:     Brian Hutchinson <b.hutchman@gmail.com>
Cc:     linux-trace-users@vger.kernel.org
Subject: Re: Trying to trace when RT FF & RR threads hit RT Throttle limit
 (kernel.sched_rt_runtime_us)
Message-ID: <20230502164311.7081d2f8@gandalf.local.home>
In-Reply-To: <CAFZh4h-VT8T5VB2roQEw7ADT9hXTp-xn6nJan_QN3XRs_5tDGg@mail.gmail.com>
References: <CAFZh4h89N2FedvTePY7cXUjwZw61mpjcy+f9oBu5a54gYiozTw@mail.gmail.com>
        <20230501101753.4c4cf74f@gandalf.local.home>
        <CAFZh4h_+v7CKUHb86v_MudO5pG8pvBQwEDOzr+Svs2JGgP64kQ@mail.gmail.com>
        <20230501112103.0957b03a@gandalf.local.home>
        <CAFZh4h-VT8T5VB2roQEw7ADT9hXTp-xn6nJan_QN3XRs_5tDGg@mail.gmail.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-trace-users.vger.kernel.org>
X-Mailing-List: linux-trace-users@vger.kernel.org

On Mon, 1 May 2023 15:35:43 -0400
Brian Hutchinson <b.hutchman@gmail.com> wrote:

> I don't "think" anything is moving around here unless the OS is going
> against what it's been told to do.  The cpu's are isolated with
> cmdline at boot and the affinity of these processes has been selected
> when they startup so they should stay where they are put unless there
> is something going on I don't know about.  I think I've seen talk
> before that the affinity is just a "suggestion" making me think there
> are cases where something could move but if that's true I don't know
> what those scenarios are.

BTW, you may want to email the relevant maintainers of the scheduler (yes,
I'm one of them), because it's getting off topic for linux-trace-users.

-- Steve
