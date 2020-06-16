Return-Path: <SRS0=sGUs=75=vger.kernel.org=linux-trace-users-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FBFCC433E0
	for <linux-trace-users@archiver.kernel.org>; Tue, 16 Jun 2020 10:27:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0F36820767
	for <linux-trace-users@archiver.kernel.org>; Tue, 16 Jun 2020 10:27:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728160AbgFPK1o (ORCPT
        <rfc822;linux-trace-users@archiver.kernel.org>);
        Tue, 16 Jun 2020 06:27:44 -0400
Received: from mail.ut.ac.ir ([80.66.177.10]:34590 "EHLO mail.ut.ac.ir"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726805AbgFPK0t (ORCPT
        <rfc822;linux-trace-users@vger.kernel.org>);
        Tue, 16 Jun 2020 06:26:49 -0400
Received: from localhost (localhost [127.0.0.1])
        by mail.ut.ac.ir (Postfix) with ESMTP id 2A1271DB301;
        Tue, 16 Jun 2020 14:56:12 +0430 (+0430)
Received: from mail.ut.ac.ir ([127.0.0.1])
        by localhost (mail.ut.ac.ir [127.0.0.1]) (amavisd-new, port 10024)
        with LMTP id gOybnD9-Z9Sf; Tue, 16 Jun 2020 14:56:11 +0430 (+0430)
Received: from mail.ut.ac.ir (mail.ut.ac.ir [194.225.0.10])
        by mail.ut.ac.ir (Postfix) with ESMTP id C164A1DB317;
        Tue, 16 Jun 2020 14:56:10 +0430 (+0430)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Tue, 16 Jun 2020 14:56:10 +0430
From:   ahmadkhorrami <ahmadkhorrami@ut.ac.ir>
To:     Steven Rostedt <rostedt@goodmis.org>
Cc:     Linux-trace Users <linux-trace-users@vger.kernel.org>,
        Arnaldo Carvalho de Melo <acme@redhat.com>,
        linux-perf-users@vger.kernel.org
Subject: Re: Perf Script Erroneous User Stack Trace
In-Reply-To: <20200615163145.458bd878@oasis.local.home>
References: <816cb5f558cd0e528812dff2168ef4ca@ut.ac.ir>
 <20200615163145.458bd878@oasis.local.home>
Message-ID: <02a29da538c753793f663d86e7496207@ut.ac.ir>
X-Sender: ahmadkhorrami@ut.ac.ir
User-Agent: Roundcube Webmail/1.3.6
Sender: linux-trace-users-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-trace-users.vger.kernel.org>
X-Mailing-List: linux-trace-users@vger.kernel.org

Hi,
Thanks, Steven!
It was full of patches. Therefore, I thought posting questions might not 
be OK. I will post my further questions, there.
Regards.

On 2020-06-16 01:01, Steven Rostedt wrote:

> On Sun, 14 Jun 2020 18:13:21 +0430
> ahmadkhorrami <ahmadkhorrami@ut.ac.ir> wrote:
> 
>> Hi,
>> 
>> I used the following command to sample backtraces for a simple 
>> "ffmpeg"
>> benchmark:
>> sudo perf record -d --call-graph dwarf,65528 -c 1000000 -e
>> mem_load_uops_retired.l3_miss:u ffmpeg -i
>> /media/ahmad/DATA/Videos/video.mp4 -threads 1 -vf spp out.mp4
>> 
>> As can be seen PEBS is not used, the stack size is set to the maximum
>> and the sampling period is quite large. I also limited the thread 
>> count,
>> but this is the first portion of "perf script --no-demangle" output:
>> ffmpeg 11750  6670.061261:    1000000 mem_load_uops_retired.l3_miss:u:
>> 0         5080021 N/A|SNP N/A|TLB N/A|LCK N/A
>> 7fffeab68844 x264_pixel_avg_w16_avx2+0x4
>> (/usr/lib/x86_64-linux-gnu/libx264.so.152)
>> 
>> ffmpeg 11750  6670.274835:    1000000 mem_load_uops_retired.l3_miss:u:
>> 0         5080021 N/A|SNP N/A|TLB N/A|LCK N/A
>> 7fffeab68844 x264_pixel_avg_w16_avx2+0x4
>> (/usr/lib/x86_64-linux-gnu/libx264.so.152)
>> 
>> ffmpeg 11750  6670.496159:    1000000 mem_load_uops_retired.l3_miss:u:
>> 0         5080021 N/A|SNP N/A|TLB N/A|LCK N/A
>> 7fffeab8ef89 x264_pixel_sad_x4_16x16_avx2+0x49
>> (/usr/lib/x86_64-linux-gnu/libx264.so.152)
>> 
>> ffmpeg 11750  6670.852598:    1000000 mem_load_uops_retired.l3_miss:u:
>> 0         5080021 N/A|SNP N/A|TLB N/A|LCK N/A
>> 7fffeaac97b3 pixel_memset+0x293 (inlined)
>> 7fffeaac97b3 plane_expand_border+0x293 (inlined)
>> 7fffeaac97b3 x264_frame_expand_border_filtered+0x293
>> (/usr/lib/x86_64-linux-gnu/libx264.so.152)
>> 7fffeab463bc x264_fdec_filter_row+0x69c
>> (/usr/lib/x86_64-linux-gnu/libx264.so.152)
>> 7fffeab49523 x264_slice_write+0x1873
>> (/usr/lib/x86_64-linux-gnu/libx264.so.152)
>> 7fffeab85285 x264_stack_align+0x15
>> (/usr/lib/x86_64-linux-gnu/libx264.so.152)
>> 7fffeab45bdb x264_slices_write+0xfb
>> (/usr/lib/x86_64-linux-gnu/libx264.so.152)
>> 5555561e3d87 [unknown] ([heap])
>> 
>> ffmpeg 11750  6671.110007:    1000000 mem_load_uops_retired.l3_miss:u:
>> 0         5080021 N/A|SNP N/A|TLB N/A|LCK N/A
>> 7fffeab6cdde x264_frame_init_lowres_core_avx2+0x8e
>> (/usr/lib/x86_64-linux-gnu/libx264.so.152)
>> 
>> ffmpeg 11750  6671.463562:    1000000 mem_load_uops_retired.l3_miss:u:
>> 0         5080021 N/A|SNP N/A|TLB N/A|LCK N/A
>> 7fffeaabf806 x264_macroblock_load_pic_pointers+0x886 (inlined)
>> 7fffeaabf806 x264_macroblock_cache_load+0x886 (inlined)
>> 7fffeaabf806 x264_macroblock_cache_load_progressive+0x886
>> (/usr/lib/x86_64-linux-gnu/libx264.so.152)
>> 7fffeab49204 x264_slice_write+0x1554
>> (/usr/lib/x86_64-linux-gnu/libx264.so.152)
>> 7fffeab85285 x264_stack_align+0x15
>> (/usr/lib/x86_64-linux-gnu/libx264.so.152)
>> 7fffeab45bdb x264_slices_write+0xfb
>> (/usr/lib/x86_64-linux-gnu/libx264.so.152)
>> 1c [unknown] ([unknown])
>> 
>> None of the backtraces are correct. Because none of them begin with
>> "__start" or "__GI___clone". I also used "LBR", instead. But it has 
>> more
>> size constraints and, therefore, not suitable. The important thing to
>> note is that the problem occurs only with user space events (and for 
>> all
>> events that I checked). I do not think that the problem is with
>> DebugInfo. Because I manually used "perf_event_open()" system call
>> (without using "Perf") and the problem was still there (with raw
>> callstack IPs).
>> 
>> Therefore, I assumed that the problem is inside the kernel. Precisely,
>> it should be where the userspace callchain is extracted or dumped. I
>> looked for the latter (i.e., the callchain dump implementation) and it
>> seemed to be here:
>> https://github.com/torvalds/linux/blob/master/kernel/events/core.c#L6786
>> 
>> But I could not (or, equivalently, did not know how to) view the user
>> callchain instruction pointers.
>> Am I on the right track? Does anybody know the kernel mechanism for
>> extracting userspace callchains?
>> 
>> Please accept my apology for my frequent questions. I tried to get
>> around the problem, myself, but it has taken more than three complete
>> days and I'm stuck!
>> I really appreciate any suggestions.
> 
> No problem, but please note that perf questions are more likely to be
> answered via: linux-perf-users@vger.kernel.org and not
> linux-trace-users. As linux-trace-users are more for ftrace and not
> perf.
> 
> -- Steve
