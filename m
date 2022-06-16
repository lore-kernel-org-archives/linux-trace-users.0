Return-Path: <linux-trace-users-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A66F4C433EF
	for <linux-trace-users@archiver.kernel.org>; Thu, 16 Jun 2022 13:03:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231831AbiFPNDo (ORCPT
        <rfc822;linux-trace-users@archiver.kernel.org>);
        Thu, 16 Jun 2022 09:03:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38546 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229927AbiFPNDm (ORCPT
        <rfc822;linux-trace-users@vger.kernel.org>);
        Thu, 16 Jun 2022 09:03:42 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A65920BDE
        for <linux-trace-users@vger.kernel.org>; Thu, 16 Jun 2022 06:03:41 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id E3D1561BE6
        for <linux-trace-users@vger.kernel.org>; Thu, 16 Jun 2022 13:03:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05B9BC34114;
        Thu, 16 Jun 2022 13:03:39 +0000 (UTC)
Date:   Thu, 16 Jun 2022 09:03:38 -0400
From:   Steven Rostedt <rostedt@goodmis.org>
To:     Matteo Bertolino <matteo.bertolino@huawei.com>
Cc:     "linux-trace-users@vger.kernel.org" 
        <linux-trace-users@vger.kernel.org>
Subject: Re: Format of trace.dat flyrecord section
Message-ID: <20220616090338.3172219b@gandalf.local.home>
In-Reply-To: <20220616090237.2c9dda8b@gandalf.local.home>
References: <e3287c4e7ae2407f873bedf74df9651c@huawei.com>
        <20220616090237.2c9dda8b@gandalf.local.home>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-trace-users.vger.kernel.org>
X-Mailing-List: linux-trace-users@vger.kernel.org


OK, this is a claws-mail bug. It added the '\' in the email address when
doing a reply all.

-- Steve


On Thu, 16 Jun 2022 09:02:37 -0400
Steven Rostedt <rostedt@goodmis.org> wrote:

> This is just a test to see if the added '\' was due to a claws-mail bug or
> somehow I did it.
> 
> -- Steve

