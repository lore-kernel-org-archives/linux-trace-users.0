Return-Path: <linux-trace-users-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AF7FC433ED
	for <linux-trace-users@archiver.kernel.org>; Tue, 18 May 2021 23:44:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6A007610CB
	for <linux-trace-users@archiver.kernel.org>; Tue, 18 May 2021 23:44:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230216AbhERXpj (ORCPT
        <rfc822;linux-trace-users@archiver.kernel.org>);
        Tue, 18 May 2021 19:45:39 -0400
Received: from mail.efficios.com ([167.114.26.124]:59618 "EHLO
        mail.efficios.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230114AbhERXpi (ORCPT
        <rfc822;linux-trace-users@vger.kernel.org>);
        Tue, 18 May 2021 19:45:38 -0400
Received: from localhost (localhost [127.0.0.1])
        by mail.efficios.com (Postfix) with ESMTP id 1527F3459BC;
        Tue, 18 May 2021 19:44:19 -0400 (EDT)
Received: from mail.efficios.com ([127.0.0.1])
        by localhost (mail03.efficios.com [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id g6Dlag4q7IHO; Tue, 18 May 2021 19:44:18 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
        by mail.efficios.com (Postfix) with ESMTP id A77DD3454A7;
        Tue, 18 May 2021 19:44:18 -0400 (EDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.efficios.com A77DD3454A7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=efficios.com;
        s=default; t=1621381458;
        bh=5cl3NOUBcQThPW82E0uaBWvweZRSWUXyEKprDUHbvJ8=;
        h=Date:From:To:Message-ID:MIME-Version;
        b=YUshdXRfoqtttWCG73LwwP+gy6sNJzwiq5XTe0GD7o0LVTdVlZk3xm5MumhhbhzGK
         s9OsVbbKrRz0sjbB0Rriz2AS41cBPav/AIrJq3Kbtuye24aBCe9ejKnLmZNCacfj/t
         BNJmZeFZujQM7c5Pyn1bWGWw38lRXCIL/jXVK+9Mi2yuhnSiL83sRSlLyHH4xyRVz6
         KqDnVLtqcuYXxBoCICa78+7/9v3yBFN/yxrVhHU0E5/2effbQxNflmi6RWYk5Dmxhv
         29CJq6l1f5HCBFDV3AMTIDTGAc0pezFio5Jq1uhWHAiATlFymSAd2rgQ0Zdf/y1Lfv
         wBTisKfnQln4A==
X-Virus-Scanned: amavisd-new at efficios.com
Received: from mail.efficios.com ([127.0.0.1])
        by localhost (mail03.efficios.com [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id SYNskm6kv7IA; Tue, 18 May 2021 19:44:18 -0400 (EDT)
Received: from Mercury (unknown [107.159.88.171])
        by mail.efficios.com (Postfix) with ESMTPSA id 8661C345C08;
        Tue, 18 May 2021 19:44:18 -0400 (EDT)
Date:   Tue, 18 May 2021 19:44:17 -0400
From:   =?iso-8859-1?Q?J=E9r=E9mie?= Galarneau 
        <jeremie.galarneau@efficios.com>
To:     lttng-dev@lists.lttng.org
Cc:     diamon-discuss@lists.linuxfoundation.org,
        linux-trace-users@vger.kernel.org
Subject: [RELEASE] LTTng-tools 2.11.7 - Lafontaine
Message-ID: <YKRRUTTiUWWDfr6L@Mercury>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-trace-users.vger.kernel.org>
X-Mailing-List: linux-trace-users@vger.kernel.org

Hi all,

The seventh bug-fix release of LTTng-tools 2.11 - Lafontaine has just
been released. This release addresses a number of issues listed below.

2021-05-18 lttng-tools 2.11.7 (No Dirty Dishes Day)
	* Fix: sessiond: leak of config_path on duplicate --config option
	* Fix: relayd: live: data is missing between viewer attach and retry
	* Fix: lttng-ctl: erroneous check if user is part of the tracing group
	* Fix: kernel consumer: get next subbuffer EAGAIN handling
	* Fix: kernel consumer: signal metadata ready condition variable
	* Fix: consumerd: unbalanced subbuffer 'get' when checking operation availability
	* Fix: consumerd: strlen called on uninitialized path
	* Fix: tests: health thread stall: only stop consumerd when required
	* Fix: tests: quote variable in case it's not set
	* Fix: sessiond: session destroy hang in per-uid when context cannot be added
	* Fix: lttng_destroy_session_no_wait: return 0 on success
	* config: fix typo in error message
	* Tests: array expressions without contant index are invalid
	* Fix: validate that array expression contains constant
	* Fix: test: base-path tests are not run
	* Fix: filter: memory leak in filter_parser_ctx
	* Fix: sessiond: fix -Wshadow error in save.c
	* Fix: utils: avoid strncpy overlap in utils_partial_realpath
	* Clean-up: utils: make utils_partial_realpath static
	* Fix: sessiond: kernel: invalid error code check
	* Fix: ust-consumer: metadata thread not woken-up after version change
	* Clean-up: ust-consumer: simplify metadata cache unlock on error path
	* Fix: sessiond: timer: unitiliazed sigevent fields
	* Fix: sessiond: ust-registry: dereference of NULL pointer on allocation failure
	* Fix: ust-consumer: metadata cache lock not taken when sampling max offset

As always, please report any issue you may encounter to bugs.lttng.org
or on this mailing list.

Project website: https://lttng.org

Download link:
https://lttng.org/files/lttng-tools/lttng-tools-2.11.7.tar.bz2

GPG signature:
https://lttng.org/files/lttng-tools/lttng-tools-2.11.7.tar.bz2.asc
