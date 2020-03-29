Return-Path: <SRS0=qAvV=5O=vger.kernel.org=linux-trace-users-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFE34C43331
	for <linux-trace-users@archiver.kernel.org>; Sun, 29 Mar 2020 12:39:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B68A320714
	for <linux-trace-users@archiver.kernel.org>; Sun, 29 Mar 2020 12:39:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728147AbgC2Mjj (ORCPT
        <rfc822;linux-trace-users@archiver.kernel.org>);
        Sun, 29 Mar 2020 08:39:39 -0400
Received: from mail.ut.ac.ir ([80.66.177.10]:56422 "EHLO mail.ut.ac.ir"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728129AbgC2Mjj (ORCPT
        <rfc822;linux-trace-users@vger.kernel.org>);
        Sun, 29 Mar 2020 08:39:39 -0400
Received: from localhost (localhost [127.0.0.1])
        by mail.ut.ac.ir (Postfix) with ESMTP id 283BF1DA9A3;
        Sun, 29 Mar 2020 17:09:35 +0430 (+0430)
Received: from mail.ut.ac.ir ([127.0.0.1])
        by localhost (mail.ut.ac.ir [127.0.0.1]) (amavisd-new, port 10024)
        with LMTP id qbjbo5ZltEdz; Sun, 29 Mar 2020 17:09:34 +0430 (+0430)
Received: from mail.ut.ac.ir (mail.ut.ac.ir [194.225.0.10])
        by mail.ut.ac.ir (Postfix) with ESMTP id B2C0A1DA80D;
        Sun, 29 Mar 2020 17:09:33 +0430 (+0430)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Sun, 29 Mar 2020 17:09:33 +0430
From:   ahmadkhorrami <ahmadkhorrami@ut.ac.ir>
To:     Jiri Olsa <jolsa@redhat.com>
Cc:     Steven Rostedt <rostedt@goodmis.org>,
        Arnaldo Carvalho de Melo <acme@redhat.com>,
        Linux-trace Users <linux-trace-users@vger.kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        linux-trace-users-owner@vger.kernel.org,
        Jin Yao <yao.jin@linux.intel.com>,
        Milian Wolff <milian.wolff@kdab.com>,
        Namhyung Kim <namhyung@kernel.org>,
        Andi Kleen <ak@linux.intel.com>
Subject: Re: Wrong Perf Backtraces
In-Reply-To: <20200329120816.GD2155755@krava>
References: <821540886fc57d7749edee585a50602f@ut.ac.ir>
 <decdc878b1bf207c68f1bc9e21178486@ut.ac.ir>
 <fd99185b401a451fdbf96439eadcb101@ut.ac.ir> <20200327223743.GA2155755@krava>
 <57b9e24200019a41bd465e2d78c09e29@ut.ac.ir> <20200328233431.GB2155755@krava>
 <d7f65793a15bb80667e384c320549e69@ut.ac.ir>
 <8a58f8eda97525e5e49daeb001107c9d@ut.ac.ir> <20200329111959.GC2155755@krava>
 <9f7cae225ed99222e05ca1e840cd93dd@ut.ac.ir> <20200329120816.GD2155755@krava>
Message-ID: <ff979b3fffc8222d8da848b8cb92f77c@ut.ac.ir>
X-Sender: ahmadkhorrami@ut.ac.ir
User-Agent: Roundcube Webmail/1.3.6
Sender: linux-trace-users-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-trace-users.vger.kernel.org>
X-Mailing-List: linux-trace-users@vger.kernel.org

Thanks. I did both of your changes. Perhaps some outputs are revised. 
But I still have repeated function calls and the script detects them. 
Here is one of them when the sampling period is 1000 events:

evince  8751  2605.226573:      10000 
mem_load_uops_retired.l3_miss:uppp:     5635f8c4cf3a         5080022 
N/A|SNP N/A|TLB N/A|LCK N/A
             7f91785a737d gtk_box_forall+0x2d 
(/usr/lib/x86_64-linux-gnu/libgtk-3.so.0.2200.30) gtkbox.c:0
             7f91788120b5 gtk_widget_propagate_state+0x195 
(/usr/lib/x86_64-linux-gnu/libgtk-3.so.0.2200.30) gtkwidget.c:0
             7f91785a73cf gtk_box_forall+0x7f 
(/usr/lib/x86_64-linux-gnu/libgtk-3.so.0.2200.30) gtkbox.c:0
             7f91788120b5 gtk_widget_propagate_state+0x195 
(/usr/lib/x86_64-linux-gnu/libgtk-3.so.0.2200.30) gtkwidget.c:0
             7f917875ebcf gtk_stack_forall+0x2f 
(/usr/lib/x86_64-linux-gnu/libgtk-3.so.0.2200.30) gtkstack.c:0
             7f91788120b5 gtk_widget_propagate_state+0x195 
(/usr/lib/x86_64-linux-gnu/libgtk-3.so.0.2200.30) gtkwidget.c:0
             7f91788120b5 gtk_widget_propagate_state+0x195 
(/usr/lib/x86_64-linux-gnu/libgtk-3.so.0.2200.30) gtkwidget.c:0
             7f91788154aa gtk_window_forall+0x3a 
(/usr/lib/x86_64-linux-gnu/libgtk-3.so.0.2200.30) gtkwindow.c:0
             7f91788120b5 gtk_widget_propagate_state+0x195 
(/usr/lib/x86_64-linux-gnu/libgtk-3.so.0.2200.30) gtkwidget.c:0
             7f9178812a2d gtk_widget_update_state_flags+0x5d 
(/usr/lib/x86_64-linux-gnu/libgtk-3.so.0.2200.30) gtkwidget.c:0
             7f917881919e gtk_window_state_event+0x21e 
(/usr/lib/x86_64-linux-gnu/libgtk-3.so.0.2200.30) gtkwindow.c:0
             5635f6fd53ce ev_window_state_event+0x5e 
(/opt/evince-3.28.4/bin/evince) ev-window.c:4410
             7f91786b87fa _gtk_marshal_BOOLEAN__BOXED+0x6a 
(/usr/lib/x86_64-linux-gnu/libgtk-3.so.0.2200.30)
             7f9176b9410c g_closure_invoke+0x19c 
(/usr/lib/x86_64-linux-gnu/libgobject-2.0.so.0.5600.4)
             7f9176ba6de7 signal_emit_unlocked_R+0xcd7 
(/usr/lib/x86_64-linux-gnu/libgobject-2.0.so.0.5600.4) gsignal.c:0
             7f9176baf0ae g_signal_emit_valist+0x40e 
(/usr/lib/x86_64-linux-gnu/libgobject-2.0.so.0.5600.4)
             7f9176bb012e g_signal_emit+0x8e 
(/usr/lib/x86_64-linux-gnu/libgobject-2.0.so.0.5600.4)
             7f9178800533 gtk_widget_event_internal+0x163 
(/usr/lib/x86_64-linux-gnu/libgtk-3.so.0.2200.30) gtkwidget.c:0
             7f91786b78cd gtk_main_do_event+0x77d 
(/usr/lib/x86_64-linux-gnu/libgtk-3.so.0.2200.30)
             7f91781c8764 _gdk_event_emit+0x24 
(/usr/lib/x86_64-linux-gnu/libgdk-3.so.0.2200.30)
             7f91781f8f91 gdk_event_source_dispatch+0x21 
(/usr/lib/x86_64-linux-gnu/libgdk-3.so.0.2200.30) gdkeventsource.c:0
             7f91768b9416 g_main_context_dispatch+0x2e6 
(/usr/lib/x86_64-linux-gnu/libglib-2.0.so.0.5600.4)
             7f91768b964f g_main_context_iterate.isra.26+0x1ff 
(/usr/lib/x86_64-linux-gnu/libglib-2.0.so.0.5600.4) gmain.c:0
             7f91768b96db g_main_context_iteration+0x2b 
(/usr/lib/x86_64-linux-gnu/libglib-2.0.so.0.5600.4)
             7f9176e7ae3c g_application_run+0x1fc 
(/usr/lib/x86_64-linux-gnu/libgio-2.0.so.0.5600.4)
             5635f6fbc707 main+0x447 (/opt/evince-3.28.4/bin/evince) 
main.c:316
             7f9175ee0b96 __libc_start_main+0xe6 
(/lib/x86_64-linux-gnu/libc-2.27.so) libc-start.c:310
             5635f6fbc899 _start+0x29 (/opt/evince-3.28.4/bin/evince)

Here, we have two consecutive "7f91788120b5 
gtk_widget_propagate_state+0x195 
(/usr/lib/x86_64-linux-gnu/libgtk-3.so.0.2200.30) gtkwidget.c:0" lines, 
while "gtk_widget_propagate_state+0x195" is not recursive. It should 
call "gtk_container_forall", which does not occur even after the second 
(inner) call.

Regards.

On 2020-03-29 16:38, Jiri Olsa wrote:

> On Sun, Mar 29, 2020 at 04:22:27PM +0430, ahmadkhorrami wrote:
> 
>> Hi,
>> Thanks. Still no change. Sorry, I forgot to say that you should 
>> initialize
>> the "perfCMD" variable to your perf binary path.
> 
> sure I did that, and your script detected the double entries,
> now when we show also srcline for them it's silent
> 
> so there's no change at all for your perf script output?
> 
> jirka
> 
> Regards.
> 
> On 2020-03-29 15:49, Jiri Olsa wrote:
> 
> On Sun, Mar 29, 2020 at 05:46:57AM +0430, ahmadkhorrami wrote:
> 
> Hi,
> Each line is correct. I mean addresses match symbols. But some
> callers and
> callees do not match. Perhaps callchain misses some callers in
> between.
> Regards
> right, I missed another case.. how about the change below?
> your script is silent now on my data
> 
> jirka
> 
> ---
> diff --git a/tools/perf/util/evsel_fprintf.c
> b/tools/perf/util/evsel_fprintf.c
> index 3b4842840db0..fc4fb88937ed 100644
> --- a/tools/perf/util/evsel_fprintf.c
> +++ b/tools/perf/util/evsel_fprintf.c
> @@ -173,6 +173,8 @@ int sample__fprintf_callchain(struct perf_sample
> *sample, int left_alignment,
> 
> if (print_srcline)
> printed += map__fprintf_srcline(map, addr, "\n  ", fp);
> +            else if (node->srcline)
> +                printed += fprintf(fp, " %s", node->srcline);
> 
> if (sym && sym->inlined)
> printed += fprintf(fp, " (inlined)");
