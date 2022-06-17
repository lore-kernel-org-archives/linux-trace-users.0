Return-Path: <linux-trace-users-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE065C43334
	for <linux-trace-users@archiver.kernel.org>; Fri, 17 Jun 2022 15:26:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1382626AbiFQP0F (ORCPT
        <rfc822;linux-trace-users@archiver.kernel.org>);
        Fri, 17 Jun 2022 11:26:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54074 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1382150AbiFQP0F (ORCPT
        <rfc822;linux-trace-users@vger.kernel.org>);
        Fri, 17 Jun 2022 11:26:05 -0400
Received: from mail-vk1-xa32.google.com (mail-vk1-xa32.google.com [IPv6:2607:f8b0:4864:20::a32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 78C852A72B
        for <linux-trace-users@vger.kernel.org>; Fri, 17 Jun 2022 08:26:04 -0700 (PDT)
Received: by mail-vk1-xa32.google.com with SMTP id z17so2132273vkb.13
        for <linux-trace-users@vger.kernel.org>; Fri, 17 Jun 2022 08:26:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0H9akfmgJa0fk9gzl5H3x214FEVRQhvJAL3kDqij3r8=;
        b=mO/ghKeuCATHW3qigg7/DoFNRyIB2B902q8A7P1t/OH4ZP7CxS0qJxPd45mPJGA/VC
         7kWa/N4+Ni7rF8U+DPYstvBxIDl3Eahg2spAAj2srtvvQFz6Mn0tSIWl0FZQwQvxwp/8
         BO8Juki7THJSzSZXVyNgIqFDfYI5627+g4mBeZGE5zYQmZytizBm7aergTWEi/G6AvLT
         C73ILWYe6heXk1at2BeZDVVqX4jPHtEwpOXu1WzikMft7qiXXYDfr9Ml2/q935qieDIt
         Bcf0uP9r3FFOFNCmmDKf32aETElL35+nfYge2nvsomKsUI8BtTT0eJZaVIfkNP7pGj7/
         cuyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0H9akfmgJa0fk9gzl5H3x214FEVRQhvJAL3kDqij3r8=;
        b=7WGSsHuGUNeD5PXM8PbcUUHG4c+8XoBJzgXLO3WYZ7DLvNh4xq8F81Baq0T8AvElRS
         O40ufNpUo2cXzFDn66HqEo8n/7fd9Jrw7WK1UWNm/6F1QxM9vq1oIEUWmYSNHF7uJjV5
         EkWwhj1E050pQKRNVsVSWflzz/+ntCIPZMjxB0Z/SRnABQ7mvM4K0BdcU5/njLn+Z9At
         PFyUbw4c8ZbfeGzpnK7Gro2g7GiCDUqUCh2aw6D8p3ztBD5/JqvHXbbsqeszTdVTOz8U
         5me6EeULIpAUp+6umL5yZGaYIL9fwqnS7llGkC1IW3RMZnIW+nfRV+zBDW+ncZflniIR
         5z5Q==
X-Gm-Message-State: AJIora8qdvhQrbpHHaRzG+snoErOtTf5IHEGiny3R8gGa0LR4rIdU3qF
        hPk5uZbCwVo8euQMAVg+Ie0qZjp0oakmZVkf7joLZVoEDmo=
X-Google-Smtp-Source: AGRyM1tHmDI40ZR+wDd7qRq9ny4mgLN/7DnMCHmVxNaX6/aemxb5P3VWFzV7frP+aNDIWEwImTRXyKz/IXJI2cTgEMM=
X-Received: by 2002:a1f:2154:0:b0:368:aaba:31b8 with SMTP id
 h81-20020a1f2154000000b00368aaba31b8mr5078683vkh.33.1655479563546; Fri, 17
 Jun 2022 08:26:03 -0700 (PDT)
MIME-Version: 1.0
References: <e3287c4e7ae2407f873bedf74df9651c@huawei.com> <20220616090237.2c9dda8b@gandalf.local.home>
 <20220616090338.3172219b@gandalf.local.home> <7082a3842cac4fe4bd3e6fcb8e693ff6@huawei.com>
In-Reply-To: <7082a3842cac4fe4bd3e6fcb8e693ff6@huawei.com>
From:   Tzvetomir Stoyanov <tz.stoyanov@gmail.com>
Date:   Fri, 17 Jun 2022 18:25:47 +0300
Message-ID: <CAPpZLN7x_w9FTJ1Knrrmv2Rny2T5T-SH+jh=sHNnxWKqYK7s6g@mail.gmail.com>
Subject: Re: Format of trace.dat flyrecord section
To:     Matteo Bertolino <matteo.bertolino@huawei.com>
Cc:     "linux-trace-users@vger.kernel.org" 
        <linux-trace-users@vger.kernel.org>,
        Steven Rostedt <rostedt@goodmis.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-trace-users.vger.kernel.org>
X-Mailing-List: linux-trace-users@vger.kernel.org

On Fri, Jun 17, 2022 at 4:08 PM Matteo Bertolino
<matteo.bertolino@huawei.com> wrote:
>
> Dear Mr Rostedt and mr Stoyanov,
> thanks for your warming welcoming and for your answers.
>
> I had clearer ideas now. If possible, I would like to ask some clarifications.
> Once everything is clear in my mind, I will write a resume with an example for the mailing list, so it can be usefulf for future experiments.
>
> Let's suppose that I want to write some events like the "function tracer":
> Thanks to your explanation, I successfully communicated in the header this format. This is confirmed by:
>
> ```
> dreamer@dreamer-VB:~/Desktop/mydotdat/input$ trace-cmd dump --events -i ../mytrace_v7.dat
>         [Section 18 @ 617: "Unknown", flags 0x0, 485 bytes]
>         [Events format, 1 systems]
> name: function
> ID: 1
> format:
>         field:unsigned short common_type;       offset:0;       size:2; signed:0;
>         field:unsigned char common_flags;       offset:2;       size:1; signed:0;
>         field:unsigned char common_preempt_count;       offset:3;       size:1; signed:0;
>         field:int common_pid;   offset:4;       size:4; signed:1;
>
>         field:unsigned long ip; offset:8;       size:8; signed:0;
>         field:unsigned long parent_ip;  offset:16;      size:8; signed:0;
>
> print fmt: " %ps <-- %ps", (void *)REC->ip, (void *)REC->parent_ip
> ```
>
> Now, in my trace.dat, I want to write the real information.
> If you permit me, I'd like to continue this discussion with a concrete example.
>
> Let's suppose that I want to represent the following information:
>
> Event: function trace event
> Timestamp 9 seconds
> PID: 7777
> Function address: 0x2266D
> Parent: 0x2266E
>
> I start by filling the header_event information:
> - Writing 900000000000 on 8 bytes (timestamp).
> - Writing `24`in 8 bytes (commit) --> event data for event ID are on 24 bytes, indeed: common_* are on 8 bytes, ip and parent ip on 8.
> - Ignoring overwrite: indeed, I already used commit.
>
> Then, I have the 4080 bytes of payload event, but I use only 24 of them, as expressed in commit.
> - common_type is 1, (2 bytes), because I want a function event
> - common_flags is 0 (1 byte)
> - common_preempt_count is 0 (1 byte)
> - common_pid is 7777 (4 bytes)
> - ip is 0x2266D (8 bytes)
> - parent_ip is 0x2266E (8 bytes)
> - the remaining 4096 - 24 bytes are of padding, so I can complete the 4080 bytes of data.
>
> Unfortunately, in this way, only CPU number and timestamp are correctly displayed on the frontend (kernelshark).
> Event is marked as "unknown" and PID is wrong.
> Timestamp astonishes me too: to correctly display it, I just need to write 900000000000 on 8 bytes.
> Trying to put "1" on time_type (5bits), 0 on delta (27 bits) and 900000000000 on array (1*4 bytes), the timestamp is not correct.

Hi Matteo,
The 'type_len' should be 6 for your event, as the payload is 24 bytes
(6*4). The 'time_delta' is the delta from the timestamp written in the
page header, i.e. if you put 199 in 'time_delta' the time stamp of the
event is 900000000199. One very important note - take care of the
endian, used for all numbers in the file. The endian of the file can
be different from the endian of the host, where the file is displayed.
That's why that information is written in the trace.dat - in the very
beginning of the file.

>
> Thus, I think I am doing something wrong. May you help me in correcting this example, please?
>
> Another thing that did let me with a doubt is the following one: do I need a page (4096 bytes) for an event?
> In other words: the 4096-24 bytes of padding to complete the 4080 bytes of "data" are mandatory to express another event?
>
> Thanks for your help,
> Matteo
>
> -----Original Message-----
> From: Steven Rostedt [mailto:rostedt@goodmis.org]
> Sent: Thursday, June 16, 2022 3:04 PM
> To: Matteo Bertolino <matteo.bertolino@huawei.com>
> Cc: linux-trace-users@vger.kernel.org
> Subject: Re: Format of trace.dat flyrecord section
>
>
> OK, this is a claws-mail bug. It added the '\' in the email address when doing a reply all.
>
> -- Steve
>
>
> On Thu, 16 Jun 2022 09:02:37 -0400
> Steven Rostedt <rostedt@goodmis.org> wrote:
>
> > This is just a test to see if the added '\' was due to a claws-mail
> > bug or somehow I did it.
> >
> > -- Steve
>


-- 
Tzvetomir (Ceco) Stoyanov
VMware Open Source Technology Center
