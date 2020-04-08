Return-Path: <SRS0=ad/Y=5Y=vger.kernel.org=linux-trace-users-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9219CC2D0EA
	for <linux-trace-users@archiver.kernel.org>; Wed,  8 Apr 2020 15:34:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5C983206BE
	for <linux-trace-users@archiver.kernel.org>; Wed,  8 Apr 2020 15:34:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=efficios.com header.i=@efficios.com header.b="jtHots/J"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727851AbgDHPe3 (ORCPT
        <rfc822;linux-trace-users@archiver.kernel.org>);
        Wed, 8 Apr 2020 11:34:29 -0400
Received: from mail.efficios.com ([167.114.26.124]:35992 "EHLO
        mail.efficios.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726709AbgDHPe2 (ORCPT
        <rfc822;linux-trace-users@vger.kernel.org>);
        Wed, 8 Apr 2020 11:34:28 -0400
Received: from localhost (localhost [127.0.0.1])
        by mail.efficios.com (Postfix) with ESMTP id 68A462660F5;
        Wed,  8 Apr 2020 11:34:28 -0400 (EDT)
Received: from mail.efficios.com ([127.0.0.1])
        by localhost (mail03.efficios.com [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id Ch9mB-7hjBbb; Wed,  8 Apr 2020 11:34:28 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
        by mail.efficios.com (Postfix) with ESMTP id 39FA72662CC;
        Wed,  8 Apr 2020 11:34:28 -0400 (EDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.efficios.com 39FA72662CC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=efficios.com;
        s=default; t=1586360068;
        bh=Ypvg5NcUIvyITohP63FhYTbBE982arKc3d6IvZfFfAc=;
        h=Date:From:To:Message-ID:MIME-Version;
        b=jtHots/JUNcYSuxjKzF+8xCBtXUDjXhQTWb0Ww9uVVRAZpHkt1dxYUrsEoqAjtPXU
         WYVJnZNuc58y7M5EcmLqR6GF7BidKIKppYpFzTZdmGciHS9szwsCaDUCSPpPZPVIb4
         LqLxN1INJbTfqdFqPKzALGVw3aOpd4RXZR/df5dNST7zn35BiZqqdQuiBlcl8HarFv
         mgrHrRK+Y1rSzsLaSoMlfs5u1gT9FpIjba7r/Wad0ftfvvHkhiO7egO+lmbQ8pIVCc
         PnMVLdpVktwM/ps5y0kJvKsXPDesp20D4x1U7GycdkDj0rznu8M4ICAxLfqFUvXwTr
         PKgefGtMgHUHg==
X-Virus-Scanned: amavisd-new at efficios.com
Received: from mail.efficios.com ([127.0.0.1])
        by localhost (mail03.efficios.com [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id RMOUzXrx7Uzs; Wed,  8 Apr 2020 11:34:28 -0400 (EDT)
Received: from mail03.efficios.com (mail03.efficios.com [167.114.26.124])
        by mail.efficios.com (Postfix) with ESMTP id 3147C266507;
        Wed,  8 Apr 2020 11:34:28 -0400 (EDT)
Date:   Wed, 8 Apr 2020 11:34:28 -0400 (EDT)
From:   Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
To:     lttng-dev@lists.lttng.org,
        diamon-discuss@lists.linuxfoundation.org,
        linux-trace-users@vger.kernel.org
Message-ID: <71190912.27144.1586360068185.JavaMail.zimbra@efficios.com>
Subject: [RELEASE] LTTng-UST 2.11.2 (Linux user-space tracer)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Originating-IP: [167.114.26.124]
X-Mailer: Zimbra 8.8.15_GA_3918 (ZimbraWebClient - FF74 (Linux)/8.8.15_GA_3895)
Thread-Index: VjzJmaMldWc4FUBbWIfeauEdy3yXNQ==
Thread-Topic: LTTng-UST 2.11.2 (Linux user-space tracer)
Sender: linux-trace-users-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-trace-users.vger.kernel.org>
X-Mailing-List: linux-trace-users@vger.kernel.org

LTTng-UST, the Linux Trace Toolkit Next Generation Userspace Tracer,
is a low-overhead application tracer. The library "liblttng-ust" enables
tracing of applications and libraries.

Version 2.11.2 is a very small bugfix release which includes only a
single fix affecting the LTTng filter interpreter when dealing with
floating point numbers loaded from lttng contexts.

Thanks,

Mathieu

Project website: https://lttng.org
Documentation: https://lttng.org/docs
Download link: https://lttng.org/download


-- 
Mathieu Desnoyers
EfficiOS Inc.
http://www.efficios.com
