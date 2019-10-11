Return-Path: <SRS0=I2AM=YE=vger.kernel.org=linux-trace-users-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77F9FC47404
	for <linux-trace-users@archiver.kernel.org>; Fri, 11 Oct 2019 20:28:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4A3DB2084C
	for <linux-trace-users@archiver.kernel.org>; Fri, 11 Oct 2019 20:28:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=efficios.com header.i=@efficios.com header.b="tlUTEZ41"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729032AbfJKU2m (ORCPT
        <rfc822;linux-trace-users@archiver.kernel.org>);
        Fri, 11 Oct 2019 16:28:42 -0400
Received: from mail.efficios.com ([167.114.142.138]:43096 "EHLO
        mail.efficios.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728930AbfJKU2l (ORCPT
        <rfc822;linux-trace-users@vger.kernel.org>);
        Fri, 11 Oct 2019 16:28:41 -0400
Received: from localhost (ip6-localhost [IPv6:::1])
        by mail.efficios.com (Postfix) with ESMTP id B3F023408DB;
        Fri, 11 Oct 2019 16:28:40 -0400 (EDT)
Received: from mail.efficios.com ([IPv6:::1])
        by localhost (mail02.efficios.com [IPv6:::1]) (amavisd-new, port 10032)
        with ESMTP id blUkH0M_pWMY; Fri, 11 Oct 2019 16:28:40 -0400 (EDT)
Received: from localhost (ip6-localhost [IPv6:::1])
        by mail.efficios.com (Postfix) with ESMTP id 75FF23408D8;
        Fri, 11 Oct 2019 16:28:40 -0400 (EDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.efficios.com 75FF23408D8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=efficios.com;
        s=default; t=1570825720;
        bh=pWH7UiDPKHELMInPl/Xs7rUmmZIVWLTfvNyJBvJu73Y=;
        h=Date:From:To:Message-ID:MIME-Version;
        b=tlUTEZ41GfAiQ3w9eOE7409iFJzkPBiRWbzErXezSkdZPGQeHIKjaHi7hQvaTAHFx
         BfimLWefc5gK4EIYrpPQ/kIYTVibi+Me109B7kCIipfCdoYsjs4OBhLvpgl6tFmQXH
         slkyM+c8yuPwL6YFVhh/NCzbMJu+grXys37NLKmWdDIBQji4euVRYMdJe+Rf1/dajs
         nTR1KJsZ0mouJ8NLdg0iMkhOGshprPGonfsLcMGtjveJ6O1d3rjDXr5yosGp22znFo
         tLwn8uSYkmI3fyPbT+JNxFWwIsvB8uf63hyP8ZYz5o5v80AcwCO6bhE+DELfZsctFq
         uiy4QoCvV4cRA==
X-Virus-Scanned: amavisd-new at efficios.com
Received: from mail.efficios.com ([IPv6:::1])
        by localhost (mail02.efficios.com [IPv6:::1]) (amavisd-new, port 10026)
        with ESMTP id anwEIPlysLAg; Fri, 11 Oct 2019 16:28:40 -0400 (EDT)
Received: from mail02.efficios.com (mail02.efficios.com [167.114.142.138])
        by mail.efficios.com (Postfix) with ESMTP id 616B83408C7;
        Fri, 11 Oct 2019 16:28:40 -0400 (EDT)
Date:   Fri, 11 Oct 2019 16:28:40 -0400 (EDT)
From:   Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
To:     lttng-dev@lists.lttng.org,
        diamon-discuss@lists.linuxfoundation.org,
        linux-trace-users@vger.kernel.org
Message-ID: <907852202.19209.1570825720359.JavaMail.zimbra@efficios.com>
Subject: [RELEASE] LTTng-modules 2.11.0-rc7 (Linux kernel tracer)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Originating-IP: [167.114.142.138]
X-Mailer: Zimbra 8.8.15_GA_3869 (ZimbraWebClient - FF69 (Linux)/8.8.15_GA_3869)
Thread-Index: kIneAJivur+TLwUEdMisjERmAjTwHA==
Thread-Topic: LTTng-modules 2.11.0-rc7 (Linux kernel tracer)
Sender: linux-trace-users-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-trace-users.vger.kernel.org>
X-Mailing-List: linux-trace-users@vger.kernel.org

The LTTng modules provide Linux kernel tracing capability to the LTTng
tracer toolset.

* New in this release:

Changes since the last 2.11 release candidate are very few: one commit
fixes compilation on the current 5.4-rc Linux kernels, and one user-visible
change is related to the sched_switch Linux kernel tracepoint "prev_state"
field. It adapts to the upstream Linux changes that were integrated in
4.14, 4.15, and 4.20, making sure we provide relevant information in the
trace in every build scenario.

We expect this release candidate to be the last one before releasing
2.11 final.

In order to keep the release announcements short, we will stop including
the detailed Changelog. It is always available in the project source tree.

Thanks!

Mathieu

Project website: http://lttng.org
Documentation: http://lttng.org/docs
Download link: http://lttng.org/download

-- 
Mathieu Desnoyers
EfficiOS Inc.
http://www.efficios.com
