Return-Path: <SRS0=9mrg=5Q=vger.kernel.org=linux-trace-users-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67AFDC43331
	for <linux-trace-users@archiver.kernel.org>; Tue, 31 Mar 2020 15:06:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4169820781
	for <linux-trace-users@archiver.kernel.org>; Tue, 31 Mar 2020 15:06:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730408AbgCaPGA (ORCPT
        <rfc822;linux-trace-users@archiver.kernel.org>);
        Tue, 31 Mar 2020 11:06:00 -0400
Received: from mail.ut.ac.ir ([80.66.177.10]:40376 "EHLO mail.ut.ac.ir"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726526AbgCaPF7 (ORCPT
        <rfc822;linux-trace-users@vger.kernel.org>);
        Tue, 31 Mar 2020 11:05:59 -0400
Received: from localhost (localhost [127.0.0.1])
        by mail.ut.ac.ir (Postfix) with ESMTP id BA9211DB1E0;
        Tue, 31 Mar 2020 19:35:56 +0430 (+0430)
Received: from mail.ut.ac.ir ([127.0.0.1])
        by localhost (mail.ut.ac.ir [127.0.0.1]) (amavisd-new, port 10024)
        with LMTP id mp0cvrZYpu5l; Tue, 31 Mar 2020 19:35:56 +0430 (+0430)
Received: from mail.ut.ac.ir (mail.ut.ac.ir [194.225.0.10])
        by mail.ut.ac.ir (Postfix) with ESMTP id 7A1BA1DB1DE;
        Tue, 31 Mar 2020 19:35:55 +0430 (+0430)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Date:   Tue, 31 Mar 2020 19:35:55 +0430
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
In-Reply-To: <fe8e797932c0cb6d1b8db2ee9b991ed0@ut.ac.ir>
References: <821540886fc57d7749edee585a50602f@ut.ac.ir>
 <20200331132052.GD2518490@krava> <08bf52eda6e699ee6b3070c75eac9123@ut.ac.ir>
 <8573002.CDJkKcVGEf@agathebauer> <fe8e797932c0cb6d1b8db2ee9b991ed0@ut.ac.ir>
Message-ID: <f7460b4bbedbeeb61d8fedf32c1213e9@ut.ac.ir>
X-Sender: ahmadkhorrami@ut.ac.ir
User-Agent: Roundcube Webmail/1.3.6
Sender: linux-trace-users-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-trace-users.vger.kernel.org>
X-Mailing-List: linux-trace-users@vger.kernel.org

And it seems that the bogus backtraces constitute only a small portion 
of the whole log. This seems to be good news.

On 2020-03-31 19:32, ahmadkhorrami wrote:

> Hi Milian,
> Thanks for the detailed answer. Well, the bug you mentioned is bad 
> news. Because I sample using uppp. Perhaps this leads to these weird 
> traces. Is this a purely software bug?
> 
> On 2020-03-31 19:14, Milian Wolff wrote:
> 
> On Dienstag, 31. März 2020 15:39:18 CEST ahmadkhorrami wrote:
> 
> But the addresses do not match. Do you confirm this as a bug in
> libdwarf,...?
> 
> So I will ignore addresses without a matching symbol. But they do not
> seem reliable!
> 
> Could you tell me the name of the library that generates the raw
> addresses, so that I can try to debug it?
> This is a platform specific question. There are multiple ways to unwind 
> a
> stack. If you are on x86 then by default the .eh_frame section is 
> available
> which holds the information necessary for unwinding. It doesn't depend 
> on
> debug symbols, that's only used for symbolization and inline-frame 
> resolution
> as Jiri indicated.
> 
> That said, in the context of perf, there are multiple scenarios that 
> can lead
> to broken unwinding:
> 
> a) perf record --call-graph dwarf: unwinding can overflow the stack 
> copy
> associated with every sample, so the upper end of the stack will be 
> broken
> 
> b) perf record --call-graph $any: when you are sampling on a precise 
> event,
> such as cycles:P which is the default afaik, then on Intel with PEBS 
> e.g. the
> stack copy may be "wrong". See e.g. https://lkml.org/lkml/2018/11/6/257 
> and
> the overall thread. This is not solved yet afaik and after my initial 
> attempt
> at workarounding this issue I stopped looking into it and instead opted 
> for
> explicitly sampling on the non-precise events when I record call 
> graphs... You
> could try that too: do you see the issue when you run e.g.:
> 
> `perf record --call-graph dwarf -e cycles`
> 
> This should take the non-precise version for sampling but then at least 
> the
> call stacks are correct. I.e. you trade the accuracy of the instruction
> pointer to which a sample points with reduced call stack breakage.
> 
> c) bugs :)
