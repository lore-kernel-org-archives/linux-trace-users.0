Return-Path: <SRS0=QNZT=5L=vger.kernel.org=linux-trace-users-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9784BC43331
	for <linux-trace-users@archiver.kernel.org>; Thu, 26 Mar 2020 13:20:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 78C182073E
	for <linux-trace-users@archiver.kernel.org>; Thu, 26 Mar 2020 13:20:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726270AbgCZNUe (ORCPT
        <rfc822;linux-trace-users@archiver.kernel.org>);
        Thu, 26 Mar 2020 09:20:34 -0400
Received: from mail.ut.ac.ir ([80.66.177.10]:53472 "EHLO mail.ut.ac.ir"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725994AbgCZNUe (ORCPT
        <rfc822;linux-trace-users@vger.kernel.org>);
        Thu, 26 Mar 2020 09:20:34 -0400
Received: from localhost (localhost [127.0.0.1])
        by mail.ut.ac.ir (Postfix) with ESMTP id DF6D61DAB38;
        Thu, 26 Mar 2020 17:50:28 +0430 (+0430)
Received: from mail.ut.ac.ir ([127.0.0.1])
        by localhost (mail.ut.ac.ir [127.0.0.1]) (amavisd-new, port 10024)
        with LMTP id qYYQZOMi1BFD; Thu, 26 Mar 2020 17:50:28 +0430 (+0430)
Received: from mail.ut.ac.ir (mail.ut.ac.ir [194.225.0.10])
        by mail.ut.ac.ir (Postfix) with ESMTP id 68B201DB12C;
        Thu, 26 Mar 2020 17:50:27 +0430 (+0430)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Thu, 26 Mar 2020 17:50:27 +0430
From:   ahmadkhorrami <ahmadkhorrami@ut.ac.ir>
To:     Jiri Olsa <jolsa@redhat.com>
Cc:     Steven Rostedt <rostedt@goodmis.org>,
        Arnaldo Carvalho de Melo <acme@redhat.com>,
        Linux-trace Users <linux-trace-users@vger.kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        linux-trace-users-owner@vger.kernel.org,
        Jin Yao <yao.jin@linux.intel.com>,
        Milian Wolff <milian.wolff@kdab.com>,
        Namhyung Kim <namhyung@kernel.org>,
        Changbin Du <changbin.du@intel.com>,
        Andi Kleen <ak@linux.intel.com>
Subject: Re: Wrong Perf Backtraces
In-Reply-To: <20200326095928.GF1947699@krava>
References: <9551c616b045299482fc9e26281c1062@ut.ac.ir>
 <20200325192858.GC19495@redhat.com>
 <4ffb7e2b6e272c20616fbf133a125fdf@ut.ac.ir> <20200325203921.GB1947699@krava>
 <20200325210252.GC1947699@krava>
 <20200325170932.34d52269@gandalf.local.home>
 <edcf2ce8838d83b1c2d44204d9ca001f@ut.ac.ir> <20200325214624.GD1947699@krava>
 <fba145203611e7edcd674cc0cec9974b@ut.ac.ir>
 <52904543671bcb68ea9109b90c3e4267@ut.ac.ir> <20200326095928.GF1947699@krava>
Message-ID: <243486883401862967ec2b06348c67f3@ut.ac.ir>
X-Sender: ahmadkhorrami@ut.ac.ir
User-Agent: Roundcube Webmail/1.3.6
Sender: linux-trace-users-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-trace-users.vger.kernel.org>
X-Mailing-List: linux-trace-users@vger.kernel.org

Hi,
First of all, many thanks for your time. Did you say that the first file 
has problems?

The first file (http://gofile.io/?c=qk6oXv) has repeated gmallocn()s 
while the second (https://gofile.io/?c=oGxgSM) also has problems with 
unmatched (not necessarily repeated) function calls. I am not sure if 
the kernel for the second one is 5.4.7 or the generic Ubuntu kernel. But 
the first one is certainly 5.4.7. Just to be clear, there were many 
instances of these unmatched <caller, callees>.
I have a simple python script that checks for this situation. It 
disassembles functions using GDB and checks the (directly called) target 
of each caller. I will put some comments in the script and upload it. 
Could you check to see if the python script detects any mismatches in 
your backtraces? It takes the perf script output file as input. I will 
upload the script in an hour.

Regards.

On 2020-03-26 14:29, Jiri Olsa wrote:

> On Thu, Mar 26, 2020 at 03:39:31AM +0430, ahmadkhorrami wrote:
> 
>> An here is the second one:
>> https://gofile.io/?c=oGxgSM
> 
> thanks, so far I don't see that, but I think it's because
> the 'inline' code does not resolve the libc dso correctly,
> CC-ing few other folks..
> 
> so I'm able to get:
> 
> EvJobScheduler 17382 13006.872877:      10000 
> mem_load_uops_retired.l3_miss:uppp:     7fffd2e06588         5080022 
> N/A|SNP N/A|TLB N/A|LCK N/A
> 7ffff4b04c74 [unknown] (/lib/x86_64-linux-gnu/libc-2.27.so)
> 7ffff4b072ec malloc+0x27c (/lib/x86_64-linux-gnu/libc-2.27.so)
> 7fffd9872ddd gmalloc+0xd 
> (/usr/lib/x86_64-linux-gnu/libpoppler.so.73.0.0)
> 7fffd9873391 copyString+0x11 
> (/usr/lib/x86_64-linux-gnu/libpoppler.so.73.0.0)
> 
> while you see:
> 
> EvJobScheduler 17382 13006.872877:      10000 
> mem_load_uops_retired.l3_miss:uppp:     7fffd2e06588         5080022 
> N/A|SNP N/A|TLB N/A|LCK N/A
> 7ffff4b04c74 _int_malloc+0x9a4 (/lib/x86_64-linux-gnu/libc-2.27.so)
> 7ffff4b072ec __GI___libc_malloc+0x27c (inlined)
> 7fffd9872ddd gmalloc+0xd 
> (/usr/lib/x86_64-linux-gnu/libpoppler.so.73.0.0)
> 7fffd9872ddd gmalloc+0xd 
> (/usr/lib/x86_64-linux-gnu/libpoppler.so.73.0.0)
> 
> so for some reason I don't resolve 7ffff4b04c74, which might
> be the reason I don't see the following address twice as you do:
> 
> 7fffd9872ddd gmalloc+0xd 
> (/usr/lib/x86_64-linux-gnu/libpoppler.so.73.0.0)
> 7fffd9872ddd gmalloc+0xd 
> (/usr/lib/x86_64-linux-gnu/libpoppler.so.73.0.0)
> 
> the previous field (7ffff4b072ec) is resolved by the
> 'inline' code, so I wonder it's related
> 
> I needed to make some changes to utils/srcline.c to be able
> to properly open dso via buildid cache, I pushed it to:
> 
> git://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git
> perf/callchain
> 
> here are the steps to get above output:
> 
> download perf.data and perf archive data from:
> https://gofile.io/?c=o95O7N
> http://gofile.io/?c=qk6oXv
> 
> $ unxz ./perf.data.xz
> $ tar xvf perf.data.tar.bz2 -C ~/.debug
> 
> compile perf from aobve tree/branch and run:
> 
> $ perf script -i perf.data
> 
> I think we might be missing some libraries in 'perf archive'
> by not following debug_link section, will check on this
> 
> jirka
> 
> Regards
> On 2020-03-26 02:51, ahmadkhorrami wrote:
> 
> Here is the link for the gmallocn()s:
> http://gofile.io/?c=qk6oXv
> I will send the second one as soon as the upload is finished:
> 
> Regards.
> 
> On 2020-03-26 02:16, Jiri Olsa wrote:
> 
> On Thu, Mar 26, 2020 at 02:07:39AM +0430, ahmadkhorrami wrote:
> 
> Here is the link for the gmallocn() case:
> https://gofile.io/?c=o95O7N
> The output for the second case is big. I have a small one produced
> several
> days ago the link of which is as follows:
> https://gofile.io/?c=OIPCjx
> looking good, but I still need you t run 'perf archive' on top of your
> data and send me the perf.data.tar.bz2 it generates, like:
> 
> [jolsa@krava perf]$ sudo ./perf record
> ^C[ perf record: Woken up 1 times to write data ]
> [ perf record: Captured and wrote 1.675 MB perf.data (6248 samples) ]
> 
> [jolsa@krava perf]$ sudo ./perf archive
> Now please run:
> 
> $ tar xvf perf.data.tar.bz2 -C ~/.debug
> 
> wherever you need to run 'perf report' on.
> 
> I need that perf.data.tar.bz2 generated from your data
> 
> thanks,
> jirka
> 
> Regards.
> 
> On 2020-03-26 01:39, Steven Rostedt wrote:
> 
> On Wed, 25 Mar 2020 22:02:52 +0100
> Jiri Olsa <jolsa@redhat.com> wrote:
> 
> yea, no luck.. so if you could generate some reasonable small
> perf.data that
> shows the issue and send it over together with 'perf archive' data
> privately
> to me and to whoever else ask for it, so we don't polute the list..
> Right. And it may be better if you compress it too.
> 
> xz perf.data
> 
> and attach the perf.data.xz (and only privately send it to Mr. Olsa).
> 
> -- Steve
> 
> or if you could put it somewhere on the web/ftp.. that'd be best
