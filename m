Return-Path: <SRS0=/Mq6=XC=vger.kernel.org=linux-trace-users-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD4E2C43331
	for <linux-trace-users@archiver.kernel.org>; Sat,  7 Sep 2019 12:26:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7BC5F2178F
	for <linux-trace-users@archiver.kernel.org>; Sat,  7 Sep 2019 12:26:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=efficios.com header.i=@efficios.com header.b="RpcHKgcw"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732712AbfIGM0x (ORCPT
        <rfc822;linux-trace-users@archiver.kernel.org>);
        Sat, 7 Sep 2019 08:26:53 -0400
Received: from mail.efficios.com ([167.114.142.138]:39732 "EHLO
        mail.efficios.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731875AbfIGM0x (ORCPT
        <rfc822;linux-trace-users@vger.kernel.org>);
        Sat, 7 Sep 2019 08:26:53 -0400
Received: from localhost (ip6-localhost [IPv6:::1])
        by mail.efficios.com (Postfix) with ESMTP id 51A3DA55B9;
        Sat,  7 Sep 2019 08:26:52 -0400 (EDT)
Received: from mail.efficios.com ([IPv6:::1])
        by localhost (mail02.efficios.com [IPv6:::1]) (amavisd-new, port 10032)
        with ESMTP id ECtavj8kHRxr; Sat,  7 Sep 2019 08:26:52 -0400 (EDT)
Received: from localhost (ip6-localhost [IPv6:::1])
        by mail.efficios.com (Postfix) with ESMTP id 01B89A55B6;
        Sat,  7 Sep 2019 08:26:52 -0400 (EDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.efficios.com 01B89A55B6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=efficios.com;
        s=default; t=1567859212;
        bh=lPaXTYyLzQFl0a5AFpGKMwzCElkm4+7ImaOhoOnMmdM=;
        h=Date:From:To:Message-ID:MIME-Version;
        b=RpcHKgcwwU39xZj48+EplFEocbBIotCkRv/JDgodQZmqxBbhFrU3cI1lLWolfcbVO
         vQ42QE+oZkKHyRPZM71EYNEdbLY8dutYB5+BqtYo98R2eLh1DlB651ERcE2OuD/xC+
         CZqmM4zTC6mbeoyYtR0gjgd+wnnSxxFUn9GbtEg/qoR2dqyYpkE2XW+MrghFe6n8PI
         2FeQKTrl2fM8X0So4pF/D76UHL0Ce5bBJo1kxVeVAk/0teEQp5vZP2Izb6g5AQiIuQ
         S0FnM/nc8YfvBiPpDHf78mwolqw7IpJfJjc2bnCjXRrAS5w9sJ2zo7z2fS+fgtF420
         DEFQsAuZowpYw==
X-Virus-Scanned: amavisd-new at efficios.com
Received: from mail.efficios.com ([IPv6:::1])
        by localhost (mail02.efficios.com [IPv6:::1]) (amavisd-new, port 10026)
        with ESMTP id XCIk0mWy2QHn; Sat,  7 Sep 2019 08:26:51 -0400 (EDT)
Received: from mail02.efficios.com (mail02.efficios.com [167.114.142.138])
        by mail.efficios.com (Postfix) with ESMTP id D9B11A55AE;
        Sat,  7 Sep 2019 08:26:51 -0400 (EDT)
Date:   Sat, 7 Sep 2019 08:26:51 -0400 (EDT)
From:   Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
To:     lttng-dev@lists.lttng.org,
        diamon-discuss@lists.linuxfoundation.org,
        linux-trace-users@vger.kernel.org
Message-ID: <1650973402.81.1567859211691.JavaMail.zimbra@efficios.com>
Subject: [RELEASE] LTTng-modules 2.11.0-rc6, 2.10.11, 2.9.14  (Linux kernel
 tracer)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Originating-IP: [167.114.142.138]
X-Mailer: Zimbra 8.8.15_GA_3829 (ZimbraWebClient - FF68 (Linux)/8.8.15_GA_3829)
Thread-Index: j6GbdiBXrI793i42qc+gbxZ01FIYnA==
Thread-Topic: LTTng-modules 2.11.0-rc6, 2.10.11, 2.9.14 (Linux kernel tracer)
Sender: linux-trace-users-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-trace-users.vger.kernel.org>
X-Mailing-List: linux-trace-users@vger.kernel.org

The LTTng modules provide Linux kernel tracing capability to the LTTng
tracer toolset.

Those releases cover all actively maintained branches of the lttng-modules
project.

For stable-2.10 and stable-2.9, those include only bugfixes.

For the stable-2.11 branch, currently in release candidate
stage, it introduces two new ABI:

  * LTTNG_KERNEL_SESSION_SET_CREATION_TIME
  * LTTNG_KERNEL_SESSION_SET_NAME

It populates additional trace metadata environment fields
with internal information and with information provided by
the lttng session daemon. This allows trace readers to
re-create the trace directory hierarchy from the metadata
environment.

Project website: http://lttng.org
Documentation: http://lttng.org/docs
Download link: http://lttng.org/download

Changelog:

2019-09-07 (Walter White's Anniversary) LTTng modules 2.11.0-rc6
        * Fix: gcc-9.1 stack frame size warning
        * Introduce LTTNG_KERNEL_SESSION_SET_CREATION_TIME
        * Add metadata env fields
        * Introduce LTTNG_KERNEL_SESSION_SET_NAME
        * Fix: do not use diagnostic pragma when GCC version is lower than 4.6.0
        * Fix: missing define when not building with gcc
        * Fix: lttng-tracepoint module notifier should return NOTIFY_OK

2019-09-07 (Walter White's Anniversary) LTTng modules 2.10.11
        * Fix: gcc-9.1 stack frame size warning
        * Fix: do not use diagnostic pragma when GCC version is lower than 4.6.0
        * Fix: missing define when not building with gcc
        * Fix: lttng-tracepoint module notifier should return NOTIFY_OK

2019-09-07 (Walter White's Anniversary) LTTng modules 2.9.14
        * Fix: gcc-9.1 stack frame size warning
        * Fix: do not use diagnostic pragma when GCC version is lower than 4.6.0
        * Fix: missing define when not building with gcc
        * Fix: lttng-tracepoint module notifier should return NOTIFY_OK

-- 
Mathieu Desnoyers
EfficiOS Inc.
http://www.efficios.com
