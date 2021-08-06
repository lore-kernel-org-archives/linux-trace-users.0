Return-Path: <linux-trace-users-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B47DAC4338F
	for <linux-trace-users@archiver.kernel.org>; Fri,  6 Aug 2021 20:21:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8D77261163
	for <linux-trace-users@archiver.kernel.org>; Fri,  6 Aug 2021 20:21:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244902AbhHFUWK (ORCPT
        <rfc822;linux-trace-users@archiver.kernel.org>);
        Fri, 6 Aug 2021 16:22:10 -0400
Received: from mail.efficios.com ([167.114.26.124]:60202 "EHLO
        mail.efficios.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231823AbhHFUWJ (ORCPT
        <rfc822;linux-trace-users@vger.kernel.org>);
        Fri, 6 Aug 2021 16:22:09 -0400
Received: from localhost (localhost [127.0.0.1])
        by mail.efficios.com (Postfix) with ESMTP id 568FD37B382;
        Fri,  6 Aug 2021 16:21:53 -0400 (EDT)
Received: from mail.efficios.com ([127.0.0.1])
        by localhost (mail03.efficios.com [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id THoWE6-3X7P9; Fri,  6 Aug 2021 16:21:52 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
        by mail.efficios.com (Postfix) with ESMTP id 59AD037B229;
        Fri,  6 Aug 2021 16:21:52 -0400 (EDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.efficios.com 59AD037B229
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=efficios.com;
        s=default; t=1628281312;
        bh=WtBj8q1avbA8RiLwG6a1s+x3PjArDG7YEA9QU8Tmvgc=;
        h=Date:From:To:Message-ID:MIME-Version;
        b=QzLZxXutcid9S5yyQ9PPFm/xa/9J0/sWhsKEToFBUhOly4BujkRRp51mRDVfWgePg
         D6La95Nbm1afix1ilMNC1840M6qCbX6PzQiWGDpwBpFem43sFU2AqDFQiRj6AyhGHH
         jH6wV63g6CrtQahl6mbusFXi5YrrTLtg2HG247wUkOYgDG5Z4u0wfh3bNqV0rV8acV
         kj4+eKIaKSa+i9wibN2II41ipxQgISH5+Ea954Rd/cwSLA8s7qL4oojSSuhxFMiPpC
         4MgbdqoihuyQBdIoP2BATINEAQtsxLMCrWgj6ewYa86ByRTfcSfGuNfWa15nmuBbIM
         8imAW1btOMzJA==
X-Virus-Scanned: amavisd-new at efficios.com
Received: from mail.efficios.com ([127.0.0.1])
        by localhost (mail03.efficios.com [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id O0P3TFKZkpOK; Fri,  6 Aug 2021 16:21:52 -0400 (EDT)
Received: from Mercury (unknown [107.159.88.171])
        by mail.efficios.com (Postfix) with ESMTPSA id 4025237B228;
        Fri,  6 Aug 2021 16:21:52 -0400 (EDT)
Date:   Fri, 6 Aug 2021 16:21:51 -0400
From:   =?iso-8859-1?Q?J=E9r=E9mie?= Galarneau 
        <jeremie.galarneau@efficios.com>
To:     lttng-dev <lttng-dev@lists.lttng.org>
Cc:     diamon-discuss <diamon-discuss-bounces@lists.linuxfoundation.org>,
        linux-trace-users <linux-trace-users@vger.kernel.org>
Subject: [RELEASE] LTTng 2.12.5 - (Ta) Meilleure
Message-ID: <YQ2Z3yAtG6QxpQ1H@Mercury>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-trace-users.vger.kernel.org>
X-Mailing-List: linux-trace-users@vger.kernel.org

Hi all,

The fifth bug-fix release of LTTng-tools 2.12 - (Ta) Meilleure has just been
released. This release addresses a number of issues listed below.

2021-08-06 lttng-tools 2.12.5 (International Beer Day)
	* Fix: runas: less-than-zero comparison of an unsigned value
	* Fix: runas: supplementary groups are ignored on lttng save
	* Fix: lttng: free sessions in cmd_destroy
	* Fix: lttng: free domains and channels in get_session_stats_str
	* Fix: rotation client example: leak of handle on error
	* .gitreview: Set default branch to 'stable-2.12'
	* tests: Move tap-driver.sh out of the autotools aux directory
	* Fix: use of uninitialised bytes valgrind warning
	* Fix: bump minimal urcu dependency to 0.11
	* Fix: consumer: unbalanced RCU read-side lock on error
	* Fix: tests: missing LOG_DRIVER and LOG_DRIVER_FLAGS
	* Fix: list_lttng_agent_events: unbalanced RCU read-side lock on error

As always, please report any issue you may encounter to bugs.lttng.org
or on this mailing list.

Project website: https://lttng.org

Download link:
https://lttng.org/files/lttng-tools/lttng-tools-2.12.5.tar.bz2

GPG signature:
https://lttng.org/files/lttng-tools/lttng-tools-2.12.5.tar.bz2.asc
