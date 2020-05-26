Return-Path: <SRS0=5oOi=7I=vger.kernel.org=linux-trace-users-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 636B7C433DF
	for <linux-trace-users@archiver.kernel.org>; Tue, 26 May 2020 16:52:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D8D52207FB
	for <linux-trace-users@archiver.kernel.org>; Tue, 26 May 2020 16:52:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=firstfloor.org header.i=@firstfloor.org header.b="fB8VIFWC"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728339AbgEZQwj (ORCPT
        <rfc822;linux-trace-users@archiver.kernel.org>);
        Tue, 26 May 2020 12:52:39 -0400
Received: from one.firstfloor.org ([193.170.194.197]:37812 "EHLO
        one.firstfloor.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727941AbgEZQwj (ORCPT
        <rfc822;linux-trace-users@vger.kernel.org>);
        Tue, 26 May 2020 12:52:39 -0400
X-Greylist: delayed 636 seconds by postgrey-1.27 at vger.kernel.org; Tue, 26 May 2020 12:52:38 EDT
Received: by one.firstfloor.org (Postfix, from userid 503)
        id 44A098685E; Tue, 26 May 2020 18:42:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=firstfloor.org;
        s=mail; t=1590511320;
        bh=ypj4ICCsdXfcRKsp95D8F+u/CRhGalypVnmun5o9cJQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=fB8VIFWCBOwHm5CNqJZ8J/Nqb/aMn19iQofeb63Rl9nP8jWQT31B2Q1VORR8zi8wu
         ty9SM/4dkoimEA2CJr9RqeTVAH5FKEPVyR/IenBztcjgSSqlI7lZtzlBstz9cPl6Jp
         NOfO4fwVOSzNAEY9VPyrShlq4OjxfwUJboMVqPgg=
Date:   Tue, 26 May 2020 09:42:00 -0700
From:   Andi Kleen <andi@firstfloor.org>
To:     Arnaldo Carvalho de Melo <acme@redhat.com>
Cc:     Steven Rostedt <rostedt@goodmis.org>,
        Andi Kleen <andi@firstfloor.org>,
        Jin Yao <yao.jin@linux.intel.com>,
        ahmadkhorrami <ahmadkhorrami@ut.ac.ir>,
        Linux-trace Users <linux-trace-users@vger.kernel.org>,
        linux-perf-users@vger.kernel.org,
        Arnaldo Carvalho de Melo <acme@kernel.org>
Subject: Re: Perf Reports Jump Instructions as Memory Access Instructions
Message-ID: <20200526164159.dsnboewwdyczr5j6@two.firstfloor.org>
References: <20200526133817.GA23187@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200526133817.GA23187@redhat.com>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-trace-users-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-trace-users.vger.kernel.org>
X-Mailing-List: linux-trace-users@vger.kernel.org

> > > The access point is at offset 0 of the following disassembly:
>  > Dump of assembler code for function cairo_surface_get_device_scale@plt:
> > >     0x000000000002a310 <+0>:     jmpq   *0x2c8b3a(%rip)        # 0x2f2e50
> > >     0x000000000002a316 <+6>:     pushq  $0x1c7
> > >     0x000000000002a31b <+11>:    jmpq   0x28690
> > > 
> > > This is an unconditional jump which will not lead to macrofusion.
> 
> But that will access memory, no? The instruction at offset 0.

Instruction fetches are not sampled by the MEM_INST_RETIRED event.

This is an indirect jump through memory, so it accesses the memory at
0x2c8b3a(%rip). These kind of accesses are sampled by the event.

Other memory accesses as part of other instructions may be sampled too.

-Andi
