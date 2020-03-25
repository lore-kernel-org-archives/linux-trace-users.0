Return-Path: <SRS0=L3+l=5K=vger.kernel.org=linux-trace-users-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5BD6C54FD0
	for <linux-trace-users@archiver.kernel.org>; Wed, 25 Mar 2020 15:18:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B5DDA20772
	for <linux-trace-users@archiver.kernel.org>; Wed, 25 Mar 2020 15:18:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727666AbgCYPSv (ORCPT
        <rfc822;linux-trace-users@archiver.kernel.org>);
        Wed, 25 Mar 2020 11:18:51 -0400
Received: from mail.ut.ac.ir ([80.66.177.10]:39202 "EHLO mail.ut.ac.ir"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727600AbgCYPSv (ORCPT
        <rfc822;linux-trace-users@vger.kernel.org>);
        Wed, 25 Mar 2020 11:18:51 -0400
Received: from localhost (localhost [127.0.0.1])
        by mail.ut.ac.ir (Postfix) with ESMTP id 9B9A01DAC93;
        Wed, 25 Mar 2020 19:48:41 +0430 (+0430)
Received: from mail.ut.ac.ir ([127.0.0.1])
        by localhost (mail.ut.ac.ir [127.0.0.1]) (amavisd-new, port 10024)
        with LMTP id yJIMe3bOvE9B; Wed, 25 Mar 2020 19:48:39 +0430 (+0430)
Received: from mail.ut.ac.ir (mail.ut.ac.ir [194.225.0.10])
        by mail.ut.ac.ir (Postfix) with ESMTP id 60EB41DA87E;
        Wed, 25 Mar 2020 19:48:39 +0430 (+0430)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Wed, 25 Mar 2020 19:48:39 +0430
From:   ahmadkhorrami <ahmadkhorrami@ut.ac.ir>
To:     Jiri Olsa <jolsa@redhat.com>
Cc:     Steven Rostedt <rostedt@goodmis.org>,
        Linux-trace Users <linux-trace-users@vger.kernel.org>,
        Arnaldo Carvalho de Melo <acme@redhat.com>,
        Peter Zijlstra <peterz@infradead.org>,
        linux-trace-users-owner@vger.kernel.org,
        Jin Yao <yao.jin@linux.intel.com>
Subject: Re: Wrong Perf Backtraces
In-Reply-To: <ee43289d91fcae1c9ef5cc2429dc916b@ut.ac.ir>
References: <157597d74ff17f781d9de7e7e3defd13@ut.ac.ir>
 <bd85fc28dfb5dcf7fc10507c3c86a56d@ut.ac.ir>
 <20200322203421.715b32d8@oasis.local.home>
 <21b3df4080709f193d62b159887e2a83@ut.ac.ir> <20200323084942.GA1534489@krava>
 <ee43289d91fcae1c9ef5cc2429dc916b@ut.ac.ir>
Message-ID: <8645d3626b4714690925328ab00373d6@ut.ac.ir>
X-Sender: ahmadkhorrami@ut.ac.ir
User-Agent: Roundcube Webmail/1.3.6
Sender: linux-trace-users-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-trace-users.vger.kernel.org>
X-Mailing-List: linux-trace-users@vger.kernel.org

Hi,

Could you give me some hints about where the actual problem takes place? 
Is the problem with "Perf" or the hardware part (i.e., "Hardware 
Performance Counters")? Can I revise the problem by simply modifying the 
code? How much work is needed?

Your suggestions will be appreciated, because your experience and 
knowledge in this area is much more.

Regards.

On 2020-03-23 14:33, ahmadkhorrami wrote:

> Hi,
> It seems that my previous e-mail is not sent, properly. So, here is a 
> link to the stackoverflow question:
> https://stackoverflow.com/questions/60766026/wrong-perf-backtraces
> 
> The perf is for Ubuntu 18.04 with the following "uname -a" output:
> Linux Ahmad-Laptop 5.0.0-37-generic #40~18.04.1-Ubuntu SMP Thu Nov 14 
> 12:06:39 UTC 2019 x86_64 x86_64 x86_64 GNU/Linux
> I also used a compiled Linux-5.4.7 kernel and its corresponding Perf 
> tool.
> 
> Regards.
> 
> On 2020-03-23 13:19, Jiri Olsa wrote:
> 
> On Mon, Mar 23, 2020 at 07:48:26AM +0430, ahmadkhorrami wrote:
> 
> Here is a link to the detailed question at Stackoverflow:
> 
> https://stackoverflow.com/questions/60766026/wrong-perf-backtraces
> hi,
> what perf version are you running?
> 
> jirka
> 
> I can copy it here, if needed.
> 
> Thanks
> 
> On 2020-03-23 05:04, Steven Rostedt wrote:
> 
> On Mon, 23 Mar 2020 00:54:01 +0430
> ahmadkhorrami <ahmadkhorrami@ut.ac.ir> wrote:
> 
> Hi,
> I used "Perf" to extract call graphs in an evince benchmark. The 
> command
> used is as follows:
> sudo perf record -d --call-graph dwarf -c 10000 e
> mem_load_uops_retired.l3_miss:uppp /opt/evince-3.28.4/bin/evince
> 
> I extracted the backtraces using "perf script" and found out that there
> are many corrupted backtrace instances. Some contained repeated 
> function
> calls, for example two consecutive gmallocn()s exactly at the same
> offsets. There are also some backtraces where the callers and callees 
> do
> not match.
> Could you show some examples of the backtraces you mention?
> 
> Note that that mappings are correct. In other words, each single line 
> of
> the reported backtraces is correct (i.e., addresses match with
> functions). But is seems that there are some function calls in the
> middle, which are missed by "Perf". Strangely, in all runs (and also
> with different sampling frequencies) the problem occurs exactly at the
> same place.
> 
> I am really confused and looking forward to any help. I can also send
> backtraces if needed.
> -- Steve
