Return-Path: <SRS0=bJ2f=5J=vger.kernel.org=linux-trace-users-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0C74C2BAEE
	for <linux-trace-users@archiver.kernel.org>; Tue, 24 Mar 2020 06:40:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 98FBD2073E
	for <linux-trace-users@archiver.kernel.org>; Tue, 24 Mar 2020 06:40:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1585032033;
	bh=ivefqiFbpDEuA+nvK7a2pxjViTPTPegVRPcWWyCEKTM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-ID:From;
	b=tE51Mj48w50ow9foHfr5JxavWladhRQ5+MxeKaXyKzKwzGkGArT3pveQJuc5IJPv/
	 71tUkGSXzz1+wrZ3g77HDvMureY+8ROnIUh0knK2E4fBoFPWSfMv8p3VQvbAjt/+h0
	 jqXpBn0tSKyofr+/EQ15qf/nAEB09+KkoP0uGf0g=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725951AbgCXGkd (ORCPT
        <rfc822;linux-trace-users@archiver.kernel.org>);
        Tue, 24 Mar 2020 02:40:33 -0400
Received: from mail.kernel.org ([198.145.29.99]:57930 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725867AbgCXGkd (ORCPT
        <rfc822;linux-trace-users@vger.kernel.org>);
        Tue, 24 Mar 2020 02:40:33 -0400
Received: from devnote2 (NE2965lan1.rev.em-net.ne.jp [210.141.244.193])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A340320714;
        Tue, 24 Mar 2020 06:40:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1585032032;
        bh=ivefqiFbpDEuA+nvK7a2pxjViTPTPegVRPcWWyCEKTM=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=Z7lSqZ54ACwiyyqD1iiqkwtEocHs8PfWv3RHDIdntUdeW6JycAttiewA5J+YrBN7O
         g+os+2bchsc6vXIHykxGeab3tWeLjrfxJXsD+rFi9JAYT8Pm4ejCphbF868Prj6g6c
         gx7+26vh/ZPycSqvB+xbObPaDDKOypTrT6DKNV8w=
Date:   Tue, 24 Mar 2020 15:40:29 +0900
From:   Masami Hiramatsu <mhiramat@kernel.org>
To:     Steven Rostedt <rostedt@goodmis.org>
Cc:     Taeung Song <treeze.taeung@gmail.com>,
        linux-trace-users@vger.kernel.org,
        "David S. Miller" <davem@davemloft.net>
Subject: Re: How to recheck 'maxactive' ?
Message-Id: <20200324154029.9b627b6c0f1bc7eed054f4ee@kernel.org>
In-Reply-To: <20200323090401.5ef12790@gandalf.local.home>
References: <4762764a-6df7-bc93-ed60-e336146dce1f@gmail.com>
        <20200323154741.0643126b3684c950bb37bf7e@kernel.org>
        <20200323090401.5ef12790@gandalf.local.home>
X-Mailer: Sylpheed 3.5.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-trace-users-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-trace-users.vger.kernel.org>
X-Mailing-List: linux-trace-users@vger.kernel.org

On Mon, 23 Mar 2020 09:04:01 -0400
Steven Rostedt <rostedt@goodmis.org> wrote:

> On Mon, 23 Mar 2020 15:47:41 +0900
> Masami Hiramatsu <mhiramat@kernel.org> wrote:
> 
> > Hi Taeung,
> > 
> > On Sun, 22 Mar 2020 23:06:20 +0900
> > Taeung Song <treeze.taeung@gmail.com> wrote:
> > 
> > > Hi,
> > > 
> > > After setting 'maxactive' for kretprobe,
> > > how can I recheck the value of 'maxactive' ?
> > > For example, in order to distinguish the difference
> > > between two kretprobe events
> > > (kmem_cache_alloc_node and kmem_cache_alloc_node10)
> > > 
> > >    $ cd /sys/kernel/debug/tracing
> > >    $ echo 'r:kmem_cache_alloc_node kmem_cache_alloc_node' >> kprobe_events
> > >    $ echo 'r10:kmem_cache_alloc_node10 kmem_cache_alloc_node' >> 
> > > kprobe_events
> > > 
> > >    $ cat kprobe_events
> > >    r:kprobes/kmem_cache_alloc_node kmem_cache_alloc_node
> > >    r:kprobes/kmem_cache_alloc_node10 kmem_cache_alloc_node  
> > 
> > Oops! good catch. That must be a bug, since the kprobe_events design policy
> > is to support following operation.
> > 
> > $ cat kprobe_events > /etc/event_setting
> > (reboot)
> > $ cat /etc/event_setting > kprobe_events
> > 
> > What about below patch?
> > 
> > >From 935ed56819f2bfb7ac977f5c63273c9a6e3dfb42 Mon Sep 17 00:00:00 2001  
> > From: Masami Hiramatsu <mhiramat@kernel.org>
> > Date: Mon, 23 Mar 2020 10:57:48 +0900
> > Subject: [PATCH] ftrace/kprobe: Show the maxactive number on kprobe_events
> > 
> > Show maxactive parameter on kprobe_events.
> > This allows user to save the current configuration and
> > restore it without losing maxactive parameter.
> > 
> 
> Hi Masami,
> 
> Can you resend this patch as a stand alone (so that it shows up as a patch
> on the mailing lists).

Yes I'll do.

Thank you!

> 
> Thanks!
> 
> -- Steve
> 
> 
> > Signed-off-by: Masami Hiramatsu <mhiramat@kernel.org>
> > ---
> >  kernel/trace/trace_kprobe.c | 2 ++
> >  1 file changed, 2 insertions(+)
> > 
> > diff --git a/kernel/trace/trace_kprobe.c b/kernel/trace/trace_kprobe.c
> > index 362cca52f5de..d0568af4a0ef 100644
> > --- a/kernel/trace/trace_kprobe.c
> > +++ b/kernel/trace/trace_kprobe.c
> > @@ -1078,6 +1078,8 @@ static int trace_kprobe_show(struct seq_file *m, struct dyn_event *ev)
> >  	int i;
> >  
> >  	seq_putc(m, trace_kprobe_is_return(tk) ? 'r' : 'p');
> > +	if (trace_kprobe_is_return(tk) && tk->rp.maxactive)
> > +		seq_printf(m, "%d", tk->rp.maxactive);
> >  	seq_printf(m, ":%s/%s", trace_probe_group_name(&tk->tp),
> >  				trace_probe_name(&tk->tp));
> >  
> 


-- 
Masami Hiramatsu <mhiramat@kernel.org>
