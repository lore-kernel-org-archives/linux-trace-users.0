Return-Path: <SRS0=qAvV=5O=vger.kernel.org=linux-trace-users-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4B8DC43331
	for <linux-trace-users@archiver.kernel.org>; Sun, 29 Mar 2020 14:23:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A2A08206F6
	for <linux-trace-users@archiver.kernel.org>; Sun, 29 Mar 2020 14:23:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727976AbgC2OXe (ORCPT
        <rfc822;linux-trace-users@archiver.kernel.org>);
        Sun, 29 Mar 2020 10:23:34 -0400
Received: from mail.ut.ac.ir ([80.66.177.10]:38166 "EHLO mail.ut.ac.ir"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727488AbgC2OXe (ORCPT
        <rfc822;linux-trace-users@vger.kernel.org>);
        Sun, 29 Mar 2020 10:23:34 -0400
Received: from localhost (localhost [127.0.0.1])
        by mail.ut.ac.ir (Postfix) with ESMTP id 370941DAC5D;
        Sun, 29 Mar 2020 18:53:31 +0430 (+0430)
Received: from mail.ut.ac.ir ([127.0.0.1])
        by localhost (mail.ut.ac.ir [127.0.0.1]) (amavisd-new, port 10024)
        with LMTP id lTTIMm9qXWaJ; Sun, 29 Mar 2020 18:53:30 +0430 (+0430)
Received: from mail.ut.ac.ir (mail.ut.ac.ir [194.225.0.10])
        by mail.ut.ac.ir (Postfix) with ESMTP id 202101DAC4F;
        Sun, 29 Mar 2020 18:53:30 +0430 (+0430)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Date:   Sun, 29 Mar 2020 18:53:30 +0430
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
In-Reply-To: <1867036.PIDvDuAF1L@agathebauer>
References: <821540886fc57d7749edee585a50602f@ut.ac.ir>
 <20200329120816.GD2155755@krava> <ff979b3fffc8222d8da848b8cb92f77c@ut.ac.ir>
 <1867036.PIDvDuAF1L@agathebauer>
Message-ID: <033a38757419b4bea99a84f18fb90527@ut.ac.ir>
X-Sender: ahmadkhorrami@ut.ac.ir
User-Agent: Roundcube Webmail/1.3.6
Sender: linux-trace-users-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-trace-users.vger.kernel.org>
X-Mailing-List: linux-trace-users@vger.kernel.org

Hi,
Good Point. But putting symbols aside, the addresses do not match, by 
themselves.
Regards.

On 2020-03-29 18:20, Milian Wolff wrote:

> On Sonntag, 29. März 2020 14:39:33 CEST ahmadkhorrami wrote:
> 
>> Thanks. I did both of your changes. Perhaps some outputs are revised.
>> But I still have repeated function calls and the script detects them.
>> Here is one of them when the sampling period is 1000 events:
> 
> <snip>
> 
>> Here, we have two consecutive "7f91788120b5
>> gtk_widget_propagate_state+0x195
>> (/usr/lib/x86_64-linux-gnu/libgtk-3.so.0.2200.30) gtkwidget.c:0" 
>> lines,
>> while "gtk_widget_propagate_state+0x195" is not recursive. It should
>> call "gtk_container_forall", which does not occur even after the 
>> second
>> (inner) call.
> 
> Potentially you are just lacking some debug symbols here for this GTK 
> library.
> note that "gtkwidget.c:0" is bogus already - the line numbers start 
> with 1, so
> a line of 0 reported indicates a lack of (full) debug information for 
> this
> file.
> 
> Cheers
