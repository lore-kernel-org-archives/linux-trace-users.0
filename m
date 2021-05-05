Return-Path: <linux-trace-users-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C342C433ED
	for <linux-trace-users@archiver.kernel.org>; Wed,  5 May 2021 14:48:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0766F613CD
	for <linux-trace-users@archiver.kernel.org>; Wed,  5 May 2021 14:48:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233413AbhEEOtp (ORCPT
        <rfc822;linux-trace-users@archiver.kernel.org>);
        Wed, 5 May 2021 10:49:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42558 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233362AbhEEOtp (ORCPT
        <rfc822;linux-trace-users@vger.kernel.org>);
        Wed, 5 May 2021 10:49:45 -0400
Received: from mail-qt1-x831.google.com (mail-qt1-x831.google.com [IPv6:2607:f8b0:4864:20::831])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F20DC061574
        for <linux-trace-users@vger.kernel.org>; Wed,  5 May 2021 07:48:49 -0700 (PDT)
Received: by mail-qt1-x831.google.com with SMTP id j17so1339330qtx.6
        for <linux-trace-users@vger.kernel.org>; Wed, 05 May 2021 07:48:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Kc2O+SoeAqRp4B9fcyxEnP4ZscShQlREmNQKkpDe3E0=;
        b=YrhL0jBWT45XFQHOZzipv6SIvWmEuE9LzhK3GjAiWiqJfHsqxYrAUN9U4zIVLqEq71
         nXFp7SzaSjQ3zepYgrlyE+kEu982lG46U9r6H7/RkF7NhiIjIzq+XpoKfyIqrOAC9+00
         Xjot0NHvUZ1DsQSRnEAjdPVwNsJGydEYWxxiDUra+7jdaUHVS5j6KYodf0DCs0sn4Xik
         hi/hMNasPykrK2ebZDmXlg5nfjXcBB2KlMS7SWmearcU6qK9n2wsPnIP/Bohz2wvkWfJ
         BK4U8V/dTPORUyk92jL+WBL7O44gxVbH262wdqAPcZ98HTy1FNFfKCY7L2jF/beXPcxG
         ljpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Kc2O+SoeAqRp4B9fcyxEnP4ZscShQlREmNQKkpDe3E0=;
        b=EfbPYBSGIqmsurhYWxfCgY97G7beXH1LZlf5KI6NOrqqra9HQHcgCLbF0wWp+1JiXo
         81WoaWZ5GZTqDsnPHOtoLGu4odtd2xkOYEV983BNEXFhtbK9E3EWE64QeUYiWU7zNwZy
         uctLC49u8rM0ewdP5/bWsRWMuib+jlWFrIP4n1Br5scdfqk2Ykyl4Gym4n4CgHGzfmxY
         lfqrVx2gSuispm+U2+/qeLw4rMVWav/dc+cw8FXWM493/vF3V9sm098avmRB+sDCrSu4
         FqQSoJnBA7CI9sA6FRKp5bYa+q07QPs1cY1rPFckJ69WlpCLLO+vkefWA2GjBsjhl+xE
         06Dg==
X-Gm-Message-State: AOAM530Nc+1/S2Vl7R+xCHGUPC5RgvFn+3BA7APc0R7zrC4z1tk6J/zI
        ROeg7eJTrXnxNvST1qP2AZiQMZ0b/f3Ci2QOyRv/d1iOCd0YQg==
X-Google-Smtp-Source: ABdhPJycDmzj7a+QMFI/ZCvzdfuBRf4m9Xyn/MfD1eXk0zIbG86IGVCIJOZLrnHblYU+OZf6sN8bhh6mWcX4cHySCtU=
X-Received: by 2002:ac8:5894:: with SMTP id t20mr17819168qta.134.1620226128153;
 Wed, 05 May 2021 07:48:48 -0700 (PDT)
MIME-Version: 1.0
References: <CABPy0FmkQAJXiX=uQatisCCHsZpfpk78DA9GrNFfULTguiY_vQ@mail.gmail.com>
 <20210505091829.3eb87117@gandalf.local.home>
In-Reply-To: <20210505091829.3eb87117@gandalf.local.home>
From:   Lin Wang <wanglinseven@gmail.com>
Date:   Wed, 5 May 2021 10:48:37 -0400
Message-ID: <CABPy0FmFOB3=u2oXwpLWkf5=tcukGdF4zuJdPFomqrdkULYf2g@mail.gmail.com>
Subject: Re: how to continuously capture events
To:     Steven Rostedt <rostedt@goodmis.org>
Cc:     linux-trace-users@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-trace-users.vger.kernel.org>
X-Mailing-List: linux-trace-users@vger.kernel.org

> > Hi all,
> >
> > I'm new to ftrace and linux programming in general. Forgive me for
>
> Hi Lin,
>
> Welcome!
>
> > asking dumb questions.
>
> When first learning something, there are no dumb questions :-)

Thank you, Steve.

> trace-cmd is hard to read, but we are working on sample code that will make
> using libtracefs much easier. For example, I wrote this simple code to read
> all files that are opened.

I will check out the example, and keep digging in trace-cmd.

Thanks,
-Lin

On Wed, May 5, 2021 at 9:18 AM Steven Rostedt <rostedt@goodmis.org> wrote:
>
> On Wed, 5 May 2021 08:21:35 -0400
> Lin Wang <wanglinseven@gmail.com> wrote:
>
> > Hi all,
> >
> > I'm new to ftrace and linux programming in general. Forgive me for
>
> Hi Lin,
>
> Welcome!
>
> > asking dumb questions.
>
> When first learning something, there are no dumb questions :-)
>
> >
> > I'm trying to continuously capture certain kernel events, convert them
> > to a different format and then write them to a file.
> >
> > I understand that trace_pipe should be used for streaming. But I'm not
> > sure how to read the content of trace_pipe at event boundary (I
> > currently just read it to a temp buffer which would sometimes cut the
> > last event in half). I discovered libtraceevent and libtracefs that I
> > think are meant to help with this kind of tasks, so I'm reading the
> > source code of trace-cmd to find examples. But so far the progress has
> > been slow.
>
> Yes, libtracefs is what you want.
>
> The man pages are here (I'm still working on a tutorial):
>
>  https://trace-cmd.org/Documentation/libtracefs/libtracefs.html
>
> Although that may be a little out of date. I need to automate that to be
> updated whenever I make a new release.
>
> >
> > Could anyone point me to the right direction, or advise me with a
> > general outline of what I should do to achieve my task?
> >
>
> I think you may be on the right track.
>
> trace-cmd is hard to read, but we are working on sample code that will make
> using libtracefs much easier. For example, I wrote this simple code to read
> all files that are opened.
>
>   # ./show-open-files cat /etc/passwd
> 42727-<...>: file=/etc/ld.so.cache flags=88000 mode=0
> 42727-<...>: :   addr=0x7f8900123868
> 42727-<...>: :   addr=0x7f89001100f7
> 42727-<...>: file=/lib64/libc.so.6 flags=88000 mode=0
> 42727-<...>: :   addr=0x7f8900123868
> 42727-<...>: :   addr=0x7f8900110139
> 42727-<...>: file=/usr/lib/locale/locale-archive flags=88000 mode=0
> 42727-<...>: :   addr=0x7f890000886c
> 42727-<...>: :   addr=0x7f88fff448ce
> 42727-<...>: :   addr=0x7f88fff44268
> root:x:0:0:root:/root:/bin/bash
> [..]
> flatpak:x:963:962:User for flatpak system helper:/:/sbin/nologin
> 42727-<...>: file=/etc/passwd flags=8000 mode=0
> 42727-<...>: :   addr=0x7f890000319b
> 42727-<...>: :   addr=0x4c45485300647773
>
>
>   http://rostedt.org/code/show-open-files.c
>
> We are adding new API to libtracefs all the time to make it even easier to
> access the tracefs file system. Feel free to subscribe to linux-trace-devel
> if you want to participate or just want to see what is being worked on.
>
>   http://vger.kernel.org/vger-lists.html#linux-trace-devel
>
> If you have any more questions, feel free to ask!
>
> -- Steve
