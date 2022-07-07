Return-Path: <linux-trace-users-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0763C43334
	for <linux-trace-users@archiver.kernel.org>; Thu,  7 Jul 2022 13:44:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235391AbiGGNo0 (ORCPT
        <rfc822;linux-trace-users@archiver.kernel.org>);
        Thu, 7 Jul 2022 09:44:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37880 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235424AbiGGNoZ (ORCPT
        <rfc822;linux-trace-users@vger.kernel.org>);
        Thu, 7 Jul 2022 09:44:25 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B40AD11179
        for <linux-trace-users@vger.kernel.org>; Thu,  7 Jul 2022 06:44:24 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 4D3A4620B5
        for <linux-trace-users@vger.kernel.org>; Thu,  7 Jul 2022 13:44:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63FD0C3411E;
        Thu,  7 Jul 2022 13:44:23 +0000 (UTC)
Date:   Thu, 7 Jul 2022 09:44:22 -0400
From:   Steven Rostedt <rostedt@goodmis.org>
To:     Daniel Wagner <dwagner@suse.de>
Cc:     linux-trace-users@vger.kernel.org
Subject: Re: [RFC v1] libtraceevent: Add initial support for meson
Message-ID: <20220707094422.1bf96c9d@gandalf.local.home>
In-Reply-To: <20220707121440.28216-1-dwagner@suse.de>
References: <20220707121440.28216-1-dwagner@suse.de>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-trace-users.vger.kernel.org>
X-Mailing-List: linux-trace-users@vger.kernel.org

On Thu,  7 Jul 2022 14:14:40 +0200
Daniel Wagner <dwagner@suse.de> wrote:

> The rest should work as expected. The only thing I was not really
> clear what the purpose is the libtraceevent-dynamic-list which seems
> not be used or installed. The meson build will also generate the file
> but using the host nm and not the cross tool chain if any is used. I
> didn't want to invest too much time figuring out this detail if it is
> actually not used.

Hi Daniel,

Thanks for doing this. Hopefully I'll get some time to try it out.

Anyway, as for the libtraceevent-dynamic-list, it was brought over from the
kernel tools/lib directory. I guess it is needed for the plugins to work
properly, although I have not had issues with it.

But if you want to know more, see commit e3d09ec8126fe ("tools lib
traceevent: Export dynamic symbols used by traceevent plugins") in the
Linux kernel source.

-- Steve
