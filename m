Return-Path: <SRS0=cwR1=YK=vger.kernel.org=linux-trace-users-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1418FA372A
	for <linux-trace-users@archiver.kernel.org>; Thu, 17 Oct 2019 20:01:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B571420854
	for <linux-trace-users@archiver.kernel.org>; Thu, 17 Oct 2019 20:01:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=efficios.com header.i=@efficios.com header.b="aaJwiM4s"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2436833AbfJQUBK (ORCPT
        <rfc822;linux-trace-users@archiver.kernel.org>);
        Thu, 17 Oct 2019 16:01:10 -0400
Received: from mail.efficios.com ([167.114.142.138]:41618 "EHLO
        mail.efficios.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2436848AbfJQUBK (ORCPT
        <rfc822;linux-trace-users@vger.kernel.org>);
        Thu, 17 Oct 2019 16:01:10 -0400
Received: from localhost (ip6-localhost [IPv6:::1])
        by mail.efficios.com (Postfix) with ESMTP id 641C13453CE;
        Thu, 17 Oct 2019 16:01:09 -0400 (EDT)
Received: from mail.efficios.com ([IPv6:::1])
        by localhost (mail02.efficios.com [IPv6:::1]) (amavisd-new, port 10032)
        with ESMTP id BBI2_dwstpsg; Thu, 17 Oct 2019 16:01:09 -0400 (EDT)
Received: from localhost (ip6-localhost [IPv6:::1])
        by mail.efficios.com (Postfix) with ESMTP id 2433C3453CB;
        Thu, 17 Oct 2019 16:01:09 -0400 (EDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.efficios.com 2433C3453CB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=efficios.com;
        s=default; t=1571342469;
        bh=0NFVnmKZw/T7tAgg/nNVzLbidrHUzML1XjoxTGUzQ8U=;
        h=Date:From:To:Message-ID:MIME-Version;
        b=aaJwiM4sMLoHP9LOYQvUb3JAihq6Ykwi66asFZvGl2IndI05wTmyISIgAvabPRo/l
         7/C5SRYkUEBcKmgXn9eWcPW4CjKiGrtfSt9BDklZ1QhhyqEP7LqsyqhoMTIrJfaZVc
         WV2w9xCd1hMpvO8GdpraHa9n/SlUn6MUt2u8zK5VHmsz8LDNZdMMdxmSYDo8LGrMh+
         C5KaIFen/xayl4dA6fHj+KRRrINaOZWsbzN2BaYWG2qNZBWj/aa4yVNZIxJCIAcdjU
         w6PNOFlw3VLoj4n9034zk4H6QyOs3tSWxHiEdLs6aOy26TgzjK3DXl4DHdKW/FXmwh
         z8isXiQexAP4Q==
X-Virus-Scanned: amavisd-new at efficios.com
Received: from mail.efficios.com ([IPv6:::1])
        by localhost (mail02.efficios.com [IPv6:::1]) (amavisd-new, port 10026)
        with ESMTP id ZllKY-z8AJfA; Thu, 17 Oct 2019 16:01:09 -0400 (EDT)
Received: from mail02.efficios.com (mail02.efficios.com [167.114.142.138])
        by mail.efficios.com (Postfix) with ESMTP id 0B7F63453BD;
        Thu, 17 Oct 2019 16:01:09 -0400 (EDT)
Date:   Thu, 17 Oct 2019 16:01:09 -0400 (EDT)
From:   Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
To:     lttng-dev@lists.lttng.org,
        diamon-discuss@lists.linuxfoundation.org,
        linux-trace-users@vger.kernel.org
Message-ID: <1993019012.12718.1571342469013.JavaMail.zimbra@efficios.com>
Subject: [RELEASE] LTTng-modules 2.9.15 (EOL), 2.10.12 (Linux kernel tracer)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Originating-IP: [167.114.142.138]
X-Mailer: Zimbra 8.8.15_GA_3869 (ZimbraWebClient - FF69 (Linux)/8.8.15_GA_3869)
Thread-Index: BeFUse+pwa1MX7TURD9hBIKvmXs71Q==
Thread-Topic: LTTng-modules 2.9.15 (EOL), 2.10.12 (Linux kernel tracer)
Sender: linux-trace-users-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-trace-users.vger.kernel.org>
X-Mailing-List: linux-trace-users@vger.kernel.org

Hi,

We are pleased to announce the 2.9.15 (EOL) and 2.10.12 stable releases
of the LTTng-modules project 2.9 and 2.10 stable branches.

The LTTng modules provide Linux kernel tracing capability to the LTTng
tracer toolset.

* New in these release:

Both releases contain an update the the scheduler "prev_state" field
of the sched_switch event. It now traces payload which matches the
various changes that went through the various upstream Linux kernel
versions.

Now that the release of LTTng-modules 2.11.0 is imminent, version
2.9.15 marks the end of life (EOL) of the 2.9 stable branch of
LTTng-modules.

Thanks!

Mathieu

Project website: http://lttng.org
Documentation: http://lttng.org/docs
Download link: http://lttng.org/download

-- 
Mathieu Desnoyers
EfficiOS Inc.
http://www.efficios.com
