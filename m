Return-Path: <linux-trace-users-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2432DC433F5
	for <linux-trace-users@archiver.kernel.org>; Tue,  8 Mar 2022 15:01:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230501AbiCHPC0 (ORCPT
        <rfc822;linux-trace-users@archiver.kernel.org>);
        Tue, 8 Mar 2022 10:02:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59776 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235737AbiCHPCZ (ORCPT
        <rfc822;linux-trace-users@vger.kernel.org>);
        Tue, 8 Mar 2022 10:02:25 -0500
Received: from mail.efficios.com (mail.efficios.com [167.114.26.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 161944D9E0
        for <linux-trace-users@vger.kernel.org>; Tue,  8 Mar 2022 07:01:28 -0800 (PST)
Received: from localhost (localhost [127.0.0.1])
        by mail.efficios.com (Postfix) with ESMTP id 3CA0E366948;
        Tue,  8 Mar 2022 10:01:27 -0500 (EST)
Received: from mail.efficios.com ([127.0.0.1])
        by localhost (mail03.efficios.com [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id dJu981JQG3VX; Tue,  8 Mar 2022 10:01:26 -0500 (EST)
Received: from localhost (localhost [127.0.0.1])
        by mail.efficios.com (Postfix) with ESMTP id CCECD366947;
        Tue,  8 Mar 2022 10:01:26 -0500 (EST)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.efficios.com CCECD366947
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=efficios.com;
        s=default; t=1646751686;
        bh=/zPF+yhnDoydy5aFRSeAqSbtTGZbvsj+/52FE5jPX1U=;
        h=Date:From:To:Message-ID:MIME-Version;
        b=nfK/OcOVNnEzeODhQRs9u09WvGVHq1F36le3nTfeVSGAlhh6NUUn5X2zFYajuCH6Y
         Ma3y+Ce/K1Onj+GeOpXb1Vo6TK1iG5HqIM4v0dXgtFCb5pixDPgDucCRRLcVJUApjU
         Ne9d1tBkGQ1rXktCk9eS02PIKz3tqnKfCyv6iDrKH1Pky3HBrCScdQn7nr0TuGwgFp
         0mcK6MiOTLttUYcoDovSB6SvXTZ0O4GP1hbNqUf0otm8b4ntk+ispWxmvJqHzVTJph
         BoEfvdp6hB9ljGmuV8ylZq0XXJwduRjFcqhWeMh3kQ+JWFZLUvqDU9jD+Q0waXMCzW
         eTHHHBmIzUkjw==
X-Virus-Scanned: amavisd-new at efficios.com
Received: from mail.efficios.com ([127.0.0.1])
        by localhost (mail03.efficios.com [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id ru3Q4UzyvD9l; Tue,  8 Mar 2022 10:01:26 -0500 (EST)
Received: from mail03.efficios.com (mail03.efficios.com [167.114.26.124])
        by mail.efficios.com (Postfix) with ESMTP id C2226366946;
        Tue,  8 Mar 2022 10:01:26 -0500 (EST)
Date:   Tue, 8 Mar 2022 10:01:26 -0500 (EST)
From:   Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
To:     Federico Di Pierro <nierro92@gmail.com>
Cc:     linux-trace-users <linux-trace-users@vger.kernel.org>
Message-ID: <1491155105.129307.1646751686676.JavaMail.zimbra@efficios.com>
In-Reply-To: <CAMZm_C=NR8rmYn_1gnhw5Udx4ypMZy1nwcFucc0=wbYYHhTpHg@mail.gmail.com>
References: <CAMZm_C=NR8rmYn_1gnhw5Udx4ypMZy1nwcFucc0=wbYYHhTpHg@mail.gmail.com>
Subject: Re: arm64 execve/clone sys_exit tracepoints
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Originating-IP: [167.114.26.124]
X-Mailer: Zimbra 8.8.15_GA_4203 (ZimbraWebClient - FF97 (Linux)/8.8.15_GA_4232)
Thread-Topic: arm64 execve/clone sys_exit tracepoints
Thread-Index: 3IA4q7EM8rUxVnJ7M5B/gyWZj4ePqA==
Precedence: bulk
List-ID: <linux-trace-users.vger.kernel.org>
X-Mailing-List: linux-trace-users@vger.kernel.org

----- On Mar 8, 2022, at 5:11 AM, Federico Di Pierro nierro92@gmail.com wrote:

> Hi everyone,
> 
> While testing Falco on arm64 my team and I encountered some weird
> issues; basically, it seems like execve() exit tracepoint is never
> called.
> Moreover, the clone() exit tracepoint referred to the child process is
> also missing.
> The issue is present on both the kmod and eBPF probe.
> 
> I tested on amznlinux2 with kernel 5.10.96-90.460.amzn2.aarch64, but
> other team members tested on other kernel versions too (down to
> 4.14.X).
> I was also able to reproduce the problem using bpftrace tool: hooking
> on tracepoint:syscalls:sys_exit_execve; no event is received:
> 
> bpftrace -e 'tracepoint:syscalls:sys_exit_execve { printf("execve!\n"); }'
> 
> Since sys_enter tracepoints are indeed called, we'd expect the
> sys_exit ones to be called too, just like it happens on x86.
> The question is: are we missing anything obvious here?

I'm not sure about your clone issue, but wrt execve, I know there
may be some discrepancy when exec turns a non-compat executable into
a compat one and vice-versa. Do you exec a binary with a different
bitness, and therefore a different syscall table, on return from exec ?

Thanks,

Mathieu


> 
> Thank you very much for your time,
> Regards
> Federico

-- 
Mathieu Desnoyers
EfficiOS Inc.
http://www.efficios.com
