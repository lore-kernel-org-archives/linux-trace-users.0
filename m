Return-Path: <SRS0=PWZ5=3S=vger.kernel.org=linux-trace-users-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	PDS_TONAME_EQ_TOLOCAL_SHORT,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B137C2D0DB
	for <linux-trace-users@archiver.kernel.org>; Wed, 29 Jan 2020 15:38:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3F3E32071E
	for <linux-trace-users@archiver.kernel.org>; Wed, 29 Jan 2020 15:38:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=efficios.com header.i=@efficios.com header.b="SC1z40zl"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726564AbgA2Pii (ORCPT
        <rfc822;linux-trace-users@archiver.kernel.org>);
        Wed, 29 Jan 2020 10:38:38 -0500
Received: from mail.efficios.com ([167.114.26.124]:39634 "EHLO
        mail.efficios.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726240AbgA2Pii (ORCPT
        <rfc822;linux-trace-users@vger.kernel.org>);
        Wed, 29 Jan 2020 10:38:38 -0500
X-Greylist: delayed 438 seconds by postgrey-1.27 at vger.kernel.org; Wed, 29 Jan 2020 10:38:38 EST
Received: from localhost (localhost [127.0.0.1])
        by mail.efficios.com (Postfix) with ESMTP id E6A6A24873D;
        Wed, 29 Jan 2020 10:31:19 -0500 (EST)
Received: from mail.efficios.com ([127.0.0.1])
        by localhost (mail03.efficios.com [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id kpgsD_VMEEOv; Wed, 29 Jan 2020 10:31:19 -0500 (EST)
Received: from localhost (localhost [127.0.0.1])
        by mail.efficios.com (Postfix) with ESMTP id 943B224866B;
        Wed, 29 Jan 2020 10:31:19 -0500 (EST)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.efficios.com 943B224866B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=efficios.com;
        s=default; t=1580311879;
        bh=x1CNYSmVc4hexgWWBDqmNWXlPF9vceTEzN5Uklymhcw=;
        h=Date:From:To:Message-ID:MIME-Version;
        b=SC1z40zlzl0uFDnrDZpspzwTwDyO26UKkDWrEi1QA/84GV6+sQff+Qn4aMqppArfL
         fzLCTta5maL9NqLV2N8xf/owxOKKxvr+zED8QDJkpRUFS+JOm9NyfOquE2SHcgoeBG
         RrvluqbksMpYKqbKs5E8r1m0PjICm+D7/hlbDPFvYDZEAo0YebkPGIsYLMDgPPrIqQ
         O275d/URsc+pfKQMcKRjpv/5znS0UG/ThzXxEUPS4oDBpo6uEFj4AJL0g30dw5lCi/
         H8WmIWGXooaoimVW0JrREhS2SPJZgW5Y/An31uUtYVB7GHWRMEQLGvitG92ibDCT1w
         5U7yGCWBGWG6Q==
X-Virus-Scanned: amavisd-new at efficios.com
Received: from mail.efficios.com ([127.0.0.1])
        by localhost (mail03.efficios.com [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id SXBbvp8I6DWp; Wed, 29 Jan 2020 10:31:19 -0500 (EST)
Received: from mail03.efficios.com (mail03.efficios.com [167.114.26.124])
        by mail.efficios.com (Postfix) with ESMTP id 7C32B24873C;
        Wed, 29 Jan 2020 10:31:19 -0500 (EST)
Date:   Wed, 29 Jan 2020 10:31:19 -0500 (EST)
From:   Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
To:     lttng-dev <lttng-dev@lists.lttng.org>
Cc:     lwn@lwn.net, linux-trace-users@vger.kernel.org,
        diamon-discuss@lists.linuxfoundation.org
Message-ID: <2032449194.602824.1580311879379.JavaMail.zimbra@efficios.com>
Subject: [RELEASE] LTTng-modules 2.10.13 and 2.11.1 (Linux kernel tracer)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Originating-IP: [167.114.26.124]
X-Mailer: Zimbra 8.8.15_GA_3895 (ZimbraWebClient - FF72 (Linux)/8.8.15_GA_3895)
Thread-Index: oNXPAwFVEG2dHDtl7f8Rz3n8bSy7eg==
Thread-Topic: LTTng-modules 2.10.13 and 2.11.1 (Linux kernel tracer)
Sender: linux-trace-users-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-trace-users.vger.kernel.org>
X-Mailing-List: linux-trace-users@vger.kernel.org

Hi,

This announcement covers both actively supported stable branches of lttng-modules
(2.10 and 2.11). Updates introduced in these releases enable building lttng-modules
against the Linux kernel v5.5.

The LTTng modules provide Linux kernel tracing capability to the LTTng
tracer toolset.

Thanks,

Mathieu

Project website: https://lttng.org
Documentation: https://lttng.org/docs
Download link: https://lttng.org/download

-- 
Mathieu Desnoyers
EfficiOS Inc.
http://www.efficios.com
