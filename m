Return-Path: <SRS0=Whn0=U5=vger.kernel.org=linux-trace-users-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6043FC5B57E
	for <linux-trace-users@archiver.kernel.org>; Sun, 30 Jun 2019 14:31:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3C39E20665
	for <linux-trace-users@archiver.kernel.org>; Sun, 30 Jun 2019 14:31:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726514AbfF3ObS (ORCPT
        <rfc822;linux-trace-users@archiver.kernel.org>);
        Sun, 30 Jun 2019 10:31:18 -0400
Received: from outgoing-stata.csail.mit.edu ([128.30.2.210]:35946 "EHLO
        outgoing-stata.csail.mit.edu" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726500AbfF3ObS (ORCPT
        <rfc822;linux-trace-users@vger.kernel.org>);
        Sun, 30 Jun 2019 10:31:18 -0400
Received: from mail-ot1-f51.google.com ([209.85.210.51])
        by outgoing-stata.csail.mit.edu with esmtpsa (TLS1.2:RSA_AES_128_CBC_SHA1:128)
        (Exim 4.82)
        (envelope-from <aeden@csail.mit.edu>)
        id 1hharN-000AEr-Bu
        for linux-trace-users@vger.kernel.org; Sun, 30 Jun 2019 10:31:17 -0400
Received: by mail-ot1-f51.google.com with SMTP id e8so10805537otl.7
        for <linux-trace-users@vger.kernel.org>; Sun, 30 Jun 2019 07:31:17 -0700 (PDT)
X-Gm-Message-State: APjAAAX9TUZuCY0yiLHD3vIU94etIeXWcAKERpfGAA3JtCCI5wlg5pmu
        FPuzU10/oA6YV+MAMrVm3HP2u3oZrzIf9xa7600=
X-Google-Smtp-Source: APXvYqxhqiYpP78ZhKZajWvH74zQyzij0U+hrDy1wgz3+/dmfrxenHtKtOFxdNxIdim651lEnQ86xgLmKthIu3BG28o=
X-Received: by 2002:a9d:88f:: with SMTP id 15mr15114968otf.147.1561905076742;
 Sun, 30 Jun 2019 07:31:16 -0700 (PDT)
MIME-Version: 1.0
References: <CAHMsQjVYHY1N=X9emeYg34XxeUaMRdV--3NYFNdy111sD0-0gg@mail.gmail.com>
 <20190626114601.6510c943@gandalf.local.home> <CAHMsQjV_uuhf6XPB7xype--V87_d7KeEgeks-7Qfw-2GVzLSrw@mail.gmail.com>
In-Reply-To: <CAHMsQjV_uuhf6XPB7xype--V87_d7KeEgeks-7Qfw-2GVzLSrw@mail.gmail.com>
From:   Anthony Eden <aeden@csail.mit.edu>
Date:   Sun, 30 Jun 2019 10:31:05 -0400
X-Gmail-Original-Message-ID: <CAHMsQjX4MH+nHB66s-95FGXpOz_O=XJwnQw6RJRaa_rchQMPeA@mail.gmail.com>
Message-ID: <CAHMsQjX4MH+nHB66s-95FGXpOz_O=XJwnQw6RJRaa_rchQMPeA@mail.gmail.com>
Subject: Re: increase size of number of possible tracing events
To:     Steven Rostedt <rostedt@goodmis.org>
Cc:     linux-trace-users@vger.kernel.org, kaslevs@vmware.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-trace-users-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-trace-users.vger.kernel.org>
X-Mailing-List: linux-trace-users@vger.kernel.org

Using ptrace to do this turns out to be absurdly slow, as one might
expect (I wrote a python script for lldb). If anyone would like to see
the actual numbers let me know.

-Anthony
