Return-Path: <SRS0=v7Zq=5H=vger.kernel.org=linux-trace-users-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 045C9C1975A
	for <linux-trace-users@archiver.kernel.org>; Sun, 22 Mar 2020 20:24:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D159E20722
	for <linux-trace-users@archiver.kernel.org>; Sun, 22 Mar 2020 20:24:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726809AbgCVUYF (ORCPT
        <rfc822;linux-trace-users@archiver.kernel.org>);
        Sun, 22 Mar 2020 16:24:05 -0400
Received: from mail.ut.ac.ir ([80.66.177.10]:51356 "EHLO mail.ut.ac.ir"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726623AbgCVUYF (ORCPT
        <rfc822;linux-trace-users@vger.kernel.org>);
        Sun, 22 Mar 2020 16:24:05 -0400
Received: from localhost (localhost [127.0.0.1])
        by mail.ut.ac.ir (Postfix) with ESMTP id 419AF1DAA12
        for <linux-trace-users@vger.kernel.org>; Mon, 23 Mar 2020 00:54:02 +0430 (+0430)
Received: from mail.ut.ac.ir ([127.0.0.1])
        by localhost (mail.ut.ac.ir [127.0.0.1]) (amavisd-new, port 10024)
        with LMTP id SYl-3EjpxKV6 for <linux-trace-users@vger.kernel.org>;
        Mon, 23 Mar 2020 00:54:01 +0430 (+0430)
Received: from mail.ut.ac.ir (mail.ut.ac.ir [194.225.0.10])
        by mail.ut.ac.ir (Postfix) with ESMTP id 9B8AC1DAA0E
        for <linux-trace-users@vger.kernel.org>; Mon, 23 Mar 2020 00:54:01 +0430 (+0430)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Mon, 23 Mar 2020 00:54:01 +0430
From:   ahmadkhorrami <ahmadkhorrami@ut.ac.ir>
To:     Linux-trace Users <linux-trace-users@vger.kernel.org>
Subject: Wrong Perf Backtraces
In-Reply-To: <157597d74ff17f781d9de7e7e3defd13@ut.ac.ir>
References: <157597d74ff17f781d9de7e7e3defd13@ut.ac.ir>
Message-ID: <bd85fc28dfb5dcf7fc10507c3c86a56d@ut.ac.ir>
X-Sender: ahmadkhorrami@ut.ac.ir
User-Agent: Roundcube Webmail/1.3.6
Sender: linux-trace-users-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-trace-users.vger.kernel.org>
X-Mailing-List: linux-trace-users@vger.kernel.org

Hi,
I used "Perf" to extract call graphs in an evince benchmark. The command 
used is as follows:
sudo perf record -d --call-graph dwarf -c 10000 e 
mem_load_uops_retired.l3_miss:uppp /opt/evince-3.28.4/bin/evince

I extracted the backtraces using "perf script" and found out that there 
are many corrupted backtrace instances. Some contained repeated function 
calls, for example two consecutive gmallocn()s exactly at the same 
offsets. There are also some backtraces where the callers and callees do 
not match.

Note that that mappings are correct. In other words, each single line of 
the reported backtraces is correct (i.e., addresses match with 
functions). But is seems that there are some function calls in the 
middle, which are missed by "Perf". Strangely, in all runs (and also 
with different sampling frequencies) the problem occurs exactly at the 
same place.

I am really confused and looking forward to any help. I can also send 
backtraces if needed.
Regards.
