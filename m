Return-Path: <SRS0=dZ7p=7H=vger.kernel.org=linux-trace-users-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC9BBC433DF
	for <linux-trace-users@archiver.kernel.org>; Mon, 25 May 2020 14:52:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B065720878
	for <linux-trace-users@archiver.kernel.org>; Mon, 25 May 2020 14:52:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404000AbgEYOw2 (ORCPT
        <rfc822;linux-trace-users@archiver.kernel.org>);
        Mon, 25 May 2020 10:52:28 -0400
Received: from mail.kernel.org ([198.145.29.99]:42652 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2403969AbgEYOw2 (ORCPT
        <rfc822;linux-trace-users@vger.kernel.org>);
        Mon, 25 May 2020 10:52:28 -0400
Received: from oasis.local.home (cpe-66-24-58-225.stny.res.rr.com [66.24.58.225])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 38D2C2078B;
        Mon, 25 May 2020 14:52:27 +0000 (UTC)
Date:   Mon, 25 May 2020 10:52:25 -0400
From:   Steven Rostedt <rostedt@goodmis.org>
To:     ahmadkhorrami <ahmadkhorrami@ut.ac.ir>
Cc:     Linux-trace Users <linux-trace-users@vger.kernel.org>,
        Arnaldo Carvalho de Melo <acme@redhat.com>
Subject: Re: Perf Reports Jump Instructions as Memory Access Instructions
Message-ID: <20200525105225.6472d38b@oasis.local.home>
In-Reply-To: <d66d3f9b1bdf6e4ca0ed44f344697915@ut.ac.ir>
References: <d66d3f9b1bdf6e4ca0ed44f344697915@ut.ac.ir>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-trace-users-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-trace-users.vger.kernel.org>
X-Mailing-List: linux-trace-users@vger.kernel.org

Arnaldo,

This one may be for you ;-)

-- Steve


On Sun, 17 May 2020 19:40:52 +0430
ahmadkhorrami <ahmadkhorrami@ut.ac.ir> wrote:

> Hi,
> I used the following perf command to sample user space read accesses to 
> DRAM by evince:
> perf record -d --call-graph dwarf -c 100 -e 
> mem_load_uops_retired.l3_miss:uppp /opt/evince-3.28.4/bin/evince
> 
> As can be seen, I used the PEBS feature to increase the accuracy of 
> sampling. But there are some non-memory accesses reported as memory 
> ones. Here is one of them reported by perf script -D:
> 11159097179866 0xfb80 [0x1778]: PERF_RECORD_SAMPLE(IP, 0x4002): 
> 7309/7309: 0x7ffff6d6c310 period: 10000 addr: 0x7ffff7034e50
> ... FP chain: nr:0
> ... user regs: mask 0xff0fff ABI 64-bit
> .... AX    0x555555b8b4c0
> .... BX    0x555555c48e10
> .... CX    0x1
> .... DX    0x7fffffffd988
> .... SI    0x7fffffffd980
> .... DI    0x555555b8b4c0
> .... BP    0x258
> .... SP    0x7fffffffd978
> .... IP    0x7ffff6d6c310
> .... FLAGS 0x20e
> .... CS    0x33
> .... SS    0x2b
> .... R8    0x27c
> .... R9    0x24
> .... R10   0x2a2
> .... R11   0x0
> .... R12   0x258
> .... R13   0x555555b8b4c0
> .... R14   0x3000
> .... R15   0x7ffff5747000
> ... ustack: size 5768, offset 0xd8
>   . data_src: 0x5080022
>   ... thread: evince:7309
>   ...... dso: /usr/lib/x86_64-linux-gnu/libgdk-3.so.0.2200.30
> evince  7309 11159.097179:      10000    
> mem_load_uops_retired.l3_miss:uppp:     7ffff7034e50         5080022 
> N/A|SNP N/A|TLB N/A|LCK N/A
>          7ffff6d6c310 cairo_surface_get_device_scale@plt+0x0 
> (/usr/lib/x86_64-linux-gnu/libgdk-3.so.0.2200.30)
>          7ffff6d91029 gdk_window_create_similar_surface+0xc9 
> (/usr/lib/x86_64-linux-gnu/libgdk-3.so.0.2200.30)
>          7ffff6d95410 gdk_window_begin_paint_internal+0x350 
> (/usr/lib/x86_64-linux-gnu/libgdk-3.so.0.2200.30)
>          7ffff6d956f1 gdk_window_begin_draw_frame+0xc1 
> (/usr/lib/x86_64-linux-gnu/libgdk-3.so.0.2200.30)
>          7ffff73c4942 gtk_widget_render+0xd2 
> (/usr/lib/x86_64-linux-gnu/libgtk-3.so.0.2200.30)
>          7ffff7268858 gtk_main_do_event+0x708 
> (/usr/lib/x86_64-linux-gnu/libgtk-3.so.0.2200.30)
>          7ffff6d79764 _gdk_event_emit+0x24 
> (/usr/lib/x86_64-linux-gnu/libgdk-3.so.0.2200.30)
>          7ffff6d897f4 _gdk_window_process_updates_recurse_helper+0x104 
> (/usr/lib/x86_64-linux-gnu/libgdk-3.so.0.2200.30)
>          7ffff6d8a9f5 gdk_window_process_updates_internal+0x165 
> (/usr/lib/x86_64-linux-gnu/libgdk-3.so.0.2200.30)
>          7ffff6d8abef gdk_window_process_updates_with_mode+0x11f 
> (/usr/lib/x86_64-linux-gnu/libgdk-3.so.0.2200.30)
>          7ffff574510c g_closure_invoke+0x19c 
> (/usr/lib/x86_64-linux-gnu/libgobject-2.0.so.0.5600.4)
>          7ffff575805d signal_emit_unlocked_R+0xf4d 
> (/usr/lib/x86_64-linux-gnu/libgobject-2.0.so.0.5600.4)
>          7ffff5760714 g_signal_emit_valist+0xa74 
> (/usr/lib/x86_64-linux-gnu/libgobject-2.0.so.0.5600.4)
>          7ffff576112e g_signal_emit+0x8e 
> (/usr/lib/x86_64-linux-gnu/libgobject-2.0.so.0.5600.4)
>          7ffff6d82ac8 gdk_frame_clock_paint_idle+0x3c8 
> (/usr/lib/x86_64-linux-gnu/libgdk-3.so.0.2200.30)
>          7ffff6d6e07f gdk_threads_dispatch+0x1f 
> (/usr/lib/x86_64-linux-gnu/libgdk-3.so.0.2200.30)
>          7ffff546ad02 g_timeout_dispatch+0x12 
> (/usr/lib/x86_64-linux-gnu/libglib-2.0.so.0.5600.4)
>          7ffff546a284 g_main_dispatch+0x154 (inlined)
>          7ffff546a284 g_main_context_dispatch+0x154 
> (/usr/lib/x86_64-linux-gnu/libglib-2.0.so.0.5600.4)
>          7ffff546a64f g_main_context_iterate+0x1ff (inlined)
>          7ffff546a6db g_main_context_iteration+0x2b 
> (/usr/lib/x86_64-linux-gnu/libglib-2.0.so.0.5600.4)
>          7ffff5a2be3c g_application_run+0x1fc 
> (/usr/lib/x86_64-linux-gnu/libgio-2.0.so.0.5600.4)
>          555555573707 main+0x447 (/opt/evince-3.28.4/bin/evince)
>          7ffff4a91b96 __libc_start_main+0xe6 
> (/lib/x86_64-linux-gnu/libc-2.27.so)
>          555555573899 _start+0x29 (/opt/evince-3.28.4/bin/evince)
> 
> The access point is at offset 0 of the following disassembly:
> Dump of assembler code for function cairo_surface_get_device_scale@plt:
>     0x000000000002a310 <+0>:     jmpq   *0x2c8b3a(%rip)        # 0x2f2e50
>     0x000000000002a316 <+6>:     pushq  $0x1c7
>     0x000000000002a31b <+11>:    jmpq   0x28690
> 
> This is an unconditional jump which will not lead to macrofusion.
> 
> Any help is appreciated.
> 
> Regards.

