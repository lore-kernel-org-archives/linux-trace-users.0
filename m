Return-Path: <SRS0=hGpF=UZ=vger.kernel.org=linux-trace-users-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 695FCC48BD6
	for <linux-trace-users@archiver.kernel.org>; Wed, 26 Jun 2019 15:46:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3ED6E2177B
	for <linux-trace-users@archiver.kernel.org>; Wed, 26 Jun 2019 15:46:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726410AbfFZPqE (ORCPT
        <rfc822;linux-trace-users@archiver.kernel.org>);
        Wed, 26 Jun 2019 11:46:04 -0400
Received: from mail.kernel.org ([198.145.29.99]:54716 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725958AbfFZPqD (ORCPT
        <rfc822;linux-trace-users@vger.kernel.org>);
        Wed, 26 Jun 2019 11:46:03 -0400
Received: from gandalf.local.home (cpe-66-24-58-225.stny.res.rr.com [66.24.58.225])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 2217C217D9;
        Wed, 26 Jun 2019 15:46:03 +0000 (UTC)
Date:   Wed, 26 Jun 2019 11:46:01 -0400
From:   Steven Rostedt <rostedt@goodmis.org>
To:     Anthony Eden <aeden@csail.mit.edu>
Cc:     linux-trace-users@vger.kernel.org,
        Slavomir Kaslev <kaslevs@vmware.com>
Subject: Re: increase size of number of possible tracing events
Message-ID: <20190626114601.6510c943@gandalf.local.home>
In-Reply-To: <CAHMsQjVYHY1N=X9emeYg34XxeUaMRdV--3NYFNdy111sD0-0gg@mail.gmail.com>
References: <CAHMsQjVYHY1N=X9emeYg34XxeUaMRdV--3NYFNdy111sD0-0gg@mail.gmail.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-trace-users-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-trace-users.vger.kernel.org>
X-Mailing-List: linux-trace-users@vger.kernel.org

On Fri, 21 Jun 2019 18:14:54 -0400
Anthony Eden <aeden@csail.mit.edu> wrote:

> I am trying to develop a patch which increases the maximum number of
> possible tracing events (i.e. TRACE_EVENT_TYPE_MAX). I naively tried
> changing unsigned short trace_entry::type to unsigned int (that simply
> broke tracing).
> 
> Short background: I am placing a UProbe tracepoint at the start of
> every basic block for every DSO in a dynamically-linked program. I
> recently hit the ceiling for the maximum number of tracepoints with
> dnsmasq;
> 
> /usr/bin/dnsmasq:            12826 basic blocks
> /usr/lib/libc.so.6:          60511 basic blocks
> /lib64/ld-linux-x86-64.so.2: 6270 basic blocks
> linux-vdso.so.1:             36 basic blocks
> 
> Writing to /sys/kernel/debug/tracing/uprobe_events returns -ENODEV. If
> anyone could provide some guidance towards raising the limit, it would
> be much appreciated.
>

I'm not sure having over 65535 different events is a good idea. Perhaps
we should create a different type of uprobe that can be reused, as I'm
sure you are not making each of these events record different data.
Basically make it similar to the function tracing event, which is a
single event that records the function that it traces, and not
thousands of different individual events.

Would something like that be helpful for you? It still requires a
kernel change, but that is still possible.

-- Steve
