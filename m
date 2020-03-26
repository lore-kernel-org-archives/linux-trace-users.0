Return-Path: <SRS0=QNZT=5L=vger.kernel.org=linux-trace-users-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB93EC43331
	for <linux-trace-users@archiver.kernel.org>; Thu, 26 Mar 2020 18:19:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9D58120719
	for <linux-trace-users@archiver.kernel.org>; Thu, 26 Mar 2020 18:19:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727192AbgCZSTR (ORCPT
        <rfc822;linux-trace-users@archiver.kernel.org>);
        Thu, 26 Mar 2020 14:19:17 -0400
Received: from mail.ut.ac.ir ([80.66.177.10]:59034 "EHLO mail.ut.ac.ir"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727738AbgCZSTR (ORCPT
        <rfc822;linux-trace-users@vger.kernel.org>);
        Thu, 26 Mar 2020 14:19:17 -0400
Received: from localhost (localhost [127.0.0.1])
        by mail.ut.ac.ir (Postfix) with ESMTP id 27C611DB206;
        Thu, 26 Mar 2020 22:49:14 +0430 (+0430)
Received: from mail.ut.ac.ir ([127.0.0.1])
        by localhost (mail.ut.ac.ir [127.0.0.1]) (amavisd-new, port 10024)
        with LMTP id JrrnlMFIhcUP; Thu, 26 Mar 2020 22:49:13 +0430 (+0430)
Received: from mail.ut.ac.ir (mail.ut.ac.ir [194.225.0.10])
        by mail.ut.ac.ir (Postfix) with ESMTP id B79F01DB1FD;
        Thu, 26 Mar 2020 22:49:12 +0430 (+0430)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Thu, 26 Mar 2020 22:49:12 +0430
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
In-Reply-To: <20200326153950.GG1947699@krava>
References: <4ffb7e2b6e272c20616fbf133a125fdf@ut.ac.ir>
 <20200325203921.GB1947699@krava> <20200325210252.GC1947699@krava>
 <20200325170932.34d52269@gandalf.local.home>
 <edcf2ce8838d83b1c2d44204d9ca001f@ut.ac.ir> <20200325214624.GD1947699@krava>
 <fba145203611e7edcd674cc0cec9974b@ut.ac.ir>
 <52904543671bcb68ea9109b90c3e4267@ut.ac.ir> <20200326095928.GF1947699@krava>
 <243486883401862967ec2b06348c67f3@ut.ac.ir> <20200326153950.GG1947699@krava>
Message-ID: <bf654a5cfe5a2a4188a286f1f5868e17@ut.ac.ir>
X-Sender: ahmadkhorrami@ut.ac.ir
User-Agent: Roundcube Webmail/1.3.6
Sender: linux-trace-users-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-trace-users.vger.kernel.org>
X-Mailing-List: linux-trace-users@vger.kernel.org

Hi,
Here is the link for the python script:
https://gofile.io/?c=1ZSLwe
It is written in python-3 and takes the perf script output as input.
It looks for consecutive repeated backtrace lines and checks if the 
function in these lines calls itself at the offset in the line (i.e., 
checks if recursion is possible). If not possible it reports an error. 
Could you check to see if any error is detected in your outputs, please?
Regards.
On 2020-03-26 20:09, Jiri Olsa wrote:

> On Thu, Mar 26, 2020 at 05:50:27PM +0430, ahmadkhorrami wrote:
> 
>> Hi,
>> First of all, many thanks for your time. Did you say that the first 
>> file has
>> problems?
>> 
>> The first file (http://gofile.io/?c=qk6oXv) has repeated gmallocn()s 
>> while
>> the second (https://gofile.io/?c=oGxgSM) also has problems with 
>> unmatched
>> (not necessarily repeated) function calls. I am not sure if the kernel 
>> for
>> the second one is 5.4.7 or the generic Ubuntu kernel. But the first 
>> one is
>> certainly 5.4.7. Just to be clear, there were many instances of these
>> unmatched <caller, callees>.
> 
> I can se all the files, but I just can't see the issue yet
> but it's probably because of issues with perf archive..
> 
> let's see if somebody else can chime in
> 
>> I have a simple python script that checks for this situation. It
>> disassembles functions using GDB and checks the (directly called) 
>> target of
>> each caller. I will put some comments in the script and upload it. 
>> Could you
>> check to see if the python script detects any mismatches in your 
>> backtraces?
>> It takes the perf script output file as input. I will upload the 
>> script in
>> an hour.
> 
> ok
> 
> jirka
