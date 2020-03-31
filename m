Return-Path: <SRS0=9mrg=5Q=vger.kernel.org=linux-trace-users-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD771C43331
	for <linux-trace-users@archiver.kernel.org>; Tue, 31 Mar 2020 20:57:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B23AC2080C
	for <linux-trace-users@archiver.kernel.org>; Tue, 31 Mar 2020 20:57:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727852AbgCaU5s (ORCPT
        <rfc822;linux-trace-users@archiver.kernel.org>);
        Tue, 31 Mar 2020 16:57:48 -0400
Received: from mail.ut.ac.ir ([80.66.177.10]:56778 "EHLO mail.ut.ac.ir"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728893AbgCaU5s (ORCPT
        <rfc822;linux-trace-users@vger.kernel.org>);
        Tue, 31 Mar 2020 16:57:48 -0400
Received: from localhost (localhost [127.0.0.1])
        by mail.ut.ac.ir (Postfix) with ESMTP id 2669CF80AA;
        Wed,  1 Apr 2020 01:27:45 +0430 (+0430)
Received: from mail.ut.ac.ir ([127.0.0.1])
        by localhost (mail.ut.ac.ir [127.0.0.1]) (amavisd-new, port 10024)
        with LMTP id 1l8-GxAazV2K; Wed,  1 Apr 2020 01:27:44 +0430 (+0430)
Received: from mail.ut.ac.ir (mail.ut.ac.ir [194.225.0.10])
        by mail.ut.ac.ir (Postfix) with ESMTP id E4031F80A9;
        Wed,  1 Apr 2020 01:27:43 +0430 (+0430)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Date:   Wed, 01 Apr 2020 01:27:43 +0430
From:   ahmadkhorrami <ahmadkhorrami@ut.ac.ir>
To:     Milian Wolff <milian.wolff@kdab.com>
Cc:     Jiri Olsa <jolsa@redhat.com>, Steven Rostedt <rostedt@goodmis.org>,
        Arnaldo Carvalho de Melo <acme@redhat.com>,
        Linux-trace Users <linux-trace-users@vger.kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        linux-trace-users-owner@vger.kernel.org,
        Jin Yao <yao.jin@linux.intel.com>,
        Namhyung Kim <namhyung@kernel.org>,
        Andi Kleen <ak@linux.intel.com>
Subject: Re: Wrong Perf Backtraces
In-Reply-To: <7774721.NyiUUSuA9g@agathebauer>
References: <821540886fc57d7749edee585a50602f@ut.ac.ir>
 <8573002.CDJkKcVGEf@agathebauer> <fe8e797932c0cb6d1b8db2ee9b991ed0@ut.ac.ir>
 <7774721.NyiUUSuA9g@agathebauer>
Message-ID: <e97fc4aeff263bc1eb0206b7a3c22011@ut.ac.ir>
X-Sender: ahmadkhorrami@ut.ac.ir
User-Agent: Roundcube Webmail/1.3.6
Sender: linux-trace-users-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-trace-users.vger.kernel.org>
X-Mailing-List: linux-trace-users@vger.kernel.org

Hi,
On 2020-03-31 19:59, Milian Wolff wrote:

> On Dienstag, 31. März 2020 17:02:37 CEST ahmadkhorrami wrote:
> 
>> Hi Milian,
>> Thanks for the detailed answer. Well, the bug you mentioned is bad 
>> news.
>> Because I sample using uppp. Perhaps this leads to these weird traces.
> 
> Please read the full thread from here on:
> 
> https://lkml.org/lkml/2018/11/2/86
> 
> But as I said - it should be easy to check if this is really the issue 
> are
> running into or not: Try to see if you see the problem when you sample 
> without
> `ppp`. If not, then you can be pretty sure it's this issue. If you 
> still see
> it, then it's something different.
> 
Well, the problem exists even when ":uppp" is changed to ":u".
>> Is this a purely software bug?
> 
> I wouldn't call it that, personally. Rather, it's a limitation in the 
> hardware
> and software. We would need something completely different to "fix" 
> this, i.e.
> something like a deeper LBR. That's btw another alternative you could 
> try:
> `perf record --call-graph lbr` and live with the short call stacks. But 
> at
> least these should be correct (afaik). For me personally they are 
> always far
> too short and thus not practical to use in reality.
> 
> Cheers
Regards.
