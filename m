Return-Path: <SRS0=qAvV=5O=vger.kernel.org=linux-trace-users-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC5FEC43331
	for <linux-trace-users@archiver.kernel.org>; Sun, 29 Mar 2020 01:17:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A63AB206F2
	for <linux-trace-users@archiver.kernel.org>; Sun, 29 Mar 2020 01:17:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727806AbgC2BRD (ORCPT
        <rfc822;linux-trace-users@archiver.kernel.org>);
        Sat, 28 Mar 2020 21:17:03 -0400
Received: from mail.ut.ac.ir ([80.66.177.10]:56936 "EHLO mail.ut.ac.ir"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727491AbgC2BRD (ORCPT
        <rfc822;linux-trace-users@vger.kernel.org>);
        Sat, 28 Mar 2020 21:17:03 -0400
Received: from localhost (localhost [127.0.0.1])
        by mail.ut.ac.ir (Postfix) with ESMTP id 9A3091DA3D4;
        Sun, 29 Mar 2020 05:46:59 +0430 (+0430)
Received: from mail.ut.ac.ir ([127.0.0.1])
        by localhost (mail.ut.ac.ir [127.0.0.1]) (amavisd-new, port 10024)
        with LMTP id CpcD-FQbh8Zs; Sun, 29 Mar 2020 05:46:58 +0430 (+0430)
Received: from mail.ut.ac.ir (mail.ut.ac.ir [194.225.0.10])
        by mail.ut.ac.ir (Postfix) with ESMTP id 732031DA3A9;
        Sun, 29 Mar 2020 05:46:57 +0430 (+0430)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Sun, 29 Mar 2020 05:46:57 +0430
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
In-Reply-To: <d7f65793a15bb80667e384c320549e69@ut.ac.ir>
References: <20200326095928.GF1947699@krava>
 <243486883401862967ec2b06348c67f3@ut.ac.ir> <20200326153950.GG1947699@krava>
 <bf654a5cfe5a2a4188a286f1f5868e17@ut.ac.ir> <20200327092045.GH1947699@krava>
 <821540886fc57d7749edee585a50602f@ut.ac.ir>
 <decdc878b1bf207c68f1bc9e21178486@ut.ac.ir>
 <fd99185b401a451fdbf96439eadcb101@ut.ac.ir> <20200327223743.GA2155755@krava>
 <57b9e24200019a41bd465e2d78c09e29@ut.ac.ir> <20200328233431.GB2155755@krava>
 <d7f65793a15bb80667e384c320549e69@ut.ac.ir>
Message-ID: <8a58f8eda97525e5e49daeb001107c9d@ut.ac.ir>
X-Sender: ahmadkhorrami@ut.ac.ir
User-Agent: Roundcube Webmail/1.3.6
Sender: linux-trace-users-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-trace-users.vger.kernel.org>
X-Mailing-List: linux-trace-users@vger.kernel.org

Hi,
Each line is correct. I mean addresses match symbols. But some callers 
and callees do not match. Perhaps callchain misses some callers in 
between.
Regards

On 2020-03-29 05:13, ahmadkhorrami wrote:

> Hi Mr. Olsa,
> Thanks for your time. The problem is still there. Repeated lines are 
> not limited to inline functions. If my script works on your system, it 
> will show these lines.
> Regards.
> 
> On 2020-03-29 04:04, Jiri Olsa wrote:
> 
> On Sat, Mar 28, 2020 at 03:42:53AM +0430, ahmadkhorrami wrote:
> 
> Hi,
> Thanks. If you suggest the potentially bogus locations of the source 
> code, I
> will give a try.
> Regards.
> heya,
> the change below 'fixes' it for me:
> 
> $ perf script ...
> ...
> evince 2220122 1605573.007639:      11759 cycles:u:
> ffffffffaec012f0 [unknown] ([unknown])
> 7f93f17116b6 __mmap64+0x26 mmap64.c:59 (inlined)
> 7f93f17116b6 __mmap64+0x26 mmap64.c:47 (inlined)
> 
> it wasn't really broken, the output is just missing the source line
> info in perf script callchain output, which adds the "missing part",
> because for inlined entries the entry address stays the same for all
> its inlined parts
> 
> could you try the change?
> 
> thanks,
> jirka
> 
> diff --git a/tools/perf/util/evsel_fprintf.c 
> b/tools/perf/util/evsel_fprintf.c
> index 3b4842840db0..7349dfbbef2e 100644
> --- a/tools/perf/util/evsel_fprintf.c
> +++ b/tools/perf/util/evsel_fprintf.c
> @@ -174,8 +174,11 @@ int sample__fprintf_callchain(struct perf_sample 
> *sample, int left_alignment,
> if (print_srcline)
> printed += map__fprintf_srcline(map, addr, "\n  ", fp);
> 
> -            if (sym && sym->inlined)
> +            if (sym && sym->inlined) {
> +                if (node->srcline)
> +                    printed += fprintf(fp, " %s", node->srcline);
> printed += fprintf(fp, " (inlined)");
> +            }
> 
> if (!print_oneline)
> printed += fprintf(fp, "\n");
