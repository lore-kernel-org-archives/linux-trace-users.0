Return-Path: <linux-trace-users-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E083FC433ED
	for <linux-trace-users@archiver.kernel.org>; Tue, 18 May 2021 23:46:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B5B3C61074
	for <linux-trace-users@archiver.kernel.org>; Tue, 18 May 2021 23:46:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230440AbhERXrq (ORCPT
        <rfc822;linux-trace-users@archiver.kernel.org>);
        Tue, 18 May 2021 19:47:46 -0400
Received: from mail.efficios.com ([167.114.26.124]:60956 "EHLO
        mail.efficios.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230088AbhERXrq (ORCPT
        <rfc822;linux-trace-users@vger.kernel.org>);
        Tue, 18 May 2021 19:47:46 -0400
Received: from localhost (localhost [127.0.0.1])
        by mail.efficios.com (Postfix) with ESMTP id 68D3A345D24;
        Tue, 18 May 2021 19:46:27 -0400 (EDT)
Received: from mail.efficios.com ([127.0.0.1])
        by localhost (mail03.efficios.com [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id cf0kTN6j3BR4; Tue, 18 May 2021 19:46:26 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
        by mail.efficios.com (Postfix) with ESMTP id 60E85345D23;
        Tue, 18 May 2021 19:46:26 -0400 (EDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.efficios.com 60E85345D23
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=efficios.com;
        s=default; t=1621381586;
        bh=TDGZMQHGOSUuSHGihDnY/TY8IRkvvthcOwZnYSLjtbA=;
        h=Date:From:To:Message-ID:MIME-Version;
        b=AR73fafsZ/slmaiq7a6SQBsCVKSLL48IHdxFFXwk2dWhkMxNzZBci4gp52Xt+TJ2f
         gKBrN1xxE782cQ7DygRcctGkJ+Gheoybr6Oa07U8GQCsyMZyL+KuU/xBZ22SeQn7Ga
         k8xbDL2C4FMTq0j6DH6qudEzM3iyPWAGhFfegSpcMIOZkEKoWvlLORVnr6k1jrqsK+
         YO8A0Gcp6O2KHuTizOMh0dONY7EUp7ADd653KTw43lopEhKz3aPiT0N6H58Uq5QIgl
         yRU6qWwehHY27dk99xDmrVmceBq4myxvfcyiTxAOr74WGblOnQv0bPa2oeiMrp6WDr
         D9WTFBjEXr3bQ==
X-Virus-Scanned: amavisd-new at efficios.com
Received: from mail.efficios.com ([127.0.0.1])
        by localhost (mail03.efficios.com [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id Y3REbysghQWp; Tue, 18 May 2021 19:46:26 -0400 (EDT)
Received: from Mercury (unknown [107.159.88.171])
        by mail.efficios.com (Postfix) with ESMTPSA id 3BC69345C8F;
        Tue, 18 May 2021 19:46:26 -0400 (EDT)
Date:   Tue, 18 May 2021 19:46:26 -0400
From:   =?iso-8859-1?Q?J=E9r=E9mie?= Galarneau 
        <jeremie.galarneau@efficios.com>
To:     lttng-dev@lists.lttng.org
Cc:     diamon-discuss@lists.linuxfoundation.org,
        linux-trace-users@vger.kernel.org
Subject: [RELEASE] LTTng 2.12.4 - (Ta) Meilleure
Message-ID: <YKRR0mmKIGxjag6Y@Mercury>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-trace-users.vger.kernel.org>
X-Mailing-List: linux-trace-users@vger.kernel.org

Hi all,

The fourth bug-fix release of LTTng-tools 2.12 - (Ta) Meilleure has just been
released. This release addresses a number of issues listed below.

2021-05-18 lttng-tools 2.12.4 (No Dirty Dishes Day)
	* Fix: snapshot path have domain subdir duplicate "ust/ust" or "kernel/kernel"
	* Fix: relayd: failure to read index entry or stream packet after clear
	* Fix: sessiond: leak of config_path on duplicate --config option
	* Fix: relayd: live: data is missing between viewer attach and retry
	* Fix: lttng-ctl: erroneous check if user is part of the tracing group
	* Fix: kernel consumer: get next subbuffer EAGAIN handling
	* Fix: kernel consumer: signal metadata ready condition variable
	* Fix: consumerd: unbalanced subbuffer 'get' when checking operation availability
	* Fix: tests: gen-ust-events-ns: Uninitialized argument value
	* Fix: consumerd: strlen called on uninitialized path
	* Fix: tests: health thread stall: only stop consumerd when required
	* Fix: tests: quote variable in case it's not set
	* Fix: sessiond: session destroy hang in per-uid when context cannot be added
	* Fix: backward relayd: path contains a leading "ust" folder
	* Fix: lttng_destroy_session_no_wait: return 0 on success
	* config: fix typo in error message
	* Tests: array expressions without contant index are invalid
	* Fix: validate that array expression contains constant
	* Fix: test: base-path tests are not run
	* Fix: filter: memory leak in filter_parser_ctx
	* Fix: sessiond: fix -Wshadow error in save.c
	* Fix: utils: avoid strncpy overlap in utils_partial_realpath
	* Clean-up: utils: make utils_partial_realpath static
	* Fix: added missing test_channel and removed double defined test_syscall
	* Fix: sessiond: kernel: invalid error code check
	* Tests: fix: unchecked sscanf return value
	* compiler warning cleanup: is_signed_type: compare -1 to 1

As always, please report any issue you may encounter to bugs.lttng.org
or on this mailing list.

Project website: https://lttng.org

Download link:
https://lttng.org/files/lttng-tools/lttng-tools-2.12.4.tar.bz2

GPG signature:
https://lttng.org/files/lttng-tools/lttng-tools-2.12.4.tar.bz2.asc
