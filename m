Return-Path: <SRS0=Ymyf=5I=vger.kernel.org=linux-trace-users-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DCEBC10F26
	for <linux-trace-users@archiver.kernel.org>; Mon, 23 Mar 2020 06:47:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0BF682074D
	for <linux-trace-users@archiver.kernel.org>; Mon, 23 Mar 2020 06:47:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1584946067;
	bh=cla2juA7Pkm2R77Y1ajC8PVPD42viMocN+1qYemefqY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-ID:From;
	b=dC3RXp86Yxjggzf01rE7Bt/ScPIFyPTu5XsnH514m0cFFrMF9D5EiIlpzFTRF9bzj
	 HQ7RyxXgqPnFKl48NegCSwHGObP+Mtxag55kUXCjMkVM4mPi1jylPNMjLrU9LtRq97
	 N9I+9DSkkt6eBDxyHSBuzT0fS8iRVxqKQXau2Z34=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727164AbgCWGrq (ORCPT
        <rfc822;linux-trace-users@archiver.kernel.org>);
        Mon, 23 Mar 2020 02:47:46 -0400
Received: from mail.kernel.org ([198.145.29.99]:48938 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726142AbgCWGrq (ORCPT
        <rfc822;linux-trace-users@vger.kernel.org>);
        Mon, 23 Mar 2020 02:47:46 -0400
Received: from devnote2 (NE2965lan1.rev.em-net.ne.jp [210.141.244.193])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B05E620736;
        Mon, 23 Mar 2020 06:47:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1584946066;
        bh=cla2juA7Pkm2R77Y1ajC8PVPD42viMocN+1qYemefqY=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=aE7tJ26aVqz0Y3EzPOYMNtb/LjUu+xPF2S5m6o4qKlQ/uz+fnSxv3FPGBq9OGLNPt
         vY20PXIedKBptWV7kd7ooPlyQ0f1DUzKe5C+u/moes9n2aDH4uwiJ71oQR4zv9HFme
         89JQKLRfPZrZE7+BnQafjXsSXNKZLS/zKZO8qxfU=
Date:   Mon, 23 Mar 2020 15:47:41 +0900
From:   Masami Hiramatsu <mhiramat@kernel.org>
To:     Taeung Song <treeze.taeung@gmail.com>
Cc:     linux-trace-users@vger.kernel.org,
        Masami Hiramatsu <mhiramat@kernel.org>,
        "David S. Miller" <davem@davemloft.net>
Subject: Re: How to recheck 'maxactive' ?
Message-Id: <20200323154741.0643126b3684c950bb37bf7e@kernel.org>
In-Reply-To: <4762764a-6df7-bc93-ed60-e336146dce1f@gmail.com>
References: <4762764a-6df7-bc93-ed60-e336146dce1f@gmail.com>
X-Mailer: Sylpheed 3.5.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-trace-users-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-trace-users.vger.kernel.org>
X-Mailing-List: linux-trace-users@vger.kernel.org

Hi Taeung,

On Sun, 22 Mar 2020 23:06:20 +0900
Taeung Song <treeze.taeung@gmail.com> wrote:

> Hi,
> 
> After setting 'maxactive' for kretprobe,
> how can I recheck the value of 'maxactive' ?
> For example, in order to distinguish the difference
> between two kretprobe events
> (kmem_cache_alloc_node and kmem_cache_alloc_node10)
> 
>    $ cd /sys/kernel/debug/tracing
>    $ echo 'r:kmem_cache_alloc_node kmem_cache_alloc_node' >> kprobe_events
>    $ echo 'r10:kmem_cache_alloc_node10 kmem_cache_alloc_node' >> 
> kprobe_events
> 
>    $ cat kprobe_events
>    r:kprobes/kmem_cache_alloc_node kmem_cache_alloc_node
>    r:kprobes/kmem_cache_alloc_node10 kmem_cache_alloc_node

Oops! good catch. That must be a bug, since the kprobe_events design policy
is to support following operation.

$ cat kprobe_events > /etc/event_setting
(reboot)
$ cat /etc/event_setting > kprobe_events

What about below patch?

From 935ed56819f2bfb7ac977f5c63273c9a6e3dfb42 Mon Sep 17 00:00:00 2001
From: Masami Hiramatsu <mhiramat@kernel.org>
Date: Mon, 23 Mar 2020 10:57:48 +0900
Subject: [PATCH] ftrace/kprobe: Show the maxactive number on kprobe_events

Show maxactive parameter on kprobe_events.
This allows user to save the current configuration and
restore it without losing maxactive parameter.

Signed-off-by: Masami Hiramatsu <mhiramat@kernel.org>
---
 kernel/trace/trace_kprobe.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/kernel/trace/trace_kprobe.c b/kernel/trace/trace_kprobe.c
index 362cca52f5de..d0568af4a0ef 100644
--- a/kernel/trace/trace_kprobe.c
+++ b/kernel/trace/trace_kprobe.c
@@ -1078,6 +1078,8 @@ static int trace_kprobe_show(struct seq_file *m, struct dyn_event *ev)
 	int i;
 
 	seq_putc(m, trace_kprobe_is_return(tk) ? 'r' : 'p');
+	if (trace_kprobe_is_return(tk) && tk->rp.maxactive)
+		seq_printf(m, "%d", tk->rp.maxactive);
 	seq_printf(m, ":%s/%s", trace_probe_group_name(&tk->tp),
 				trace_probe_name(&tk->tp));
 
-- 
2.20.1


Thank you,


-- 
Masami Hiramatsu <mhiramat@kernel.org>
