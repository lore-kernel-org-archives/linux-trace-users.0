Return-Path: <linux-trace-users-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5EB1C433F5
	for <linux-trace-users@archiver.kernel.org>; Wed,  5 Jan 2022 21:31:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244430AbiAEVbG (ORCPT
        <rfc822;linux-trace-users@archiver.kernel.org>);
        Wed, 5 Jan 2022 16:31:06 -0500
Received: from mail.efficios.com ([167.114.26.124]:51214 "EHLO
        mail.efficios.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244426AbiAEVbF (ORCPT
        <rfc822;linux-trace-users@vger.kernel.org>);
        Wed, 5 Jan 2022 16:31:05 -0500
Received: from localhost (localhost [127.0.0.1])
        by mail.efficios.com (Postfix) with ESMTP id 523023C9BB6;
        Wed,  5 Jan 2022 16:31:05 -0500 (EST)
Received: from mail.efficios.com ([127.0.0.1])
        by localhost (mail03.efficios.com [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id xC3aI1Eo1gbY; Wed,  5 Jan 2022 16:31:05 -0500 (EST)
Received: from localhost (localhost [127.0.0.1])
        by mail.efficios.com (Postfix) with ESMTP id 142573C9BB5;
        Wed,  5 Jan 2022 16:31:05 -0500 (EST)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.efficios.com 142573C9BB5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=efficios.com;
        s=default; t=1641418265;
        bh=FtQsD0KAmJdh5/ojxWwmQ5T+gV2osP8+r5cvU8Cj10w=;
        h=Date:From:To:Message-ID:MIME-Version;
        b=C6EwY1U7dNY7Kha0vpBIH55ccGRopCA06FVjTqkxU8nta1gEveS3rebNfzPVz2u0q
         kaFiBpcPEL3eN5IJvW1/tMfO0keichX+NIlkWdFzADnkLaboCed5uM7UAVjCdbnNcx
         VsNl3GYtmsd2sAm7uTREsjkqLYB+OqtumXFg08/Xs/c18sas+x2HcHrsAJVUXxwRf+
         DMGzzRs1BC8Itx3JDg4zp4InBtooiufVnh6wJ7igLyt2vs8tVwmmtszdA0VkNG6yMp
         gT+z3HxG13x8drn6aBdvKYGIJpNOHt+TIRwp+r/7gfw3ovLAzfp0RzQAaTQ8KUoPeo
         rgGthBRWfV//Q==
X-Virus-Scanned: amavisd-new at efficios.com
Received: from mail.efficios.com ([127.0.0.1])
        by localhost (mail03.efficios.com [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id gT_DXEVSHCvQ; Wed,  5 Jan 2022 16:31:05 -0500 (EST)
Received: from mail03.efficios.com (mail03.efficios.com [167.114.26.124])
        by mail.efficios.com (Postfix) with ESMTP id 097843C9BB4;
        Wed,  5 Jan 2022 16:31:05 -0500 (EST)
Date:   Wed, 5 Jan 2022 16:31:05 -0500 (EST)
From:   Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
To:     lttng-dev <lttng-dev@lists.lttng.org>,
        Diamon discuss <diamon-discuss@lists.linuxfoundation.org>,
        linux-trace-users <linux-trace-users@vger.kernel.org>
Message-ID: <739463869.5555.1641418265020.JavaMail.zimbra@efficios.com>
In-Reply-To: <697935027.5550.1641418043715.JavaMail.zimbra@efficios.com>
References: <697935027.5550.1641418043715.JavaMail.zimbra@efficios.com>
Subject: Re: [RELEASE] LTTng-UST 2.12.3 and 2.11.5 (Linux user-space tracer)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Originating-IP: [167.114.26.124]
X-Mailer: Zimbra 8.8.15_GA_4180 (ZimbraWebClient - FF95 (Linux)/8.8.15_GA_4177)
Thread-Topic: LTTng-UST 2.12.3 and 2.11.5 (Linux user-space tracer)
Thread-Index: m7GiKJygw0akYxq/Mbpwf/qNqXu0iQenq/5J
Precedence: bulk
List-ID: <linux-trace-users.vger.kernel.org>
X-Mailing-List: linux-trace-users@vger.kernel.org

----- On Jan 5, 2022, at 4:27 PM, Mathieu Desnoyers mathieu.desnoyers@efficios.com wrote:

> Hi,
> 
> This is a release announcement for the LTTng-UST 2.12.3 and 2.11.5
> tracer. Those are bug fix releases.
> 
> The 2.11.5 release marks the end of life (EOL) of the stable-2.11 branch.
> Users experiencing issues with the 2.11 branch are expected to upgrade to
> either 2.12.3 or 2.13.1.
> 
> Note that the latest stable branch is 2.13 (its most recent release
> is 2.13.1, released on December 10, 2021).
> 
> * Notable changes in 2.12.3:
> 
> Two notable fixes are "Fix: nestable pthread cancelstate" and
> "Fix: abort on decrement_sem_count during concurrent tracing start and
> teardown",
> which fix a rare deadlock scenario at application exit.

Just as a clarification, the second fix corrects a race scenario triggering an
assertion failure.

Thanks,

MAthieu

> 
> Another notable fix is "fix: liblttng-ust-fd async-signal-safe close()", which
> ensures that the implementation of the symbol interposition for "close" is
> async-signal safe, as it should be.
> 
> Please refer to the change logs below for the fixes contained in those
> two releases.
> 
> Feedback is welcome,
> 
> Thanks,
> 
> Mathieu
> 
> Project website: https://lttng.org
> Documentation: https://lttng.org/docs
> Download link: https://lttng.org/download
> 
> 
> 2022-01-05 (National Bird Day) lttng-ust 2.12.3
>        * Fix: ust-cancelstate: include string.h for strerror
>        * Fix: lttng-ust-fd: remove lttng_ust_common_ctor call
>        * Fix: nestable pthread cancelstate
>        * Fix: abort on decrement_sem_count during concurrent tracing start and teardown
>        * fix: liblttng-ust-fd async-signal-safe close()
>        * Set git-review branch to stable-2.12
>        * fix: link benchmark with pthread
>        * Fix: liblttng-ust-ctl have dependencies on liburcu
>        * Fix: add extern "C" to two header files
> 
> 2022-01-05 (National Bird Day) lttng-ust 2.11.5
>        * Set git-review branch to stable-2.11
>        * fix: allow building with userspace-rcu 0.13
> 
> --
> Mathieu Desnoyers
> EfficiOS Inc.
> http://www.efficios.com

-- 
Mathieu Desnoyers
EfficiOS Inc.
http://www.efficios.com
