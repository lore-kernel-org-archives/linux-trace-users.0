Return-Path: <SRS0=9mrg=5Q=vger.kernel.org=linux-trace-users-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21779C43331
	for <linux-trace-users@archiver.kernel.org>; Tue, 31 Mar 2020 19:20:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id EF1D820784
	for <linux-trace-users@archiver.kernel.org>; Tue, 31 Mar 2020 19:20:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727720AbgCaTUy (ORCPT
        <rfc822;linux-trace-users@archiver.kernel.org>);
        Tue, 31 Mar 2020 15:20:54 -0400
Received: from mail.ut.ac.ir ([80.66.177.10]:37462 "EHLO mail.ut.ac.ir"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727509AbgCaTUy (ORCPT
        <rfc822;linux-trace-users@vger.kernel.org>);
        Tue, 31 Mar 2020 15:20:54 -0400
Received: from localhost (localhost [127.0.0.1])
        by mail.ut.ac.ir (Postfix) with ESMTP id 69F721DB1BB;
        Tue, 31 Mar 2020 23:50:51 +0430 (+0430)
Received: from mail.ut.ac.ir ([127.0.0.1])
        by localhost (mail.ut.ac.ir [127.0.0.1]) (amavisd-new, port 10024)
        with LMTP id y6-LkbiTIigQ; Tue, 31 Mar 2020 23:50:50 +0430 (+0430)
Received: from mail.ut.ac.ir (mail.ut.ac.ir [194.225.0.10])
        by mail.ut.ac.ir (Postfix) with ESMTP id E5F741DB172;
        Tue, 31 Mar 2020 23:50:49 +0430 (+0430)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Date:   Tue, 31 Mar 2020 23:50:49 +0430
From:   ahmadkhorrami <ahmadkhorrami@ut.ac.ir>
To:     Arnaldo Carvalho de Melo <acme@redhat.com>
Cc:     Milian Wolff <milian.wolff@kdab.com>, Jiri Olsa <jolsa@redhat.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Linux-trace Users <linux-trace-users@vger.kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        linux-trace-users-owner@vger.kernel.org,
        Jin Yao <yao.jin@linux.intel.com>,
        Namhyung Kim <namhyung@kernel.org>,
        Andi Kleen <ak@linux.intel.com>
Subject: Re: Wrong Perf Backtraces
In-Reply-To: <20200331161002.GB23207@redhat.com>
References: <821540886fc57d7749edee585a50602f@ut.ac.ir>
 <8573002.CDJkKcVGEf@agathebauer> <fe8e797932c0cb6d1b8db2ee9b991ed0@ut.ac.ir>
 <7774721.NyiUUSuA9g@agathebauer> <20200331161002.GB23207@redhat.com>
Message-ID: <56139d1ce9afdfe5fdea0a0a374c5faf@ut.ac.ir>
X-Sender: ahmadkhorrami@ut.ac.ir
User-Agent: Roundcube Webmail/1.3.6
Sender: linux-trace-users-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-trace-users.vger.kernel.org>
X-Mailing-List: linux-trace-users@vger.kernel.org

Thanks.
I checked "perf script -D", and it contains repeated addresses in 
itself. The problem seems to occur at the sampling instant. Does anybody 
know the location of the sampling handler?
I am looking forward to the answer.
Regards.

On 2020-03-31 20:40, Arnaldo Carvalho de Melo wrote:

> Em Tue, Mar 31, 2020 at 05:29:17PM +0200, Milian Wolff escreveu: On 
> Dienstag, 31. März 2020 17:02:37 CEST ahmadkhorrami wrote: Hi Milian,
> Thanks for the detailed answer. Well, the bug you mentioned is bad 
> news.
> Because I sample using uppp. Perhaps this leads to these weird traces.
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
> Is this a purely software bug?
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

Probably this may help:

   From: Kan Liang <kan.liang@linux.intel.com>
   Subject: [PATCH V4 00/17] Stitch LBR call stack (Perf Tools)
   Date: Thu, 19 Mar 2020 13:25:00 -0700
   
https://lore.kernel.org/lkml/20200319202517.23423-1-kan.liang@linux.intel.com/

- Arnaldo
