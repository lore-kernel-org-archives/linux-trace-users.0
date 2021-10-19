Return-Path: <linux-trace-users-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1074CC433EF
	for <linux-trace-users@archiver.kernel.org>; Tue, 19 Oct 2021 21:13:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DE23560F8F
	for <linux-trace-users@archiver.kernel.org>; Tue, 19 Oct 2021 21:13:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229498AbhJSVPo (ORCPT
        <rfc822;linux-trace-users@archiver.kernel.org>);
        Tue, 19 Oct 2021 17:15:44 -0400
Received: from mail.efficios.com ([167.114.26.124]:51700 "EHLO
        mail.efficios.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229491AbhJSVPn (ORCPT
        <rfc822;linux-trace-users@vger.kernel.org>);
        Tue, 19 Oct 2021 17:15:43 -0400
Received: from localhost (localhost [127.0.0.1])
        by mail.efficios.com (Postfix) with ESMTP id 1AF2338E503;
        Tue, 19 Oct 2021 17:13:30 -0400 (EDT)
Received: from mail.efficios.com ([127.0.0.1])
        by localhost (mail03.efficios.com [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id sZWRxeE9KGUC; Tue, 19 Oct 2021 17:13:29 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
        by mail.efficios.com (Postfix) with ESMTP id 869E238E502;
        Tue, 19 Oct 2021 17:13:29 -0400 (EDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.efficios.com 869E238E502
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=efficios.com;
        s=default; t=1634678009;
        bh=HvT8EovTNI6nQ9RSJii0fGFeLhlmBNxLqkqsdOy/jtg=;
        h=Date:From:To:Message-ID:MIME-Version;
        b=qN0xv+ZsiAWa4bRZZPN7Jr7g6JFHrcdeBKdtQigB6T56Utggdo/atSp0qMqFkCpe2
         Qcwva8TthCAhuqi2yKiIxQC8DSNsHLfIVIIqGQ+e+x0SM6cF4yVErSlwILn4klij7V
         EOtn4n+CCL0L8cpy8tyBA34WO2+KN42z6dWMXEUw4IUoCVDb2aQfOExSI2FWUQhwsm
         NQUJDh6uuz70N38GHZkBrSI4fkVa54l6wUlpvpV3c8Vitd1w7lpt7PR70fZMPYp4fr
         t/VUJnK0p3fEcFBq7N+58lotFE15koMz9hfXBCB4xxlvcXB0QwTQG1kLZjf8dzVtoD
         n/5bYIZluG0ow==
X-Virus-Scanned: amavisd-new at efficios.com
Received: from mail.efficios.com ([127.0.0.1])
        by localhost (mail03.efficios.com [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id RXrMGJkFp8Qv; Tue, 19 Oct 2021 17:13:29 -0400 (EDT)
Received: from mail03.efficios.com (mail03.efficios.com [167.114.26.124])
        by mail.efficios.com (Postfix) with ESMTP id 7B1EE38E501;
        Tue, 19 Oct 2021 17:13:29 -0400 (EDT)
Date:   Tue, 19 Oct 2021 17:13:29 -0400 (EDT)
From:   =?utf-8?B?SsOpcsOpbWll?= Galarneau 
        <jeremie.galarneau@efficios.com>
To:     lttng-dev <lttng-dev@lists.lttng.org>
Cc:     diamon-discuss <diamon-discuss@lists.linuxfoundation.org>,
        linux-trace-users <linux-trace-users@vger.kernel.org>
Message-ID: <1790858757.21395.1634678009452.JavaMail.zimbra@efficios.com>
Subject: [RELEASE] LTTng-tools 2.11.8 - Lafontaine
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Originating-IP: [167.114.26.124]
X-Mailer: Zimbra 8.8.15_GA_4156 (ZimbraWebClient - GC95 (Linux)/8.8.15_GA_4156)
Thread-Index: gHgpWheTuGaoeqqfOAFvu91eb/lhiA==
Thread-Topic: LTTng-tools 2.11.8 - Lafontaine
Precedence: bulk
List-ID: <linux-trace-users.vger.kernel.org>
X-Mailing-List: linux-trace-users@vger.kernel.org

Hi all, 

We have just released the eighth and final bug-fix release of LTTng-tools 2.11 - 
Lafontaine. This release addresses the issues listed below. 

2021-10-18 lttng-tools 2.11.8 (National Chocolate Cupcake Day) 
* Fix: sessiond: previously created channel cannot be enabled 
* Fix: ust: app stuck on recv message during UST comm timeout scenario 
* Fix: ust: UST communication can return -EAGAIN 
* Fix: ust: segfault on lttng start on filter bytecode copy 
* Build fix: Missing message in LTTNG_DEPRECATED invocation 
* include: remove spurious spaces in condition/session-rotation.h 
* fix: wrong define used for GCC version check 
* Fix: userspace-probe: unreported error on string copy error 
* Fix: userspace-probe: truncating binary path for SDT 
* Fix: sessiond: ust session is inactive during ust_app_global_update 
* Fix: man: lttng-rotate: trace file count/size limitation does not apply 
* Fix: rotation client example: leak of handle on error 
* Fix: use of uninitialised bytes valgrind warning 
* Fix: bump minimal urcu dependency to 0.11 
* Fix: list_lttng_agent_events: unbalanced RCU read-side lock on error 
* Fix: consumer: unbalanced RCU read-side lock on error 

As always, please report any issue you may encounter to bugs.lttng.org 
or on this mailing list. 

Project website: https://lttng.org 

Download link: 
https://lttng.org/files/lttng-tools/lttng-tools-2.11.8.tar.bz2 

GPG signature: 
https://lttng.org/files/lttng-tools/lttng-tools-2.11.8.tar.bz2.asc
