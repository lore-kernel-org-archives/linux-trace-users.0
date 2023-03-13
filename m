Return-Path: <linux-trace-users-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3A85C6FD19
	for <linux-trace-users@archiver.kernel.org>; Mon, 13 Mar 2023 18:25:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229571AbjCMSZG (ORCPT
        <rfc822;linux-trace-users@archiver.kernel.org>);
        Mon, 13 Mar 2023 14:25:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50278 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230115AbjCMSYo (ORCPT
        <rfc822;linux-trace-users@vger.kernel.org>);
        Mon, 13 Mar 2023 14:24:44 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD1117DD2C
        for <linux-trace-users@vger.kernel.org>; Mon, 13 Mar 2023 11:24:28 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 0337961465
        for <linux-trace-users@vger.kernel.org>; Mon, 13 Mar 2023 18:24:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DE83C433EF;
        Mon, 13 Mar 2023 18:24:26 +0000 (UTC)
Date:   Mon, 13 Mar 2023 14:24:24 -0400
From:   Steven Rostedt <rostedt@goodmis.org>
To:     Julia Lawall <julia.lawall@inria.fr>
Cc:     linux-trace-users@vger.kernel.org
Subject: Re: CSV output
Message-ID: <20230313142424.26107bcb@gandalf.local.home>
In-Reply-To: <606f40f1-a411-b688-9136-cbc6fa95541f@inria.fr>
References: <alpine.DEB.2.22.394.2303120805430.2865@hadrien>
        <20230313121528.5650068b@gandalf.local.home>
        <87b0589-28a5-1cb5-f3ee-4d5c2e817116@inria.fr>
        <20230313135332.075af0a9@gandalf.local.home>
        <606f40f1-a411-b688-9136-cbc6fa95541f@inria.fr>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-trace-users.vger.kernel.org>
X-Mailing-List: linux-trace-users@vger.kernel.org

On Mon, 13 Mar 2023 18:59:50 +0100 (CET)
Julia Lawall <julia.lawall@inria.fr> wrote:

> > Better yet, I'm hoping to get some time to finish looking at the python
> > updates that were sent to me, and where it could be possible to just allow
> > you to override the output with a python script.  
> 
> OK, no hurry.  I looked into the plugins, but they seem to control only
> part of the output and it seems that one would be needed for every type of
> event.  I could try writing python, if there is an example.

The python plugins are currently broken, and we started adding more
features to the plugins to control the output a bit more.

-- Steve
