Return-Path: <SRS0=XDsJ=UM=vger.kernel.org=linux-trace-users-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16D85C31E45
	for <linux-trace-users@archiver.kernel.org>; Thu, 13 Jun 2019 18:33:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E0BF220896
	for <linux-trace-users@archiver.kernel.org>; Thu, 13 Jun 2019 18:33:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Yf13PQ4R"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726838AbfFMSdu (ORCPT
        <rfc822;linux-trace-users@archiver.kernel.org>);
        Thu, 13 Jun 2019 14:33:50 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:36904 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725851AbfFMSdu (ORCPT
        <rfc822;linux-trace-users@vger.kernel.org>);
        Thu, 13 Jun 2019 14:33:50 -0400
Received: by mail-pg1-f196.google.com with SMTP id 20so10374pgr.4
        for <linux-trace-users@vger.kernel.org>; Thu, 13 Jun 2019 11:33:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=XmUngWrX+qn33RMaE8uJCHOsDExQjQIcN6FpfTUz0t8=;
        b=Yf13PQ4R0ZDHgS2Wy8PwCjVhXsUAo8LeqxQmmLDmmyCEszLXLsLrBruWZMu8MpBCZ8
         UfRdjtMgqVRRnzssSVM9gaYtz6gT1R0X0uP8sp2eWILb7aBmyOttMnRzijeproH5qiBj
         1mKmisHr3sabYBBZvqHZ7rj0sIoZy/gDpXaNf3Nmb2EH3rKy95Yx+oB19iVkZCG3URSG
         eh4q2B9euqzNVjQlNvxrQ5RBsWePwnDAZbWvEAgKlaRMR/XWaFa1ktWbyN1Gcy9/f+Lg
         uIdKr/hOsNJeBARLfNZVRFOMRmS6K7hVS1X/368g4bbRRwddqZ3BNB2YnchaPNlDizas
         zRxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XmUngWrX+qn33RMaE8uJCHOsDExQjQIcN6FpfTUz0t8=;
        b=UIcWoPlwcw4R/SagzUqGTxyx3e92QwOSuqYvYb61RiLeGj7oTDr32/tW1NkEoy5a56
         NcVMMq7EcD6DzCfx0puxP7xYLJNvalVHbl25ecpWo5BI0rA1S3Wh1QZOtFqXYV6b9YXs
         FxedZpITo0tes2Irv9gknxokj4j3hoNNgZXLseuKbNtCHts4s9WXDhgvs9qsdtvl1n4R
         479MJ4Y+Zr87EHyflChPYj7Efc/zlWy9mJ6zFW5zbycHkvaLOfXUgGsqw3ZkFEm74scT
         2aDPB8+jhOPihGesRxJTp/lF7yTvmFBrUD/vJ6bFsawx7aB4dMVjtaLYVBrIhCWiqLti
         KjOA==
X-Gm-Message-State: APjAAAUrzmFwG1zoXmfYof78aM5CJ7Yc11Us/DSX7w3oAOkms7XIzNyA
        xap5mgUOGSi9L2vSKY8SmVK9ooTEH/OltWG6aOHSIA==
X-Google-Smtp-Source: APXvYqyVem0vVxrQIjr+yIOGE/E3qIe1d5TXQDfQorIp8dAhF8zSdi71cknmZJXkJS2ASaIO1QZwxjiSCCS8Hu/YLN4=
X-Received: by 2002:a62:3543:: with SMTP id c64mr12088884pfa.242.1560450829778;
 Thu, 13 Jun 2019 11:33:49 -0700 (PDT)
MIME-Version: 1.0
References: <CAM_iQpU9SQPoZnwfdmOECftDPt99HLe4NX-b_JaCk1oRLYZB_g@mail.gmail.com>
 <20190613140220.2316ff77@gandalf.local.home>
In-Reply-To: <20190613140220.2316ff77@gandalf.local.home>
From:   Cong Wang <xiyou.wangcong@gmail.com>
Date:   Thu, 13 Jun 2019 11:33:38 -0700
Message-ID: <CAM_iQpWCtP5PYjCJhZb4xC6Bt4R=3BAW8btGCPKeFMxeESc29A@mail.gmail.com>
Subject: Re: Trace event filtering
To:     Steven Rostedt <rostedt@goodmis.org>
Cc:     linux-trace-users@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-trace-users-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-trace-users.vger.kernel.org>
X-Mailing-List: linux-trace-users@vger.kernel.org

On Thu, Jun 13, 2019 at 11:02 AM Steven Rostedt <rostedt@goodmis.org> wrote:
>
> On Thu, 13 Jun 2019 10:43:22 -0700
> Cong Wang <xiyou.wangcong@gmail.com> wrote:
>
> > Hi, all
>
> Hi Cong,
>
> >
> > I have a simple question about filters in libtraceevent. It looks like
> > libtraceevent parses and matches filters in user-space, but kernel
> > already implements filtering in kernel-space which is better because
> > it should prevent events from generating, if not matched. So why
> > doesn't libtraceevent use kernel filters?
>
> The libtraceevent library is made to process the data after it has been
> recorded. It is not the library for use of starting the recording,
> hence there's no reason to make it use kernel filtering.

I see, I thought there is a libtraceevent API to use kernel filters too, so
it is actually designed not to use kernel filters, from what you said.

>
> >
> > I am trying to filter out non-error block_rq_complete events, clearly
> > I don't want to see rasdaemon woken up every time for error==0 case,
> > which is literally all the time.
>
> You can do that by this:
>
>   echo 'error != 0' > /sys/kernel/tracing/events/block/block_rq_complete/filter
>
> Note, trace-cmd does this, and we are working on making a libftrace.so
> (hopefully it will be out this year) that will allow you to do this
> easily from any application.

Yeah, before sending out the question I actually verified that rasdaemon
won't be woken up with that kernel fitler set.

So, I will have to implement this by myself, fortunately it is not hard.

>
> >
> > BTW, the user-space filters have slightly different syntax with
> > kernel-space filters, at least the regex matching looks slightly
> > different to me.
>
> Yes, the parsing in the kernel is very limited, but for userspace, we
> have the regex (man regex) at our disposal, that the kernel does not
> have. Thus, we use that powerful engine. Unfortunately, that means that
> the kernel and the userspace filtering will be different.

Right.

>
> >
> > Am I miss anything here?
>
> Did that answer all your questions?

Yes.

Thanks!
