Return-Path: <SRS0=XDsJ=UM=vger.kernel.org=linux-trace-users-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A420C31E45
	for <linux-trace-users@archiver.kernel.org>; Thu, 13 Jun 2019 18:02:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 64A462054F
	for <linux-trace-users@archiver.kernel.org>; Thu, 13 Jun 2019 18:02:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726967AbfFMSCX (ORCPT
        <rfc822;linux-trace-users@archiver.kernel.org>);
        Thu, 13 Jun 2019 14:02:23 -0400
Received: from mail.kernel.org ([198.145.29.99]:46846 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726884AbfFMSCX (ORCPT
        <rfc822;linux-trace-users@vger.kernel.org>);
        Thu, 13 Jun 2019 14:02:23 -0400
Received: from gandalf.local.home (cpe-66-24-58-225.stny.res.rr.com [66.24.58.225])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 3547720645;
        Thu, 13 Jun 2019 18:02:22 +0000 (UTC)
Date:   Thu, 13 Jun 2019 14:02:20 -0400
From:   Steven Rostedt <rostedt@goodmis.org>
To:     Cong Wang <xiyou.wangcong@gmail.com>
Cc:     linux-trace-users@vger.kernel.org
Subject: Re: Trace event filtering
Message-ID: <20190613140220.2316ff77@gandalf.local.home>
In-Reply-To: <CAM_iQpU9SQPoZnwfdmOECftDPt99HLe4NX-b_JaCk1oRLYZB_g@mail.gmail.com>
References: <CAM_iQpU9SQPoZnwfdmOECftDPt99HLe4NX-b_JaCk1oRLYZB_g@mail.gmail.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-trace-users-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-trace-users.vger.kernel.org>
X-Mailing-List: linux-trace-users@vger.kernel.org

On Thu, 13 Jun 2019 10:43:22 -0700
Cong Wang <xiyou.wangcong@gmail.com> wrote:

> Hi, all

Hi Cong,

> 
> I have a simple question about filters in libtraceevent. It looks like
> libtraceevent parses and matches filters in user-space, but kernel
> already implements filtering in kernel-space which is better because
> it should prevent events from generating, if not matched. So why
> doesn't libtraceevent use kernel filters?

The libtraceevent library is made to process the data after it has been
recorded. It is not the library for use of starting the recording,
hence there's no reason to make it use kernel filtering.

> 
> I am trying to filter out non-error block_rq_complete events, clearly
> I don't want to see rasdaemon woken up every time for error==0 case,
> which is literally all the time.

You can do that by this:

  echo 'error != 0' > /sys/kernel/tracing/events/block/block_rq_complete/filter

Note, trace-cmd does this, and we are working on making a libftrace.so
(hopefully it will be out this year) that will allow you to do this
easily from any application.

> 
> BTW, the user-space filters have slightly different syntax with
> kernel-space filters, at least the regex matching looks slightly
> different to me.

Yes, the parsing in the kernel is very limited, but for userspace, we
have the regex (man regex) at our disposal, that the kernel does not
have. Thus, we use that powerful engine. Unfortunately, that means that
the kernel and the userspace filtering will be different.

> 
> Am I miss anything here?

Did that answer all your questions?

-- Steve
