Return-Path: <SRS0=/Mq6=XC=vger.kernel.org=linux-trace-users-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36650C0030B
	for <linux-trace-users@archiver.kernel.org>; Sat,  7 Sep 2019 12:17:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id F2969218AC
	for <linux-trace-users@archiver.kernel.org>; Sat,  7 Sep 2019 12:17:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=efficios.com header.i=@efficios.com header.b="GOatcQpq"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731869AbfIGMR4 (ORCPT
        <rfc822;linux-trace-users@archiver.kernel.org>);
        Sat, 7 Sep 2019 08:17:56 -0400
Received: from mail.efficios.com ([167.114.142.138]:37322 "EHLO
        mail.efficios.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728129AbfIGMR4 (ORCPT
        <rfc822;linux-trace-users@vger.kernel.org>);
        Sat, 7 Sep 2019 08:17:56 -0400
Received: from localhost (ip6-localhost [IPv6:::1])
        by mail.efficios.com (Postfix) with ESMTP id F3940A527E;
        Sat,  7 Sep 2019 08:17:54 -0400 (EDT)
Received: from mail.efficios.com ([IPv6:::1])
        by localhost (mail02.efficios.com [IPv6:::1]) (amavisd-new, port 10032)
        with ESMTP id nS9WAQL1c7DY; Sat,  7 Sep 2019 08:17:54 -0400 (EDT)
Received: from localhost (ip6-localhost [IPv6:::1])
        by mail.efficios.com (Postfix) with ESMTP id 906A2A526F;
        Sat,  7 Sep 2019 08:17:54 -0400 (EDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.efficios.com 906A2A526F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=efficios.com;
        s=default; t=1567858674;
        bh=zCcjoBlnrlQta7zQ4LLvmLDlD7KIr8sYdh2Mpn/EiQU=;
        h=Date:From:To:Message-ID:MIME-Version;
        b=GOatcQpqBHwh/ejb7ARhMM5dEb0JmQHHK7vgBTsZ/8cOjZG7k9ZYsM9MmkUM425rS
         su/hmAVdnzLqVH7/xgdEZn+9jAMyR6sCn1yKxnqYmrgkkl1Ob2LhOGwjNsesKhs0Y1
         ytS4S+/lhsTA9YqyzkRu1DAH7hgZh/oe/ZOA2dnqTZs/ctZpPAgSVQ3Fx8emeUVXwR
         jdP5+J4xERb1eK468v7DrqdxRt8EaAMupCrF2bT/vXPM9fwvo2nbClJaIEdE6HnCCb
         4O3HkLZPg3n2LsuH/L5v9LIpbxzl4iuZ+z0oZm/AmUbCT22epzuVDKGfQCC+3ufToA
         okbwT14SUlvWQ==
X-Virus-Scanned: amavisd-new at efficios.com
Received: from mail.efficios.com ([IPv6:::1])
        by localhost (mail02.efficios.com [IPv6:::1]) (amavisd-new, port 10026)
        with ESMTP id EXSIZ1CvfA0b; Sat,  7 Sep 2019 08:17:54 -0400 (EDT)
Received: from mail02.efficios.com (mail02.efficios.com [167.114.142.138])
        by mail.efficios.com (Postfix) with ESMTP id 71BD0A5265;
        Sat,  7 Sep 2019 08:17:54 -0400 (EDT)
Date:   Sat, 7 Sep 2019 08:17:54 -0400 (EDT)
From:   Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
To:     lttng-dev@lists.lttng.org,
        diamon-discuss@lists.linuxfoundation.org,
        linux-trace-users@vger.kernel.org
Message-ID: <433645114.42.1567858674197.JavaMail.zimbra@efficios.com>
Subject: [RELEASE] LTTng-UST v2.11.0-rc4, v2.10.5, v2.9.6 (Linux user-space
 tracer)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Originating-IP: [167.114.142.138]
X-Mailer: Zimbra 8.8.15_GA_3829 (ZimbraWebClient - FF68 (Linux)/8.8.15_GA_3829)
Thread-Index: J7vBVeeQnwGz+WrOTSjPK+y3JzWCEA==
Thread-Topic: LTTng-UST v2.11.0-rc4, v2.10.5, v2.9.6 (Linux user-space tracer)
Sender: linux-trace-users-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-trace-users.vger.kernel.org>
X-Mailing-List: linux-trace-users@vger.kernel.org

LTTng-UST, the Linux Trace Toolkit Next Generation Userspace Tracer,
is a low-overhead application tracer. The library "liblttng-ust" enables
tracing of applications and libraries.

Those are bugfix releases for all currently maintained branches of lttng-ust
(stable-2.9, stable-2.10, and finally stable-2.11 which is nearing completion
of its release candidate stage).

Project website: http://lttng.org
Documentation: http://lttng.org/docs
Download link: http://lttng.org/download

Changelog:

2019-09-07 (Walter White's Anniversary) lttng-ust 2.11.0-rc4
        * Fix: don't wait for initial statedump when 0 session active
        * Fix: wait for initial statedump before proceeding to the main program
        * Use MAP_POPULATE to reduce pagefault when available
        * Fix: remove uninitialised value
        * Fix: GCC unaligned pointer warnings
        * Fix: do not use diagnostic pragma when GCC version is lower than 4.6.0
        * Fix: missing define when not building with gcc
        * Fix: client_sequence_number may dereference NULL pointer
        * Fix: namespace our gettid wrapper

2019-09-07 (Walter White's Anniversary) lttng-ust 2.10.5
        * Fix: don't wait for initial statedump when 0 session active
        * Fix: wait for initial statedump before proceeding to the main program
        * Fix: remove uninitialised value
        * Fix: GCC unaligned pointer warnings
        * Fix: do not use diagnostic pragma when GCC version is lower than 4.6.0
        * Fix: missing define when not building with gcc
        * Fix: client_sequence_number may dereference NULL pointer
        * Fix: namespace our gettid wrapper

2019-09-07 (Walter White's Anniversary) lttng-ust 2.9.6
        * Fix: don't wait for initial statedump when 0 session active
        * Fix: wait for initial statedump before proceeding to the main program
        * Fix: remove uninitialised value
        * Fix: GCC unaligned pointer warnings
        * Fix: do not use diagnostic pragma when GCC version is lower than 4.6.0
        * Fix: missing define when not building with gcc
        * Fix: client_sequence_number may dereference NULL pointer
        * Fix: namespace our gettid wrapper

-- 
Mathieu Desnoyers
EfficiOS Inc.
http://www.efficios.com
