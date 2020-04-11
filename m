Return-Path: <SRS0=xzDi=53=vger.kernel.org=linux-trace-users-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 204F7C2BA19
	for <linux-trace-users@archiver.kernel.org>; Sat, 11 Apr 2020 21:04:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D670420674
	for <linux-trace-users@archiver.kernel.org>; Sat, 11 Apr 2020 21:04:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726204AbgDKVE3 (ORCPT
        <rfc822;linux-trace-users@archiver.kernel.org>);
        Sat, 11 Apr 2020 17:04:29 -0400
Received: from mail.ut.ac.ir ([80.66.177.10]:55504 "EHLO mail.ut.ac.ir"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726167AbgDKVE3 (ORCPT
        <rfc822;linux-trace-users@vger.kernel.org>);
        Sat, 11 Apr 2020 17:04:29 -0400
Received: from localhost (localhost [127.0.0.1])
        by mail.ut.ac.ir (Postfix) with ESMTP id D7CEA1DA8A3;
        Sun, 12 Apr 2020 01:34:25 +0430 (+0430)
Received: from mail.ut.ac.ir ([127.0.0.1])
        by localhost (mail.ut.ac.ir [127.0.0.1]) (amavisd-new, port 10024)
        with LMTP id XLFex0RNLv62; Sun, 12 Apr 2020 01:34:21 +0430 (+0430)
Received: from mail.ut.ac.ir (mail.ut.ac.ir [194.225.0.10])
        by mail.ut.ac.ir (Postfix) with ESMTP id BD60F1DA7BF;
        Sun, 12 Apr 2020 01:34:20 +0430 (+0430)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Date:   Sun, 12 Apr 2020 01:34:20 +0430
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
In-Reply-To: <e624e60c697934beb88cb8744f23c68b@ut.ac.ir>
References: <821540886fc57d7749edee585a50602f@ut.ac.ir>
 <8573002.CDJkKcVGEf@agathebauer> <fe8e797932c0cb6d1b8db2ee9b991ed0@ut.ac.ir>
 <7774721.NyiUUSuA9g@agathebauer> <e97fc4aeff263bc1eb0206b7a3c22011@ut.ac.ir>
 <9dc590447c61e044934bdad4127297b8@ut.ac.ir>
 <e624e60c697934beb88cb8744f23c68b@ut.ac.ir>
Message-ID: <f1b212e2b5035bbb2ccfb4e74f6f28cd@ut.ac.ir>
X-Sender: ahmadkhorrami@ut.ac.ir
User-Agent: Roundcube Webmail/1.3.6
Sender: linux-trace-users-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-trace-users.vger.kernel.org>
X-Mailing-List: linux-trace-users@vger.kernel.org

I traced the code and it jumped into PLT and .... Therefore, it seems 
that it is actually a function call and is incorrectly reported as 
inline. In other words, this is a called function incorrectly reported 
as inline, while the "gmallocn" case was an inline incorrectly omitted. 
Hopefully, I'm right.

Regards.

On 2020-04-11 21:12, ahmadkhorrami wrote:

> Hi,
> I found the problem by building the libraries from source code. The 
> "gmallocn()"s were inlines. So, perhaps it would be better if Perf had 
> reported it as "(inlined)" as in the common case.
> The second problematic case (repeated 
> "gtk_action_muxer_query_action()"s) was purely due to my lack of 
> knowledge. Sorry for wasting your time, specially, Mr. Olsa, :D. It was 
> inter-library tail-call elimination, which I did not know is possible 
> (I thought tail-calls happen only inside each translation unit). In 
> other words, the last operation in the callee at 
> "gtk_action_muxer_query_action+0x6c" is a jump to the beginning of 
> "gtk_action_muxer_query_action()".
> And the debug info for the dbg-packages (Ubuntu in my case), seems to 
> be OK. I wonder why source lines were reported as 0. Perhaps, the 
> unwinding library is bogus.
> 
> Finally, I have a new (hopefully, unsilly) question, :D. In the 
> following backtrace, __GI___libc_malloc+0x197 is reported as inline. 
> While its address (i.e., 0x7ffff4b07207) does not match that of its 
> parent function call point (i.e., gmalloc+0x59 which is 
> 0x7fffd9872fb9). Is this logical? And, again, there are many such 
> instances in the Perf output.
> 
> EvJobScheduler 10021  8653.926478:        100 
> mem_load_uops_retired.l3_miss:uppp:     7fffd1062a00         5080022 
> N/A|SNP N/A|TLB N/A|LCK N/A
> 7ffff4b07207 tcache_get+0x197 (inlined)
> 7ffff4b07207 __GI___libc_malloc+0x197 (inlined)
> 7fffd9872fb9 gmalloc+0x59 (inlined)
> 7fffd9872fb9 gmallocn+0x59 
> (/usr/lib/x86_64-linux-gnu/libpoppler.so.73.0.0)
> 7fffd9872fb9 gmallocn+0x59 
> (/usr/lib/x86_64-linux-gnu/libpoppler.so.73.0.0)
> 7fffd9951e6f _ZN8TextLine8coalesceEP10UnicodeMap+0xff 
> (/usr/lib/x86_64-linux-gnu/libpoppler.so.73.0.0)
> 7fffd9952f82 _ZN9TextBlock8coalesceEP10UnicodeMapd+0x752 
> (/usr/lib/x86_64-linux-gnu/libpoppler.so.73.0.0)
> 7fffd995bc37 _ZN8TextPage8coalesceEbdb+0x1507 
> (/usr/lib/x86_64-linux-gnu/libpoppler.so.73.0.0)
> 7fffd995cb71 _ZN13TextOutputDev7endPageEv+0x31 
> (/usr/lib/x86_64-linux-gnu/libpoppler.so.73.0.0)
> 7fffe803c6d2 _ZL26poppler_page_get_text_pageP12_PopplerPage+0x92 
> (/usr/lib/x86_64-linux-gnu/libpoppler-glib.so.8.9.0)
> 7fffe803deb3 poppler_page_get_selection_region+0x63 
> (/usr/lib/x86_64-linux-gnu/libpoppler-glib.so.8.9.0)
> 7fffe82ab650 [unknown] 
> (/opt/evince-3.28.4/lib/evince/4/backends/libpdfdocument.so)
> 7ffff795f165 ev_job_page_data_run+0x2f5 
> (/opt/evince-3.28.4/lib/libevview3.so.3.0.0)
> 7ffff7961309 ev_job_thread+0xe9 (inlined)
> 7ffff7961309 ev_job_thread_proxy+0xe9 
> (/opt/evince-3.28.4/lib/libevview3.so.3.0.0)
> 7ffff5492194 g_thread_proxy+0x54 
> (/usr/lib/x86_64-linux-gnu/libglib-2.0.so.0.5600.4)
> 7ffff4e686da start_thread+0xda 
> (/lib/x86_64-linux-gnu/libpthread-2.27.so)
> 7ffff4b9188e __GI___clone+0x3e (inlined)
> 
> I am looking forward to any help or suggestions.
> Regards.
> 
> On 2020-04-04 05:31, ahmadkhorrami wrote:
> 
> Hi,
> I think that I should give up and assume that all illogical repeated 
> addresses are inlines. Thanks everybody, especially, Jirka, Milian, 
> Arnaldo and Steven. Perhaps some day I will be back and try to dig 
> deeper (with your hints and assistance).
> Regards.
> 
> On 2020-04-01 01:27, ahmadkhorrami wrote:
> 
> Hi,
> On 2020-03-31 19:59, Milian Wolff wrote:
> 
> On Dienstag, 31. März 2020 17:02:37 CEST ahmadkhorrami wrote:
> 
> Hi Milian,
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
> it, then it's something different. Well, the problem exists even when 
> ":uppp" is changed to ":u".
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
> 
> Cheers
    Regards.
