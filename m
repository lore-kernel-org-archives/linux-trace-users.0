Return-Path: <linux-trace-users-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FD79C433EF
	for <linux-trace-users@archiver.kernel.org>; Tue, 19 Oct 2021 21:13:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 44C8A60F8F
	for <linux-trace-users@archiver.kernel.org>; Tue, 19 Oct 2021 21:13:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229657AbhJSVPs (ORCPT
        <rfc822;linux-trace-users@archiver.kernel.org>);
        Tue, 19 Oct 2021 17:15:48 -0400
Received: from mail.efficios.com ([167.114.26.124]:51728 "EHLO
        mail.efficios.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229603AbhJSVPp (ORCPT
        <rfc822;linux-trace-users@vger.kernel.org>);
        Tue, 19 Oct 2021 17:15:45 -0400
Received: from localhost (localhost [127.0.0.1])
        by mail.efficios.com (Postfix) with ESMTP id 0386038DFEC;
        Tue, 19 Oct 2021 17:13:32 -0400 (EDT)
Received: from mail.efficios.com ([127.0.0.1])
        by localhost (mail03.efficios.com [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id Q66ukc8qM8sP; Tue, 19 Oct 2021 17:13:31 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
        by mail.efficios.com (Postfix) with ESMTP id BEEFE38E3B4;
        Tue, 19 Oct 2021 17:13:31 -0400 (EDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.efficios.com BEEFE38E3B4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=efficios.com;
        s=default; t=1634678011;
        bh=XjrW5KftNb0Dv6LCIF9adAOPyno8/pQ4jD2Ju6fA7lw=;
        h=Date:From:To:Message-ID:MIME-Version;
        b=CdLR1uq7LDHDiN8XWSDe2ZJTzRViYQgfS7g1pmBNtqtFl5dBL+a1LOt0Ymbsb7ARR
         qNriRK88v1aq1SxmJpdNE2JUlKGwlz6gU+3kKUAgN/23rRdJCeNf5OV9U0NO1xUtAS
         i0219oLxR9V5RQrgOluo8lbdXf5MTAwpUhssL/5LvhUP6Ephq3JD9YfW6hjD7RXBOr
         RPyIYRc1W08nIldv7NY/eRgTEwhOzYH43qeIm9gE1NAn8pVXUAS52YwAbYhU4dnREV
         D8Jp31jWwmj/bjVtKyFpz3rbqnOPxI4R3mJUy8FWJxKpo/QREnZRa6EvwBysGoqsqh
         UlRB8w8/Q4+BQ==
X-Virus-Scanned: amavisd-new at efficios.com
Received: from mail.efficios.com ([127.0.0.1])
        by localhost (mail03.efficios.com [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id aQr0xKhq5bZb; Tue, 19 Oct 2021 17:13:31 -0400 (EDT)
Received: from mail03.efficios.com (mail03.efficios.com [167.114.26.124])
        by mail.efficios.com (Postfix) with ESMTP id B657F38E32E;
        Tue, 19 Oct 2021 17:13:31 -0400 (EDT)
Date:   Tue, 19 Oct 2021 17:13:31 -0400 (EDT)
From:   =?utf-8?B?SsOpcsOpbWll?= Galarneau 
        <jeremie.galarneau@efficios.com>
To:     lttng-dev <lttng-dev@lists.lttng.org>
Cc:     diamon-discuss <diamon-discuss@lists.linuxfoundation.org>,
        linux-trace-users <linux-trace-users@vger.kernel.org>
Message-ID: <1608072864.21396.1634678011737.JavaMail.zimbra@efficios.com>
Subject: [RELEASE] LTTng-tools 2.12.6 - (Ta) Meilleure
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Originating-IP: [167.114.26.124]
X-Mailer: Zimbra 8.8.15_GA_4156 (ZimbraWebClient - GC95 (Linux)/8.8.15_GA_4156)
Thread-Index: qP5k52t409NrIJ6yZg8s/9nd0nGbtw==
Thread-Topic: LTTng-tools 2.12.6 - (Ta) Meilleure
Precedence: bulk
List-ID: <linux-trace-users.vger.kernel.org>
X-Mailing-List: linux-trace-users@vger.kernel.org

Hi all, 

We have just released the sixth bug-fix release of LTTng-tools 2.12 - (Ta) 
Meilleure. This release addresses a number of issues listed below. 

2021-10-18 lttng-tools 2.12.6 (National Chocolate Cupcake Day) 
* Fix: sessiond: previously created channel cannot be enabled 
* Fix: ust: app stuck on recv message during UST comm timeout scenario 
* Fix: ust: UST communication can return -EAGAIN 
* Fix: ust: segfault on lttng start on filter bytecode copy 
* Build fix: Missing message in LTTNG_DEPRECATED invocation 
* include: remove spurious spaces in condition/session-rotation.h 
* tests: fix header of regression/ust/getcpu-override/run-getcpu-override 
* fix: wrong define used for GCC version check 
* Fix: userspace-probe: unreported error on string copy error 
* Fix: userspace-probe: truncating binary path for SDT 
* Fix: statements with side-effects in assert statements 
* Fix: lttng_trace_archive_location_serialize is called on freed memory 
* Fix: sessiond: ust session is inactive during ust_app_global_update 
* Fix: Tests: race condition in test_ns_contexts_change 
* Fix: Tests: race condition in test_event_tracker 
* Fix: man: lttng-rotate: trace file count/size limitation does not apply 

As always, please report any issue you may encounter to bugs.lttng.org 
or on this mailing list. 

Project website: https://lttng.org 

Download link: 
https://lttng.org/files/lttng-tools/lttng-tools-2.12.6.tar.bz2 

GPG signature: 
https://lttng.org/files/lttng-tools/lttng-tools-2.12.6.tar.bz2.asc
