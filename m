Return-Path: <SRS0=bWJy=UU=vger.kernel.org=linux-trace-users-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA138C43613
	for <linux-trace-users@archiver.kernel.org>; Fri, 21 Jun 2019 23:19:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B1C6E2089E
	for <linux-trace-users@archiver.kernel.org>; Fri, 21 Jun 2019 23:19:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726054AbfFUXTW convert rfc822-to-8bit (ORCPT
        <rfc822;linux-trace-users@archiver.kernel.org>);
        Fri, 21 Jun 2019 19:19:22 -0400
Received: from smtprelay0047.hostedemail.com ([216.40.44.47]:39259 "EHLO
        smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726052AbfFUXTW (ORCPT
        <rfc822;linux-trace-users@vger.kernel.org>);
        Fri, 21 Jun 2019 19:19:22 -0400
X-Greylist: delayed 319 seconds by postgrey-1.27 at vger.kernel.org; Fri, 21 Jun 2019 19:19:21 EDT
Received: from smtprelay.hostedemail.com (10.5.19.251.rfc1918.com [10.5.19.251])
        by smtpgrave06.hostedemail.com (Postfix) with ESMTP id E5AFC801AB96
        for <linux-trace-users@vger.kernel.org>; Fri, 21 Jun 2019 23:14:02 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
        by smtprelay07.hostedemail.com (Postfix) with ESMTP id 41781181D3368;
        Fri, 21 Jun 2019 23:14:02 +0000 (UTC)
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-HE-Tag: dogs48_7a8001affbb44
X-Filterd-Recvd-Size: 2032
Received: from [10.57.69.55] (static-172-109-151-218.tamp.fl.frontiernet.net [172.109.151.218])
        (Authenticated sender: rostedt@goodmis.org)
        by omf01.hostedemail.com (Postfix) with ESMTPA;
        Fri, 21 Jun 2019 23:14:01 +0000 (UTC)
Date:   Fri, 21 Jun 2019 19:13:59 -0400
User-Agent: K-9 Mail for Android
In-Reply-To: <CAHMsQjVYHY1N=X9emeYg34XxeUaMRdV--3NYFNdy111sD0-0gg@mail.gmail.com>
References: <CAHMsQjVYHY1N=X9emeYg34XxeUaMRdV--3NYFNdy111sD0-0gg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 8BIT
Subject: Re: increase size of number of possible tracing events
To:     Anthony Eden <aeden@csail.mit.edu>,
        linux-trace-users@vger.kernel.org
From:   Steven Rostedt <rostedt@goodmis.org>
Message-ID: <94B3BBEC-3555-4E49-8EC4-FAACD073E7B6@goodmis.org>
Sender: linux-trace-users-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-trace-users.vger.kernel.org>
X-Mailing-List: linux-trace-users@vger.kernel.org

I'm currently traveling (replying on my phone so excuse the top post), but what you want will require a kernel change.

-- Steve


On June 21, 2019 6:14:54 PM EDT, Anthony Eden <aeden@csail.mit.edu> wrote:
>I am trying to develop a patch which increases the maximum number of
>possible tracing events (i.e. TRACE_EVENT_TYPE_MAX). I naively tried
>changing unsigned short trace_entry::type to unsigned int (that simply
>broke tracing).
>
>Short background: I am placing a UProbe tracepoint at the start of
>every basic block for every DSO in a dynamically-linked program. I
>recently hit the ceiling for the maximum number of tracepoints with
>dnsmasq;
>
>/usr/bin/dnsmasq:            12826 basic blocks
>/usr/lib/libc.so.6:          60511 basic blocks
>/lib64/ld-linux-x86-64.so.2: 6270 basic blocks
>linux-vdso.so.1:             36 basic blocks
>
>Writing to /sys/kernel/debug/tracing/uprobe_events returns -ENODEV. If
>anyone could provide some guidance towards raising the limit, it would
>be much appreciated.
>
>Thanks,
>-Anthony

-- 
Sent from my Android device with K-9 Mail. Please excuse my brevity and top posting.
