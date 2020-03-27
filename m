Return-Path: <SRS0=ls0D=5M=vger.kernel.org=linux-trace-users-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CBA6C2D0E5
	for <linux-trace-users@archiver.kernel.org>; Fri, 27 Mar 2020 12:58:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id DFC1920848
	for <linux-trace-users@archiver.kernel.org>; Fri, 27 Mar 2020 12:58:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727263AbgC0M6i (ORCPT
        <rfc822;linux-trace-users@archiver.kernel.org>);
        Fri, 27 Mar 2020 08:58:38 -0400
Received: from mail.ut.ac.ir ([80.66.177.10]:59302 "EHLO mail.ut.ac.ir"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726165AbgC0M6h (ORCPT
        <rfc822;linux-trace-users@vger.kernel.org>);
        Fri, 27 Mar 2020 08:58:37 -0400
Received: from localhost (localhost [127.0.0.1])
        by mail.ut.ac.ir (Postfix) with ESMTP id 7EEF71DB242;
        Fri, 27 Mar 2020 17:28:34 +0430 (+0430)
Received: from mail.ut.ac.ir ([127.0.0.1])
        by localhost (mail.ut.ac.ir [127.0.0.1]) (amavisd-new, port 10024)
        with LMTP id 18dSuOjHSDqf; Fri, 27 Mar 2020 17:28:33 +0430 (+0430)
Received: from mail.ut.ac.ir (mail.ut.ac.ir [194.225.0.10])
        by mail.ut.ac.ir (Postfix) with ESMTP id 42D621DB217;
        Fri, 27 Mar 2020 17:28:33 +0430 (+0430)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Date:   Fri, 27 Mar 2020 17:28:33 +0430
From:   ahmadkhorrami <ahmadkhorrami@ut.ac.ir>
To:     Milian Wolff <milian.wolff@kdab.com>
Cc:     Jiri Olsa <jolsa@redhat.com>, Steven Rostedt <rostedt@goodmis.org>,
        Arnaldo Carvalho de Melo <acme@redhat.com>,
        Linux-trace Users <linux-trace-users@vger.kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        linux-trace-users-owner@vger.kernel.org,
        Jin Yao <yao.jin@linux.intel.com>,
        Namhyung Kim <namhyung@kernel.org>,
        Changbin Du <changbin.du@intel.com>,
        Andi Kleen <ak@linux.intel.com>
Subject: Re: Wrong Perf Backtraces
In-Reply-To: <2478802.X9hSmTKtgW@agathebauer>
References: <20200325210252.GC1947699@krava>
 <821540886fc57d7749edee585a50602f@ut.ac.ir>
 <decdc878b1bf207c68f1bc9e21178486@ut.ac.ir> <2478802.X9hSmTKtgW@agathebauer>
Message-ID: <ca0cb1410a799267a2e1e23b6e8f7535@ut.ac.ir>
X-Sender: ahmadkhorrami@ut.ac.ir
User-Agent: Roundcube Webmail/1.3.6
Sender: linux-trace-users-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-trace-users.vger.kernel.org>
X-Mailing-List: linux-trace-users@vger.kernel.org

Hi,
Thanks Milian. So if I am right, I should do the following:
1) Run "perf buildid-list" and catch all the <file path, build-ids> 
pairs.
2) First check for the existence of the file path.
3) If failed, concatenate "~/.debug", file path, "/" and buildid and use 
it as the alternative.
I thought that GDB is smart enough to detect these situations in the 
same way that it detects debug info files.
Should I check any directory other than ~/.debug?
Regards.

On 2020-03-27 16:40, Milian Wolff wrote:

> On Freitag, 27. März 2020 12:04:20 CET ahmadkhorrami wrote:
> 
>> I do the following:
>> If this line is in the perf script backtrace:
>> 7f21ffe256db g_main_context_iteration+0x2b
>> (/usr/lib/x86_64-linux-gnu/libglib-2.0.so.0.5600.4)
>> I run the following command:
>> gdb -batch -ex 'file 
>> /usr/lib/x86_64-linux-gnu/libglib-2.0.so.0.5600.4'
>> -ex 'disass g_main_context_iteration'.
> 
> You can try to parse the output of `perf buildid-list` to get a mapping 
> that
> can be used to run this on another person's machine. E.g.
> 
> ```
> $ perf buildid-list
> 5837b1e7495db791f9a3a56fb6ca29958da75b0c [kernel.kallsyms]
> 845f98f6a3019620c37a2f611b2f20c27de83d5b 
> /home/milian/projects/kdab/rnd/
> hotspot/build/tests/test-clients/cpp-parallel/cpp-parallel
> f6ca5853dae87d9f0503a9ef230f6d1fa15a832d /usr/lib/ld-2.30.so
> 92883b06055e8e21ded8eb0cd5a61f5704531152 [vdso]
> 8b04d1825b63d9a600e3d57ac71058935e7ad757 /usr/lib/libpthread-2.30.so
> 09639b80a8fad179004f2484608764d2b336dd4a /usr/lib/libstdc++.so.6.0.27
> 33d1f350f13728651d74dd2a56bad1e4e4648f5e /usr/lib/libc-2.30.so
> $ file 
> ~/.debug/usr/lib/ld-2.30.so/f6ca5853dae87d9f0503a9ef230f6d1fa15a832d/
> elf
> /home/milian/.debug/usr/lib/ld-2.30.so/
> f6ca5853dae87d9f0503a9ef230f6d1fa15a832d/elf: ELF 64-bit LSB shared 
> object,
> x86-64, version 1 (SYSV), statically linked,
> BuildID[sha1]=f6ca5853dae87d9f0503a9ef230f6d1fa15a832d, not stripped
> ```
> 
> I'm afraid to say that I currently don't have the time required to be 
> of more
> help in debugging this issue in general.
> 
> Good luck!
