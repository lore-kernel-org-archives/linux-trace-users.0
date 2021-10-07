Return-Path: <linux-trace-users-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8175C433EF
	for <linux-trace-users@archiver.kernel.org>; Thu,  7 Oct 2021 17:10:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BD15061058
	for <linux-trace-users@archiver.kernel.org>; Thu,  7 Oct 2021 17:10:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242964AbhJGRMp (ORCPT
        <rfc822;linux-trace-users@archiver.kernel.org>);
        Thu, 7 Oct 2021 13:12:45 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:56832 "EHLO
        mx0b-00069f02.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S241593AbhJGRMp (ORCPT
        <rfc822;linux-trace-users@vger.kernel.org>);
        Thu, 7 Oct 2021 13:12:45 -0400
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 197H4ghZ028807
        for <linux-trace-users@vger.kernel.org>; Thu, 7 Oct 2021 17:10:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to :
 subject : message-id : content-type : content-transfer-encoding :
 mime-version; s=corp-2021-07-09;
 bh=6cU+gTgLkq84zvD6hVkw+t5vsv2YJlfMchXzxlCuEaM=;
 b=E0zXdpongV2AgeM8EzcFAlv2cPI+hRvwXpxYozRSaII9lQFRyekzlIvN6LKsE5fMoN5U
 1dpV4BzMEMwRcivaEV5qvcn/rNLecTsW2+0g0XS4w2e7AsgK3uxFXJYLObu5RvWwF/eL
 kGJzj+QiNX4tqeivtD4aWyrX1fbtTbHJz7hULFc4zTj8SveFAr+xLoYRdJyzzcvkSC47
 nkQfkWb+TLbK4hsib/Gdoo9EEKyFUklyWSfuIS2qVQtQ3XTGzyw38h0eqhaUN8jL9OsN
 YGl9WmXoPV3q3goeALA36UOv55kJQCZN10Vt6ZvKoQ/SBooyGxcQaJ2/ZUqsROWT4aDx Hw== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
        by mx0b-00069f02.pphosted.com with ESMTP id 3bj1ecj2nu-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
        for <linux-trace-users@vger.kernel.org>; Thu, 07 Oct 2021 17:10:50 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
        by userp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 197HAm5H119385
        for <linux-trace-users@vger.kernel.org>; Thu, 7 Oct 2021 17:10:49 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2177.outbound.protection.outlook.com [104.47.55.177])
        by userp3030.oracle.com with ESMTP id 3bf0sak0t7-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
        for <linux-trace-users@vger.kernel.org>; Thu, 07 Oct 2021 17:10:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fzmlXKL0Q6i8o9wF7aeF/DBAlgBIqmnXHWeVxXnw8H6bGMBqEQ4NCEztISoXNoNV9ooF4jQXQ10uX1w1kV/ktW/xiDhX3EGwOliMP5JiGIJbatYP/PDkvwT7z5ssU1htxvSYxUf5eVZgQnjNeepiw7OaidTdJEPNjaxx0q0/l8dLirvObcRAUVwdoPf91e8L8Esl2GT3ySCOL6nmPqhAq2R0yq0Fxy4IGkm+mJ9p3zIr7hfOKDMzkCkc/U3ubgPLfXJ1qerZerZuGBe4jrlHIB19Pu43TndgjgAbUFRenjV6iWuHjOjWtoRXrBrZNDYsuHOOiZIaDedzStjnSxnBiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6cU+gTgLkq84zvD6hVkw+t5vsv2YJlfMchXzxlCuEaM=;
 b=DkJpu6IKfWZkSzIxt2fYhRuAZIkRudxrHHRqNRJ3ZarzIZDGoIvG++OXT2WDvEIafGagcc1flf9RIvkuwWyOMhtWBoG9/L2nI3bxnp9xCFQ7vyQ2EMwiBZMkHO6Rxi4rkVhkuK/bVbt1FtuEvCx+e3ggwUqJGqXN3Vs4/HQGejY5e03Jqy+j5d/zV0zmVW6iJa37PfBJm4PDP9H5L3wXOPE4fn1tPL/XygXiNkPl0iPU95HxSNDI1/JrMYPHDbYvEhQwF0WNkt6mD50Ev5jLiuQjvp6DfhJrGoZzLoAZTueraBx007jeOluWbS9IO87IKmXzwjdsVpd2aL+p+6USEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6cU+gTgLkq84zvD6hVkw+t5vsv2YJlfMchXzxlCuEaM=;
 b=JvQGCCTIfR1eHEMkj9aobnDK4z7UqzS9qF4Xi/2tzQM50UgLKtY8jZl193uxrAlTdfQ7sLJHTknTZ0FT+F5lF76VQDeBg9wgk4Y/EKKaaJxkWp1ngjYpVUTgfy+RDHSUXOktQ8QIo4OG92jcZzVzYMzcrtN8ynqCLf/ipo9FfqA=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=oracle.com;
Received: from SN6PR10MB2975.namprd10.prod.outlook.com (2603:10b6:805:d2::10)
 by SN4PR10MB5608.namprd10.prod.outlook.com (2603:10b6:806:20b::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.18; Thu, 7 Oct
 2021 17:10:44 +0000
Received: from SN6PR10MB2975.namprd10.prod.outlook.com
 ([fe80::e8fe:fa3a:4519:3b36]) by SN6PR10MB2975.namprd10.prod.outlook.com
 ([fe80::e8fe:fa3a:4519:3b36%6]) with mapi id 15.20.4587.019; Thu, 7 Oct 2021
 17:10:44 +0000
Date:   Thu, 7 Oct 2021 13:09:42 -0400
From:   Kris Van Hees <kris.van.hees@oracle.com>
To:     linux-trace-users@vger.kernel.org
Subject: RELEASE: DTrace for Linux 2.0.0-1.7
Message-ID: <20211007170942.GO20417@oracle.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: SN1PR12CA0043.namprd12.prod.outlook.com
 (2603:10b6:802:20::14) To SN6PR10MB2975.namprd10.prod.outlook.com
 (2603:10b6:805:d2::10)
MIME-Version: 1.0
Received: from localhost (2606:b400:8024:1010::17c6) by SN1PR12CA0043.namprd12.prod.outlook.com (2603:10b6:802:20::14) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.18 via Frontend Transport; Thu, 7 Oct 2021 17:10:44 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d49cabcd-2fe3-4e60-7f10-08d989b56621
X-MS-TrafficTypeDiagnostic: SN4PR10MB5608:
X-Microsoft-Antispam-PRVS: <SN4PR10MB560824AC518E7CE7FE01C358C2B19@SN4PR10MB5608.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ywOvAvo6nI9tee6oN1kyZ1tvG6Jzz34J7N/f1d2VYqZNKzojZuQwaWvdvPLIS3RZRsZA/lKyihs7hhBNkXreoUrnLfEz+HLNO53uIPMg3xgLgqip1mBI4kT599WgxLZP3CtUwW769T6iyUsSPDLwzxaUgjdFJ3oUsDzru0ULGTWfI1IWdvWmgoOeg/BJceEBi/aLQTDanMGZ2ATQis25e6M1P/6qpXUXW1OI/tPMrcLxsOrNnwd393reTWN/zA+sbouSvivp5MLSP58Mvjnl1EwrRKioYBqXFXWNeNB/l9LkAuiVPS4TtKVchJzVRWK5SexxZmM0360h3f8XBBah/u1BU2s+srJHZ89InXm8SYbt5bgnvfgK0cv+OETOH+v5dQsVkNePq57gyPBPcn8IHHCW3nJ8wJBqoJkmSBL67DgBdoDZwMYcbzVpMj5HnT8p0cOKSHfRMLPVf5e86qh/QJcuAyDK3Dj4+b49aUgskdQVHJis6ktUf5MBP4HBnQ0++Np+U9m72IjLprrEgkKrQbBhUlrxzLwVJuQP3++rK0iCA2b06JrATjVy3K2NjeaNPF2YEnhsRn7i4qufO3efj9U0OICr4nTIzty3gYtyyZJzRnmDJOQZzM6ne70xO7qZSWHViamDm+6z3FhfBaH+BPs+eYVyzAtnyJ/AJnSXGiGjgmNR0pYrRvGJrnIo5p40K4NTZha3xjBcVi/gN5ZgYqWuIE9tXqfHW75MnEZSlmyIH5xLOqR2eEaEcucE50DrqUmFmB7PnTVuTmPOtbtP2A==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR10MB2975.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(966005)(83380400001)(316002)(36756003)(1076003)(52116002)(33656002)(8676002)(8936002)(6916009)(66476007)(66556008)(66946007)(6496006)(5660300002)(6486002)(86362001)(2616005)(508600001)(38100700002)(2906002)(186003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?8L7Hd53YaQRZEb2e0vdhhzHTGvAUsLPEvGUnzMAtqZk5ZbEIKMaGYikIiw?=
 =?iso-8859-1?Q?UgAQ2/tH3n1GTeilkpVH4gy/wvpyxgV3XSYtatbblYNzL3ISCo8XFMvQXZ?=
 =?iso-8859-1?Q?VPzIMX0Z1s9FPT0iKTwxCfypRq6eujIsL5BPxevneKq3Uy9bTAreDZolwE?=
 =?iso-8859-1?Q?hiA7KP5o6HOKaJUnnonVe7857Td0cCa/z3wpP58BNb32N6VAiES/BVuFh4?=
 =?iso-8859-1?Q?9lgPlUq9xUbEfOV4Mauddq3MUPiV/+HdEym6l0kBE1ioS7DRoPSHNT2PYj?=
 =?iso-8859-1?Q?slsfoHZkHPGfQNxWrptF1cBQD9TEUfK9rY7YcUwmXqFPlpix/SqBg+hyhH?=
 =?iso-8859-1?Q?5UZVgPq2C2sLLgURtN3PVXueOgML561jHK0dOfRo0vosYxGv0Ne3F2PraM?=
 =?iso-8859-1?Q?qIZEiP16J1X5fdfQNH+zbWSjANTTtPN9qkcj5n9y9g1+cN3J+Z0ji31ltg?=
 =?iso-8859-1?Q?t8qsP7/HdpzD1LNl3OE9amfj0hnLNcs3XUA86RjDw4yf9V5MJ48C26znfl?=
 =?iso-8859-1?Q?6+nv0/oyP8cU1mWYGVTsTdIfu9sAfRLQwrVne3tOfoERILUKkv90k7E0wS?=
 =?iso-8859-1?Q?a3xIOAsD6GW1MDoAXu8e9T0irvotvYQWn7zKFgwW54Xy4vDhFS9Fhh5hfn?=
 =?iso-8859-1?Q?i+l9u2hGNPKEyzp/DX72H+zyZNFzPS62HdZyDhrR7y5thYL8OTtRvlOxHO?=
 =?iso-8859-1?Q?NdEpXXBfH0YxqIFybi94sHyYgbyabHKrVlVC561sGPnsd9PR+vxwKJgVu6?=
 =?iso-8859-1?Q?jSpJSL+dt7BcprnRVzmXu5mz3UXDbxn4w7eCvCxn/XBdFniglyxn2Pt8Sh?=
 =?iso-8859-1?Q?zDlH7f6v+M6t7ECo7OdNf094UuPfKnc5tqC2XXEJgtd0+SlxxG0D/P62Y9?=
 =?iso-8859-1?Q?bsCu6D+yLSY96IRixizCUU/MO0sZa9IHGaVp5K+q+5vIFd6rTNvF1BrISE?=
 =?iso-8859-1?Q?ncoqxmf4Olw82gO54Kg110wG3cMbbsLLeBCabqKG9dClX+rprxfuwXjwkO?=
 =?iso-8859-1?Q?4wxqlhj/1xaPzxqHkIdU6X3H8yGzgIHhmR8gmw2ApIZa+nF+mi1f8LOtWy?=
 =?iso-8859-1?Q?1Qw6b2yMxOXZhQDnvBgHgwm0/GTRGoaOWzmsbUJx8NdavkWI3JkO3fS+hT?=
 =?iso-8859-1?Q?bfTa/YLsQC7Ui0kOdY7ON77Ad3tFnZAgSwlxn0h89OusLAQ+bzUW5ZxkBf?=
 =?iso-8859-1?Q?/fYLQA5B2c4CFlOo2AKiGcr7F8Z39L2I0M8wr3RDzTm9PEtm6H91modnx2?=
 =?iso-8859-1?Q?K/+GtNWi8Sq1jqQ1sHU9X7mBNl2UknR8HdGLxSgXZYxVuvvdRfSDj8Sn+x?=
 =?iso-8859-1?Q?lWmw444wzxfQq6JSDIdgp0sB2RB++dFnsU/ASP104hQNFDO16wmusDApkL?=
 =?iso-8859-1?Q?jHWFIbwY9Zr9qrS+e6+39yQ4VS9O/lTA=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d49cabcd-2fe3-4e60-7f10-08d989b56621
X-MS-Exchange-CrossTenant-AuthSource: SN6PR10MB2975.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2021 17:10:44.7251
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zJ8mWkt92RddIoPfjw/40NmDEwVQBcnNLY61qAX595DcIoqRqfpHQWy7VTdDOwlRo3VS5lNzfbB2L6/LrJs2sZngPyMzoaJjG4LrkSwjcc8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN4PR10MB5608
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10130 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 suspectscore=0
 adultscore=64 mlxscore=0 phishscore=0 bulkscore=0 mlxlogscore=999
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109230001 definitions=main-2110070112
X-Proofpoint-GUID: iER9xVE5KzRt7cfTwd8VkXzhNT3W5onp
X-Proofpoint-ORIG-GUID: iER9xVE5KzRt7cfTwd8VkXzhNT3W5onp
Precedence: bulk
List-ID: <linux-trace-users.vger.kernel.org>
X-Mailing-List: linux-trace-users@vger.kernel.org

We are happy to announce the availability of the latest development version of
DTrace for Linux (2.0.0-1.7).

This new version is based on BPF and other Linux kernel tracing features and
is implemented entirely as a userspace application.

The functionality is still limited in comparison to the kernel module based
version of DTrace for Linux (currently at version 1.2.1-1).  Development
continues in an incremental fashion to make the full feature set of DTrace
available using existing kernel features.

WHERE TO FIND IT?

The new version of DTrace for Linux is available at:
    https://github.com/oracle/dtrace-utils/tree/2.0-branch-dev

The most recent release tag is 2.0.0-1.7.

FEATURES

  - BEGIN and END probe (with full support for the expected semantics).
  - ERROR probe support.
  - Function Boundary Tracing (FBT) probes.
  - System call entry and exit probes.
  - Timer-based profile-* and tick-* probes.
  - Statically Defined Tracing (SDT) probes for kernel tracepoints.
  - [NEW] Arguments for SDT probes can be retrieved with arg0-arg9.
  - pid provider support for userspace function boundary tracing.
  - Aggregated data collection support.
  - Aggregation functions: avg, count, llquantize, lquantize, max, min,
    quantize, stddev, and sum.
  - Aggregation actions: normalize() and denormalize().
  - Pretty-printing for aggregations using the printa() action.
  - Support for local and global variables with storage sizes greater
    than 8 bytes.  This adds struct and union support for local and global
    variables.
  - Initial support for strings: string constants in D clauses, assignment,
    built-in variables, trace(), strlen().
  - [NEW] The strjoin() and substr() subroutines.
  - Various features to support stack tracing.
  - Direct compilation of D source code into BPF programs.
  - Efficient use of pre-compiled BPF functions for library functions.
  - [NEW] A bpflog option to request the BPF verifier log for loaded programs.
  - BPF program linking of dynamically generated code and pre-compiled code
    to facilitate code sharing and code re-use.
  - Improved integrated disassembler for generated BPF code at the
    clause and program level (-S in combination with the new -xdisasm=#\
    option).
  - Improved trace data buffer handling based on memory mapped perf event
    ring-buffers.
  - Deferred creation of kernel level probes.  Listing available probes does
    not require them to be created at the kernel level.

DEPENDENCIES

DTrace for Linux depends on libctf (part of newer binutils) -or-
libdtrace-ctf.  While libctf is preferred, building against libdtrace-ctf is
fully supported.  It can be found at:
    https://github.com/oracle/libdtrace-ctf

DTrace for Linux makes use of BPF library functions that are compiled at build
time.  It depends on BPF support in GCC and binutils to generate the
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
