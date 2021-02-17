Return-Path: <linux-trace-users-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D83FC433E0
	for <linux-trace-users@archiver.kernel.org>; Wed, 17 Feb 2021 20:51:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6EF7A64E6C
	for <linux-trace-users@archiver.kernel.org>; Wed, 17 Feb 2021 20:51:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232161AbhBQUvR (ORCPT
        <rfc822;linux-trace-users@archiver.kernel.org>);
        Wed, 17 Feb 2021 15:51:17 -0500
Received: from mail.efficios.com ([167.114.26.124]:58904 "EHLO
        mail.efficios.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231773AbhBQUvQ (ORCPT
        <rfc822;linux-trace-users@vger.kernel.org>);
        Wed, 17 Feb 2021 15:51:16 -0500
Received: from localhost (localhost [127.0.0.1])
        by mail.efficios.com (Postfix) with ESMTP id 2E9D63245C2;
        Wed, 17 Feb 2021 15:50:36 -0500 (EST)
Received: from mail.efficios.com ([127.0.0.1])
        by localhost (mail03.efficios.com [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id Ttn4q-NqDxJg; Wed, 17 Feb 2021 15:50:35 -0500 (EST)
Received: from localhost (localhost [127.0.0.1])
        by mail.efficios.com (Postfix) with ESMTP id BA9FC3245BF;
        Wed, 17 Feb 2021 15:50:35 -0500 (EST)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.efficios.com BA9FC3245BF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=efficios.com;
        s=default; t=1613595035;
        bh=cKhDgjMGZustarpfv5sKKlznOcnplg/uCCkW5RwIxl4=;
        h=Date:From:To:Message-ID:MIME-Version;
        b=dSQibSfwyu0A9gVkxvw2q/dBHbdBU3qes5lxaVpCiH8UBk+GfNfepsa9siSy5osc8
         0TIUjFAGGGo9vORHiPKFO89Gie/Ld4rtb3Q/tbGugxRnlggmtzFPRuqut1VyAeXc6S
         7XJKGbYGc7xwH2KENkAJv1TFoxCkfnIsFvQSMoL7cJ7iHUkOMMcrzGG4acXhcRLmNc
         RFxP3EzytA+rEU6wgvMCJ7jLyXILbi+h9E/BaK/CCmbUTQUcqTI34EDOOf/eCUPRYq
         wYx2V6mO8HIove8FzNOsfNmR1x08RSozZznT6xEhp9G1z5xuLHoqQeiaxueJz2jfpj
         J9ZNEiW14twXg==
X-Virus-Scanned: amavisd-new at efficios.com
Received: from mail.efficios.com ([127.0.0.1])
        by localhost (mail03.efficios.com [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id 3AkUdGOzPTrv; Wed, 17 Feb 2021 15:50:35 -0500 (EST)
Received: from mail03.efficios.com (mail03.efficios.com [167.114.26.124])
        by mail.efficios.com (Postfix) with ESMTP id AEFAB3243CF;
        Wed, 17 Feb 2021 15:50:35 -0500 (EST)
Date:   Wed, 17 Feb 2021 15:50:35 -0500 (EST)
From:   Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
To:     lttng-dev@lists.lttng.org,
        diamon-discuss@lists.linuxfoundation.org,
        linux-trace-users@vger.kernel.org, lwn@lwn.net
Message-ID: <820791812.25860.1613595035617.JavaMail.zimbra@efficios.com>
Subject: [RELEASE] LTTng-UST 2.11.3 and 2.12.1 (Linux user-space tracer)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Originating-IP: [167.114.26.124]
X-Mailer: Zimbra 8.8.15_GA_3996 (ZimbraWebClient - FF85 (Linux)/8.8.15_GA_3996)
Thread-Index: KlGxbtU3V1lTspKBAPQvwyaR6vsKUw==
Thread-Topic: LTTng-UST 2.11.3 and 2.12.1 (Linux user-space tracer)
Precedence: bulk
List-ID: <linux-trace-users.vger.kernel.org>
X-Mailing-List: linux-trace-users@vger.kernel.org

Hi,

This is a bugfix release announcement for the currently maintained stable
branches of the LTTng user-space tracer. The new versions are respectively
2.11.3 and 2.12.1. Those new releases contain minor bug fixes. Users are
encouraged to upgrade.

LTTng-UST, the Linux Trace Toolkit Next Generation Userspace Tracer,
is a low-overhead application tracer. The library "liblttng-ust" enables
tracing of applications and libraries.

Please refer to the respective release Changelog files for details.

Thanks,

Mathieu

Project website: https://lttng.org
Documentation: https://lttng.org/docs
Download link: https://lttng.org/download


-- 
Mathieu Desnoyers
EfficiOS Inc.
http://www.efficios.com
