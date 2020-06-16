Return-Path: <SRS0=sGUs=75=vger.kernel.org=linux-trace-users-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA4ECC433DF
	for <linux-trace-users@archiver.kernel.org>; Tue, 16 Jun 2020 16:29:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C6A902075E
	for <linux-trace-users@archiver.kernel.org>; Tue, 16 Jun 2020 16:29:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=kdab.com header.i=@kdab.com header.b="Z9uoDN/r"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730324AbgFPQ3b (ORCPT
        <rfc822;linux-trace-users@archiver.kernel.org>);
        Tue, 16 Jun 2020 12:29:31 -0400
Received: from mail.kdab.com ([176.9.126.58]:33773 "EHLO mail.kdab.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729167AbgFPQ3b (ORCPT
        <rfc822;linux-trace-users@vger.kernel.org>);
        Tue, 16 Jun 2020 12:29:31 -0400
X-Greylist: delayed 505 seconds by postgrey-1.27 at vger.kernel.org; Tue, 16 Jun 2020 12:29:30 EDT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kdab.com; h=
 content-type:content-type:content-transfer-encoding:mime-version
 :references:in-reply-to:organization:message-id:date:date
 :subject:subject:from:from; s=dkim; t=1592324462; x=1593188463;
 bh=TDH8XI3aNG/ZC9GX2xxdOJ9ZGPpM1LPh83SlBzQfNF8=; b=Z9uoDN/ry6JZ
 xRTviTi1BPwDLgZJMB0cjoJpkJXyLrwZoVmB/bRp6uSYAbgs+/9G+uWZNrE9YQWD
 UjQTjngS7VjMuKHlg9sQh0e9TSoGysfLlmWfFWKnQOPpiV0MRims2REmeEwi2nlY
 sQOjukrLtJWM9avf/Ygi+nNURtQ45t0=
X-Virus-Scanned: amavisd-new at kdab.com
From:   Milian Wolff <milian.wolff@kdab.com>
To:     Ian Rogers <irogers@google.com>,
        ahmadkhorrami <ahmadkhorrami@ut.ac.ir>
Cc:     Steven Rostedt <rostedt@goodmis.org>,
        Linux-trace Users <linux-trace-users@vger.kernel.org>,
        Arnaldo Carvalho de Melo <acme@redhat.com>,
        linux-perf-users <linux-perf-users@vger.kernel.org>,
        linux-trace-users-owner@vger.kernel.org
Subject: Re: Sp! Re: Perf Script Erroneous User Stack Trace
Date:   Tue, 16 Jun 2020 18:20:59 +0200
Message-ID: <5121466.Fqp1Q3JDDc@agathebauer>
Organization: KDAB
In-Reply-To: <2eef8c33a31ae627010d985ac2ffae96@ut.ac.ir>
References: <816cb5f558cd0e528812dff2168ef4ca@ut.ac.ir>
 <7e31757ab3c4ccea654c0921b8a50303@ut.ac.ir>
 <2eef8c33a31ae627010d985ac2ffae96@ut.ac.ir>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-trace-users-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-trace-users.vger.kernel.org>
X-Mailing-List: linux-trace-users@vger.kernel.org

On Dienstag, 16. Juni 2020 16:37:08 CEST ahmadkhorrami wrote:
> Hi,
> The problem doesn't seems to be caused by the assembly code. I checked
> the execution in GDB, and put breakpoint at
> "x264_pixel_avg_w16_avx2+0x4" and ignored with 10, 100, 1000, 10000 and
> 100000 occurrences. But, in all cases, GDB, successfully, displayed the
> whole backtrace. One of them is as follows:

<snip>

> It seems that, there should be something wrong with the kernel-side
> implementation. Could anybody point me to the kernel implementation? I
> think it is dumped, here:
> https://github.com/torvalds/linux/blob/master/kernel/events/core.c#L6786
> 
> But, I do not know where in the kernel, the user call-stack is
> generated.
> Any guesses?

The kernel does not unwind the user call-stack when you use `perf record --
call-graph dwarf`. This is all done in user space at `perf report` time. The 
kernel only copies parts of the stack, in your case 64KB.

There are tons of ways that can lead to broken unwinding. To figure out more, 
you'll have to dive into `perf report` and try to come with some ideas 
yourself:

a) try to figure out how unwinding should work for that library, does it have 
.eh_frame or does it need debug information for unwinding? If the latter - run 
`strace -e file -f perf script` and check if the separate debug information 
files are found and loaded by perf.
b) run `perf script -v` and inspect the log for your first broken sample - is 
there anything in it that may indicate the reason for the issue?
c) try elfutils instead of libunwind for unwinding, does that make a 
difference?
d) dive even deeper into the code to see where and why it fails, potentially 
even within libunwind

Note that GDB uses a completely different unwinder than perf. Libunwind is 
pretty good, but GDB has even better fallbacks to figure out backtraces. I 
mean it often even works after (partial) stack corruption there ;-) So just 
saying "it works in GDB" doesn't help us too much...

Good luck!

-- 
Milian Wolff | milian.wolff@kdab.com | Senior Software Engineer
KDAB (Deutschland) GmbH, a KDAB Group company
Tel: +49-30-521325470
KDAB - The Qt, C++ and OpenGL Experts

