Return-Path: <linux-trace-users-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73184C433EF
	for <linux-trace-users@archiver.kernel.org>; Fri, 10 Dec 2021 20:45:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232511AbhLJUtQ (ORCPT
        <rfc822;linux-trace-users@archiver.kernel.org>);
        Fri, 10 Dec 2021 15:49:16 -0500
Received: from mail.efficios.com ([167.114.26.124]:54258 "EHLO
        mail.efficios.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231685AbhLJUtP (ORCPT
        <rfc822;linux-trace-users@vger.kernel.org>);
        Fri, 10 Dec 2021 15:49:15 -0500
Received: from localhost (localhost [127.0.0.1])
        by mail.efficios.com (Postfix) with ESMTP id 19B943927D9;
        Fri, 10 Dec 2021 15:45:40 -0500 (EST)
Received: from mail.efficios.com ([127.0.0.1])
        by localhost (mail03.efficios.com [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id agyuk7p1VXmw; Fri, 10 Dec 2021 15:45:39 -0500 (EST)
Received: from localhost (localhost [127.0.0.1])
        by mail.efficios.com (Postfix) with ESMTP id 2609F3928D0;
        Fri, 10 Dec 2021 15:45:39 -0500 (EST)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.efficios.com 2609F3928D0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=efficios.com;
        s=default; t=1639169139;
        bh=96PzG0f2K2ZYvQViJnt4qmcH+8jusjsHwKU3YD7QShA=;
        h=Date:From:To:Message-ID:MIME-Version;
        b=FIfDhvNM2QeEJbD58fsAb4jmVwN4rwhLIU+T2+aJs7+97VtcgRkHRFXFRauCvoCKp
         +W8ufrepgvBY2Yy280hJUMXv18E2318Ku+6BkvofhOtSM8Pkzhm7PSZxHEipdH9qa0
         qbhbHPrZanv+hx3Sld56E41YSvEms4nFQ3i2gKpsVM3f/BY3C7II6cQfx8QPO629G6
         bkRPxlLladoozu42EQvmMDrBZAhk2ZbKZ8fbVnj2CQDIaHW2EXlynY60yDdadmtRc2
         wSvQWfH4PgJJc2RCxnDu2YaIIsShrUuHjQRyROvitO7w+H9r3koFYmjbxXW1nq//FB
         4NBJ83PdGZTiQ==
X-Virus-Scanned: amavisd-new at efficios.com
Received: from mail.efficios.com ([127.0.0.1])
        by localhost (mail03.efficios.com [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id lPglTssnjNj3; Fri, 10 Dec 2021 15:45:39 -0500 (EST)
Received: from mail03.efficios.com (mail03.efficios.com [167.114.26.124])
        by mail.efficios.com (Postfix) with ESMTP id 18C10392B27;
        Fri, 10 Dec 2021 15:45:39 -0500 (EST)
Date:   Fri, 10 Dec 2021 15:45:38 -0500 (EST)
From:   Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
To:     lttng-dev <lttng-dev@lists.lttng.org>
Cc:     diamon-discuss@lists.linuxfoundation.org,
        linux-trace-users@vger.kernel.org
Message-ID: <1697490258.28441.1639169138969.JavaMail.zimbra@efficios.com>
Subject: [RELEASE] LTTng-UST 2.13.1 (Linux user-space tracer)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Originating-IP: [167.114.26.124]
X-Mailer: Zimbra 8.8.15_GA_4173 (ZimbraWebClient - FF94 (Linux)/8.8.15_GA_4177)
Thread-Index: A/kqqja9BDVf/kUNVOsd4rXMEufssA==
Thread-Topic: LTTng-UST 2.13.1 (Linux user-space tracer)
Precedence: bulk
List-ID: <linux-trace-users.vger.kernel.org>
X-Mailing-List: linux-trace-users@vger.kernel.org

This 2.13.1 release of LTTng-UST is a bugfix-only release for various
shortcomings that were identified in the 2.13.0 release.

A few key highlights: the C++ support for building probe providers has
been improved, async-signal-safety of the close wrapper has been fixed,
pthread cancelstate in nested use scenarios is now properly handled.

2021-12-10 (Lost and Found Day) lttng-ust 2.13.1
        * Fix: ust-compiler: constructor/destructor build on g++ 4.8
        * ust-compiler: constructor/destructor whitespaces layout and macro dependency
        * Fix: ust-cancelstate: include string.h for strerror
        * Fix: libnuma is prepended to LIBS
        * fix: Allow disabling some abi compat tests
        * Fix: generate probe registration constructor as a C++ constuctor
        * Fix: nestable pthread cancelstate
        * Fix: abort on decrement_sem_count during concurrent tracing start and teardown
        * fix: allocating C++ compound literal on heap with Clang
        * Check for C++11 when building C++ probe providers
        * fix: liblttng-ust-fd async-signal-safe close()
        * tracepoints: print debug message when lttng-ust-tracepoint.so is not found
        * Fix: static_assert unavailable with glibc < 2.16
        * Fix: combined tracing of lttng-ust 2.12/2.13 generates corrupted traces
        * doc/man: Document LTTNG_UST_ABORT_ON_CRITICAL variable
        * fix: remove autoconf features default value in help message
        * Set git-review branch to stable-2.13
        * Fix: add extern "C" to two header files

Project website: https://lttng.org
Documentation: https://lttng.org/docs
Download link: https://lttng.org/download


-- 
Mathieu Desnoyers
EfficiOS Inc.
http://www.efficios.com
