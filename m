Return-Path: <SRS0=yZNv=7Q=vger.kernel.org=linux-trace-users-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1278C433DF
	for <linux-trace-users@archiver.kernel.org>; Wed,  3 Jun 2020 03:49:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A87792077D
	for <linux-trace-users@archiver.kernel.org>; Wed,  3 Jun 2020 03:49:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726708AbgFCDtk (ORCPT
        <rfc822;linux-trace-users@archiver.kernel.org>);
        Tue, 2 Jun 2020 23:49:40 -0400
Received: from mail.ut.ac.ir ([80.66.177.10]:49744 "EHLO mail.ut.ac.ir"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725922AbgFCDtk (ORCPT
        <rfc822;linux-trace-users@vger.kernel.org>);
        Tue, 2 Jun 2020 23:49:40 -0400
Received: from localhost (localhost [127.0.0.1])
        by mail.ut.ac.ir (Postfix) with ESMTP id 252E51DA69C;
        Wed,  3 Jun 2020 08:19:35 +0430 (+0430)
Received: from mail.ut.ac.ir ([127.0.0.1])
        by localhost (mail.ut.ac.ir [127.0.0.1]) (amavisd-new, port 10024)
        with LMTP id 6FiFLNLi4j-p; Wed,  3 Jun 2020 08:19:34 +0430 (+0430)
Received: from mail.ut.ac.ir (mail.ut.ac.ir [194.225.0.10])
        by mail.ut.ac.ir (Postfix) with ESMTP id 3ECF71DA517;
        Wed,  3 Jun 2020 08:19:34 +0430 (+0430)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Wed, 03 Jun 2020 08:19:34 +0430
From:   ahmadkhorrami <ahmadkhorrami@ut.ac.ir>
To:     Andi Kleen <andi@firstfloor.org>
Cc:     Arnaldo Carvalho de Melo <acme@redhat.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Jin Yao <yao.jin@linux.intel.com>,
        Linux-trace Users <linux-trace-users@vger.kernel.org>,
        linux-perf-users@vger.kernel.org,
        Arnaldo Carvalho de Melo <acme@kernel.org>,
        linux-trace-users-owner@vger.kernel.org
Subject: Re: Perf Reports Jump Instructions as Memory Access Instructions
In-Reply-To: <3043c6c2f878ad3419e350867903cb0a@ut.ac.ir>
References: <20200526133817.GA23187@redhat.com>
 <20200526164159.dsnboewwdyczr5j6@two.firstfloor.org>
 <3043c6c2f878ad3419e350867903cb0a@ut.ac.ir>
Message-ID: <1113a5891fcccce6cfe59e6da59eee95@ut.ac.ir>
X-Sender: ahmadkhorrami@ut.ac.ir
User-Agent: Roundcube Webmail/1.3.6
Sender: linux-trace-users-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-trace-users.vger.kernel.org>
X-Mailing-List: linux-trace-users@vger.kernel.org

Thanks everybody, specially, Steven, Arnaldo and Andi.

On 2020-05-27 00:25, ahmadkhorrami wrote:

> Thanks! This seems reasonable. But as Arnaldo says, why is there a skid 
> in the access address while PEBS is used? Both RIP and Access Address 
> should match, Right?
> Regards.
> 
> On 2020-05-26 21:12, Andi Kleen wrote:
> 
>> The access point is at offset 0 of the following disassembly:
>> Dump of assembler code for function 
>> cairo_surface_get_device_scale@plt:
> 
> 0x000000000002a310 <+0>:     jmpq   *0x2c8b3a(%rip)        # 0x2f2e50
> 0x000000000002a316 <+6>:     pushq  $0x1c7
> 0x000000000002a31b <+11>:    jmpq   0x28690
> 
> This is an unconditional jump which will not lead to macrofusion.

But that will access memory, no? The instruction at offset 0.
Instruction fetches are not sampled by the MEM_INST_RETIRED event.

This is an indirect jump through memory, so it accesses the memory at
0x2c8b3a(%rip). These kind of accesses are sampled by the event.

Other memory accesses as part of other instructions may be sampled too.

-Andi
