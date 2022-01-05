Return-Path: <linux-trace-users-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42ABFC433F5
	for <linux-trace-users@archiver.kernel.org>; Wed,  5 Jan 2022 21:27:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244425AbiAEV11 (ORCPT
        <rfc822;linux-trace-users@archiver.kernel.org>);
        Wed, 5 Jan 2022 16:27:27 -0500
Received: from mail.efficios.com ([167.114.26.124]:49742 "EHLO
        mail.efficios.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244405AbiAEV1Z (ORCPT
        <rfc822;linux-trace-users@vger.kernel.org>);
        Wed, 5 Jan 2022 16:27:25 -0500
Received: from localhost (localhost [127.0.0.1])
        by mail.efficios.com (Postfix) with ESMTP id 7DE253C987A;
        Wed,  5 Jan 2022 16:27:24 -0500 (EST)
Received: from mail.efficios.com ([127.0.0.1])
        by localhost (mail03.efficios.com [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id t0zTNLx1n0NY; Wed,  5 Jan 2022 16:27:23 -0500 (EST)
Received: from localhost (localhost [127.0.0.1])
        by mail.efficios.com (Postfix) with ESMTP id DC4203C9C13;
        Wed,  5 Jan 2022 16:27:23 -0500 (EST)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.efficios.com DC4203C9C13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=efficios.com;
        s=default; t=1641418043;
        bh=EH4fM2BqqgHNeBpehYV/OJzlHYGoifATc3ul7FINUtI=;
        h=Date:From:To:Message-ID:MIME-Version;
        b=WzLXG5hAboBbfIw+Vr5XKNIt0iBKG8DTqPrNrVwceaSdHg+UGBxC1mHFypCp6+Iwz
         Wl6dZ3J+/BoX0epwv6XW8/ApG0GGcyvE63Z2MCCKpE2ucqYXmxnVLeZ7V8xk2abANQ
         3tOC+hFAoht9Ft/W7w22SeT0GTRtXskM/Jp8rqLR3AXUq7Dk/baKSHcotann5Vf6pq
         F6h6HnhumoNL8XG/ZXQQ5i+AOHTmCXcrjqmK6J/cMl75VDfwloN5n0wTJxyfbj75zM
         YGqtCXdKpupyyU8bSbd9oQAlwJbeCTPaCrUOPake9Jr0FCa1Ezgh5EENU7qVythQDh
         C2V9gHgW7MJgg==
X-Virus-Scanned: amavisd-new at efficios.com
Received: from mail.efficios.com ([127.0.0.1])
        by localhost (mail03.efficios.com [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id BXcFK0AJJdKM; Wed,  5 Jan 2022 16:27:23 -0500 (EST)
Received: from mail03.efficios.com (mail03.efficios.com [167.114.26.124])
        by mail.efficios.com (Postfix) with ESMTP id CFBE53C9C12;
        Wed,  5 Jan 2022 16:27:23 -0500 (EST)
Date:   Wed, 5 Jan 2022 16:27:23 -0500 (EST)
From:   Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
To:     lttng-dev@lists.lttng.org,
        diamon-discuss@lists.linuxfoundation.org,
        linux-trace-users@vger.kernel.org
Message-ID: <697935027.5550.1641418043715.JavaMail.zimbra@efficios.com>
Subject: [RELEASE] LTTng-UST 2.12.3 and 2.11.5 (Linux user-space tracer)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Originating-IP: [167.114.26.124]
X-Mailer: Zimbra 8.8.15_GA_4180 (ZimbraWebClient - FF95 (Linux)/8.8.15_GA_4177)
Thread-Index: m7GiKJygw0akYxq/Mbpwf/qNqXu0iQ==
Thread-Topic: LTTng-UST 2.12.3 and 2.11.5 (Linux user-space tracer)
Precedence: bulk
List-ID: <linux-trace-users.vger.kernel.org>
X-Mailing-List: linux-trace-users@vger.kernel.org

Hi,

This is a release announcement for the LTTng-UST 2.12.3 and 2.11.5
tracer. Those are bug fix releases.

The 2.11.5 release marks the end of life (EOL) of the stable-2.11 branch.
Users experiencing issues with the 2.11 branch are expected to upgrade to
either 2.12.3 or 2.13.1.

Note that the latest stable branch is 2.13 (its most recent release
is 2.13.1, released on December 10, 2021).

* Notable changes in 2.12.3:

Two notable fixes are "Fix: nestable pthread cancelstate" and
"Fix: abort on decrement_sem_count during concurrent tracing start and teardown",
which fix a rare deadlock scenario at application exit.

Another notable fix is "fix: liblttng-ust-fd async-signal-safe close()", which
ensures that the implementation of the symbol interposition for "close" is
async-signal safe, as it should be.

Please refer to the change logs below for the fixes contained in those
two releases.

Feedback is welcome,

Thanks,

Mathieu

Project website: https://lttng.org
Documentation: https://lttng.org/docs
Download link: https://lttng.org/download


2022-01-05 (National Bird Day) lttng-ust 2.12.3
        * Fix: ust-cancelstate: include string.h for strerror
        * Fix: lttng-ust-fd: remove lttng_ust_common_ctor call
        * Fix: nestable pthread cancelstate
        * Fix: abort on decrement_sem_count during concurrent tracing start and teardown
        * fix: liblttng-ust-fd async-signal-safe close()
        * Set git-review branch to stable-2.12
        * fix: link benchmark with pthread
        * Fix: liblttng-ust-ctl have dependencies on liburcu
        * Fix: add extern "C" to two header files

2022-01-05 (National Bird Day) lttng-ust 2.11.5
        * Set git-review branch to stable-2.11
        * fix: allow building with userspace-rcu 0.13

-- 
Mathieu Desnoyers
EfficiOS Inc.
http://www.efficios.com
