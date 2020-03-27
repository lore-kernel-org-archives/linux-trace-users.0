Return-Path: <SRS0=ls0D=5M=vger.kernel.org=linux-trace-users-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8717CC43331
	for <linux-trace-users@archiver.kernel.org>; Fri, 27 Mar 2020 23:13:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5D71120717
	for <linux-trace-users@archiver.kernel.org>; Fri, 27 Mar 2020 23:13:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726912AbgC0XNA (ORCPT
        <rfc822;linux-trace-users@archiver.kernel.org>);
        Fri, 27 Mar 2020 19:13:00 -0400
Received: from mail.ut.ac.ir ([80.66.177.10]:57032 "EHLO mail.ut.ac.ir"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726781AbgC0XM7 (ORCPT
        <rfc822;linux-trace-users@vger.kernel.org>);
        Fri, 27 Mar 2020 19:12:59 -0400
Received: from localhost (localhost [127.0.0.1])
        by mail.ut.ac.ir (Postfix) with ESMTP id 1633A108081;
        Sat, 28 Mar 2020 03:42:55 +0430 (+0430)
Received: from mail.ut.ac.ir ([127.0.0.1])
        by localhost (mail.ut.ac.ir [127.0.0.1]) (amavisd-new, port 10024)
        with LMTP id pCvQOkjwK1iM; Sat, 28 Mar 2020 03:42:54 +0430 (+0430)
Received: from mail.ut.ac.ir (mail.ut.ac.ir [194.225.0.10])
        by mail.ut.ac.ir (Postfix) with ESMTP id C4DAB10807F;
        Sat, 28 Mar 2020 03:42:53 +0430 (+0430)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Sat, 28 Mar 2020 03:42:53 +0430
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
In-Reply-To: <20200327223743.GA2155755@krava>
References: <fba145203611e7edcd674cc0cec9974b@ut.ac.ir>
 <52904543671bcb68ea9109b90c3e4267@ut.ac.ir> <20200326095928.GF1947699@krava>
 <243486883401862967ec2b06348c67f3@ut.ac.ir> <20200326153950.GG1947699@krava>
 <bf654a5cfe5a2a4188a286f1f5868e17@ut.ac.ir> <20200327092045.GH1947699@krava>
 <821540886fc57d7749edee585a50602f@ut.ac.ir>
 <decdc878b1bf207c68f1bc9e21178486@ut.ac.ir>
 <fd99185b401a451fdbf96439eadcb101@ut.ac.ir> <20200327223743.GA2155755@krava>
Message-ID: <57b9e24200019a41bd465e2d78c09e29@ut.ac.ir>
X-Sender: ahmadkhorrami@ut.ac.ir
User-Agent: Roundcube Webmail/1.3.6
Sender: linux-trace-users-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-trace-users.vger.kernel.org>
X-Mailing-List: linux-trace-users@vger.kernel.org

Hi,
Thanks. If you suggest the potentially bogus locations of the source 
code, I will give a try.
Regards.

On 2020-03-28 03:07, Jiri Olsa wrote:

> On Fri, Mar 27, 2020 at 11:13:27PM +0430, ahmadkhorrami wrote:
> 
>> Hi,
>> I revised the code. Hopefully, it works. Could you check it with your 
>> own
>> outputs? It is valuable for me to know if your output contains wrong
>> backtraces or not. Here is the link:
>> https://gofile.io/?c=rz2kGc
> 
> will check, so far caught one.. might be same case:
> 
> evince 2168454 1549196.055094:      43831 cycles:u:
> ffffffffaec012f0 [unknown] ([unknown])
> 7f0dd44776b6 __mmap64+0x26 (inlined)
> 7f0dd44776b6 __mmap64+0x26 (inlined)
> 
> will try to investigate next week
> 
> thanks,
> jirka
> 
> Regards.
> 
> On 2020-03-27 15:34, ahmadkhorrami wrote:
> 
> I do the following:
> If this line is in the perf script backtrace:
> 7f21ffe256db g_main_context_iteration+0x2b
> (/usr/lib/x86_64-linux-gnu/libglib-2.0.so.0.5600.4)
> I run the following command:
> gdb -batch -ex 'file /usr/lib/x86_64-linux-gnu/libglib-2.0.so.0.5600.4'
> -ex 'disass g_main_context_iteration'.
> 
> Regards.
> 
> On 2020-03-27 15:29, ahmadkhorrami wrote:
> 
> Hi,
> Thanks! Could you tell me what should be changed in order to make
> the code runnable on your system, if it is possible?
> Regards.
> 
> On 2020-03-27 13:50, Jiri Olsa wrote:
> 
> On Thu, Mar 26, 2020 at 10:49:12PM +0430, ahmadkhorrami wrote:
> 
> Hi,
> Here is the link for the python script:
> https://gofile.io/?c=1ZSLwe
> It is written in python-3 and takes the perf script output as input.
> It looks for consecutive repeated backtrace lines and checks if the
> function
> in these lines calls itself at the offset in the line (i.e., checks if
> recursion is possible). If not possible it reports an error. Could
> you check
> to see if any error is detected in your outputs, please?
> I'm getting tons of following output:
> 
> /usr/lib/x86_64-linux-gnu/libgtk-3.so.0.2200.30: No such file or
> directory.
> No symbol table is loaded.  Use the "file" command.
> 7ffff71b9bc1 gtk_css_node_invalidate_timestamp+0x31
> (/usr/lib/x86_64-linux-gnu/libgtk-3.so.0.2200.30)
> 
> I assume it's because I have all the dso binaries stored
> under .biuldid path, while you check the output name
> 
> jirka
> 
> Regards.
> On 2020-03-26 20:09, Jiri Olsa wrote:
> 
> On Thu, Mar 26, 2020 at 05:50:27PM +0430, ahmadkhorrami wrote:
> 
> Hi,
> First of all, many thanks for your time. Did you say that the first
> file has
> problems?
> 
> The first file (http://gofile.io/?c=qk6oXv) has repeated gmallocn()s
> while
> the second (https://gofile.io/?c=oGxgSM) also has problems with
> unmatched
> (not necessarily repeated) function calls. I am not sure if the
> kernel for
> the second one is 5.4.7 or the generic Ubuntu kernel. But the first
> one is
> certainly 5.4.7. Just to be clear, there were many instances of these
> unmatched <caller, callees>.
> I can se all the files, but I just can't see the issue yet
> but it's probably because of issues with perf archive..
> 
> let's see if somebody else can chime in
> 
> I have a simple python script that checks for this situation. It
> disassembles functions using GDB and checks the (directly called)
> target of
> each caller. I will put some comments in the script and upload it.
> Could you
> check to see if the python script detects any mismatches in your
> backtraces?
> It takes the perf script output file as input. I will upload the
> script in
> an hour.
> ok
> 
> jirka
