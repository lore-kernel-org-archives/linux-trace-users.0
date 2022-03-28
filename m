Return-Path: <linux-trace-users-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B598C433FE
	for <linux-trace-users@archiver.kernel.org>; Mon, 28 Mar 2022 18:38:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245266AbiC1Sk0 (ORCPT
        <rfc822;linux-trace-users@archiver.kernel.org>);
        Mon, 28 Mar 2022 14:40:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245262AbiC1SkY (ORCPT
        <rfc822;linux-trace-users@vger.kernel.org>);
        Mon, 28 Mar 2022 14:40:24 -0400
Received: from mail.efficios.com (mail.efficios.com [167.114.26.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2035262C84
        for <linux-trace-users@vger.kernel.org>; Mon, 28 Mar 2022 11:38:41 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
        by mail.efficios.com (Postfix) with ESMTP id 293903FB1E3;
        Mon, 28 Mar 2022 14:38:41 -0400 (EDT)
Received: from mail.efficios.com ([127.0.0.1])
        by localhost (mail03.efficios.com [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id j3teuTtbCbZD; Mon, 28 Mar 2022 14:38:40 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
        by mail.efficios.com (Postfix) with ESMTP id 853B13FB33C;
        Mon, 28 Mar 2022 14:38:40 -0400 (EDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.efficios.com 853B13FB33C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=efficios.com;
        s=default; t=1648492720;
        bh=rVCBNmop3iRsX562IcAnf/ywmlTvYC3DatjujSEPS4U=;
        h=Date:From:To:Message-ID:MIME-Version;
        b=pxzCB5FEtU9LPPJMdD524Zy7N+CPkHJ4C6VNj5k45LzniwQdXk6GkQPljgcDyG6Io
         7ZIw+5EAhskSfJRLK6vzVU96OlKvCgLwaYN+KfZRfYJQdQQEz/LUW0X3t6jgbu1fRM
         YsK9fJMODFhKRUWTHJdenno9xdp660q1c4uNxLelmGiC+d8Wz2Eu4PdSwLPMCoyTwz
         2iRd299UAY4ZVSlEj0GP41H4iQJR/fOSqnmaaqshrg2pMfqqbVO3YfhB6VQ+P07d+6
         PPCVgBT60b8xGoccyicAk7s3RMcDVMi1DypF9I8/ScWn9yml0nOzOGCQbsg7BUNj9S
         /whdRUvG3KXCw==
X-Virus-Scanned: amavisd-new at efficios.com
Received: from mail.efficios.com ([127.0.0.1])
        by localhost (mail03.efficios.com [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id 4MHL4H4TQyuq; Mon, 28 Mar 2022 14:38:40 -0400 (EDT)
Received: from carbonara (192-222-180-24.qc.cable.ebox.net [192.222.180.24])
        by mail.efficios.com (Postfix) with ESMTPSA id 5C1D83FB423;
        Mon, 28 Mar 2022 14:38:40 -0400 (EDT)
Date:   Mon, 28 Mar 2022 14:38:40 -0400
From:   =?iso-8859-1?Q?J=E9r=E9mie?= Galarneau 
        <jeremie.galarneau@efficios.com>
To:     lttng-dev@lists.lttng.org
Cc:     linux-trace-users <linux-trace-users@vger.kernel.org>,
        diamon-discuss <diamon-discuss@lists.linuxfoundation.org>
Subject: [RELEASE] LTTng-tools =?iso-8859-1?B?Mi4x?=
 =?iso-8859-1?Q?3=2E5_-_Nordicit=E9?=
Message-ID: <YkIAsNVc2xq0hxZM@carbonara>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-trace-users.vger.kernel.org>
X-Mailing-List: linux-trace-users@vger.kernel.org

Hi all,

We have just released the fifth bug-fix release of LTTng-tools 2.13 - Nor=
dicit=E9.
This release addresses a number of issues listed below.

2022-03-28 lttng-tools 2.13.5 (National Hot Tub Day)
	* Fix: doc: action: wrong function documented for action_list destroy
	* Fix: lttng-elf: wrong error label used by error path
	* Fix: use the correct endian compat macros
	* Fix: tests: uninitialized lttng_payload
	* Fix: sessiond: ust-app: uninitialized name logged on stream copy failu=
re
	* Fix: lttng-elf: untrusted entry size divisor
	* Fix: event: erroneous bound check on perf counter name size
	* Fix: sessiond: event name length check is too strict
	* Fix: relayd: missing session unlock on error path
	* fix: warning '-Wstringop-truncation' with GCC 11.2
	* Add Log4j 2.x agent tests for the 'log4j' domain
	* Fix: relayd: session id is ignored by 2.11+ create session command
	* Build fix: consumer: aggregate initialization isn't supported
	* Fix: consumerd: use-after-free of metadata bucket
	* Fix: ust-consumerd: leak of stream control structure
	* Fix: liblttng-ctl: erroneous flat size computation
	* Fix: test: babeltrace1 python bindings exposes `op_enum` as a string
	* Build fix: relayd: mismatching function signatures
	* Build fix: use of mutable keyword in C file
	* Fix: relayd: connection abruptly closed on viewer stream creation fail=
ure
	* Fix: relayd: live client fails on clear of multi-domain session
	* fix: msgpack requires limits.h for UINT_MAX
	* Fix: liblttng-ctl: hide symbols introduced by packing fixes
	* Fix: rotation: hang on destroy when using scheduled rotation based on =
timer
	* Fix: consumerd: fd still open after `lttng snapshot record` returns
	* Fix: event: unchecked return value for lttng_strncpy
	* Fix: event: format specifier for ssize_t
	* Fix: sessiond: use after free
	* Fix: sessiond: `break` used instead of `goto`
	* Fix: sessiond: lttng_channel object is not reclaimed
	* Fix: common: local_attr might leak
	* Fix: session: end goto label used for error path
	* Fix: sessiond: event, filter expression, bytecode, exclusions might le=
ak
	* Fix: lttng-sessiond: event_context might leak
	* Fix: lttng-ctl: uninitialized pointer read
	* Fix: ser/des: missing null terminator on payload append
	* Fix: test: test plan/skip must come after TAP initialization
	* Fix: test: missing test plan for non-x86/arm platforms (i.e powerpc)
	* Fix: remove debugging output
	* Fix: tests: test_kernel: break should only be used in loops
	* Fix: tools/snapshots/test_kernel flaky test
	* Tests: Fix: test_list_triggers_cli: support in-kernel builtin lttng-mo=
dules
	* Fix: lttng: truncated addresses and offsets on 32-bit builds
	* Fix: liblttng-ctl comm: lttng_event_field is not packed
	* Fix: liblttng-ctl comm: lttng_event_context is not packed
	* Fix: liblttng-ctl comm: lttng_event is not packed
	* libcommon: move event.c to libcommon-lgpl
	* Fix: liblttng-ctl comm: lttng_channel is not packed
	* Fix: conversion from KB to bytes overflow on arm32
	* Fix: Unexpected payload size in cmd_recv_stream_2_11
	* Fix: liblttng-ctl: missing index allocator symbols
	* Fix: lttng-sessiond: null pointer used to log session name
	* Tests: add kernel test into the `make check` test suite.
	* Build dist fix: some kernel tests are not distributed
	* Tests: fix: test_kernel_function: erroneous test count
	* Tests: fix: test_kernel_function: event name mismatch
	* Tests: fix: select_poll_epoll: test assumes epoll fd value
	* Fix: missing RCU read side critical sections

As always, please report any issue you may encounter to bugs.lttng.org
or on this mailing list.

Project website: https://lttng.org

Download link:
https://lttng.org/files/lttng-tools/lttng-tools-2.13.5.tar.bz2

GPG signature:
https://lttng.org/files/lttng-tools/lttng-tools-2.13.5.tar.bz2.asc
