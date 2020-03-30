Return-Path: <SRS0=Bv4Z=5P=vger.kernel.org=linux-trace-users-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 296C6C43331
	for <linux-trace-users@archiver.kernel.org>; Mon, 30 Mar 2020 19:05:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 05FEA2072E
	for <linux-trace-users@archiver.kernel.org>; Mon, 30 Mar 2020 19:05:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726781AbgC3TFN (ORCPT
        <rfc822;linux-trace-users@archiver.kernel.org>);
        Mon, 30 Mar 2020 15:05:13 -0400
Received: from mail.ut.ac.ir ([80.66.177.10]:55792 "EHLO mail.ut.ac.ir"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726518AbgC3TFN (ORCPT
        <rfc822;linux-trace-users@vger.kernel.org>);
        Mon, 30 Mar 2020 15:05:13 -0400
Received: from localhost (localhost [127.0.0.1])
        by mail.ut.ac.ir (Postfix) with ESMTP id EA36A1DB133;
        Mon, 30 Mar 2020 23:35:09 +0430 (+0430)
Received: from mail.ut.ac.ir ([127.0.0.1])
        by localhost (mail.ut.ac.ir [127.0.0.1]) (amavisd-new, port 10024)
        with LMTP id xM16TJwSrOiN; Mon, 30 Mar 2020 23:35:09 +0430 (+0430)
Received: from mail.ut.ac.ir (mail.ut.ac.ir [194.225.0.10])
        by mail.ut.ac.ir (Postfix) with ESMTP id 864E61DB13A;
        Mon, 30 Mar 2020 23:35:08 +0430 (+0430)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Date:   Mon, 30 Mar 2020 23:35:08 +0430
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
In-Reply-To: <e51e7fc0bed5e79f5e7774fcd5389c3d@ut.ac.ir>
References: <821540886fc57d7749edee585a50602f@ut.ac.ir>
 <1867036.PIDvDuAF1L@agathebauer> <20200329192010.GA2361248@krava>
 <2522580.mvXUDI8C0e@agathebauer> <20200330130750.GC2361248@krava>
 <e51e7fc0bed5e79f5e7774fcd5389c3d@ut.ac.ir>
Message-ID: <8cb4f94b11fbac6ca3a44b924b6ee7b3@ut.ac.ir>
X-Sender: ahmadkhorrami@ut.ac.ir
User-Agent: Roundcube Webmail/1.3.6
Sender: linux-trace-users-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-trace-users.vger.kernel.org>
X-Mailing-List: linux-trace-users@vger.kernel.org

Hi,
Sorry, I did not pay attention to the fact that we need debug info to be 
able to decode the callchain. So, without complete debug info the 
backtrace (either the symbols or the addresses) is bogus. But you say 
that the backtrace portions containing binaries with full debug info are 
OK. Am I right? Please confirm if this is the case.
If so, these portions may be enough for my current usecase.
Regards.

On 2020-03-30 18:19, ahmadkhorrami wrote:

> Hi,
> thanks, but I still do not understand the cause of the problem. It 
> seems that it is purely a software bug and the callchain addresses seem 
> wrong,by themselves. Am I right?
> Regards.
> On 2020-03-30 17:37, Jiri Olsa wrote:
> 
>> On Mon, Mar 30, 2020 at 08:09:53AM +0200, Milian Wolff wrote: On 
>> Sonntag, 29. März 2020 21:20:10 CEST Jiri Olsa wrote: On Sun, Mar 29, 
>> 2020 at 03:50:57PM +0200, Milian Wolff wrote: On Sonntag, 29. März 
>> 2020 14:39:33 CEST ahmadkhorrami wrote: Thanks. I did both of your 
>> changes. Perhaps some outputs are revised.
>> But I still have repeated function calls and the script detects them.
>> Here is one of them when the sampling period is 1000 events: <snip>
>> 
>> Here, we have two consecutive "7f91788120b5
>> gtk_widget_propagate_state+0x195
>> (/usr/lib/x86_64-linux-gnu/libgtk-3.so.0.2200.30) gtkwidget.c:0" 
>> lines,
>> while "gtk_widget_propagate_state+0x195" is not recursive. It should
>> call "gtk_container_forall", which does not occur even after the 
>> second
>> (inner) call.
>> Potentially you are just lacking some debug symbols here for this GTK
>> library. note that "gtkwidget.c:0" is bogus already - the line numbers
>> start with 1, so
> could we just skip those then? pass on all zero lined inlines
> and not add/display them
> I guess so - but quite frankly I'm a bit uneasy to do this without 
> further
> exploration about the actual causes here. Afaik DWARF does not say 
> anything
> about the validity, so in theory there might be some language/compiler 
> that
> encodes valid DWARF locations with line 0?
> 
> Generally, it would be quite interesting to figure out why there is 
> /some/
> DWARF data here such that the code thinks it's able to decode the 
> inline frame
> but then fails and leads to this confusing result?
> right, but it's beyond my DWARF expertise ;-) we'll need
> to wait till one of you guys could take a look on it
> 
> thanks,
> jirka
