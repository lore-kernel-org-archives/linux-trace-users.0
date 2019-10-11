Return-Path: <SRS0=I2AM=YE=vger.kernel.org=linux-trace-users-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFF10C47404
	for <linux-trace-users@archiver.kernel.org>; Fri, 11 Oct 2019 20:28:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 911D02084C
	for <linux-trace-users@archiver.kernel.org>; Fri, 11 Oct 2019 20:28:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=efficios.com header.i=@efficios.com header.b="SsnH9wuD"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728974AbfJKU2i (ORCPT
        <rfc822;linux-trace-users@archiver.kernel.org>);
        Fri, 11 Oct 2019 16:28:38 -0400
Received: from mail.efficios.com ([167.114.142.138]:43016 "EHLO
        mail.efficios.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728930AbfJKU2i (ORCPT
        <rfc822;linux-trace-users@vger.kernel.org>);
        Fri, 11 Oct 2019 16:28:38 -0400
Received: from localhost (ip6-localhost [IPv6:::1])
        by mail.efficios.com (Postfix) with ESMTP id E69B63408AC;
        Fri, 11 Oct 2019 16:28:36 -0400 (EDT)
Received: from mail.efficios.com ([IPv6:::1])
        by localhost (mail02.efficios.com [IPv6:::1]) (amavisd-new, port 10032)
        with ESMTP id 5qVTb5cf3szy; Fri, 11 Oct 2019 16:28:36 -0400 (EDT)
Received: from localhost (ip6-localhost [IPv6:::1])
        by mail.efficios.com (Postfix) with ESMTP id 76608340894;
        Fri, 11 Oct 2019 16:28:36 -0400 (EDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.efficios.com 76608340894
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=efficios.com;
        s=default; t=1570825716;
        bh=iWAVlCyv/q+ndHa5Pb+0lsJR84FuCVubYIeS+gtT1so=;
        h=Date:From:To:Message-ID:MIME-Version;
        b=SsnH9wuDdELDKqsndqcsTThVwlsyvjyRHmWvqZCaU2qJI0dsR6i0ulgqr22JFUSxO
         X2Qu/IhE8MzGGzH/Cl+ziuN4euzRQF7KM+Tb2Htm/6x5HE5QlpCuw9Ri9OYxBCUQC3
         4lPiV5MU3Jxa8kui2vKl8igRvsZcOq1T4ERgh/hMISHCnNAY6Yj1O0J7D6G0sCdmge
         Ch9qwHsJ/xKXZG1ZEzm7wKyhbf7ZBqPE2EbojBmBwcMNJjO9kLGhebXq6kdE1cl4uv
         OnZhDP9kkVSp2hQKiM+iifmmFKvHF1mugqO8dvR36XVcVtCJJra+Ue6iPwargfRdvz
         0u6tM55b6uwQQ==
X-Virus-Scanned: amavisd-new at efficios.com
Received: from mail.efficios.com ([IPv6:::1])
        by localhost (mail02.efficios.com [IPv6:::1]) (amavisd-new, port 10026)
        with ESMTP id VntvKCvbDbBD; Fri, 11 Oct 2019 16:28:36 -0400 (EDT)
Received: from mail02.efficios.com (mail02.efficios.com [167.114.142.138])
        by mail.efficios.com (Postfix) with ESMTP id 5E3BF340886;
        Fri, 11 Oct 2019 16:28:36 -0400 (EDT)
Date:   Fri, 11 Oct 2019 16:28:36 -0400 (EDT)
From:   Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
To:     lttng-dev@lists.lttng.org,
        diamon-discuss@lists.linuxfoundation.org,
        linux-trace-users@vger.kernel.org
Message-ID: <1332935633.19189.1570825716227.JavaMail.zimbra@efficios.com>
Subject: [RELEASE] LTTng-UST 2.11.0-rc5 (Linux user-space tracer)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Originating-IP: [167.114.142.138]
X-Mailer: Zimbra 8.8.15_GA_3869 (ZimbraWebClient - FF69 (Linux)/8.8.15_GA_3869)
Thread-Index: fkQqwdcP3Dx8irSi+JJy1CYsBVd6LQ==
Thread-Topic: LTTng-UST 2.11.0-rc5 (Linux user-space tracer)
Sender: linux-trace-users-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-trace-users.vger.kernel.org>
X-Mailing-List: linux-trace-users@vger.kernel.org

LTTng-UST, the Linux Trace Toolkit Next Generation Userspace Tracer,
is a low-overhead application tracer. The library "liblttng-ust" enables
tracing of applications and libraries.

* New in this release:

This release candidate contains pretty much only bug fixes taking care of
regressions recently reported by end users on LTTng's bug tracker. Those
are not new to 2.11, so we expect to release those bug fixes into the
stable 2.9 and 2.10 lttng-ust branches soon as well.

We expect this release candidate to be the last one before releasing
2.11 final.

In order to keep the release announcements short, we will stop including
the detailed Changelog. It is always available in the project source tree.

Thanks for your feedback!

Mathieu

Project website: http://lttng.org
Documentation: http://lttng.org/docs
Download link: http://lttng.org/download

-- 
Mathieu Desnoyers
EfficiOS Inc.
http://www.efficios.com
