Return-Path: <SRS0=9mrg=5Q=vger.kernel.org=linux-trace-users-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B341C43331
	for <linux-trace-users@archiver.kernel.org>; Tue, 31 Mar 2020 11:53:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5D20F20714
	for <linux-trace-users@archiver.kernel.org>; Tue, 31 Mar 2020 11:53:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730540AbgCaLxN (ORCPT
        <rfc822;linux-trace-users@archiver.kernel.org>);
        Tue, 31 Mar 2020 07:53:13 -0400
Received: from mail.ut.ac.ir ([80.66.177.10]:49384 "EHLO mail.ut.ac.ir"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730424AbgCaLxM (ORCPT
        <rfc822;linux-trace-users@vger.kernel.org>);
        Tue, 31 Mar 2020 07:53:12 -0400
Received: from localhost (localhost [127.0.0.1])
        by mail.ut.ac.ir (Postfix) with ESMTP id 9EB11EC213;
        Tue, 31 Mar 2020 16:23:08 +0430 (+0430)
Received: from mail.ut.ac.ir ([127.0.0.1])
        by localhost (mail.ut.ac.ir [127.0.0.1]) (amavisd-new, port 10024)
        with LMTP id d6Rlj-22-j4j; Tue, 31 Mar 2020 16:23:08 +0430 (+0430)
Received: from mail.ut.ac.ir (mail.ut.ac.ir [194.225.0.10])
        by mail.ut.ac.ir (Postfix) with ESMTP id 83263EC20D;
        Tue, 31 Mar 2020 16:23:07 +0430 (+0430)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Tue, 31 Mar 2020 16:23:07 +0430
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
In-Reply-To: <20200331093035.GB2518490@krava>
References: <821540886fc57d7749edee585a50602f@ut.ac.ir>
 <1867036.PIDvDuAF1L@agathebauer> <20200329192010.GA2361248@krava>
 <2522580.mvXUDI8C0e@agathebauer> <20200330130750.GC2361248@krava>
 <e51e7fc0bed5e79f5e7774fcd5389c3d@ut.ac.ir>
 <8cb4f94b11fbac6ca3a44b924b6ee7b3@ut.ac.ir>
 <c1a64287c45da58def62a45e44525f02@ut.ac.ir> <20200331093035.GB2518490@krava>
Message-ID: <be61f1d3acdd6167b7f2063f0628f68f@ut.ac.ir>
X-Sender: ahmadkhorrami@ut.ac.ir
User-Agent: Roundcube Webmail/1.3.6
Sender: linux-trace-users-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-trace-users.vger.kernel.org>
X-Mailing-List: linux-trace-users@vger.kernel.org

Hi, surely I did that. I thought that there may exist a more systematic 
way which avoids my perf crashes.
Regards.

On 2020-03-31 14:00, Jiri Olsa wrote:

> On Tue, Mar 31, 2020 at 09:13:28AM +0430, ahmadkhorrami wrote:
> 
>> Hi,
>> I checked the reported address in libgtk. GDB could map it to the 
>> source
>> files. Also, once, I read at Stackoverflow that perf gives up on 
>> printing
>> the backtrace (truncates the output backtrace), whenever it detects a 
>> binary
>> file without debug info. Could you describe more about this situation?
>> And dear Mr. Olsa, if these cases do not occur on your system, could 
>> you
>> tell me how you installed the debug info for the binaries on your 
>> system,
>> please?
> 
> google: 'how to install debuginfo on <whatever distro you run on>'
> 
> jirka
