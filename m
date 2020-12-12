Return-Path: <linux-trace-users-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB42AC4361B
	for <linux-trace-users@archiver.kernel.org>; Sat, 12 Dec 2020 04:38:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 86DF023158
	for <linux-trace-users@archiver.kernel.org>; Sat, 12 Dec 2020 04:38:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2407098AbgLLEh3 (ORCPT
        <rfc822;linux-trace-users@archiver.kernel.org>);
        Fri, 11 Dec 2020 23:37:29 -0500
Received: from userp2130.oracle.com ([156.151.31.86]:42640 "EHLO
        userp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391778AbgLLEhX (ORCPT
        <rfc822;linux-trace-users@vger.kernel.org>);
        Fri, 11 Dec 2020 23:37:23 -0500
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
        by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0BC4YkHh140349
        for <linux-trace-users@vger.kernel.org>; Sat, 12 Dec 2020 04:36:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=message-id : date :
 from : to : subject; s=corp-2020-01-29;
 bh=ZC+SelLCxKVxD3mYFCkOdT5rb2EodWIDBnBO4omqq7c=;
 b=r0DWFQ/3d97SG0z+r9bQAqOcpG/dfDA9fUWlYxIyj78vRTlNUEWXuUT53+tFm34k2vSF
 jLHx314ZkUUoZ+2lD8TdeDFP29qZTIBM7pUGoZqeqt7Dz91igH1kLKcEErOXlKaTF7u4
 1MCCqtjrQNdYpDOm/WgZEdQA2HScm6G/SeBlTVen0Skh7nkp4QzhjwadHZ0Q51BJeMw1
 1rW2TUfpr4ghaCfgzn7bXSGkML18nOiKjZRaB3zU4bDW1rBjbuPSb+HXwTzCh9MXyCQt
 c63yTVLks3Ht3REkvb1CJ7gaYLNXNYuPSjz0nbn+X/CaN0EZYWwYCD/ITrKJJp1mvqAh dQ== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
        by userp2130.oracle.com with ESMTP id 35cn9r03xd-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL)
        for <linux-trace-users@vger.kernel.org>; Sat, 12 Dec 2020 04:36:42 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
        by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0BC4Ox4n180243
        for <linux-trace-users@vger.kernel.org>; Sat, 12 Dec 2020 04:34:41 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
        by aserp3030.oracle.com with ESMTP id 35ckw8c749-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
        for <linux-trace-users@vger.kernel.org>; Sat, 12 Dec 2020 04:34:41 +0000
Received: from abhmp0004.oracle.com (abhmp0004.oracle.com [141.146.116.10])
        by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 0BC4YfR4013535
        for <linux-trace-users@vger.kernel.org>; Sat, 12 Dec 2020 04:34:41 GMT
Message-Id: <202012120434.0BC4YfR4013535@aserv0121.oracle.com>
Received: from localhost (/10.154.176.65)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Fri, 11 Dec 2020 20:34:41 -0800
Date:   Fri, 11 Dec 2020 23:34:38 -0500
From:   Kris Van Hees <kris.van.hees@oracle.com>
To:     linux-trace-users@vger.kernel.org
Subject: RELEASE: New version of DTrace for Linux
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9832 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 phishscore=0 suspectscore=0
 mlxscore=0 mlxlogscore=999 malwarescore=0 adultscore=1 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2012120034
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9832 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 mlxlogscore=999
 impostorscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0
 malwarescore=0 priorityscore=1501 phishscore=0 mlxscore=0 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012120035
Precedence: bulk
List-ID: <linux-trace-users.vger.kernel.org>
X-Mailing-List: linux-trace-users@vger.kernel.org

I am happy to announce the availability of the latest development version of
DTrace for Linux (2.0.0-1.4).

This new version is based on BPF and other Linux kernel tracing features and
is implemented entirely as a userspace application.

The functionality is still limited in comparison to the kernel module based
version of DTrace for Linux (currently at version 1.2.1-1).  Development
continues in an incremental fashion to make the full feature set of DTrace
available using existing kernel features.

WHERE TO FIND IT?

The new version of DTrace for Linux is available at:
	https://github.com/oracle/dtrace-utils/tree/2.0-branch-dev

The most recent release tag is 2.0.0-1.4.

FEATURES

  - BEGIN and END probe (with full support for the expected semantics).
  - Function Boundary Tracing (FBT) probes.
  - System call entry and exit probes.
  - Timer-based profile-* and tick-* probes.
  - Statically Defined Tracing (SDT) probes for kernel tracepoints.
  - [NEW] Aggregated data collection support.
  - [NEW] Aggregation functions: avg, count, llquantize, lquantize, max, min,
    quantize, stddev, and sum.
  - [NEW] Pretty-printing for aggregations using the printa() action.
  - Direct compilation of D source code into BPF programs.
  - Efficient use of pre-compiled BPF functions for library functions.
  - BPF program linking of dynamically generated code and pre-compiled code
    to facilitate code sharing and code re-use.
  - Integrated disassembler for generated BPF code at the clause and program
    level (-S in combination with the new -xdisasm=# option).
  - Improved trace data buffer handling based on memory mapped perf event
    ring-buffers.
  - Deferred creation of kernel level probes.  Listing available probes does
    not require them to be created at the kernel level.

DEPENDENCIES

DTrace for Linux depends on libctf (part of newer binutils) -or- libdtrace-ctf.
While libctf is preferred, building against libdtrace-ctf is fully supported.
It can be found at:
	https://github.com/oracle/libdtrace-ctf

DTrace for Linux makes use of BPF library functions that are compiled at build
time.  It depends on BPF support in GCC and binutils to generate the
pre-compiled BPF function library.

DTrace for Linux makes use of 3 additional features that are not commonly
available in the Linux kernel:

  - CTF data generation at compile time: this provides important datatype
    information for kernel and kernel module symbols.

  - waitfd() system call: this provides a mechanism to monitor for state
    changes of processes that are being traced.

  - /proc/kallsyms module grouping support: this adds annotation with module
    names to all symbols that are part of a kernel module even if the module
    is configured to be compiled into the kernel proper.  This allows for
    consistent ways to refer to probes by module and function (or probe) name.

These additional support features for tracing are available at:
	https://github.com/oracle/dtrace-linux-kernel/tree/v2/5.8.1

Please consider joining our development list: dtrace-devel@oss.oracle.com

	Enjoy!

	Kris
