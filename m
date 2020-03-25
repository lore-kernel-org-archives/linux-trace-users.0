Return-Path: <SRS0=L3+l=5K=vger.kernel.org=linux-trace-users-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9B28C43331
	for <linux-trace-users@archiver.kernel.org>; Wed, 25 Mar 2020 23:09:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A6E7420737
	for <linux-trace-users@archiver.kernel.org>; Wed, 25 Mar 2020 23:09:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727487AbgCYXJf (ORCPT
        <rfc822;linux-trace-users@archiver.kernel.org>);
        Wed, 25 Mar 2020 19:09:35 -0400
Received: from mail.ut.ac.ir ([80.66.177.10]:48824 "EHLO mail.ut.ac.ir"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727358AbgCYXJf (ORCPT
        <rfc822;linux-trace-users@vger.kernel.org>);
        Wed, 25 Mar 2020 19:09:35 -0400
Received: from localhost (localhost [127.0.0.1])
        by mail.ut.ac.ir (Postfix) with ESMTP id 30A731DAE8D;
        Thu, 26 Mar 2020 03:39:32 +0430 (+0430)
Received: from mail.ut.ac.ir ([127.0.0.1])
        by localhost (mail.ut.ac.ir [127.0.0.1]) (amavisd-new, port 10024)
        with LMTP id jEClgkQmwMR6; Thu, 26 Mar 2020 03:39:31 +0430 (+0430)
Received: from mail.ut.ac.ir (mail.ut.ac.ir [194.225.0.10])
        by mail.ut.ac.ir (Postfix) with ESMTP id 25E721DAA6D;
        Thu, 26 Mar 2020 03:39:31 +0430 (+0430)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Thu, 26 Mar 2020 03:39:31 +0430
From:   ahmadkhorrami <ahmadkhorrami@ut.ac.ir>
To:     Jiri Olsa <jolsa@redhat.com>
Cc:     Steven Rostedt <rostedt@goodmis.org>,
        Arnaldo Carvalho de Melo <acme@redhat.com>,
        Linux-trace Users <linux-trace-users@vger.kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        linux-trace-users-owner@vger.kernel.org,
        Jin Yao <yao.jin@linux.intel.com>
Subject: Re: Wrong Perf Backtraces
In-Reply-To: <fba145203611e7edcd674cc0cec9974b@ut.ac.ir>
References: <8645d3626b4714690925328ab00373d6@ut.ac.ir>
 <20200325154643.GA1934048@krava> <20200325185831.GB19495@redhat.com>
 <9551c616b045299482fc9e26281c1062@ut.ac.ir>
 <20200325192858.GC19495@redhat.com>
 <4ffb7e2b6e272c20616fbf133a125fdf@ut.ac.ir> <20200325203921.GB1947699@krava>
 <20200325210252.GC1947699@krava>
 <20200325170932.34d52269@gandalf.local.home>
 <edcf2ce8838d83b1c2d44204d9ca001f@ut.ac.ir> <20200325214624.GD1947699@krava>
 <fba145203611e7edcd674cc0cec9974b@ut.ac.ir>
Message-ID: <52904543671bcb68ea9109b90c3e4267@ut.ac.ir>
X-Sender: ahmadkhorrami@ut.ac.ir
User-Agent: Roundcube Webmail/1.3.6
Sender: linux-trace-users-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-trace-users.vger.kernel.org>
X-Mailing-List: linux-trace-users@vger.kernel.org

An here is the second one:
https://gofile.io/?c=oGxgSM
Regards
On 2020-03-26 02:51, ahmadkhorrami wrote:

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
