Return-Path: <SRS0=ykZ6=D6=vger.kernel.org=linux-trace-users-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05C27C388F9
	for <linux-trace-users@archiver.kernel.org>; Fri, 23 Oct 2020 21:30:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 91A18208E4
	for <linux-trace-users@archiver.kernel.org>; Fri, 23 Oct 2020 21:29:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="SWJKyJ0P"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1756714AbgJWV37 (ORCPT
        <rfc822;linux-trace-users@archiver.kernel.org>);
        Fri, 23 Oct 2020 17:29:59 -0400
Received: from userp2120.oracle.com ([156.151.31.85]:53254 "EHLO
        userp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1756713AbgJWV37 (ORCPT
        <rfc822;linux-trace-users@vger.kernel.org>);
        Fri, 23 Oct 2020 17:29:59 -0400
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
        by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 09NLOcl3054430
        for <linux-trace-users@vger.kernel.org>; Fri, 23 Oct 2020 21:29:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to :
 subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=wwJM6qxSCwfZoLXHoHwDjJhuSthewGQlaIknEzykLrs=;
 b=SWJKyJ0P5gbbhKURvfZOA3xzskcWOK0KwNNJsaysvK2oTFkHKA5u1a/zn0WrE2EV8yXo
 7pQXAPVLX/QiPWFh6sMrZk8vwfHT9G9Sgm6oV88c69WhHa3B6RS2as+0G0oSLGZoRpoU
 9bUbYQub+Gw+AxfXZMTmRbt/jrHtLK9XVF8JEpQwuQ4Y/ivgNFeD8iyzZejOUdyXzviO
 JNcttrDKxTRAD2bpK08kVl/Uux6Yc+fxsgSuPisI3SyPc/zr47L3Nz1/nEZ6lRjWfPrR
 Zc7Gbs4ZcHhLTfCXwpl/88T6zenpxzMKa//D1R2bLU0hRlemnLyWbzYqnH/nJ+dZCXxz yg== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
        by userp2120.oracle.com with ESMTP id 34ak16wh00-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL)
        for <linux-trace-users@vger.kernel.org>; Fri, 23 Oct 2020 21:29:57 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
        by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 09NLPmJG034521
        for <linux-trace-users@vger.kernel.org>; Fri, 23 Oct 2020 21:29:56 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
        by aserp3020.oracle.com with ESMTP id 348ah2ecj8-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
        for <linux-trace-users@vger.kernel.org>; Fri, 23 Oct 2020 21:29:56 +0000
Received: from abhmp0013.oracle.com (abhmp0013.oracle.com [141.146.116.19])
        by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 09NLTupr005173
        for <linux-trace-users@vger.kernel.org>; Fri, 23 Oct 2020 21:29:56 GMT
Received: from localhost (/10.159.211.99)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Fri, 23 Oct 2020 14:29:55 -0700
Date:   Fri, 23 Oct 2020 17:29:52 -0400
From:   Kris Van Hees <kris.van.hees@oracle.com>
To:     linux-trace-users@vger.kernel.org
Subject: RELEASE: New version of DTrace for Linux
Message-ID: <20201023212952.GV21643@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9783 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=2 mlxscore=0 phishscore=0
 malwarescore=0 spamscore=0 suspectscore=0 bulkscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2010230131
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9783 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 phishscore=0
 priorityscore=1501 clxscore=1011 malwarescore=0 mlxscore=0 adultscore=0
 lowpriorityscore=0 impostorscore=0 spamscore=0 mlxlogscore=999
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2010230131
Precedence: bulk
List-ID: <linux-trace-users.vger.kernel.org>
X-Mailing-List: linux-trace-users@vger.kernel.org

I am happy to announce the availability of the latest development version of
DTrace for Linux (2.0.0-1.3).

This new version is based on BPF and other Linux kernel tracing features and
is implemented entirely as a userspace application.

The functionality is still limited in comparison to the kernel module based
version of DTrace for Linux (currently at version 1.2.1-1).  Development
continues in an incremental fashion to make the full feature set of DTrace
available using existing kernel features.

WHERE TO FIND IT?

The new version of DTrace for Linux is available at:
	https://github.com/oracle/dtrace-utils/tree/2.0-branch-dev

The most recent release tag is 2.0.0-1.3.

FEATURES

  - BEGIN and END probe (with full support for the expected semantics).
  - Function Boundary Tracing (FBT) probes.
  - System call entry and exit probes.
  - Timer-based profile-* and tick-* probes.
  - Statically Defined Tracing (SDT) probes for kernel tracepoints.
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
