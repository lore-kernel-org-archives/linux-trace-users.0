Return-Path: <SRS0=RPU7=U2=vger.kernel.org=linux-trace-users-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EABF8C48BD7
	for <linux-trace-users@archiver.kernel.org>; Thu, 27 Jun 2019 16:45:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C7D0E208E3
	for <linux-trace-users@archiver.kernel.org>; Thu, 27 Jun 2019 16:45:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726426AbfF0QpB (ORCPT
        <rfc822;linux-trace-users@archiver.kernel.org>);
        Thu, 27 Jun 2019 12:45:01 -0400
Received: from outgoing-stata.csail.mit.edu ([128.30.2.210]:41496 "EHLO
        outgoing-stata.csail.mit.edu" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725770AbfF0QpB (ORCPT
        <rfc822;linux-trace-users@vger.kernel.org>);
        Thu, 27 Jun 2019 12:45:01 -0400
Received: from mail-oi1-f172.google.com ([209.85.167.172])
        by outgoing-stata.csail.mit.edu with esmtpsa (TLS1.2:RSA_AES_128_CBC_SHA1:128)
        (Exim 4.82)
        (envelope-from <aeden@csail.mit.edu>)
        id 1hgXW8-000Gtq-F1
        for linux-trace-users@vger.kernel.org; Thu, 27 Jun 2019 12:45:00 -0400
Received: by mail-oi1-f172.google.com with SMTP id g7so2058417oia.8
        for <linux-trace-users@vger.kernel.org>; Thu, 27 Jun 2019 09:45:00 -0700 (PDT)
X-Gm-Message-State: APjAAAVJfDsHqPaoQF5Kk9YgpVZyMBIdlX8+7Go2w6IIYUAwPz9OvsU/
        qoDYs2yqNZkUoEg9a85HsRydRNYBWcJrYgv8FyY=
X-Google-Smtp-Source: APXvYqxVuliDpgNWK2Hvr9m8UUw1RIbAX+znazrVhcQfhAYy4FtoE/b5mitDmCdd0H7F5KXVrpaqE8VBaHePYjstMII=
X-Received: by 2002:aca:ebc8:: with SMTP id j191mr2767528oih.164.1561653899796;
 Thu, 27 Jun 2019 09:44:59 -0700 (PDT)
MIME-Version: 1.0
References: <CAHMsQjVYHY1N=X9emeYg34XxeUaMRdV--3NYFNdy111sD0-0gg@mail.gmail.com>
 <20190626114601.6510c943@gandalf.local.home>
In-Reply-To: <20190626114601.6510c943@gandalf.local.home>
From:   Anthony Eden <aeden@csail.mit.edu>
Date:   Thu, 27 Jun 2019 12:44:48 -0400
X-Gmail-Original-Message-ID: <CAHMsQjV_uuhf6XPB7xype--V87_d7KeEgeks-7Qfw-2GVzLSrw@mail.gmail.com>
Message-ID: <CAHMsQjV_uuhf6XPB7xype--V87_d7KeEgeks-7Qfw-2GVzLSrw@mail.gmail.com>
Subject: Re: increase size of number of possible tracing events
To:     Steven Rostedt <rostedt@goodmis.org>
Cc:     linux-trace-users@vger.kernel.org, kaslevs@vmware.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-trace-users-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-trace-users.vger.kernel.org>
X-Mailing-List: linux-trace-users@vger.kernel.org

> I'm not sure having over 65535 different events is a good idea. Perhaps
> we should create a different type of uprobe that can be reused, as I'm
> sure you are not making each of these events record different data.
> Basically make it similar to the function tracing event, which is a
> single event that records the function that it traces, and not
> thousands of different individual events.
>
> Would something like that be helpful for you? It still requires a
> kernel change, but that is still possible.

You're right; the events record no data. Optimizing for this use-case
sounds reasonable.

It would be very helpful. The basic-block traces produced by this
mechanism allow us to identify bugs introduced by transformations we
make on the binaries. Kernel changes are no problem.

-Anthony
