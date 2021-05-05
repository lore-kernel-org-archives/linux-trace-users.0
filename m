Return-Path: <linux-trace-users-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0325C433ED
	for <linux-trace-users@archiver.kernel.org>; Wed,  5 May 2021 13:18:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 79444613BE
	for <linux-trace-users@archiver.kernel.org>; Wed,  5 May 2021 13:18:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233450AbhEENT2 (ORCPT
        <rfc822;linux-trace-users@archiver.kernel.org>);
        Wed, 5 May 2021 09:19:28 -0400
Received: from mail.kernel.org ([198.145.29.99]:57902 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233445AbhEENT2 (ORCPT
        <rfc822;linux-trace-users@vger.kernel.org>);
        Wed, 5 May 2021 09:19:28 -0400
Received: from gandalf.local.home (cpe-66-24-58-225.stny.res.rr.com [66.24.58.225])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 8CC5F613BE;
        Wed,  5 May 2021 13:18:31 +0000 (UTC)
Date:   Wed, 5 May 2021 09:18:29 -0400
From:   Steven Rostedt <rostedt@goodmis.org>
To:     Lin Wang <wanglinseven@gmail.com>
Cc:     linux-trace-users@vger.kernel.org
Subject: Re: how to continuously capture events
Message-ID: <20210505091829.3eb87117@gandalf.local.home>
In-Reply-To: <CABPy0FmkQAJXiX=uQatisCCHsZpfpk78DA9GrNFfULTguiY_vQ@mail.gmail.com>
References: <CABPy0FmkQAJXiX=uQatisCCHsZpfpk78DA9GrNFfULTguiY_vQ@mail.gmail.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-trace-users.vger.kernel.org>
X-Mailing-List: linux-trace-users@vger.kernel.org

On Wed, 5 May 2021 08:21:35 -0400
Lin Wang <wanglinseven@gmail.com> wrote:

> Hi all,
> 
> I'm new to ftrace and linux programming in general. Forgive me for

Hi Lin,

Welcome!

> asking dumb questions.

When first learning something, there are no dumb questions :-)

> 
> I'm trying to continuously capture certain kernel events, convert them
> to a different format and then write them to a file.
> 
> I understand that trace_pipe should be used for streaming. But I'm not
> sure how to read the content of trace_pipe at event boundary (I
> currently just read it to a temp buffer which would sometimes cut the
> last event in half). I discovered libtraceevent and libtracefs that I
> think are meant to help with this kind of tasks, so I'm reading the
> source code of trace-cmd to find examples. But so far the progress has
> been slow.

Yes, libtracefs is what you want.

The man pages are here (I'm still working on a tutorial):

 https://trace-cmd.org/Documentation/libtracefs/libtracefs.html

Although that may be a little out of date. I need to automate that to be
updated whenever I make a new release.

> 
> Could anyone point me to the right direction, or advise me with a
> general outline of what I should do to achieve my task?
> 

I think you may be on the right track.

trace-cmd is hard to read, but we are working on sample code that will make
using libtracefs much easier. For example, I wrote this simple code to read
all files that are opened.

  # ./show-open-files cat /etc/passwd
42727-<...>: file=/etc/ld.so.cache flags=88000 mode=0
42727-<...>: :   addr=0x7f8900123868
42727-<...>: :   addr=0x7f89001100f7
42727-<...>: file=/lib64/libc.so.6 flags=88000 mode=0
42727-<...>: :   addr=0x7f8900123868
42727-<...>: :   addr=0x7f8900110139
42727-<...>: file=/usr/lib/locale/locale-archive flags=88000 mode=0
42727-<...>: :   addr=0x7f890000886c
42727-<...>: :   addr=0x7f88fff448ce
42727-<...>: :   addr=0x7f88fff44268
root:x:0:0:root:/root:/bin/bash
[..]
flatpak:x:963:962:User for flatpak system helper:/:/sbin/nologin
42727-<...>: file=/etc/passwd flags=8000 mode=0
42727-<...>: :   addr=0x7f890000319b
42727-<...>: :   addr=0x4c45485300647773


  http://rostedt.org/code/show-open-files.c

We are adding new API to libtracefs all the time to make it even easier to
access the tracefs file system. Feel free to subscribe to linux-trace-devel
if you want to participate or just want to see what is being worked on.

  http://vger.kernel.org/vger-lists.html#linux-trace-devel

If you have any more questions, feel free to ask!

-- Steve
