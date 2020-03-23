Return-Path: <SRS0=Ymyf=5I=vger.kernel.org=linux-trace-users-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84D5DC4332E
	for <linux-trace-users@archiver.kernel.org>; Mon, 23 Mar 2020 00:34:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5221C20722
	for <linux-trace-users@archiver.kernel.org>; Mon, 23 Mar 2020 00:34:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726902AbgCWAeZ (ORCPT
        <rfc822;linux-trace-users@archiver.kernel.org>);
        Sun, 22 Mar 2020 20:34:25 -0400
Received: from mail.kernel.org ([198.145.29.99]:47922 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726897AbgCWAeY (ORCPT
        <rfc822;linux-trace-users@vger.kernel.org>);
        Sun, 22 Mar 2020 20:34:24 -0400
Received: from oasis.local.home (cpe-66-24-58-225.stny.res.rr.com [66.24.58.225])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 9861E206C3;
        Mon, 23 Mar 2020 00:34:23 +0000 (UTC)
Date:   Sun, 22 Mar 2020 20:34:21 -0400
From:   Steven Rostedt <rostedt@goodmis.org>
To:     ahmadkhorrami <ahmadkhorrami@ut.ac.ir>
Cc:     Linux-trace Users <linux-trace-users@vger.kernel.org>,
        Arnaldo Carvalho de Melo <acme@redhat.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Jiri Olsa <jolsa@redhat.com>
Subject: Re: Wrong Perf Backtraces
Message-ID: <20200322203421.715b32d8@oasis.local.home>
In-Reply-To: <bd85fc28dfb5dcf7fc10507c3c86a56d@ut.ac.ir>
References: <157597d74ff17f781d9de7e7e3defd13@ut.ac.ir>
        <bd85fc28dfb5dcf7fc10507c3c86a56d@ut.ac.ir>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-trace-users-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-trace-users.vger.kernel.org>
X-Mailing-List: linux-trace-users@vger.kernel.org

On Mon, 23 Mar 2020 00:54:01 +0430
ahmadkhorrami <ahmadkhorrami@ut.ac.ir> wrote:

> Hi,
> I used "Perf" to extract call graphs in an evince benchmark. The command 
> used is as follows:
> sudo perf record -d --call-graph dwarf -c 10000 e 
> mem_load_uops_retired.l3_miss:uppp /opt/evince-3.28.4/bin/evince
> 
> I extracted the backtraces using "perf script" and found out that there 
> are many corrupted backtrace instances. Some contained repeated function 
> calls, for example two consecutive gmallocn()s exactly at the same 
> offsets. There are also some backtraces where the callers and callees do 
> not match.

Could you show some examples of the backtraces you mention?

> 
> Note that that mappings are correct. In other words, each single line of 
> the reported backtraces is correct (i.e., addresses match with 
> functions). But is seems that there are some function calls in the 
> middle, which are missed by "Perf". Strangely, in all runs (and also 
> with different sampling frequencies) the problem occurs exactly at the 
> same place.
> 
> I am really confused and looking forward to any help. I can also send 
> backtraces if needed.

-- Steve
