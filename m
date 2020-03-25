Return-Path: <SRS0=L3+l=5K=vger.kernel.org=linux-trace-users-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56181C2D0E5
	for <linux-trace-users@archiver.kernel.org>; Wed, 25 Mar 2020 18:54:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2AD182074D
	for <linux-trace-users@archiver.kernel.org>; Wed, 25 Mar 2020 18:54:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727306AbgCYSyy (ORCPT
        <rfc822;linux-trace-users@archiver.kernel.org>);
        Wed, 25 Mar 2020 14:54:54 -0400
Received: from mail.ut.ac.ir ([80.66.177.10]:39196 "EHLO mail.ut.ac.ir"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727006AbgCYSyy (ORCPT
        <rfc822;linux-trace-users@vger.kernel.org>);
        Wed, 25 Mar 2020 14:54:54 -0400
Received: from localhost (localhost [127.0.0.1])
        by mail.ut.ac.ir (Postfix) with ESMTP id C28F51DAE09;
        Wed, 25 Mar 2020 23:24:50 +0430 (+0430)
Received: from mail.ut.ac.ir ([127.0.0.1])
        by localhost (mail.ut.ac.ir [127.0.0.1]) (amavisd-new, port 10024)
        with LMTP id 5h_wS1dZsN-r; Wed, 25 Mar 2020 23:24:50 +0430 (+0430)
Received: from mail.ut.ac.ir (mail.ut.ac.ir [194.225.0.10])
        by mail.ut.ac.ir (Postfix) with ESMTP id CBB751DADFF;
        Wed, 25 Mar 2020 23:24:49 +0430 (+0430)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Wed, 25 Mar 2020 23:24:49 +0430
From:   ahmadkhorrami <ahmadkhorrami@ut.ac.ir>
To:     Jiri Olsa <jolsa@redhat.com>
Cc:     Steven Rostedt <rostedt@goodmis.org>,
        Linux-trace Users <linux-trace-users@vger.kernel.org>,
        Arnaldo Carvalho de Melo <acme@redhat.com>,
        Peter Zijlstra <peterz@infradead.org>,
        linux-trace-users-owner@vger.kernel.org,
        Jin Yao <yao.jin@linux.intel.com>
Subject: Re: Wrong Perf Backtraces
In-Reply-To: <20200325154643.GA1934048@krava>
References: <157597d74ff17f781d9de7e7e3defd13@ut.ac.ir>
 <bd85fc28dfb5dcf7fc10507c3c86a56d@ut.ac.ir>
 <20200322203421.715b32d8@oasis.local.home>
 <21b3df4080709f193d62b159887e2a83@ut.ac.ir> <20200323084942.GA1534489@krava>
 <ee43289d91fcae1c9ef5cc2429dc916b@ut.ac.ir>
 <8645d3626b4714690925328ab00373d6@ut.ac.ir> <20200325154643.GA1934048@krava>
Message-ID: <ccc1acd1374df5d74e8935df56c22344@ut.ac.ir>
X-Sender: ahmadkhorrami@ut.ac.ir
User-Agent: Roundcube Webmail/1.3.6
Sender: linux-trace-users-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-trace-users.vger.kernel.org>
X-Mailing-List: linux-trace-users@vger.kernel.org

Thanks.
I used an evince-3.28.4 and the following command:
sudo perf record -d --call-graph dwarf -c 100 -e 
mem_load_uops_retired.l3_miss:uppp /opt/evince-3.28.4/bin/evince

I only opened a file and, then, closed it using ALT+F4. The repeated 
gmallocn()s is reproducible with any sampling frequency, but the other 
backtrace is sometimes not reproducible in low frequencies. Where should 
I send you the log file?
Regards.

On 2020-03-25 20:16, Jiri Olsa wrote:

> On Wed, Mar 25, 2020 at 07:48:39PM +0430, ahmadkhorrami wrote:
> 
>> Hi,
>> 
>> Could you give me some hints about where the actual problem takes 
>> place? Is
>> the problem with "Perf" or the hardware part (i.e., "Hardware 
>> Performance
>> Counters")? Can I revise the problem by simply modifying the code? How 
>> much
>> work is needed?
> 
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
> 
> jirka
