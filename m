Return-Path: <linux-trace-users-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8E31C19F2D
	for <linux-trace-users@archiver.kernel.org>; Tue,  9 Aug 2022 15:54:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239344AbiHIPyJ (ORCPT
        <rfc822;linux-trace-users@archiver.kernel.org>);
        Tue, 9 Aug 2022 11:54:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51570 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235645AbiHIPyI (ORCPT
        <rfc822;linux-trace-users@vger.kernel.org>);
        Tue, 9 Aug 2022 11:54:08 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4827C17A81
        for <linux-trace-users@vger.kernel.org>; Tue,  9 Aug 2022 08:54:07 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 0400DB815BE
        for <linux-trace-users@vger.kernel.org>; Tue,  9 Aug 2022 15:54:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FA61C433D6;
        Tue,  9 Aug 2022 15:54:04 +0000 (UTC)
Date:   Tue, 9 Aug 2022 11:54:07 -0400
From:   Steven Rostedt <rostedt@goodmis.org>
To:     Matteo Bertolino <matteo.bertolino@huawei.com>
Cc:     linux-trace-users@vger.kernel.org
Subject: Re: Format of funcgraph_{entry, exit} ftrace event
Message-ID: <20220809115407.6e579baa@gandalf.local.home>
In-Reply-To: <41ac8a9190b647d4ad711d3d8f82ceea@huawei.com>
References: <41ac8a9190b647d4ad711d3d8f82ceea@huawei.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-trace-users.vger.kernel.org>
X-Mailing-List: linux-trace-users@vger.kernel.org

On Tue, 9 Aug 2022 13:32:04 +0000
Matteo Bertolino <matteo.bertolino@huawei.com> wrote:

> 
> 
> While writing a `trace.dat`, I know that all the entries have an header, described by the Linux ringbuffer format (file `header_event`):
> # compressed entry header
> 	type_len    :    5 bits
> 	time_delta  :   27 bits
> 	array       :   32 bits
> 
> 	padding     : type == 29
> 	time_extend : type == 30
> 	time_stamp : type == 31
> 	data max type_len  == 28
> 
> Such header includes a timestamp (that can be a delta of the timestamp present in the `header_page`).
> 
> I have one question for the ftrace's community:
> Why are the following fields of a `funcgraph_exit` entry useful? ` calltime` and ` rettime`. 
> They look like redundant for me, because the timing information is already present on the `header_event`. 

The function graph infrastructure records the calltime and rettime and
that can be used by other users than the tracer. That is, the users are
not guaranteed to have timestamps of their own. Yes it is redundant for
the tracing, but it is also a way to test to make sure the timings
being recorded are accurate for the other use cases.

-- Steve

