Return-Path: <linux-trace-users-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65CC9C433F5
	for <linux-trace-users@archiver.kernel.org>; Fri, 17 Dec 2021 19:01:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240064AbhLQTBO (ORCPT
        <rfc822;linux-trace-users@archiver.kernel.org>);
        Fri, 17 Dec 2021 14:01:14 -0500
Received: from mail.efficios.com ([167.114.26.124]:53072 "EHLO
        mail.efficios.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236522AbhLQTBN (ORCPT
        <rfc822;linux-trace-users@vger.kernel.org>);
        Fri, 17 Dec 2021 14:01:13 -0500
Received: from localhost (localhost [127.0.0.1])
        by mail.efficios.com (Postfix) with ESMTP id F33C13C20F7;
        Fri, 17 Dec 2021 14:01:12 -0500 (EST)
Received: from mail.efficios.com ([127.0.0.1])
        by localhost (mail03.efficios.com [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id 7R8K8EQ8VgxH; Fri, 17 Dec 2021 14:01:11 -0500 (EST)
Received: from localhost (localhost [127.0.0.1])
        by mail.efficios.com (Postfix) with ESMTP id DBAEC3C2165;
        Fri, 17 Dec 2021 14:01:11 -0500 (EST)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.efficios.com DBAEC3C2165
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=efficios.com;
        s=default; t=1639767671;
        bh=UVMkNS5PgvRvVSQbDCQMDpAqXdy5+C1MPIQuk5ufbBk=;
        h=Date:From:To:Message-ID:MIME-Version;
        b=l5U0jRrKnLjATPsmPWZhh4GsWY6hjEESjPsFwst+WZwFnbavmldUyJq5PDuxfU/8v
         oTtmoZd1ktS8Jnr/VR3jHTsPqvMjEgN1iFMLlQsI7UYFHBc6S4yPb5YxlSUakxs0g8
         VRwm1RxaKF4Nn8S5ebtKDsYG0FoVkcnrb1MA4IxR4kgEfqhasUhqwEL3NTYJuBW+3t
         gwDIqz2NtyciXFYCYMXAwxg9D8lubQjtxVWx80vJrY4T175KrUx9yYh98tvQ122tCO
         KEHMS/gx0s1Tn5DUDKZqV6FRUr/xWz81ixmDy1oCcsg0K8MlYJ1tsADc77GBpD9pk1
         BcxT48rMjaT2g==
X-Virus-Scanned: amavisd-new at efficios.com
Received: from mail.efficios.com ([127.0.0.1])
        by localhost (mail03.efficios.com [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id hmRjV0ChLmLr; Fri, 17 Dec 2021 14:01:11 -0500 (EST)
Received: from carbonara (unknown [107.159.88.171])
        by mail.efficios.com (Postfix) with ESMTPSA id AE51D3C2263;
        Fri, 17 Dec 2021 14:01:11 -0500 (EST)
Date:   Fri, 17 Dec 2021 14:01:11 -0500
From:   =?iso-8859-1?Q?J=E9r=E9mie?= Galarneau 
        <jeremie.galarneau@efficios.com>
To:     lttng-dev@lists.lttng.org
Cc:     diamon-discuss <diamon-discuss@lists.linuxfoundation.org>,
        linux-trace-users <linux-trace-users@vger.kernel.org>
Subject: [RELEASE] LTTng-tools =?iso-8859-1?B?Mi4x?=
 =?iso-8859-1?Q?3=2E2_-_Nordicit=E9?=
Message-ID: <Ybzed+wMHvpvQ3Pz@carbonara>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-trace-users.vger.kernel.org>
X-Mailing-List: linux-trace-users@vger.kernel.org

Hi all,

We have just released the second bug-fix release of LTTng-tools 2.13 - No=
rdicit=E9.
This release addresses a number of issues listed below.

2021-12-17 lttng-tools 2.13.2 (National Ugly Christmas Sweater Day)
	* Validate channel context mismatch across UST applications
	* Fix: relayd: compare viewer chunks by ID rather than address
	* Fix: relayd: live: erroneous message timestamp observed from live view=
er
	* Fix: relayd comm: improperly packed rotate streams command header
	* Test: snapshot after regenerate metadata
	* Fix: ust-consumer: segfault on snapshot after regenerate metadata
	* lttng: list valid condition / action names if missing or unknown
	* lttng: mention argument number on unknown action / condition name
	* lttng: fix argument numbers in add-trigger error messages
	* argpar-utils: tweak unknown option error message
	* argpar: sync with upstream - adjust to iterator API
	* common: move append_str to string-utils
	* lttng-create(1): specify that `--shm-path` only applies to UST channel=
s
	* Fix: sessiond: action-executor: misquoted strings in logging
	* Tests: live kernel: no plan printed when non-root
	* Fix: sessiond: assert on lttng_ht_add_unique_str on ltt_sessions_ht_by=
_name
	* Fix: sessiond: snapshot: leak of trace chunk
	* Fix: test: use BABELTRACE_BIN instead of babeltrace
	* Fix: action executor: ref count imbalance for session object
	* Fix: relayd: `!vsession->current_trace_chunk` assertion failed
	* Fix: tests: fix unused-but-set warning in test_fd_tracker.c
	* Fix: sessiond: fix possible buffer overflow warning
	* Fix: tests: app unregistering is not guaranteed by app lifetime
	* Fix: lttng-ctl: tracing_group memory leaks
	* Fix: use <unistd.h> instead of <sys/unistd.h>
	* Fix: Tests: unchecked `close()` return value
	* Fix: relayd: live: mishandled initial null trace chunk
	* Fix: configure.ac: reporting SDT uprobe as a UST feature
	* Fix: Tests: leaking epoll fd
	* Typo: occurences -> occurrences

As always, please report any issue you may encounter to bugs.lttng.org
or on this mailing list.

Project website: https://lttng.org

Download link:
https://lttng.org/files/lttng-tools/lttng-tools-2.13.2.tar.bz2

GPG signature:
https://lttng.org/files/lttng-tools/lttng-tools-2.13.2.tar.bz2.asc
