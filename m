Return-Path: <linux-trace-users-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 863ACEB64D7
	for <linux-trace-users@archiver.kernel.org>; Fri, 30 Jun 2023 17:17:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233049AbjF3RRj (ORCPT
        <rfc822;linux-trace-users@archiver.kernel.org>);
        Fri, 30 Jun 2023 13:17:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37956 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233003AbjF3RRY (ORCPT
        <rfc822;linux-trace-users@vger.kernel.org>);
        Fri, 30 Jun 2023 13:17:24 -0400
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CAD7744B1
        for <linux-trace-users@vger.kernel.org>; Fri, 30 Jun 2023 10:17:02 -0700 (PDT)
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 35UGiGje013092
        for <linux-trace-users@vger.kernel.org>; Fri, 30 Jun 2023 17:17:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to :
 subject : message-id; s=corp-2023-03-30;
 bh=qxDy7uIbRISRtfvzTmSMeFWQSnd/LXaewkmHbSWvaUk=;
 b=OO79i7s4TOQ1uyUYwO/4VA3O+cZd1DTVdPg7CwJRWb6j7tlhhn/P+UDxUTOe7Wwwfmb4
 6PFKPl69tji7t5H8Rx2DNsJ0twiWky8GGh2rudT6ICF/YhfG3JYwZ1WKipwN6lAGdpAY
 B8qPeZ9Ma+7HKNEyub8or6XyeNSiSPhZ8owSijqGk4hzO+Cp7+MEFAAb/daWDKq/acBz
 hbkQlDCzkvUIsgtAqa5TdBouWcX6HpjMzhdUOgdC2Q2D2DFtrEKQdAG//nCLEKGmrTZG
 E/GwcEHsNSZ44Ngr3G5TpkFnKo+bo/0Pv6vjqz9y9IeLAYJYEgOLxR6MwjRnDJ+eMguF aQ== 
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
        by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3rdrcah4mg-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
        for <linux-trace-users@vger.kernel.org>; Fri, 30 Jun 2023 17:17:02 +0000
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
        by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 35UGu5XV038226
        for <linux-trace-users@vger.kernel.org>; Fri, 30 Jun 2023 17:17:01 GMT
Received: from localhost (dhcp-10-154-107-150.vpn.oracle.com [10.154.107.150])
        by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3rdpxfnjvc-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO)
        for <linux-trace-users@vger.kernel.org>; Fri, 30 Jun 2023 17:17:00 +0000
Date:   Fri, 30 Jun 2023 13:16:59 -0400
From:   Kris Van Hees <kris.van.hees@oracle.com>
To:     linux-trace-users@vger.kernel.org
Subject: [RELEASE] DTrace 2.0.0-1.13.1
Message-ID: <3rdpxfnjvc-1@iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com>
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-30_10,2023-06-30_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 spamscore=0
 mlxlogscore=730 malwarescore=0 phishscore=0 bulkscore=0 suspectscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2306300149
X-Proofpoint-ORIG-GUID: zqMsoSbZJYGPF2Kxnu5fqMkuU394CSOZ
X-Proofpoint-GUID: zqMsoSbZJYGPF2Kxnu5fqMkuU394CSOZ
Precedence: bulk
List-ID: <linux-trace-users.vger.kernel.org>
X-Mailing-List: linux-trace-users@vger.kernel.org

We are happy to announce the availability of the latest development version
of DTrace for Linux (2.0.0-1.13.1).

This new version is based on BPF and other Linux kernel tracing features and
is implemented entirely as a userspace application.

The functionality is close to being feature-complete in comparison with the
kernel moduule based version of DTrace for Linux (version 1.2.1-1). Development
continues in an incremental fashion to make the full feature set of DTrace
available using existing kernel features.

WHERE TO FIND IT?

The new version of DTrace for Linux is available at:

    https://github.com/oracle/dtrace-utils/tree/2.0-branch-dev

The main development branch for DTrace for Linux is at:

    https://github.com/oracle/dtrace-utils/tree/dev

The most recent release tag is 2.0.0-1.13.1.

FEATURES

  - Providers:
      + dtrace: BEGIN, END, and ERROR probes
      + fbt: Function Boundary Tracing (FBT) probes
      + sycall: System call entry and exit probes
      + profile: Timer-based profile-* and tick-* probes
      + sdt: Statically Defined Tracing (SDT) probes for kernel tracepoints
      + pid: Userspace function boundary tracing
      + usdt: Userspace Statically Defined Tracing (USDT) probes
      + cpc: CPU Performacne Counter probes
      + rawtp: SDT-style probes for kernel tracepoints with access to raw
               (untranslated) tracepoint arguments
      + proc: Process lifecycle related probes

      + [NEW] lockstat: Locking realted probes
      + [NEW] proc: signal-clear probe
      * [NEW] sched: CPU scheduling probes [partial implementation]
      + [NEW] usdt: is-enabled probes

  - Aggregations:
      + Regular and indexed aggregations
      + Aggregation functions: avg, count, llquantize, lquantize, max, min,
                               quantize, stddev, and sum.
      + Aggregation actions: clear, normalize, normalize, printa

  - Speculative tracing:
      + Functions: speculation, speculate, commit, and discard

  - Variables:
      + Global variables
      + Thread-Local Storage (TLS) variables
      + Clause-local variables
      + Associative arrays for global and TLS variables
      + Built-in: arg0 - arg9, args[], caller, curcpu, curthread, epid, errno,
        execname, gid, id, pid, ppid, probefunc, probemod, probename,
        probeprov, stackdepth, tid, timestamp, ucaller, uid, ustackdepth,
        walltimestamp

      + [NEW] Built-in: uregs[] for older kernels
      + [NEW] Full support for NULL-strings

  - Actions:
      + exit, freopen, ftruncate, mod, printa, printf, raise, setopt, stack,
        sym, system, trace, tracemem, uaddr, umod, ustack, usym

  - Subroutines:
      + alloca, basename, bcopy, copyin, copyinstr, copyinto, copyout,
        copyoutstr, dirname, getmajor, getminor, htonl, htonll, htons, index,
        inet_ntoa, lltostr, mutex_owned, mutex_owner, mutex_type_adaptive,
        mutex_type_spin, ntohl, ntohll, ntohs, progenyof, rand, rindex,
        rw_iswriter, rw_read_held, rw_write_held, strchr, strjoin, strlen,
        strrchr, strstr, strtok, substr

  - Runtime features:
      + [NEW] Reporting of drop-counters for trace data that could not be
              recorded for the principal buffer, aggregation buffers, and
              speculation buffers.

  - BPF support:
      + Direct compilation of D source code into BPF programs.
      + Efficient use of pre-compiled BPF functions for library functions.
      + A bpflog option to request the BPF verifier log for loaded programs.
      + BPF program linking of dynamically generated code and pre-compiled
        code to facilitate code sharing and code re-use.
      + Improved integrated disassembler for generated BPF code at the clause
        and program level (-S in combination with the new -xdisasm=# option).
      + Improved trace data buffer handling based on memory mapped perf event
        ring-buffers.

  - Development and debugging:
      + Support to run dtrace under valgrind.

DEPENDENCIES

DTrace for Linux depends on libctf (part of newer binutils) -or-
libdtrace-ctf. While libctf is preferred, building against libdtrace-ctf is
fully supported. It can be found at:

    https://github.com/oracle/libdtrace-ctf

DTrace for Linux makes use of BPF library functions that are compiled at 
build time. It depends on BPF support in GCC and binutils to generate the
pre-compiled BPF function library.

DTrace for Linux makes use of 3 additional features that are not commonly
available in the Linux kernel:

  - CTF data generation at compile time: this provides important datatype
    information for kernel and kernel module symbols.

  - waitfd() system call: this provides a mechanism to monitor for state
    changes of processes that are being traced.

  - /proc/kallsyms module grouping support: this adds annotation with module
    names to all symbols that are part of a kernel module even if the module
    is configured to be compiled into the kernel proper. This allows for
    consistent ways to refer to probes by module and function (or probe) name.

These additional support features for tracing are available at:

    https://github.com/oracle/dtrace-linux-kernel/tree/v2/6.1.8

Please consider joining our development list: dtrace-devel at oss.oracle.com

    Enjoy!
