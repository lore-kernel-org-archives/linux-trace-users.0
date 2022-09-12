Return-Path: <linux-trace-users-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BE17ECAAD5
	for <linux-trace-users@archiver.kernel.org>; Mon, 12 Sep 2022 09:59:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229738AbiILJ7E (ORCPT
        <rfc822;linux-trace-users@archiver.kernel.org>);
        Mon, 12 Sep 2022 05:59:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60422 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229845AbiILJ7D (ORCPT
        <rfc822;linux-trace-users@vger.kernel.org>);
        Mon, 12 Sep 2022 05:59:03 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B7A7186F8
        for <linux-trace-users@vger.kernel.org>; Mon, 12 Sep 2022 02:59:01 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 27BCD60AEF
        for <linux-trace-users@vger.kernel.org>; Mon, 12 Sep 2022 09:59:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D78A5C433D6;
        Mon, 12 Sep 2022 09:58:59 +0000 (UTC)
Date:   Mon, 12 Sep 2022 05:58:56 -0400
From:   Steven Rostedt <rostedt@goodmis.org>
To:     Tzvetomir Stoyanov <tz.stoyanov@gmail.com>
Cc:     Sharon Gabay <Sharon.Gabay@mobileye.com>,
        "linux-trace-users@vger.kernel.org" 
        <linux-trace-users@vger.kernel.org>
Subject: Re: trace-cmd: Using the python wrapping to read trace markers
Message-ID: <20220912055856.317576fc@rorschach.local.home>
In-Reply-To: <CAPpZLN4o_O+ePT5YGStZknKCrMvQ17XupP4Y0LfQ=1Y9Cn20PQ@mail.gmail.com>
References: <VE1PR09MB3535D091888EFAF84EA09E20F2459@VE1PR09MB3535.eurprd09.prod.outlook.com>
        <CAPpZLN4o_O+ePT5YGStZknKCrMvQ17XupP4Y0LfQ=1Y9Cn20PQ@mail.gmail.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-trace-users.vger.kernel.org>
X-Mailing-List: linux-trace-users@vger.kernel.org

On Mon, 12 Sep 2022 12:47:09 +0300
Tzvetomir Stoyanov <tz.stoyanov@gmail.com> wrote:

> Hi Sharon,
> 
> >
> > We are using this article to generate trace markers:
> > https://lwn.net/Articles/366796/
> >
> > I am responsible for reading the trace.dat binary into our tools and we are using the trace-cmd python wrapping.  
> 
> The trace-cmd python wrappers are auto generated. The logic for that
> may not be up to date, so I do not know what is the current state of
> those wrappers.

Thanks Tzvetomir for responding, and yes, trace-cruncher is something
to look at in this case.

Sharon,

I and many others that could help out with the wrapper code are
currently attending Linux Plumbers in Dublin (https://lpc.events), and
are not able to look into this at the moment. If we remember ( ;-) )
we'll look at this in a couple of weeks.

-- Steve
