Return-Path: <SRS0=Ye4e=U6=vger.kernel.org=linux-trace-users-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1998C0650E
	for <linux-trace-users@archiver.kernel.org>; Mon,  1 Jul 2019 12:58:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 753102146E
	for <linux-trace-users@archiver.kernel.org>; Mon,  1 Jul 2019 12:58:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726912AbfGAM6j (ORCPT
        <rfc822;linux-trace-users@archiver.kernel.org>);
        Mon, 1 Jul 2019 08:58:39 -0400
Received: from mx1.redhat.com ([209.132.183.28]:36798 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726329AbfGAM6j (ORCPT
        <rfc822;linux-trace-users@vger.kernel.org>);
        Mon, 1 Jul 2019 08:58:39 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id C3A903082291;
        Mon,  1 Jul 2019 12:58:38 +0000 (UTC)
Received: from redhat.com (ovpn-118-11.phx2.redhat.com [10.3.118.11])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id 879223ACA;
        Mon,  1 Jul 2019 12:58:35 +0000 (UTC)
Received: from fche by redhat.com with local (Exim 4.92)
        (envelope-from <fche@redhat.com>)
        id 1hhvt9-00035U-Sh; Mon, 01 Jul 2019 08:58:31 -0400
Date:   Mon, 1 Jul 2019 08:58:31 -0400
From:   "Frank Ch. Eigler" <fche@redhat.com>
To:     Anthony Eden <aeden@csail.mit.edu>
Cc:     Steven Rostedt <rostedt@goodmis.org>,
        linux-trace-users@vger.kernel.org, kaslevs@vmware.com
Subject: Re: increase size of number of possible tracing events
Message-ID: <20190701125831.GA11858@redhat.com>
References: <CAHMsQjVYHY1N=X9emeYg34XxeUaMRdV--3NYFNdy111sD0-0gg@mail.gmail.com>
 <20190626114601.6510c943@gandalf.local.home>
 <CAHMsQjV_uuhf6XPB7xype--V87_d7KeEgeks-7Qfw-2GVzLSrw@mail.gmail.com>
 <CAHMsQjX4MH+nHB66s-95FGXpOz_O=XJwnQw6RJRaa_rchQMPeA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHMsQjX4MH+nHB66s-95FGXpOz_O=XJwnQw6RJRaa_rchQMPeA@mail.gmail.com>
User-Agent: Mutt/1.12.0 (2019-05-25)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.47]); Mon, 01 Jul 2019 12:58:39 +0000 (UTC)
Sender: linux-trace-users-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-trace-users.vger.kernel.org>
X-Mailing-List: linux-trace-users@vger.kernel.org

Hi -

> Using ptrace to do this turns out to be absurdly slow, as one might
> expect (I wrote a python script for lldb). If anyone would like to see
> the actual numbers let me know.

In the mean time, you can also try systemtap userspace probes.  These
normally use kernel uprobes, but not the ftrace/perf-event mechanism,
so are not limited in number.  A user can also opt to configure pure
userspace dyninst to instrument.

- FChE
