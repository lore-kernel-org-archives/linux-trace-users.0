Return-Path: <SRS0=KgYz=74=vger.kernel.org=linux-trace-users-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.4 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFCF8C433E2
	for <linux-trace-users@archiver.kernel.org>; Mon, 15 Jun 2020 20:53:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8A57520768
	for <linux-trace-users@archiver.kernel.org>; Mon, 15 Jun 2020 20:53:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="nvPAanpI"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731685AbgFOUx5 (ORCPT
        <rfc822;linux-trace-users@archiver.kernel.org>);
        Mon, 15 Jun 2020 16:53:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41074 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731679AbgFOUxr (ORCPT
        <rfc822;linux-trace-users@vger.kernel.org>);
        Mon, 15 Jun 2020 16:53:47 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B968C08C5C2
        for <linux-trace-users@vger.kernel.org>; Mon, 15 Jun 2020 13:53:47 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id l26so884849wme.3
        for <linux-trace-users@vger.kernel.org>; Mon, 15 Jun 2020 13:53:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=NSTT3E1mwEf/1lC2Xe4aTA3BJA1o9jNTLViVi2d5eBs=;
        b=nvPAanpImiC4wngZ54chjhRy5TyE5rqMA5F5wy+jvwVtyDNpJp3UMRKT2eyjLsVlpn
         OBtphFqVvn4si8b69GdQoxWUcvf0Rzcx8wFR9jWQeB1axarjj6DTcRN8mgsU3Ed7ShVP
         mU3TAnD4YSI4sDbRIYhWC6VcsUnmtXSW+BGfpPLxwoyzx4YnBn8m52kqyHQwJ6o3IaQG
         EEh8UceDrqN3yQlwVbdNvQUoh7d4cEmsmdcIC+Aj/6Vcfe7jsVOXaE+JGdASkWHc0RZ5
         z7mmDbSZ+QHfUjMFZYOcPEAcAi+KwNIXfiVh8ag+Z5vnKewda2E0WC2UNJ4/JyfVLrrd
         bhFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=NSTT3E1mwEf/1lC2Xe4aTA3BJA1o9jNTLViVi2d5eBs=;
        b=ixqlvJGf1Gd3TePp1yPDHiSN/wrJDElVD5YYJlGc4btG7FH1oT8theILrgr9CdUYoF
         1TZ7GSA7Eibr60apXCV/YM9ohufN1juZipEvGHgIg0chjtfJGXZR0Idd4mPkFqVfwrGm
         B7nXeJTr8r6L0UetAl7Uz3mD6fhVIBmfikcp865wGPb1aSjOyNS3LzJz/OixZScFd9Pv
         ebDdyE5P4nL4em4Z48DwBmfkCCHuD6JhQpD8BEIsItabAiXu8CKHPgM1Ep3ENtHiD/qx
         8UdM29U5MVx2db53AS8kzVhn32fSoPp0j5MrMnJZREdUhNzGfmAiSgi6KgxH3WvGe/mZ
         uptg==
X-Gm-Message-State: AOAM531IHi4QZTBtlmSbscATZpycHqjdxajIJbH91ENsAXUa25QV0dYU
        9//gtQC9qGVyGTZh9P6JCDuxFBX1RLLFtjnPFoQdtA==
X-Google-Smtp-Source: ABdhPJysVB6d+zAaIpimQKBZ2cAS6eN9vvXnCnmqq4EvxYdSmMWnMDi9nFpNFXIOq6nZgQnSSt9kim2aXaq7WEG3wiQ=
X-Received: by 2002:a1c:230a:: with SMTP id j10mr1126964wmj.124.1592254425481;
 Mon, 15 Jun 2020 13:53:45 -0700 (PDT)
MIME-Version: 1.0
References: <816cb5f558cd0e528812dff2168ef4ca@ut.ac.ir> <20200615163145.458bd878@oasis.local.home>
In-Reply-To: <20200615163145.458bd878@oasis.local.home>
From:   Ian Rogers <irogers@google.com>
Date:   Mon, 15 Jun 2020 13:53:34 -0700
Message-ID: <CAP-5=fUM3r=QmUus9vh=QfNj+dRMwJoOe86ftdc4=Kg0fM7q-g@mail.gmail.com>
Subject: Re: Perf Script Erroneous User Stack Trace
To:     Steven Rostedt <rostedt@goodmis.org>
Cc:     ahmadkhorrami <ahmadkhorrami@ut.ac.ir>,
        Linux-trace Users <linux-trace-users@vger.kernel.org>,
        Arnaldo Carvalho de Melo <acme@redhat.com>,
        linux-perf-users <linux-perf-users@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-trace-users-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-trace-users.vger.kernel.org>
X-Mailing-List: linux-trace-users@vger.kernel.org

On Mon, Jun 15, 2020 at 1:32 PM Steven Rostedt <rostedt@goodmis.org> wrote:
>
> On Sun, 14 Jun 2020 18:13:21 +0430
> ahmadkhorrami <ahmadkhorrami@ut.ac.ir> wrote:
>
> > Hi,
> >
> > I used the following command to sample backtraces for a simple "ffmpeg"
> > benchmark:
> > sudo perf record -d --call-graph dwarf,65528 -c 1000000 -e
> > mem_load_uops_retired.l3_miss:u ffmpeg -i
> > /media/ahmad/DATA/Videos/video.mp4 -threads 1 -vf spp out.mp4
> >
> > As can be seen PEBS is not used, the stack size is set to the maximum
> > and the sampling period is quite large. I also limited the thread count,
> > but this is the first portion of "perf script --no-demangle" output:
> > ffmpeg 11750  6670.061261:    1000000 mem_load_uops_retired.l3_miss:u:
> >               0         5080021 N/A|SNP N/A|TLB N/A|LCK N/A
> >          7fffeab68844 x264_pixel_avg_w16_avx2+0x4
> > (/usr/lib/x86_64-linux-gnu/libx264.so.152)
> >
> > ffmpeg 11750  6670.274835:    1000000 mem_load_uops_retired.l3_miss:u:
> >               0         5080021 N/A|SNP N/A|TLB N/A|LCK N/A
> >          7fffeab68844 x264_pixel_avg_w16_avx2+0x4
> > (/usr/lib/x86_64-linux-gnu/libx264.so.152)
> >
> > ffmpeg 11750  6670.496159:    1000000 mem_load_uops_retired.l3_miss:u:
> >               0         5080021 N/A|SNP N/A|TLB N/A|LCK N/A
> >          7fffeab8ef89 x264_pixel_sad_x4_16x16_avx2+0x49
> > (/usr/lib/x86_64-linux-gnu/libx264.so.152)
> >
> > ffmpeg 11750  6670.852598:    1000000 mem_load_uops_retired.l3_miss:u:
> >               0         5080021 N/A|SNP N/A|TLB N/A|LCK N/A
> >          7fffeaac97b3 pixel_memset+0x293 (inlined)
> >          7fffeaac97b3 plane_expand_border+0x293 (inlined)
> >          7fffeaac97b3 x264_frame_expand_border_filtered+0x293
> > (/usr/lib/x86_64-linux-gnu/libx264.so.152)
> >          7fffeab463bc x264_fdec_filter_row+0x69c
> > (/usr/lib/x86_64-linux-gnu/libx264.so.152)
> >          7fffeab49523 x264_slice_write+0x1873
> > (/usr/lib/x86_64-linux-gnu/libx264.so.152)
> >          7fffeab85285 x264_stack_align+0x15
> > (/usr/lib/x86_64-linux-gnu/libx264.so.152)
> >          7fffeab45bdb x264_slices_write+0xfb
> > (/usr/lib/x86_64-linux-gnu/libx264.so.152)
> >          5555561e3d87 [unknown] ([heap])
> >
> > ffmpeg 11750  6671.110007:    1000000 mem_load_uops_retired.l3_miss:u:
> >               0         5080021 N/A|SNP N/A|TLB N/A|LCK N/A
> >          7fffeab6cdde x264_frame_init_lowres_core_avx2+0x8e
> > (/usr/lib/x86_64-linux-gnu/libx264.so.152)
> >
> > ffmpeg 11750  6671.463562:    1000000 mem_load_uops_retired.l3_miss:u:
> >               0         5080021 N/A|SNP N/A|TLB N/A|LCK N/A
> >          7fffeaabf806 x264_macroblock_load_pic_pointers+0x886 (inlined)
> >          7fffeaabf806 x264_macroblock_cache_load+0x886 (inlined)
> >          7fffeaabf806 x264_macroblock_cache_load_progressive+0x886
> > (/usr/lib/x86_64-linux-gnu/libx264.so.152)
> >          7fffeab49204 x264_slice_write+0x1554
> > (/usr/lib/x86_64-linux-gnu/libx264.so.152)
> >          7fffeab85285 x264_stack_align+0x15
> > (/usr/lib/x86_64-linux-gnu/libx264.so.152)
> >          7fffeab45bdb x264_slices_write+0xfb
> > (/usr/lib/x86_64-linux-gnu/libx264.so.152)
> >                    1c [unknown] ([unknown])
> >
> > None of the backtraces are correct. Because none of them begin with
> > "__start" or "__GI___clone". I also used "LBR", instead. But it has more
> > size constraints and, therefore, not suitable. The important thing to
> > note is that the problem occurs only with user space events (and for all
> > events that I checked). I do not think that the problem is with
> > DebugInfo. Because I manually used "perf_event_open()" system call
> > (without using "Perf") and the problem was still there (with raw
> > callstack IPs).
> >
> > Therefore, I assumed that the problem is inside the kernel. Precisely,
> > it should be where the userspace callchain is extracted or dumped. I
> > looked for the latter (i.e., the callchain dump implementation) and it
> > seemed to be here:
> > https://github.com/torvalds/linux/blob/master/kernel/events/core.c#L6786
> >
> > But I could not (or, equivalently, did not know how to) view the user
> > callchain instruction pointers.
> > Am I on the right track? Does anybody know the kernel mechanism for
> > extracting userspace callchains?

Hi Ahmad,

a lot of ffmpeg is hand written assembly such as:
https://github.com/FFmpeg/FFmpeg/blob/master/libavresample/x86/audio_convert.asm
For this to work with dwarf unwinding it needs to have call frame information:
https://sourceware.org/binutils/docs/as/CFI-directives.html

Thanks,
Ian

> > Please accept my apology for my frequent questions. I tried to get
> > around the problem, myself, but it has taken more than three complete
> > days and I'm stuck!
> > I really appreciate any suggestions.
>
> No problem, but please note that perf questions are more likely to be
> answered via: linux-perf-users@vger.kernel.org and not
> linux-trace-users. As linux-trace-users are more for ftrace and not
> perf.
>
> -- Steve
