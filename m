Return-Path: <linux-trace-users-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B3F6C433F5
	for <linux-trace-users@archiver.kernel.org>; Mon, 28 Mar 2022 18:40:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242913AbiC1Smd (ORCPT
        <rfc822;linux-trace-users@archiver.kernel.org>);
        Mon, 28 Mar 2022 14:42:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58328 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234951AbiC1Smc (ORCPT
        <rfc822;linux-trace-users@vger.kernel.org>);
        Mon, 28 Mar 2022 14:42:32 -0400
Received: from mail.efficios.com (mail.efficios.com [167.114.26.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 97CBD63511
        for <linux-trace-users@vger.kernel.org>; Mon, 28 Mar 2022 11:40:50 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
        by mail.efficios.com (Postfix) with ESMTP id 04B403FB51A;
        Mon, 28 Mar 2022 14:40:50 -0400 (EDT)
Received: from mail.efficios.com ([127.0.0.1])
        by localhost (mail03.efficios.com [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id gwDKu693KqJH; Mon, 28 Mar 2022 14:40:49 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
        by mail.efficios.com (Postfix) with ESMTP id 7BFAD3FB519;
        Mon, 28 Mar 2022 14:40:49 -0400 (EDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.efficios.com 7BFAD3FB519
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=efficios.com;
        s=default; t=1648492849;
        bh=brZ08sgLLs5TGhAYp8ngm34ZEiavbVkoPWCsU1i+A5s=;
        h=Date:From:To:Message-ID:MIME-Version;
        b=QasDnBTZ05LTXokHzWoCpndBMVPn1IcTqQql0SaK8qFCdqc6cKi2HOx43QQQOUZoG
         YOPvqwiO1k5bWCh82k6iM7T4HLCODKhi5qWH7fihgDbnB7B8KYBouXtif5bd66t1pQ
         L4qGt6AFpMXMKVTdvLCIjs4+94EvKFbvhZ5mSmkoP9fmQ+ScoWe9ur8azukwvD89XV
         M4+YNm0MVRQDA8wVtK6ClRh0HoCl3WfPl+W+k61BbS6CO1Ev1U3Dk4kOCJpHGHkIo7
         0RXvHoA9zcne/88K7vCqdLoZyNa94NGtsvyETywXU3Kgn2/h9T/QHDgme7t35das4i
         shoBKGHsTAB3A==
X-Virus-Scanned: amavisd-new at efficios.com
Received: from mail.efficios.com ([127.0.0.1])
        by localhost (mail03.efficios.com [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id 7e9PqeqEKrBD; Mon, 28 Mar 2022 14:40:49 -0400 (EDT)
Received: from carbonara (192-222-180-24.qc.cable.ebox.net [192.222.180.24])
        by mail.efficios.com (Postfix) with ESMTPSA id 5E9683FB063;
        Mon, 28 Mar 2022 14:40:49 -0400 (EDT)
Date:   Mon, 28 Mar 2022 14:40:49 -0400
From:   =?iso-8859-1?Q?J=E9r=E9mie?= Galarneau 
        <jeremie.galarneau@efficios.com>
To:     lttng-dev@lists.lttng.org
Cc:     diamon-discuss <diamon-discuss@lists.linuxfoundation.org>,
        linux-trace-users <linux-trace-users@vger.kernel.org>
Subject: [RELEASE] LTTng-tools 2.12.9 - (Ta) Meilleure
Message-ID: <YkIBMfCWRUTdQn3D@carbonara>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-trace-users.vger.kernel.org>
X-Mailing-List: linux-trace-users@vger.kernel.org

Hi all,

We have just released the ninth bug-fix release of LTTng-tools 2.12 - (Ta)
Meilleure. This release addresses a number of issues listed below.

2022-03-28 lttng-tools 2.12.9 (National Hot Tub Day)
	* Fix: lttng-elf: wrong error label used by error path
	* Fix: use the correct endian compat macros
	* Fix: lttng-elf: untrusted entry size divisor
	* Fix: event: erroneous bound check on perf counter name size
	* Fix: relayd: missing session unlock on error path
	* fix: warning '-Wstringop-truncation' with GCC 11.2
	* Add Log4j 2.x agent tests for the 'log4j' domain
	* Fix: relayd: session id is ignored by 2.11+ create session command
	* Fix: consumerd: use-after-free of metadata bucket
	* Fix: ust-consumerd: leak of stream control structure
	* Fix: liblttng-ctl: erroneous flat size computation
	* Build fix: relayd: mismatching function signatures
	* Build fix: use of mutable keyword in C file
	* Fix: relayd: connection abruptly closed on viewer stream creation failure
	* Fix: relayd: live client fails on clear of multi-domain session
	* Tests: fix: select_poll_epoll: test assumes epoll fd value
	* Fix: rotation: hang on destroy when using scheduled rotation based on timer
	* Fix: consumerd: fd still open after `lttng snapshot record` returns
	* Fix: event: unchecked return value for lttng_strncpy
	* Fix: event: format specifier for ssize_t
	* Fix: sessiond: lttng_channel object is not reclaimed
	* Fix: common: local_attr might leak
	* Fix: session: end goto label used for error path
	* Fix: ser/des: missing null terminator on payload append
	* Fix: test: test plan/skip must come after TAP initialization
	* Fix: test: missing test plan for non-x86/arm platforms (i.e powerpc)
	* Fix: liblttng-ctl comm: lttng_event_field is not packed
	* Fix: liblttng-ctl comm: lttng_event_context is not packed
	* Fix: liblttng-ctl comm: lttng_event is not packed
	* libcommon: move event.c to libcommon-lgpl
	* Fix: liblttng-ctl comm: lttng_channel is not packed
	* Fix: lttng-ctl: erroneous uses of LTTNG_PACKED
	* Backport: lttng_buffer_view_is_valid, lttng_buffer_view_contains_string
	* Fix: conversion from KB to bytes overflow on arm32
	* Fix: Unexpected payload size in cmd_recv_stream_2_11
	* Tests: add kernel test into the `make check` test suite.

As always, please report any issue you may encounter to bugs.lttng.org
or on this mailing list.

Project website: https://lttng.org

Download link:
https://lttng.org/files/lttng-tools/lttng-tools-2.12.9.tar.bz2

GPG signature:
https://lttng.org/files/lttng-tools/lttng-tools-2.12.9.tar.bz2.asc
