Return-Path: <linux-trace-users-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1B1CC433F5
	for <linux-trace-users@archiver.kernel.org>; Fri, 17 Dec 2021 19:03:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240212AbhLQTDH (ORCPT
        <rfc822;linux-trace-users@archiver.kernel.org>);
        Fri, 17 Dec 2021 14:03:07 -0500
Received: from mail.efficios.com ([167.114.26.124]:53950 "EHLO
        mail.efficios.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235807AbhLQTDH (ORCPT
        <rfc822;linux-trace-users@vger.kernel.org>);
        Fri, 17 Dec 2021 14:03:07 -0500
Received: from localhost (localhost [127.0.0.1])
        by mail.efficios.com (Postfix) with ESMTP id CC3DD3C2604;
        Fri, 17 Dec 2021 14:03:06 -0500 (EST)
Received: from mail.efficios.com ([127.0.0.1])
        by localhost (mail03.efficios.com [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id UWG1UnloVw-Z; Fri, 17 Dec 2021 14:03:06 -0500 (EST)
Received: from localhost (localhost [127.0.0.1])
        by mail.efficios.com (Postfix) with ESMTP id 617563C2339;
        Fri, 17 Dec 2021 14:03:06 -0500 (EST)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.efficios.com 617563C2339
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=efficios.com;
        s=default; t=1639767786;
        bh=qwd/Bo5TN76rWC0g9X+lTf40xwNdScuXASiOtiK5Ev4=;
        h=Date:From:To:Message-ID:MIME-Version;
        b=p45JfRfC9w9UQ0RjP63fEGh/uM45OaJLxLSPtRNTOJHREPfflluO5Eb8YmOaLj5hc
         nZJmpehioY5GmavWAwchhNuH+mnN5EfMMzk4abAvYzks+f+pLFpo+baUMzOoH5+V8g
         UivtTxnf0loNjmsCoXaJAa6wHHKZrK6zeDhy2TKn3pXRKcGLkBr6G+lSmlzvhrm3Mi
         FE4UCC70z+vyxXXrTQAP8jHxuxeVWCqlEV+DvjI62BUrzNkaVQj50qpsr1kWOh6Bfm
         ss9zwngB413DtWZFCcCESw7qcmjOTlH6gW9zjrzoWcxFDQWJJR6+uCkanVLyNlBmjf
         WRcXKqsb9Rwww==
X-Virus-Scanned: amavisd-new at efficios.com
Received: from mail.efficios.com ([127.0.0.1])
        by localhost (mail03.efficios.com [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id fffHH_yVda8l; Fri, 17 Dec 2021 14:03:06 -0500 (EST)
Received: from carbonara (unknown [107.159.88.171])
        by mail.efficios.com (Postfix) with ESMTPSA id 345423C2433;
        Fri, 17 Dec 2021 14:03:06 -0500 (EST)
Date:   Fri, 17 Dec 2021 14:03:05 -0500
From:   =?iso-8859-1?Q?J=E9r=E9mie?= Galarneau 
        <jeremie.galarneau@efficios.com>
To:     lttng-dev@lists.lttng.org
Cc:     diamon-discuss <diamon-discuss@lists.linuxfoundation.org>,
        linux-trace-users <linux-trace-users@vger.kernel.org>
Subject: [RELEASE] LTTng-tools 2.12.7 - (Ta) Meilleure
Message-ID: <Ybze6ZpA95wGqjUv@carbonara>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-trace-users.vger.kernel.org>
X-Mailing-List: linux-trace-users@vger.kernel.org

Hi all,

We have just released the seventh bug-fix release of LTTng-tools 2.12 - (Ta)
Meilleure. This release addresses a number of issues listed below.

2021-12-17 lttng-tools 2.12.7 (National Ugly Christmas Sweater Day)
	* Validate channel context mismatch across UST applications
	* Fix: relayd: compare viewer chunks by ID rather than address
	* Fix: relayd: live: erroneous message timestamp observed from live viewer
	* Fix: relayd comm: improperly packed rotate streams command header
	* test: snapshot after regenerate metadata
	* Fix: ust-consumer: segfault on snapshot after regenerate metadata
	* Tests: live kernel: no plan printed when non-root
	* Fix: sessiond: snapshot: leak of trace chunk
	* Fix: test: use BABELTRACE_BIN instead of babeltrace
	* Fix: relayd: `!vsession->current_trace_chunk` assertion failed
	* Fix: tests: fix unused-but-set warning in test_fd_tracker.c
	* Fix: sessiond: fix possible buffer overflow warning
	* Fix: lttng-ctl: tracing_group memory leaks
	* Fix: Tests: unchecked `close()` return value
	* Fix: relayd: live: mishandled initial null trace chunk
	* Fix: configure.ac: reporting SDT uprobe as a UST feature
	* Fix: Tests: leaking epoll fd

As always, please report any issue you may encounter to bugs.lttng.org
or on this mailing list.

Project website: https://lttng.org

Download link:
https://lttng.org/files/lttng-tools/lttng-tools-2.12.7.tar.bz2

GPG signature:
https://lttng.org/files/lttng-tools/lttng-tools-2.12.7.tar.bz2.asc
