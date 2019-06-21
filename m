Return-Path: <SRS0=bWJy=UU=vger.kernel.org=linux-trace-users-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49DB8C43613
	for <linux-trace-users@archiver.kernel.org>; Fri, 21 Jun 2019 22:32:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 23CA62089E
	for <linux-trace-users@archiver.kernel.org>; Fri, 21 Jun 2019 22:32:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726098AbfFUWcU (ORCPT
        <rfc822;linux-trace-users@archiver.kernel.org>);
        Fri, 21 Jun 2019 18:32:20 -0400
Received: from outgoing-stata.csail.mit.edu ([128.30.2.210]:59756 "EHLO
        outgoing-stata.csail.mit.edu" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726054AbfFUWcU (ORCPT
        <rfc822;linux-trace-users@vger.kernel.org>);
        Fri, 21 Jun 2019 18:32:20 -0400
X-Greylist: delayed 1034 seconds by postgrey-1.27 at vger.kernel.org; Fri, 21 Jun 2019 18:32:20 EDT
Received: from mail-ot1-f53.google.com ([209.85.210.53])
        by outgoing-stata.csail.mit.edu with esmtpsa (TLS1.2:RSA_AES_128_CBC_SHA1:128)
        (Exim 4.82)
        (envelope-from <aeden@csail.mit.edu>)
        id 1heRoH-000VxI-JG
        for linux-trace-users@vger.kernel.org; Fri, 21 Jun 2019 18:15:05 -0400
Received: by mail-ot1-f53.google.com with SMTP id x21so7715352otq.12
        for <linux-trace-users@vger.kernel.org>; Fri, 21 Jun 2019 15:15:05 -0700 (PDT)
X-Gm-Message-State: APjAAAWKmESZ6bc+UB2YbMlsN73Q62h/cWeAUd1q3GPD6S76mOxzu7CA
        Y5pwFbdv7hJTtoGmMxhpEZxhwZoVc+5vr+OOZPY=
X-Google-Smtp-Source: APXvYqzY4cyFHMl6lCEJZi+IpGnsKPTOrAgzLDRxc9POSBY6z+h/0bAZrNm3dkEKSRb9j/KfAxDyNMqvk8Ek6vuJIpo=
X-Received: by 2002:a9d:65ca:: with SMTP id z10mr7625934oth.334.1561155305012;
 Fri, 21 Jun 2019 15:15:05 -0700 (PDT)
MIME-Version: 1.0
From:   Anthony Eden <aeden@csail.mit.edu>
Date:   Fri, 21 Jun 2019 18:14:54 -0400
X-Gmail-Original-Message-ID: <CAHMsQjVYHY1N=X9emeYg34XxeUaMRdV--3NYFNdy111sD0-0gg@mail.gmail.com>
Message-ID: <CAHMsQjVYHY1N=X9emeYg34XxeUaMRdV--3NYFNdy111sD0-0gg@mail.gmail.com>
Subject: increase size of number of possible tracing events
To:     linux-trace-users@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-trace-users-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-trace-users.vger.kernel.org>
X-Mailing-List: linux-trace-users@vger.kernel.org

I am trying to develop a patch which increases the maximum number of
possible tracing events (i.e. TRACE_EVENT_TYPE_MAX). I naively tried
changing unsigned short trace_entry::type to unsigned int (that simply
broke tracing).

Short background: I am placing a UProbe tracepoint at the start of
every basic block for every DSO in a dynamically-linked program. I
recently hit the ceiling for the maximum number of tracepoints with
dnsmasq;

/usr/bin/dnsmasq:            12826 basic blocks
/usr/lib/libc.so.6:          60511 basic blocks
/lib64/ld-linux-x86-64.so.2: 6270 basic blocks
linux-vdso.so.1:             36 basic blocks

Writing to /sys/kernel/debug/tracing/uprobe_events returns -ENODEV. If
anyone could provide some guidance towards raising the limit, it would
be much appreciated.

Thanks,
-Anthony
