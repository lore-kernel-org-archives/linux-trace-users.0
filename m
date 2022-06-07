Return-Path: <linux-trace-users-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16FFBC433EF
	for <linux-trace-users@archiver.kernel.org>; Tue,  7 Jun 2022 04:44:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236572AbiFGEos (ORCPT
        <rfc822;linux-trace-users@archiver.kernel.org>);
        Tue, 7 Jun 2022 00:44:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35302 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234619AbiFGEoq (ORCPT
        <rfc822;linux-trace-users@vger.kernel.org>);
        Tue, 7 Jun 2022 00:44:46 -0400
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 90E0A6EB36
        for <linux-trace-users@vger.kernel.org>; Mon,  6 Jun 2022 21:44:43 -0700 (PDT)
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 256NdFg7003622
        for <linux-trace-users@vger.kernel.org>; Tue, 7 Jun 2022 04:44:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to :
 subject : message-id : content-type : content-transfer-encoding :
 mime-version; s=corp-2021-07-09;
 bh=D1PW3AuTIsziKTClwCmQw1u0UEwx309Nr2Jh+tqgbZE=;
 b=AXPKPS4zd7S7n0b69CXCcMDDEMFi6ukQQRxs/aSlgxs5ngpcgLntG5brRevboY1m4Wwy
 GUchkIyEWnkZzbKixbl8tvtvJ/iLkEKEMt37TAivUgPsvDW8Ol6Dfkyl4eFPbolizl8A
 9xtLv9hJHU61kj1KnDvUAkNosWSuXCofbzBZLvIvDNfOleIgFfag/nUCCZsmUz4mw+8L
 zBVN271YjJShdI9Uqs1p6SPF2eWkBbkBZNikPhrsIlKxZ3NCZWTgqUjxHpmmi9MsJ6XK
 T+QR4WJ5KIfpmcSt0iOV/YRM/AvajDRVLM5cnPAfRqkuCbXAFd2w7TGhG7Izb3YSTIdD +Q== 
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
        by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3gfyekcm4s-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
        for <linux-trace-users@vger.kernel.org>; Tue, 07 Jun 2022 04:44:42 +0000
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
        by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.16.1.2/8.16.1.2) with SMTP id 2574PwUW001555
        for <linux-trace-users@vger.kernel.org>; Tue, 7 Jun 2022 04:44:42 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2170.outbound.protection.outlook.com [104.47.59.170])
        by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com with ESMTP id 3gfwu2919w-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
        for <linux-trace-users@vger.kernel.org>; Tue, 07 Jun 2022 04:44:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XafobhTAroLp1JR2XUm1aN/pbBYk4Sh3EdV7vzaaKaHKSWGyflwBHtLtmh5qga+gRjbuu5KnV0ggke3FaZZy/vv4MkqhwTPo+1O9F1B8c2Qq9gRjHIV9XVON8ZieujyMncU2ie5mMccJLk8/iQ3tSB5SXPPbMR1P0m4+8qds5d3NEsRdduA3cBJHYLhpwV7ZSmfEF0wR/nzUJN5Tave//rVKMuYPhE8P9lvHLnxCfmjdSSRbUEsBrqBvIsRkfy2aHNQCU5VrmsF1RzqHi7BKUfX6PqvvLyAWrBMadB5HJ+849sWs98hNOCwq/nRjzEDmbfXRqpk3xiUtpRRHSqokrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D1PW3AuTIsziKTClwCmQw1u0UEwx309Nr2Jh+tqgbZE=;
 b=hFmF8AD7NcndUHejOqp5naBGT2IaNQU6XSUsZmx2qB5HYmBXeIQZvSLPf0NMg1Eg1lVrZ2G89bV+6jWoU3+3xlikfSRSQ1chdgS1t+Imj2mxlV44D5NMDqUkG+cdHsIrMutxK/5xs1Yg575QK+j/e0YbXpCbT7634gf0m2X8yMi4ms+9/Pih6QDL2vK06lyGIkLj5OnPxVYaQoUX+BEntoLX9OefRb7C6O1Jlnm8QBCVQYF2fKzkMREgDVO3kyKjrPcP3YUBRYY+9wN9M0GIkZrMZIdxoljOa0EdsBxOvLHyYR/4fDEIJlwcExmmywzGIf1ZDfcb5Xusi3/EX9xaBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D1PW3AuTIsziKTClwCmQw1u0UEwx309Nr2Jh+tqgbZE=;
 b=0D22bFwLnZIR6HWWJp7TwGxbXGYE3U3j0JpIggD0GxEfAchw+h1OHcYLyj6DxeNgLZdpmsJ3tykyyFJLQ8DXjJkAa6TY9p2YmSmOEpkh4secen5Zr8vY0CuZn8EsSr/wcm5oV909VuNfGVIIb/QNFlqosyq+N6lR0HCfx4Ags2Y=
Received: from SN6PR10MB2975.namprd10.prod.outlook.com (2603:10b6:805:d2::10)
 by MWHPR1001MB2301.namprd10.prod.outlook.com (2603:10b6:301:2d::38) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.13; Tue, 7 Jun
 2022 04:44:40 +0000
Received: from SN6PR10MB2975.namprd10.prod.outlook.com
 ([fe80::7d26:3b6a:85df:f41e]) by SN6PR10MB2975.namprd10.prod.outlook.com
 ([fe80::7d26:3b6a:85df:f41e%6]) with mapi id 15.20.5314.019; Tue, 7 Jun 2022
 04:44:40 +0000
Date:   Tue, 7 Jun 2022 00:44:37 -0400
From:   Kris Van Hees <kris.van.hees@oracle.com>
To:     linux-trace-users@vger.kernel.org
Subject: [RELEASE] DTrace 2.0.0-1.10
Message-ID: <Yp7XtWCqlmiGoCG4@oracle.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SA0PR11CA0151.namprd11.prod.outlook.com
 (2603:10b6:806:1bb::6) To SN6PR10MB2975.namprd10.prod.outlook.com
 (2603:10b6:805:d2::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1b8ebaf4-6833-4b58-a691-08da48406ec1
X-MS-TrafficTypeDiagnostic: MWHPR1001MB2301:EE_
X-Microsoft-Antispam-PRVS: <MWHPR1001MB230122ED5964D4C36D76091EC2A59@MWHPR1001MB2301.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: H383yptjQOY/2/kSzEj4LvWkatZZdojsQVJPSeuxCSiVaCPWc7WahE7Tg0JWHIja/H1TOSMTUjc5jyKCwkcF40aj47rVaOwC02aMhBTxBvD9Uke+pw7G+wXa/9FKD8qmUIgyhtErY7HTzJPTvu8zkSdXLC5pri86FaPR8yKlFbYkli2gioutkehhHuFI9CzNUI5DsMc+mdbC4AQ+mUOkNwb3Eu/Raj20LObZWOrcvcvCgmV6pbRLGDJ2lSrSU/zV3iQgIbw4TUbZAVPqkom7hw3QsLraP/LEUihxVwhNTWNflno+1kgO9+wIxpCtYREXIHfEeat7ddfSQ82Gp2eHEGifwuzEjVdB/AC3vAaYJ9z+MZHcPPUXXRI2RDaBwZC6Bt/ypt0uW6TTnQ9G/JCxOI7c3o4ezrwxYaHG6ECAOw+TsYnj9wq55v78gMSHp0t/jT1HWa+lmIzysc4B5XH6zZ+S9NTRUpxXCcM8dshHmCaWPF5DqE0Un7Xs93bcEv/I/pG4jgI+3EHL91ybRIsyXQfn3KA9+cUWL2+uT0T1SzeuZOSjWwkzXiYii/KSI630bOCD+WYFRJ/Lxp+O9l5nEydh4Bq1veLpXQExpQEqMlU9+kHB4w208dz0B83MPuURx64gPIiSAasGQmcrhmGtHQBsRiL4+BLRjDyPpOYAHltFE0HTf5f97mv6Smhqtvseit88ZwxKi9PqKQIZuSWiryN3RWm17WpuCoc/zwTQJ8nOqO4qp9B+95lSRxNUbif6tVKCgR62hxcXnlUzsvTCIA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR10MB2975.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(8676002)(5660300002)(6512007)(6666004)(508600001)(36756003)(66556008)(38100700002)(86362001)(66946007)(66476007)(186003)(2616005)(6506007)(6916009)(316002)(83380400001)(2906002)(966005)(8936002)(52116002)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?SJhpWqZpTRGVx6R0WXyZhzdsOjBOSZitVR+SKUQrWZbKRQSCT78eqUeXGC?=
 =?iso-8859-1?Q?d0xzNkaV7xTR0U6mAlcSmEwOn1Apbr3wvYntbu9icU42krlwG1GUajlB9o?=
 =?iso-8859-1?Q?KUCpYTjYN+W8YCtqFfPDsjDzkm08b965QXSFBthx4f0JAHc7OpwlEBZD2d?=
 =?iso-8859-1?Q?c9QkouWmadYb8wZQXOYyLfU9fmyNJgPd0gVBroxRdzieZfmfmJuchcOK1O?=
 =?iso-8859-1?Q?fkJJLvhh8s73U3nAkBJ0jMTt7X9glsp3lrfXbMr56zoJ7syQYcJkWE4jgR?=
 =?iso-8859-1?Q?zpZysKI7mxbWCGFyy+9Ax+JDaZMsQ364aJZwdi5RfZoLXzYlWLwyJH0uYr?=
 =?iso-8859-1?Q?RaWbzi0WJDmmvQvspGyoOjFmMionTnB1Qt+utKh8E693XMuhqdI4xPpG7n?=
 =?iso-8859-1?Q?LASV5Uso5f8PG3dP2Jt5jg9uyLV/qntWThPOHHeBUyko5YYUgyCginxUVp?=
 =?iso-8859-1?Q?GpgjIHUZbN1A4pSvQFmbex4enWIfLyx8k2UR0Oe0m7qyBJwnQb9tJZyg/0?=
 =?iso-8859-1?Q?dxKxxGwzXcWWz65numZBMpShwhc3evq/NqTF556yOAWRM8l3+zKErhffQi?=
 =?iso-8859-1?Q?k1+ZkMTPuYUHqTQfTLmQfvbhhkcggZ/A3BCm7D1cZx8Fjif12afdmb+Upy?=
 =?iso-8859-1?Q?4tYOs+YzBW/vGOCOpJPiInxiw3O0RVGsWdDXpOFAg3qR0sqKYIcAcABNuX?=
 =?iso-8859-1?Q?vu6xLoL/6nD3l/w8J+1WAkrcaXd1GGFOPTgOp7LNU3JNxn18hcLY+6B+uE?=
 =?iso-8859-1?Q?RW6TxKdRD2nFY0HFqitdrz70V1FUykG7Xjbf/bX4sZnFM35O8v0wWdKEe2?=
 =?iso-8859-1?Q?qBr3JugmIjJbuU6Mw0hAXUeQ2oxZgj5wI049WiaByg/Dwsr6cTUeXGO6SF?=
 =?iso-8859-1?Q?NEDvxD1BvlfBHr6SdXoGgRBWUOnN7CSb0vtYgLJmkCvRQncK/i650zDYvi?=
 =?iso-8859-1?Q?be1D9B7gBW3F5PHyE8XEJjXIpD5D2iW7SedzPPuNOhgkqSsmUjSVnuF+CO?=
 =?iso-8859-1?Q?aNaWyixDlob/ndcKyxyvsSWdn8AsQ/SlIEBQzBxIW2Xe3vBTYp6L7T1v6P?=
 =?iso-8859-1?Q?SbYeIe8H1haGhuz4Wr9G3h5E6jYAnXsKKcgzEpUIv98nM/fghzFvYHzMPT?=
 =?iso-8859-1?Q?1i68aPO8VHAsi0KPEUi+QnI1Bzo9bwG8jNuSH5VGCZiAoBljsLVGPUuoOD?=
 =?iso-8859-1?Q?NWt863b2pSclyJLuJ73j394fUACOsChDVpL/iODvgpoMreX9GtIe9zN2ha?=
 =?iso-8859-1?Q?FOCdBPDlihqlMwiPOGifgmwQNmkIa/L0ZhinzWT+4OvxlUxCIQWCIcjNrm?=
 =?iso-8859-1?Q?vqCs2oGxAPuTLx1SiicS0nxoJJMqVU6WJMDyms9lg1JLzcYzauD1ypg5cG?=
 =?iso-8859-1?Q?X7pWfeiJuuLiIPATY8z54xKzrf1VBY/DhaVZu4WgsNAnAiHS1m2RDaHFxQ?=
 =?iso-8859-1?Q?Me9GZ4TDRXZ3+F9rGr76fI5f9GbwhmU2JpH/spodMrPqit/6he7QZRg8UD?=
 =?iso-8859-1?Q?C32KEvkbQXSo/8Dcrldt7nba3ExPpFfLSy2y3/FnFGotkNCp3VxvebWdLy?=
 =?iso-8859-1?Q?d2xxUgTESY3OHa5WSEOSzCzOCHLOMuuZ6XT+/T9eNPKwnL8dJE7ByfsefV?=
 =?iso-8859-1?Q?a+lLErEh4JzJCOzXtu6NbQkVA3YFChp+qnwntPNMj0z+sn/ignsgqbyLiY?=
 =?iso-8859-1?Q?HXMPu7gU9mcTNyJ3R5JsllruzyqFmWYnahEuTPehK3C7UCK/ZGBKoI/QiJ?=
 =?iso-8859-1?Q?1Qs7Akq0gtB6ujVzkIsawqvd45AgCcjuJVziUaCLqom/E21vjTzXTQZpPp?=
 =?iso-8859-1?Q?DjrlrXk49UrDcCoysm48gb0B1PuiuKsoKQfMRO+2/vMRyaogvdHI?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b8ebaf4-6833-4b58-a691-08da48406ec1
X-MS-Exchange-CrossTenant-AuthSource: SN6PR10MB2975.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2022 04:44:40.0731
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JgllHQdR9PHEPY6a9AvMYbI1Ewnr8NgIcFbb2sCbEZK5jlPtgV9YbaEv6Xzwb3GRoknLJV0ilfTlVUCI3BSfh34QXttXL3/mFbVjDzLQNtA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1001MB2301
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.517,18.0.874
 definitions=2022-06-07_01:2022-06-02,2022-06-07 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 mlxscore=0 adultscore=0
 spamscore=0 suspectscore=0 bulkscore=0 malwarescore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2204290000
 definitions=main-2206070018
X-Proofpoint-GUID: iW4ANjhM06zKgMHSxzaCVccjyynfZsCB
X-Proofpoint-ORIG-GUID: iW4ANjhM06zKgMHSxzaCVccjyynfZsCB
Precedence: bulk
List-ID: <linux-trace-users.vger.kernel.org>
X-Mailing-List: linux-trace-users@vger.kernel.org

We are happy to announce the availability of the latest development version
of DTrace for Linux (2.0.0-1.10).

This new version is based on BPF and other Linux kernel tracing features and
is implemented entirely as a userspace application.

The functionality is still lacking some fearures in comparison to the kernel
module based version of DTrace for Linux (currently at version 1.2.1-1).  
Development continues in an incremental fashion to make the full feature set
of DTrace available using existing kernel features.

WHERE TO FIND IT?

The new version of DTrace for Linux is available at:
     https://github.com/oracle/dtrace-utils/tree/2.0-branch-dev

The main development branch for DTrace for Linux is at:
     https://github.com/oracle/dtrace-utils/tree/dev

The most recent release tag is 2.0.0-1.10.

FEATURES

   - BEGIN and END probe (with full support for the expected semantics).
   - ERROR probe support.
   - Function Boundary Tracing (FBT) probes.
   - System call entry and exit probes.
   - Timer-based profile-* and tick-* probes.
   - Statically Defined Tracing (SDT) probes for kernel tracepoints.
   - Arguments for SDT probes can be retrieved with arg0-arg9.
   - pid provider support for userspace function boundary tracing.
   - Aggregated data collection support.
   - Aggregation functions: avg, count, llquantize, lquantize, max, min,
     quantize, stddev, and sum.
   - Aggregation actions: normalize() and denormalize().
   - Pretty-printing for aggregations using the printa() action.
   - Support for local and global variables with storage sizes greater
     than 8 bytes.  This adds struct and union support for local and global
     variables.
   - Various features to support stack tracing.
   - Direct compilation of D source code into BPF programs.
   - Efficient use of pre-compiled BPF functions for library functions.
   - A bpflog option to request the BPF verifier log for loaded programs.
   - BPF program linking of dynamically generated code and pre-compiled code
     to facilitate code sharing and code re-use.
   - Improved integrated disassembler for generated BPF code at the
     clause and program level (-S in combination with the new -xdisasm=#
     option).
   - Improved trace data buffer handling based on memory mapped perf event
     ring-buffers.
   - Deferred creation of kernel level probes.  Listing available probes does
     not require them to be created at the kernel level.
   - Speculative tracing: speculation(), speculate(), commit(), and discard().
   - Nearly complete support for strings: string constants in D clauses,
     assignment, built-in variables, comparison operators, trace(), strlen(),
     strchr(), strrchr(), index(), rindex(), strstr(), strjoin(), substr(),
     and lltostr().
   - Host/network byte order conversion: htonl(), htonll(), htons(), ntohl(),
     ntohll(), and ntohs().
   - Symbol resolving for compressed kernel modules.
   - Support to run dtrace under valgrind.

   - [NEW] Subroutines: rand(), ftruncate(), basename(), dirname(), strtok(),
     alloca(), bcopy(), getmajor(), getminor(), progenyof()i, inet_ntoa().
   - [NEW] Support for Thread Local Storage (TLS) variables.
   - [NEW] Support for associative arrays.
   - [NEW] Support added to trace() for array, struct, and union arguments.
   - [NEW] Built-in variable: execname
   - [NEW] Improved disassembler annotations.
   - [NEW] Error reporting includes the program counter.

DEPENDENCIES

DTrace for Linux depends on libctf (part of newer binutils) -or-
libdtrace-ctf.  While libctf is preferred, building against libdtrace-ctf is
fully supported.  It can be found at:
     https://github.com/oracle/libdtrace-ctf

DTrace for Linux makes use of BPF library functions that are compiled at 
build time.  It depends on BPF support in GCC and binutils to generate the
pre-compiled BPF function library.

DTrace for Linux makes use of 3 additional features that are not commonly
available in the Linux kernel:

   - CTF data generation at compile time: this provides important datatype
     information for kernel and kernel module symbols.

   - waitfd() system call: this provides a mechanism to monitor for state
     changes of processes that are being traced.

   - /proc/kallsyms module grouping support: this adds annotation with module
     names to all symbols that are part of a kernel module even if the module
     is configured to be compiled into the kernel proper.  This allows for
     consistent ways to refer to probes by module and function (or probe) name.

These additional support features for tracing are available at:
     https://github.com/oracle/dtrace-linux-kernel/tree/v2/5.14.9

Please consider joining our development list: dtrace-devel at oss.oracle.com

     Enjoy!
