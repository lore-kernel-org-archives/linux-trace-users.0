Return-Path: <linux-trace-users-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39F7FC433EF
	for <linux-trace-users@archiver.kernel.org>; Thu, 16 Jun 2022 04:25:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242923AbiFPEZ3 (ORCPT
        <rfc822;linux-trace-users@archiver.kernel.org>);
        Thu, 16 Jun 2022 00:25:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36764 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229485AbiFPEZ2 (ORCPT
        <rfc822;linux-trace-users@vger.kernel.org>);
        Thu, 16 Jun 2022 00:25:28 -0400
Received: from mail-vs1-xe34.google.com (mail-vs1-xe34.google.com [IPv6:2607:f8b0:4864:20::e34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2AD75A145
        for <linux-trace-users@vger.kernel.org>; Wed, 15 Jun 2022 21:25:27 -0700 (PDT)
Received: by mail-vs1-xe34.google.com with SMTP id e20so173680vso.4
        for <linux-trace-users@vger.kernel.org>; Wed, 15 Jun 2022 21:25:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6wSwFMLh3lKnEvvDgmSrAaxIi38j3QYuHHFeGYzc7Qs=;
        b=kRPqOXIF7EXPBg7bTspIW58tTu5BzTpf+odTj5co5CaEMq7eYB2pNael0qZfTaWeab
         8WoYL6cM/2dzck3lYbdyHg02Z+Klgnldd9WmAcUvpepjU3gQLOebGbA/IweaWV+xLdUn
         Hu92orwTrr7ks9g/f6cTug0H84JcWZnny/PvtpNFXCboV439vecujcAaP1jbygC5xdWv
         quyvRsvKm9pfVUrGsTcQXlSzcMQCEKWmKvh1EF3EpnwNzKmQcbu2jq7/GFYO8oDj2wc2
         J3uEuy0x1jT/cCrcNXcK+/T/UVpjjevHyYERB5cYhTSI70e7jhrzlIH4UnLKaQSLj1NQ
         DdJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6wSwFMLh3lKnEvvDgmSrAaxIi38j3QYuHHFeGYzc7Qs=;
        b=Wc++ik5neSwxljbnKRm36qPkuYY5Hfg5FXYNb1O+DRORC0D55BTpTpfK6G3LORDYhE
         h2cyknwSfKQOLFx75rU8led41a2pGFjMCyAndATotD9yC5+5zXpzexGpKv7lFsiCiyVF
         Bi9Lt9xoW0WuymlS/UhBB4tsbfq6DRkOwcPPpOxl01I238T2cyt8RYxIr1p+UlEE5+ju
         /ReEsXyBaabCGvhPOa4NHbFrqg1D59wqVI8lyNC0UWAY2N0IZaYTWPITZe9t4mqTK0Mr
         5meyWEX/lq52jdzQObLBz2WNlPB/wgMh1yuv7S83lb0hOGMmrn2qna/DIX1qhnInauqB
         xGsA==
X-Gm-Message-State: AJIora/RBFCMjH8RFLldAwJTBLRTc6iQgdL89cy261JQf8R17VnEA9Dn
        Dr9RZLznReAEtHT+eeYNl2d+1Uh7qHSbUWRo56zPjJFB6r0=
X-Google-Smtp-Source: AGRyM1uRDtxkhVKv75C5PJSIf0cg7jB0ljdbS4tQMlLBshLpIUxE2nxL2VA/vf6gTWwf+7F54jGxkdaw7SyErLV8szU=
X-Received: by 2002:a05:6102:358c:b0:34b:f132:255b with SMTP id
 h12-20020a056102358c00b0034bf132255bmr1541335vsu.23.1655353526943; Wed, 15
 Jun 2022 21:25:26 -0700 (PDT)
MIME-Version: 1.0
References: <e3287c4e7ae2407f873bedf74df9651c@huawei.com>
In-Reply-To: <e3287c4e7ae2407f873bedf74df9651c@huawei.com>
From:   Tzvetomir Stoyanov <tz.stoyanov@gmail.com>
Date:   Thu, 16 Jun 2022 07:25:10 +0300
Message-ID: <CAPpZLN5UQtfWJWzvdx1Le2gRMqfUw_4t8YRPxtzR5Ykx6LOnwg@mail.gmail.com>
Subject: Re: Format of trace.dat flyrecord section
To:     Matteo Bertolino <matteo.bertolino@huawei.com>
Cc:     "linux-trace-users@vger.kernel.org" 
        <linux-trace-users@vger.kernel.org>,
        Steven Rostedt <rostedt@goodmis.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-trace-users.vger.kernel.org>
X-Mailing-List: linux-trace-users@vger.kernel.org

On Wed, Jun 15, 2022 at 6:19 PM Matteo Bertolino
<matteo.bertolino@huawei.com> wrote:
>
> Dear community,
>
> [Goal] I am trying to understand more about tracing. In one of my experiments, I decided to try to write my own trace.dat file (with some dummy entries).
> To do that, I am following the documentation for a "version-7 .dat" provided in https://github.com/rostedt/trace-cmd/blob/master/Documentation/trace-cmd/trace-cmd.dat.v7.5.txt ,
> and trying to looking at the code of libtraceevent, trace-cmd and kernelshark. I use kernelshark to be sure I am writing a good trace.
>
> [Context] I managed to write a complete header (I double-checked checking in strategical points in trace-cmd, kernelshark and libtraceevent code). In this header, I have three sections:
> - Section 0, with options 16 (header_infos), option 8 (in which I stated to have a single CPU), and option 3. The latter states that I have a cpu whose data starts at offset 4096 of the trace.
> - Section 16: in which I transfers the information of `header_page` and `header_event` files.
> - Section 3: the flyrecord section, whose header is followed by a padding to be one-page aligned. After the padding, there should be the CPU datas.
> Yet another check of the header's correctness are outputs of commands `trace-cmd dump --flyrecord -i mytrace.dat` and `trace-cmd dump --summary -i ../mytrace_v7.dat`.
>
> [Problem] The problems occur there. I don't manage to get the format of flyrecords.
> I understood that timestamps need to follow the structure of ringbuffers (those expressed in `header_event` file), so 5 bits for the type_len, 27 for the time_delta, and an u32 array[].
> But, kernelshark entries contains also: timestamp, CPUs, PID, EVENT, TASK, LATENCY and "INFO".
>
> Through flybuffer schema, I can only provide TIMESTAMP divided by CPUs, but where do I take other fields?

Hi Matteo,
The best source to look for the format of the events in the ring
buffer and how to parse them is
https://github.com/rostedt/libtraceevent/ , and especially the file
https://github.com/rostedt/libtraceevent/blob/libtraceevent/src/kbuffer-parse.c
. The format of the data in the u32 array[] that you mentioned is
event specific and is described in its format file, for example look
at the events/sched/sched_wakeup/format for sched_wakeup event data,
in the tracefs directory. Notice that the first 4 fields of all
events are the same - those with "common_" prefix.

> In addition to this, I didn't understand how I can provide multiple entries.

The events in the ring buffer are recorded just one after another. As
you can find the size of each recorded event when reading and parsing
the data, it is easy to jump to the next one. Be aware that pages of
the ring buffer are always aligned to the size of the system page.
Note that there are also some special events, with types described in
the `header_event` file.

>
> Thanks for you possible help,
> Matteo
>

-- 
Tzvetomir (Ceco) Stoyanov
VMware Open Source Technology Center
