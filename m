Return-Path: <linux-trace-users-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14710C433ED
	for <linux-trace-users@archiver.kernel.org>; Fri, 14 May 2021 19:43:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E0CD26145B
	for <linux-trace-users@archiver.kernel.org>; Fri, 14 May 2021 19:43:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229958AbhENTof (ORCPT
        <rfc822;linux-trace-users@archiver.kernel.org>);
        Fri, 14 May 2021 15:44:35 -0400
Received: from mail.efficios.com ([167.114.26.124]:57618 "EHLO
        mail.efficios.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229932AbhENToe (ORCPT
        <rfc822;linux-trace-users@vger.kernel.org>);
        Fri, 14 May 2021 15:44:34 -0400
Received: from localhost (localhost [127.0.0.1])
        by mail.efficios.com (Postfix) with ESMTP id 330222B8285;
        Fri, 14 May 2021 15:43:22 -0400 (EDT)
Received: from mail.efficios.com ([127.0.0.1])
        by localhost (mail03.efficios.com [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id 1QqT508Wc5II; Fri, 14 May 2021 15:43:21 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
        by mail.efficios.com (Postfix) with ESMTP id B266A2B8144;
        Fri, 14 May 2021 15:43:21 -0400 (EDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.efficios.com B266A2B8144
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=efficios.com;
        s=default; t=1621021401;
        bh=lN3BGKDjXEVfPPIZghesZjOo3f4JefopEuk6smetP6I=;
        h=Date:From:To:Message-ID:MIME-Version;
        b=T1Fb9MfCQBU7PI3+H2n485xQsS5C2Q4OI+1sIuQAjLXSmY09aGXnTiSGmw9BNLq+S
         HjfMtk30nd+2RhriuLZOgqZTsXqZnHSHy3UOpSx9rM0GPEAueLYmDidZodwhtRdgau
         hslSnCizM7huU1mlzt2X9wqRSTNENIyHzFexV7/y+v4hcMmbdUwhBlQqiyryUj7lSa
         CenbfA0cUjUcUFI1wrVSqiy1xaRe6X/PzQ7ecmkyzweBMmREsGtMo7vnAqXQ5/GdyV
         MYHcTsVl1gxjRjGBsZx9l8p0sR+MVJZIO3s8kvj/ZOAh+k7cDop6GtSCh+u+VwqVhy
         K9tApKrSLnSRg==
X-Virus-Scanned: amavisd-new at efficios.com
Received: from mail.efficios.com ([127.0.0.1])
        by localhost (mail03.efficios.com [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id TZRCHk2-JUaA; Fri, 14 May 2021 15:43:21 -0400 (EDT)
Received: from mail03.efficios.com (mail03.efficios.com [167.114.26.124])
        by mail.efficios.com (Postfix) with ESMTP id A3E27347F54;
        Fri, 14 May 2021 15:43:21 -0400 (EDT)
Date:   Fri, 14 May 2021 15:43:21 -0400 (EDT)
From:   Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
To:     lttng-dev@lists.lttng.org,
        diamon-discuss@lists.linuxfoundation.org,
        linux-trace-users@vger.kernel.org
Message-ID: <614865397.45958.1621021401586.JavaMail.zimbra@efficios.com>
Subject: [RELEASE] LTTng-UST 2.11.4 and 2.12.2
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Originating-IP: [167.114.26.124]
X-Mailer: Zimbra 8.8.15_GA_4018 (ZimbraWebClient - FF88 (Linux)/8.8.15_GA_4007)
Thread-Index: kFZthwqSfcVZZuZbbWCEFO1VhIFCtg==
Thread-Topic: LTTng-UST 2.11.4 and 2.12.2
Precedence: bulk
List-ID: <linux-trace-users.vger.kernel.org>
X-Mailing-List: linux-trace-users@vger.kernel.org

Hi,

LTTng-UST 2.11.4 and 2.12.2 are bug fix releases of the LTTng-UST user-space tracer for the
2.11 and 2.12 stable branches.

There are a few fixes, as well as a in-depth rework of the benchmark code which was sitting
in the tests of lttng-ust. This test code was contributed more than 10 years ago before I took
maintainership of the LTTng-UST project, and it was in a broken state (always returned
0 second on my test machine because it was truncating significant digits). So I reworked the
benchmark in the 2.11 and 2.12 stable branches to facilitate comparison of benchmarks between
branches, especially given the major rework done in the upcoming 2.13 version.

Thanks,

Mathieu

Project website: https://lttng.org
Documentation: https://lttng.org/docs
Download link: https://lttng.org/download

-- 
Mathieu Desnoyers
EfficiOS Inc.
http://www.efficios.com
