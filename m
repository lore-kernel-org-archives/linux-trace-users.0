Return-Path: <SRS0=Ymwr=73=vger.kernel.org=linux-trace-users-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42EADC433DF
	for <linux-trace-users@archiver.kernel.org>; Sun, 14 Jun 2020 13:43:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 28A5520714
	for <linux-trace-users@archiver.kernel.org>; Sun, 14 Jun 2020 13:43:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727055AbgFNNnZ (ORCPT
        <rfc822;linux-trace-users@archiver.kernel.org>);
        Sun, 14 Jun 2020 09:43:25 -0400
Received: from mail.ut.ac.ir ([80.66.177.10]:41152 "EHLO mail.ut.ac.ir"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727027AbgFNNnZ (ORCPT
        <rfc822;linux-trace-users@vger.kernel.org>);
        Sun, 14 Jun 2020 09:43:25 -0400
Received: from localhost (localhost [127.0.0.1])
        by mail.ut.ac.ir (Postfix) with ESMTP id 3DBAA1DA56A
        for <linux-trace-users@vger.kernel.org>; Sun, 14 Jun 2020 18:13:22 +0430 (+0430)
Received: from mail.ut.ac.ir ([127.0.0.1])
        by localhost (mail.ut.ac.ir [127.0.0.1]) (amavisd-new, port 10024)
        with LMTP id KjttavRSkwcE for <linux-trace-users@vger.kernel.org>;
        Sun, 14 Jun 2020 18:13:21 +0430 (+0430)
Received: from mail.ut.ac.ir (mail.ut.ac.ir [194.225.0.10])
        by mail.ut.ac.ir (Postfix) with ESMTP id 97F041DA459
        for <linux-trace-users@vger.kernel.org>; Sun, 14 Jun 2020 18:13:21 +0430 (+0430)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Sun, 14 Jun 2020 18:13:21 +0430
From:   ahmadkhorrami <ahmadkhorrami@ut.ac.ir>
To:     Linux-trace Users <linux-trace-users@vger.kernel.org>
Subject: Perf Script Erroneous User Stack Trace
Message-ID: <816cb5f558cd0e528812dff2168ef4ca@ut.ac.ir>
X-Sender: ahmadkhorrami@ut.ac.ir
User-Agent: Roundcube Webmail/1.3.6
Sender: linux-trace-users-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-trace-users.vger.kernel.org>
X-Mailing-List: linux-trace-users@vger.kernel.org

Hi,

I used the following command to sample backtraces for a simple "ffmpeg" 
benchmark:
sudo perf record -d --call-graph dwarf,65528 -c 1000000 -e 
mem_load_uops_retired.l3_miss:u ffmpeg -i 
/media/ahmad/DATA/Videos/video.mp4 -threads 1 -vf spp out.mp4

As can be seen PEBS is not used, the stack size is set to the maximum 
and the sampling period is quite large. I also limited the thread count, 
but this is the first portion of "perf script --no-demangle" output:
ffmpeg 11750  6670.061261:    1000000 mem_load_uops_retired.l3_miss:u:   
              0         5080021 N/A|SNP N/A|TLB N/A|LCK N/A
         7fffeab68844 x264_pixel_avg_w16_avx2+0x4 
(/usr/lib/x86_64-linux-gnu/libx264.so.152)

ffmpeg 11750  6670.274835:    1000000 mem_load_uops_retired.l3_miss:u:   
              0         5080021 N/A|SNP N/A|TLB N/A|LCK N/A
         7fffeab68844 x264_pixel_avg_w16_avx2+0x4 
(/usr/lib/x86_64-linux-gnu/libx264.so.152)

ffmpeg 11750  6670.496159:    1000000 mem_load_uops_retired.l3_miss:u:   
              0         5080021 N/A|SNP N/A|TLB N/A|LCK N/A
         7fffeab8ef89 x264_pixel_sad_x4_16x16_avx2+0x49 
(/usr/lib/x86_64-linux-gnu/libx264.so.152)

ffmpeg 11750  6670.852598:    1000000 mem_load_uops_retired.l3_miss:u:   
              0         5080021 N/A|SNP N/A|TLB N/A|LCK N/A
         7fffeaac97b3 pixel_memset+0x293 (inlined)
         7fffeaac97b3 plane_expand_border+0x293 (inlined)
         7fffeaac97b3 x264_frame_expand_border_filtered+0x293 
(/usr/lib/x86_64-linux-gnu/libx264.so.152)
         7fffeab463bc x264_fdec_filter_row+0x69c 
(/usr/lib/x86_64-linux-gnu/libx264.so.152)
         7fffeab49523 x264_slice_write+0x1873 
(/usr/lib/x86_64-linux-gnu/libx264.so.152)
         7fffeab85285 x264_stack_align+0x15 
(/usr/lib/x86_64-linux-gnu/libx264.so.152)
         7fffeab45bdb x264_slices_write+0xfb 
(/usr/lib/x86_64-linux-gnu/libx264.so.152)
         5555561e3d87 [unknown] ([heap])

ffmpeg 11750  6671.110007:    1000000 mem_load_uops_retired.l3_miss:u:   
              0         5080021 N/A|SNP N/A|TLB N/A|LCK N/A
         7fffeab6cdde x264_frame_init_lowres_core_avx2+0x8e 
(/usr/lib/x86_64-linux-gnu/libx264.so.152)

ffmpeg 11750  6671.463562:    1000000 mem_load_uops_retired.l3_miss:u:   
              0         5080021 N/A|SNP N/A|TLB N/A|LCK N/A
         7fffeaabf806 x264_macroblock_load_pic_pointers+0x886 (inlined)
         7fffeaabf806 x264_macroblock_cache_load+0x886 (inlined)
         7fffeaabf806 x264_macroblock_cache_load_progressive+0x886 
(/usr/lib/x86_64-linux-gnu/libx264.so.152)
         7fffeab49204 x264_slice_write+0x1554 
(/usr/lib/x86_64-linux-gnu/libx264.so.152)
         7fffeab85285 x264_stack_align+0x15 
(/usr/lib/x86_64-linux-gnu/libx264.so.152)
         7fffeab45bdb x264_slices_write+0xfb 
(/usr/lib/x86_64-linux-gnu/libx264.so.152)
                   1c [unknown] ([unknown])

None of the backtraces are correct. Because none of them begin with 
"__start" or "__GI___clone". I also used "LBR", instead. But it has more 
size constraints and, therefore, not suitable. The important thing to 
note is that the problem occurs only with user space events (and for all 
events that I checked). I do not think that the problem is with 
DebugInfo. Because I manually used "perf_event_open()" system call 
(without using "Perf") and the problem was still there (with raw 
callstack IPs).

Therefore, I assumed that the problem is inside the kernel. Precisely, 
it should be where the userspace callchain is extracted or dumped. I 
looked for the latter (i.e., the callchain dump implementation) and it 
seemed to be here:
https://github.com/torvalds/linux/blob/master/kernel/events/core.c#L6786

But I could not (or, equivalently, did not know how to) view the user 
callchain instruction pointers.
Am I on the right track? Does anybody know the kernel mechanism for 
extracting userspace callchains?

Please accept my apology for my frequent questions. I tried to get 
around the problem, myself, but it has taken more than three complete 
days and I'm stuck!
I really appreciate any suggestions.

Regards.
