Return-Path: <linux-trace-users-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5AF8C433B4
	for <linux-trace-users@archiver.kernel.org>; Wed,  5 May 2021 14:50:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 87480613C3
	for <linux-trace-users@archiver.kernel.org>; Wed,  5 May 2021 14:50:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233319AbhEEOvy (ORCPT
        <rfc822;linux-trace-users@archiver.kernel.org>);
        Wed, 5 May 2021 10:51:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43016 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233314AbhEEOvy (ORCPT
        <rfc822;linux-trace-users@vger.kernel.org>);
        Wed, 5 May 2021 10:51:54 -0400
Received: from mail-qk1-x736.google.com (mail-qk1-x736.google.com [IPv6:2607:f8b0:4864:20::736])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE9DAC061574
        for <linux-trace-users@vger.kernel.org>; Wed,  5 May 2021 07:50:56 -0700 (PDT)
Received: by mail-qk1-x736.google.com with SMTP id o5so1773361qkb.0
        for <linux-trace-users@vger.kernel.org>; Wed, 05 May 2021 07:50:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=HkTRf3LK0xoCqtePJ1BMZv5qHQOAFu2UdzWPx0lcwxc=;
        b=RJWEChFrqii1aV5eRCy1zePhylWkTOvmRYEt8m2N3426vdgzLronJbpJs+hjYc94hF
         4BXh+7o6bR1/06h1YJ7JQcqB25pH0H2DZ4j/YGPIeW+foJ9XUpbkX4CVOIzlew2i4HCI
         pJ1cgYJ8ETBPEQ5c/nowDYcXSuMn88JLXjSF0TcmQ+zHRCZptFVAJBOWwlaYaANnLpQA
         pkx5RhrBFaFhytHDkVAESSvUq3vUKa2gz3LPMzOO73fWlVT3ioA9tel0/qtefbSKYy2E
         xvFxul7ay3oVzLYJsJxA/fCfh4wzbdJL9iRwfWrFJQNjEFG0FCiB2Ri2lcuVkFznDntc
         CcGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=HkTRf3LK0xoCqtePJ1BMZv5qHQOAFu2UdzWPx0lcwxc=;
        b=nAcszuwLyaV8FdKFvVsdZG/YQ/cMGcuxTKpFubl2BsXQKWHE+QaP6hdi5mMf/SGKgd
         ZnKckw/9i5D9HwwpIFNdAu/xJSms1fNM+tM3HwzUUD66o3pdLC2ejbY6+oelZ5KkR4gU
         nvHY8qvgrkSIsedT8AO7PHYUSqBnDQNtkPIumU0Xj+uD4F0JNtpFjSy0rM7CsEmCZv5h
         YhNAe3fA+HOrEHzcZGelKdWB0L/RkqPWLmkcZFkvq4LWbPZbdAW0/IviISnxDOND5j0k
         slL4l/VwUcPAsCqSKyMqCjCHFXZkxmk7FqjoACrRDE3Y9JfqnIQg15izpqsJ0fM3cKS1
         homQ==
X-Gm-Message-State: AOAM531mVe4qtH93fJVsROXh6BDEg7bcc/A5AnTckQH4nwID/nrqHxPa
        kJyBm+6fMJXJTTM4LAD2eS7KqK+CxkHqDYJDeYNo6MZmZ7lP9g==
X-Google-Smtp-Source: ABdhPJzd69d0IHi6RjVTtklJoP9/zDtUxouNbPrvlQKb+V7qyqv5TMRwKZ0+vLVlxKfuKz3Bj8Gk6IuayxlGOZGdRAA=
X-Received: by 2002:a05:620a:3c3:: with SMTP id r3mr29504556qkm.35.1620226255990;
 Wed, 05 May 2021 07:50:55 -0700 (PDT)
MIME-Version: 1.0
References: <CABPy0FmkQAJXiX=uQatisCCHsZpfpk78DA9GrNFfULTguiY_vQ@mail.gmail.com>
 <20210505134708.GC346954@joraj-alpa>
In-Reply-To: <20210505134708.GC346954@joraj-alpa>
From:   Lin Wang <wanglinseven@gmail.com>
Date:   Wed, 5 May 2021 10:50:45 -0400
Message-ID: <CABPy0Fnk-4BXE8qG7BDjjXmNR66g5a3qCuQFfzL=ubFbh6-qFQ@mail.gmail.com>
Subject: Re: how to continuously capture events
To:     Jonathan Rajotte-Julien <jonathan.rajotte-julien@efficios.com>
Cc:     linux-trace-users@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-trace-users.vger.kernel.org>
X-Mailing-List: linux-trace-users@vger.kernel.org

> > I'm trying to continuously capture certain kernel events, convert them
> > to a different format and then write them to a file.
>
> You might also want to have a look at LTTng and LTTng-modules depending on your
> final use case. [1][2]

From a cursory look, it might be an overkill for what I want to
achieve. I will keep this in
mind in case I need to do something more complex. Thank you for the pointers.

-Lin

On Wed, May 5, 2021 at 9:47 AM Jonathan Rajotte-Julien
<jonathan.rajotte-julien@efficios.com> wrote:
>
> Hi,
>
> > I'm trying to continuously capture certain kernel events, convert them
> > to a different format and then write them to a file.
>
> You might also want to have a look at LTTng and LTTng-modules depending on your
> final use case. [1][2]
>
> LTTng produce CTF traces [3] that can then be read/converted/manipulated with Babeltrace [4].
>
> [1] https://lttng.org/
> [2] https://lttng.org/docs/v2.12/#doc-tracing-the-linux-kernel
> [3] https://diamon.org/ctf/
> [4] https://babeltrace.org/
>
> Cheers
>
> --
> Jonathan Rajotte-Julien
> EfficiOS
