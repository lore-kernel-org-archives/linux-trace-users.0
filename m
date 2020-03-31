Return-Path: <SRS0=9mrg=5Q=vger.kernel.org=linux-trace-users-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74656C2D0EE
	for <linux-trace-users@archiver.kernel.org>; Tue, 31 Mar 2020 13:39:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 541222071A
	for <linux-trace-users@archiver.kernel.org>; Tue, 31 Mar 2020 13:39:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730964AbgCaNjY (ORCPT
        <rfc822;linux-trace-users@archiver.kernel.org>);
        Tue, 31 Mar 2020 09:39:24 -0400
Received: from mail.ut.ac.ir ([80.66.177.10]:36460 "EHLO mail.ut.ac.ir"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730466AbgCaNjY (ORCPT
        <rfc822;linux-trace-users@vger.kernel.org>);
        Tue, 31 Mar 2020 09:39:24 -0400
Received: from localhost (localhost [127.0.0.1])
        by mail.ut.ac.ir (Postfix) with ESMTP id ED17B1DB1B3;
        Tue, 31 Mar 2020 18:09:19 +0430 (+0430)
Received: from mail.ut.ac.ir ([127.0.0.1])
        by localhost (mail.ut.ac.ir [127.0.0.1]) (amavisd-new, port 10024)
        with LMTP id ch5MV7pSCNIZ; Tue, 31 Mar 2020 18:09:19 +0430 (+0430)
Received: from mail.ut.ac.ir (mail.ut.ac.ir [194.225.0.10])
        by mail.ut.ac.ir (Postfix) with ESMTP id 9C8EA1DB1AE;
        Tue, 31 Mar 2020 18:09:18 +0430 (+0430)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Tue, 31 Mar 2020 18:09:18 +0430
From:   ahmadkhorrami <ahmadkhorrami@ut.ac.ir>
To:     Jiri Olsa <jolsa@redhat.com>
Cc:     Milian Wolff <milian.wolff@kdab.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Arnaldo Carvalho de Melo <acme@redhat.com>,
        Linux-trace Users <linux-trace-users@vger.kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        linux-trace-users-owner@vger.kernel.org,
        Jin Yao <yao.jin@linux.intel.com>,
        Namhyung Kim <namhyung@kernel.org>,
        Andi Kleen <ak@linux.intel.com>
Subject: Re: Wrong Perf Backtraces
In-Reply-To: <20200331132052.GD2518490@krava>
References: <821540886fc57d7749edee585a50602f@ut.ac.ir>
 <1867036.PIDvDuAF1L@agathebauer> <20200329192010.GA2361248@krava>
 <2522580.mvXUDI8C0e@agathebauer> <20200330130750.GC2361248@krava>
 <e51e7fc0bed5e79f5e7774fcd5389c3d@ut.ac.ir>
 <8cb4f94b11fbac6ca3a44b924b6ee7b3@ut.ac.ir>
 <cc4c1410059a672b81d27a1992cb5a9e@ut.ac.ir> <20200331132052.GD2518490@krava>
Message-ID: <08bf52eda6e699ee6b3070c75eac9123@ut.ac.ir>
X-Sender: ahmadkhorrami@ut.ac.ir
User-Agent: Roundcube Webmail/1.3.6
Sender: linux-trace-users-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-trace-users.vger.kernel.org>
X-Mailing-List: linux-trace-users@vger.kernel.org

But the addresses do not match. Do you confirm this as a bug in 
libdwarf,...?

So I will ignore addresses without a matching symbol. But they do not 
seem reliable!

Could you tell me the name of the library that generates the raw 
addresses, so that I can try to debug it?

Regards.

On 2020-03-31 17:50, Jiri Olsa wrote:

> On Tue, Mar 31, 2020 at 05:13:00PM +0430, ahmadkhorrami wrote: Hi,
> Please confirm my thought in the previous email, if it is correct.
> Regards.
> On 2020-03-30 23:35, ahmadkhorrami wrote:
> 
> Hi,
> Sorry, I did not pay attention to the fact that we need debug info to 
> be
> able to decode the callchain. So, without complete debug info the
> backtrace (either the symbols or the addresses) is bogus. But you say
> that the backtrace portions containing binaries with full debug info 
> are
> OK. Am I right? Please confirm if this is the case.
> If so, these portions may be enough for my current usecase.

you need debuginfo to resolve symbols and inlines,
raw addresses should be coorect

jirka
