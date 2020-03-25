Return-Path: <SRS0=L3+l=5K=vger.kernel.org=linux-trace-users-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA555C2D0E5
	for <linux-trace-users@archiver.kernel.org>; Wed, 25 Mar 2020 19:10:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 89AAD20658
	for <linux-trace-users@archiver.kernel.org>; Wed, 25 Mar 2020 19:10:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727174AbgCYTKm (ORCPT
        <rfc822;linux-trace-users@archiver.kernel.org>);
        Wed, 25 Mar 2020 15:10:42 -0400
Received: from mail.ut.ac.ir ([80.66.177.10]:49402 "EHLO mail.ut.ac.ir"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726838AbgCYTKm (ORCPT
        <rfc822;linux-trace-users@vger.kernel.org>);
        Wed, 25 Mar 2020 15:10:42 -0400
Received: from localhost (localhost [127.0.0.1])
        by mail.ut.ac.ir (Postfix) with ESMTP id 0E5371DAE28;
        Wed, 25 Mar 2020 23:40:37 +0430 (+0430)
Received: from mail.ut.ac.ir ([127.0.0.1])
        by localhost (mail.ut.ac.ir [127.0.0.1]) (amavisd-new, port 10024)
        with LMTP id hodNk39BK-0y; Wed, 25 Mar 2020 23:40:36 +0430 (+0430)
Received: from mail.ut.ac.ir (mail.ut.ac.ir [194.225.0.10])
        by mail.ut.ac.ir (Postfix) with ESMTP id 1E7DF1DAE00;
        Wed, 25 Mar 2020 23:40:36 +0430 (+0430)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Wed, 25 Mar 2020 23:40:36 +0430
From:   ahmadkhorrami <ahmadkhorrami@ut.ac.ir>
To:     Arnaldo Carvalho de Melo <acme@redhat.com>
Cc:     Jiri Olsa <jolsa@redhat.com>, Steven Rostedt <rostedt@goodmis.org>,
        Linux-trace Users <linux-trace-users@vger.kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        linux-trace-users-owner@vger.kernel.org,
        Jin Yao <yao.jin@linux.intel.com>
Subject: Re: Wrong Perf Backtraces
In-Reply-To: <20200325185831.GB19495@redhat.com>
References: <157597d74ff17f781d9de7e7e3defd13@ut.ac.ir>
 <bd85fc28dfb5dcf7fc10507c3c86a56d@ut.ac.ir>
 <20200322203421.715b32d8@oasis.local.home>
 <21b3df4080709f193d62b159887e2a83@ut.ac.ir> <20200323084942.GA1534489@krava>
 <ee43289d91fcae1c9ef5cc2429dc916b@ut.ac.ir>
 <8645d3626b4714690925328ab00373d6@ut.ac.ir> <20200325154643.GA1934048@krava>
 <20200325185831.GB19495@redhat.com>
Message-ID: <9551c616b045299482fc9e26281c1062@ut.ac.ir>
X-Sender: ahmadkhorrami@ut.ac.ir
User-Agent: Roundcube Webmail/1.3.6
Sender: linux-trace-users-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-trace-users.vger.kernel.org>
X-Mailing-List: linux-trace-users@vger.kernel.org

Thanks. But should I attach the files to the e-mail?

On 2020-03-25 23:28, Arnaldo Carvalho de Melo wrote:

> Em Wed, Mar 25, 2020 at 04:46:43PM +0100, Jiri Olsa escreveu: On Wed, 
> Mar 25, 2020 at 07:48:39PM +0430, ahmadkhorrami wrote: Hi,
> 
> Could you give me some hints about where the actual problem takes 
> place? Is
> the problem with "Perf" or the hardware part (i.e., "Hardware 
> Performance
> Counters")? Can I revise the problem by simply modifying the code? How 
> much
> work is needed?
> heya,
> might be some callchain processing bug, but I can't reproduce it on my 
> setup..
> would you have/make some simple example that would reproduce the issue?
> 
> Another option is that you'd send perf.data together with 'perf 
> archive' data.
> 
> Also.. we support 2 dwarf unwinders (libunwind/libdw).. not sure which 
> one you
> have compiled in, but would be helpful to see if the other shows the 
> same.

perf -vv

+

ldd `which perf`

Output will help us find out which unwinder is being used, as well as
the version of perf being used.

- Arnaldo
