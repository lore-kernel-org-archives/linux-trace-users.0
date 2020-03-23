Return-Path: <SRS0=Ymyf=5I=vger.kernel.org=linux-trace-users-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06303C4332B
	for <linux-trace-users@archiver.kernel.org>; Mon, 23 Mar 2020 12:54:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id CB71020719
	for <linux-trace-users@archiver.kernel.org>; Mon, 23 Mar 2020 12:54:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="njY/MqV4"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727582AbgCWMya (ORCPT
        <rfc822;linux-trace-users@archiver.kernel.org>);
        Mon, 23 Mar 2020 08:54:30 -0400
Received: from mail-pj1-f66.google.com ([209.85.216.66]:53352 "EHLO
        mail-pj1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728068AbgCWMya (ORCPT
        <rfc822;linux-trace-users@vger.kernel.org>);
        Mon, 23 Mar 2020 08:54:30 -0400
Received: by mail-pj1-f66.google.com with SMTP id l36so6138834pjb.3
        for <linux-trace-users@vger.kernel.org>; Mon, 23 Mar 2020 05:54:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=/wNuyOudK4lnsqabJXpE8j5qJG/piwUesE+vilid6rI=;
        b=njY/MqV4kTIbyg/UW3k9hanDcjn4a1sKkgXw3Z9TiZeLZRi7EpRSCMUTt/2UtUJNiY
         mY8t9qVCXFfU/7wqpqyR1zyUZOIw+WMty7Qa5dzMnTjLYsfOswLKKz3P/wcqjD/cQcl+
         ELn/VNJt4rxEueVnkTzGEfAwQAYeDsTycd656EhnA6VaJMDXwGM/Gd7Qr38orjkIXWX+
         dUfZ7I82Mpl4u1yxuIGuTfHSAlq461xdXAJLYdEhwIcghuw/xtMgEKpjNHhopw43JHYC
         FoezGQlFYQcAp5oOqKnT1HK+emrj8AWCJIbIyAZT07p4YR7ld5TL9br+X64S+I3ypN8J
         7/4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=/wNuyOudK4lnsqabJXpE8j5qJG/piwUesE+vilid6rI=;
        b=ovuHOVF1riwt4B8mFw0SWa1kdMV6b1YOj3L0jhYJPzz479RPfn5U6LNOYOCtJIBxEZ
         SQ3A9RpeS0FXOEy9p1Wq1076p5hHdDkEKvwE9FXZvd7MZSMeJGZ4k2UdID6ssiFpg53k
         k6K/kNCi04eoXEBo5/Dc7lBbnyurtrcFEONgbgJr34PR3BlagaHdiLCSyld29WllLq5C
         e2QurMtdhTTqub1psnTXu0iVLIeWHplM+r6Q7uyu8uYGaG/4vSbP/RnZ9OKSPLWARY/z
         1d3GfJAqMBSzweWSlCG8OiQErVGedSRmA3jthnJb0jXvruf0GN6vzxUGYqYqUvXzeTcy
         iyJg==
X-Gm-Message-State: ANhLgQ3UY41Y69DJ3TYg++sK3l5dwCo2lxhLB2pWHZkNRnVPNFdrKD4W
        Qc2X/u/PU8GhduVE/4jENsuvSg9t6Wo=
X-Google-Smtp-Source: ADFU+vtyaEdAbfYW787X1+LvLtviL/vrTe0ZfS2jeq75dNbyXGO9+9rlsTKGrftaFMQrLBCNWOV+Xw==
X-Received: by 2002:a17:902:ea8a:: with SMTP id x10mr10596888plb.328.1584968068790;
        Mon, 23 Mar 2020 05:54:28 -0700 (PDT)
Received: from [192.168.0.18] ([106.254.212.20])
        by smtp.gmail.com with ESMTPSA id c207sm13230000pfb.47.2020.03.23.05.54.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2020 05:54:27 -0700 (PDT)
Subject: Re: How to recheck 'maxactive' ?
To:     Masami Hiramatsu <mhiramat@kernel.org>
Cc:     linux-trace-users@vger.kernel.org,
        "David S. Miller" <davem@davemloft.net>
References: <4762764a-6df7-bc93-ed60-e336146dce1f@gmail.com>
 <20200323154741.0643126b3684c950bb37bf7e@kernel.org>
From:   Taeung Song <treeze.taeung@gmail.com>
Message-ID: <0dbeb5a0-2834-0f74-66cb-839d5cbf64f9@gmail.com>
Date:   Mon, 23 Mar 2020 21:54:24 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200323154741.0643126b3684c950bb37bf7e@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-trace-users-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-trace-users.vger.kernel.org>
X-Mailing-List: linux-trace-users@vger.kernel.org

Hi Masami,

Thank you for the reply!
And your patch looks great.

Thanks,
Taeung

On 3/23/20 3:47 PM, Masami Hiramatsu wrote:
> Hi Taeung,
> 
> On Sun, 22 Mar 2020 23:06:20 +0900
> Taeung Song <treeze.taeung@gmail.com> wrote:
> 
>> Hi,
>>
>> After setting 'maxactive' for kretprobe,
>> how can I recheck the value of 'maxactive' ?
>> For example, in order to distinguish the difference
>> between two kretprobe events
>> (kmem_cache_alloc_node and kmem_cache_alloc_node10)
>>
>>     $ cd /sys/kernel/debug/tracing
>>     $ echo 'r:kmem_cache_alloc_node kmem_cache_alloc_node' >> kprobe_events
>>     $ echo 'r10:kmem_cache_alloc_node10 kmem_cache_alloc_node' >>
>> kprobe_events
>>
>>     $ cat kprobe_events
>>     r:kprobes/kmem_cache_alloc_node kmem_cache_alloc_node
>>     r:kprobes/kmem_cache_alloc_node10 kmem_cache_alloc_node
> 
> Oops! good catch. That must be a bug, since the kprobe_events design policy
> is to support following operation.
> 
> $ cat kprobe_events > /etc/event_setting
> (reboot)
> $ cat /etc/event_setting > kprobe_events
> 
> What about below patch?
> 
>  From 935ed56819f2bfb7ac977f5c63273c9a6e3dfb42 Mon Sep 17 00:00:00 2001
> From: Masami Hiramatsu <mhiramat@kernel.org>
> Date: Mon, 23 Mar 2020 10:57:48 +0900
> Subject: [PATCH] ftrace/kprobe: Show the maxactive number on kprobe_events
> 
> Show maxactive parameter on kprobe_events.
> This allows user to save the current configuration and
> restore it without losing maxactive parameter.
> 
> Signed-off-by: Masami Hiramatsu <mhiramat@kernel.org>
> ---
>   kernel/trace/trace_kprobe.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/kernel/trace/trace_kprobe.c b/kernel/trace/trace_kprobe.c
> index 362cca52f5de..d0568af4a0ef 100644
> --- a/kernel/trace/trace_kprobe.c
> +++ b/kernel/trace/trace_kprobe.c
> @@ -1078,6 +1078,8 @@ static int trace_kprobe_show(struct seq_file *m, struct dyn_event *ev)
>   	int i;
>   
>   	seq_putc(m, trace_kprobe_is_return(tk) ? 'r' : 'p');
> +	if (trace_kprobe_is_return(tk) && tk->rp.maxactive)
> +		seq_printf(m, "%d", tk->rp.maxactive);
>   	seq_printf(m, ":%s/%s", trace_probe_group_name(&tk->tp),
>   				trace_probe_name(&tk->tp));
>   
> 
