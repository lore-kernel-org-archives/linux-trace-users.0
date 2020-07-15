Return-Path: <SRS0=Bpf1=A2=vger.kernel.org=linux-trace-users-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BF69C433ED
	for <linux-trace-users@archiver.kernel.org>; Wed, 15 Jul 2020 18:45:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3FE53207BB
	for <linux-trace-users@archiver.kernel.org>; Wed, 15 Jul 2020 18:45:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=efficios.com header.i=@efficios.com header.b="Lacu/aFg"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726788AbgGOSpU (ORCPT
        <rfc822;linux-trace-users@archiver.kernel.org>);
        Wed, 15 Jul 2020 14:45:20 -0400
Received: from mail.efficios.com ([167.114.26.124]:59374 "EHLO
        mail.efficios.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726354AbgGOSpT (ORCPT
        <rfc822;linux-trace-users@vger.kernel.org>);
        Wed, 15 Jul 2020 14:45:19 -0400
Received: from localhost (localhost [127.0.0.1])
        by mail.efficios.com (Postfix) with ESMTP id CEDD5284B83;
        Wed, 15 Jul 2020 14:45:18 -0400 (EDT)
Received: from mail.efficios.com ([127.0.0.1])
        by localhost (mail03.efficios.com [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id h2A1JpkzLQ5Y; Wed, 15 Jul 2020 14:45:18 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
        by mail.efficios.com (Postfix) with ESMTP id 6FF91284EF8;
        Wed, 15 Jul 2020 14:45:18 -0400 (EDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.efficios.com 6FF91284EF8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=efficios.com;
        s=default; t=1594838718;
        bh=ZUXkV2QKEcSF2K9aWBT2d51fVKsTNEl5nq3ND81UW04=;
        h=Date:From:To:Message-ID:MIME-Version;
        b=Lacu/aFgYMmb9LdgEvsccGA/KzU+BAifoV8oo7EXGc4uqoITfmP241nJhddt5DxTl
         xte3TavJL3AKZV71FYhBIgAfda+otj5WoM4euNRNpUb8HmLw3Orx6UPjpb8M4n4wW4
         uoMeisGMIjTkOS7gKagu3/sOuNeFcVosRX9HQG5sDW6xE2AWEOgA0DxtRjFNWrO9cD
         KP0XT47PUQpvPLF6md1FnR7etPeFemciAfzj0jvcVSeGxvxnBm3h0TGoB97yiRkoyA
         0sXe/wVkiFLU4fEccsB2NWAt8sYuKKML4asg4mPiyR0/SsBuOMd7pzVP/O5rr20BUQ
         9ci+RrWiNaJbw==
X-Virus-Scanned: amavisd-new at efficios.com
Received: from mail.efficios.com ([127.0.0.1])
        by localhost (mail03.efficios.com [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id pbobVPXfhyn3; Wed, 15 Jul 2020 14:45:18 -0400 (EDT)
Received: from mail03.efficios.com (mail03.efficios.com [167.114.26.124])
        by mail.efficios.com (Postfix) with ESMTP id 62C1C284EF4;
        Wed, 15 Jul 2020 14:45:18 -0400 (EDT)
Date:   Wed, 15 Jul 2020 14:45:18 -0400 (EDT)
From:   Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
To:     ahmadkhorrami <ahmadkhorrami@ut.ac.ir>
Cc:     linux-trace-users <linux-trace-users@vger.kernel.org>,
        lttng-dev <lttng-dev@lists.lttng.org>,
        Jeremie Galarneau <jeremie.galarneau@efficios.com>,
        Namhyung Kim <namhyung@kernel.org>,
        rostedt <rostedt@goodmis.org>
Message-ID: <83963025.14828.1594838718290.JavaMail.zimbra@efficios.com>
In-Reply-To: <20200715142849.0bfe909a@oasis.local.home>
References: <e9c7400ff0075f3beba2863c4432a905@ut.ac.ir> <20200715142849.0bfe909a@oasis.local.home>
Subject: Re: Capturing User-Level Function Calls/Returns
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Originating-IP: [167.114.26.124]
X-Mailer: Zimbra 8.8.15_GA_3955 (ZimbraWebClient - FF78 (Linux)/8.8.15_GA_3953)
Thread-Topic: Capturing User-Level Function Calls/Returns
Thread-Index: vVoqBn6OBnqEvOCKwZKhA82Jg+NW2g==
Sender: linux-trace-users-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-trace-users.vger.kernel.org>
X-Mailing-List: linux-trace-users@vger.kernel.org

----- On Jul 15, 2020, at 2:28 PM, rostedt rostedt@goodmis.org wrote:

> On Wed, 15 Jul 2020 20:37:16 +0430
> ahmadkhorrami <ahmadkhorrami@ut.ac.ir> wrote:
> 
>> Hi,
>> What is the most efficient way to capture occurrence of a function
>> call/return of a binary program in userspace?
>> It seems the answer is Uprobes. 1) Am I right?
>> But Uprobes use "int" instruction which leads to a switch into kernel
>> mode. 2) Wouldn't it be better to avoid this transition?
>> I'm looking forward to your reply and will be happy to read your
>> opinions.
>> Regards.
> 
> 
> Hi, I believe LTTng has utilities that can help you trace user space
> programs.

Indeed, it is documented here:

https://lttng.org/docs/#doc-liblttng-ust-cyg-profile

If your program is generating function entry/exit at a very
high rate (which goes beyond your available I/O throughput and
lasts longer than the memory you have available for ring buffers),
you will also probably want to use the "blocking-timeout" option
documented at:

https://lttng.org/docs/#doc-enabling-disabling-channels

Thanks,

Mathieu

> 
> I think there's also a users ftrace like utility that Namhyung was
> working on. But I don't know where in the development that is.
> 
> -- Steve

-- 
Mathieu Desnoyers
EfficiOS Inc.
http://www.efficios.com
