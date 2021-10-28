Return-Path: <linux-trace-users-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2947DC433F5
	for <linux-trace-users@archiver.kernel.org>; Thu, 28 Oct 2021 14:50:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 129E360C40
	for <linux-trace-users@archiver.kernel.org>; Thu, 28 Oct 2021 14:50:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230406AbhJ1Owd (ORCPT
        <rfc822;linux-trace-users@archiver.kernel.org>);
        Thu, 28 Oct 2021 10:52:33 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:5226 "EHLO
        mx0b-00069f02.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230258AbhJ1Owc (ORCPT
        <rfc822;linux-trace-users@vger.kernel.org>);
        Thu, 28 Oct 2021 10:52:32 -0400
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19SES0ed021063
        for <linux-trace-users@vger.kernel.org>; Thu, 28 Oct 2021 14:50:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to :
 subject : message-id : content-type : content-transfer-encoding :
 mime-version; s=corp-2021-07-09;
 bh=XQ0sthkUnH+v4emAJ4iaOoMH0IRkkA8uqxGk0i16Vs4=;
 b=x+lS47zUtvVa+5p4bRvN6FqjU7rGKw+D4Ml5/8G5k99Py1SizmBKCpx/KZRZaw3CwjRd
 oMjR740ZIT86KEtdWnVH2ChMGaqiK1vtwG0zQGlGED89Y17AE8lcLhmKHZxNsow8GhT3
 CPOGVVZhvgus2txSN/BLZxxs0bZx/CxBbeAyg0UYwAF9fC/wAIGWNky4PY9HKJy9hvQz
 RGA8WSJ1oelk5H/gi9FksLfpTR2poZumFvbdFl3Gz8E6L/vqYoUjcovJShItEF1lrqCH
 +E3Jxlq5dkco8xxuyu/fEUMe4slP2Z+jDhPU3g1nvkxWimIK77HeX1cjwVueL/atgCw/ JQ== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
        by mx0b-00069f02.pphosted.com with ESMTP id 3byhy9jvch-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
        for <linux-trace-users@vger.kernel.org>; Thu, 28 Oct 2021 14:50:04 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
        by aserp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 19SEfMhb043633
        for <linux-trace-users@vger.kernel.org>; Thu, 28 Oct 2021 14:50:03 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2173.outbound.protection.outlook.com [104.47.58.173])
        by aserp3030.oracle.com with ESMTP id 3bx4gbmnw8-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
        for <linux-trace-users@vger.kernel.org>; Thu, 28 Oct 2021 14:50:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cOHDYaiNUQCRqIgsU2cqATvtnsDZ6nyEKuQzekI8XB+wJUmufnxm+LRQPrC+1FqSfKu/w6j7jde0GUFNsTPYSNuAZ6u2dm/Z684T+nbe+qpxyr+nH/0FxljP9ux4ITTcI73tuSf+2GEblgwTWBxosHC9lHfkes4el5/zFHqP7A+rYKiX3XVDkXrQltuRJkw2RIKVhbi16dOVjUuAYUX9IC2T7VsVURgPy5TzB9e95X/MuDPyzj/vAlRcFDv7nRGz90gIHxYFwhfNSbyT/5ltu50l3ydqrZEcFKA9K/NhU+YWKgXXeEeBj9usY/h5kcPWq8znWiwUPkFMVvvPuX4t/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XQ0sthkUnH+v4emAJ4iaOoMH0IRkkA8uqxGk0i16Vs4=;
 b=RlsV53Iay2z/fBpcB6XVQirh4XXjHPsqD+o02QHIMXrHmJwfWeedQ/J0uX6jeydq9+Q9EV4i98zi5ac1FX9zCkGvHYBDYgu9CB8Ipt5+7iJ2z35Bk+/SvVLN+kChSMKaoqfDXG7nT2oUnK7jM2fDoA3Rr5emhfvrHBAV5xeQKL4osaLad/Q/v6iSpsqXwW3JzZFzE+dm3Q2T1bjDhnoHnaWzLb/MIJMHlyPUujbAokImnw8BPXW3wOF+yj/draP4zDz35Q1sMX2isl156SzlZ9x33ajgDjbqsAjrTl1YjVr1/er0AYzu/84+/UKlAF7A9zNWihIN7DGauxMMx/kjOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XQ0sthkUnH+v4emAJ4iaOoMH0IRkkA8uqxGk0i16Vs4=;
 b=YW87MaAkKBMdk+I+b0KWBo3VenVk7ZWyQ4TMbpzE6MTkXdSWA4sJfhmoV/vNLzrDjIt+KQcIhbONkBPJ7KFQXzu2UxiQF2G306Hbh87iC/Zg/hQsUDtdXlm00midZ3g2mows3bHw7UAq3mL4RQKxSOasb4RFJySKF+KIKG2b564=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=oracle.com;
Received: from SN6PR10MB2975.namprd10.prod.outlook.com (2603:10b6:805:d2::10)
 by SA1PR10MB5842.namprd10.prod.outlook.com (2603:10b6:806:22b::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.18; Thu, 28 Oct
 2021 14:50:01 +0000
Received: from SN6PR10MB2975.namprd10.prod.outlook.com
 ([fe80::15f9:229e:a7fc:4326]) by SN6PR10MB2975.namprd10.prod.outlook.com
 ([fe80::15f9:229e:a7fc:4326%3]) with mapi id 15.20.4649.015; Thu, 28 Oct 2021
 14:50:01 +0000
Date:   Thu, 28 Oct 2021 10:49:58 -0400
From:   Kris Van Hees <kris.van.hees@oracle.com>
To:     linux-trace-users@vger.kernel.org
Subject: [CORRECTED] RELEASE: DTrace for Linux 2.0.0-1.8
Message-ID: <20211028144958.GE1608@oracle.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: SA9PR13CA0035.namprd13.prod.outlook.com
 (2603:10b6:806:22::10) To SN6PR10MB2975.namprd10.prod.outlook.com
 (2603:10b6:805:d2::10)
MIME-Version: 1.0
Received: from localhost (2606:b400:8024:1010::17c6) by SA9PR13CA0035.namprd13.prod.outlook.com (2603:10b6:806:22::10) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.4 via Frontend Transport; Thu, 28 Oct 2021 14:50:00 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fd2815b4-e545-449a-7847-08d99a223822
X-MS-TrafficTypeDiagnostic: SA1PR10MB5842:
X-Microsoft-Antispam-PRVS: <SA1PR10MB5842206975B3DF29DAA16E75C2869@SA1PR10MB5842.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3968;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: apB3HtR7dD0XQBHiUpBXfl3lNaDv/u0o31LAuxTNcTVBqCEt6Yb4GwpFILHbicg1E/e94XDHsggSzuESrjknMa/MWBLge9oiQXvO/vyA64hMzheQSsMTLXa5wRfKYrEokyyYOI4ZdO1VMdGtMPF2ryI24XoVEvIdN3Beztke6CbAu6/8roJztasLG8ZTUy2EQkm2W1R2PqlN8ezkxAVKph+5JvI2DGXBF6u13Ld/DbqKpubkGYf7WZgdO/+4UQvh54x/Kfhqq8fJDG73Mlfrv6MvyO2ROT9t/rhc6CP+ub2kKl3E3pQLL75zaMvVkM7CLlAVR97oiGHJBMv4MDbZyf5yHRYsbsY+bk7m5l+/EYnxIqWpJDNchZRkycmFdp3MpFQczFHy2gxxxBWJ2f6hsR/ZRfClzvtwEj3CKBuW3jfY2P7/vNFxnq56EWaw9m/cBQSfxarrFHezbmlMmlGv/nDUEVadZG+djx2mnVrLLJMma3A/EWS2S1kjNYYOnlKpPRUZE4b49VTVyvcrjF6/hVTvbZ1NziIKQ7duhtcJHwWKzp+bRk7KaqBTPA+QtW5pVH4DLVowShV3oi+ktSvd91Bk6DSQ/5m15AFrJr9AYZY9uMzkKx51nrqY/jI1vOUfnTGOf9KT/pT7GBmtlsY4v0bgExtNtSEjB5INCgtyG4+m1rfo0+GksM4qv/fAHLCAysxYInOZkX2QoPCK875sGvGr+qeGz8c/pIVX51UwLAJdJN3zu1vhT4oUbMKfajJWnsyRwe5u4oViZe1uE1Wo2g==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR10MB2975.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(66556008)(6916009)(508600001)(86362001)(8936002)(33656002)(5660300002)(6486002)(6496006)(2906002)(38100700002)(66946007)(66476007)(8676002)(83380400001)(36756003)(186003)(1076003)(52116002)(966005)(316002)(2616005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?YY8uD8Mf7cscgCBUi8pt5yLtOju6PyPyi3ZjTaQ1CPzQAMdNx3HDpvX1l6?=
 =?iso-8859-1?Q?UiZDUewei9DZ8bKrTokR3aOBul43GPVLWri/Cpaw62mJfy2E30byE/933U?=
 =?iso-8859-1?Q?CGFXxHcKnHTgqmh7vVDwpzCvGX2Qw2gOTcCFUipQsAac0LiTzFqVK9LJUj?=
 =?iso-8859-1?Q?IfgSCc8yVDtzXC9grgSwZfdD1ZOt4ZtQmNJmyZNcTMJBjWSKIHTZ618kSV?=
 =?iso-8859-1?Q?LQOhoxLz9gJ9p7FZ3WgCVIT0V7/jcKpOs2X+L0m/Xg8yZEs+FpP46raHbs?=
 =?iso-8859-1?Q?5rllXr4mErVwc78Wk+1kk6GxRXnNfTnzc+jpg5IexxfkoqHQPOUkWZqg3u?=
 =?iso-8859-1?Q?NISjt0HxncFLyTX1RaJnfQorwP95zrf0V+ne1z/mT6CKpAl4yI726MHHmy?=
 =?iso-8859-1?Q?d5C1uKDWvc/NigJbeoXtI8AYrVpq85i5L1QRdc1ie8m4GDlt6rQbozDXJO?=
 =?iso-8859-1?Q?TcIQzqTyFSWFByCRC9WvEEBoxVOLTeAJBnrdw98hXxVB7M/omr81BiUeJ+?=
 =?iso-8859-1?Q?Xd4DhNOjYM2N8DL8Dg2w+9TWry/8lJfP9bOrIQPoWNBsea2LXdjfFgiI37?=
 =?iso-8859-1?Q?jWKQe7caoWB8f21cIhaoCEVh2Q2v+iEShMBXlVRo4rXKDZYZmBRqPRwf9M?=
 =?iso-8859-1?Q?RIE9Tv9hllcSOiOu1ciSkU3HunLwR39G40xshHSYKJ6cXgvhxzMDvG/MP/?=
 =?iso-8859-1?Q?iiDD4jVNIdLtNQoBjnUzyFaP/ibnF1n4vA07PkEoRNinK0YTKyP4E3YdMY?=
 =?iso-8859-1?Q?JuXd3CLN4QVj4gwiI7aXUck+dkYZXqENMuqTIjD36xQYRwHhZRouoLb+P0?=
 =?iso-8859-1?Q?sikkXcJzXLFjF8xpFgS5g2Ay4BmbfjUg0yPAXO/kT+sXsOLZWMatzGgUxm?=
 =?iso-8859-1?Q?weeJfKWij9r5BGIIDr53uHf4+OEyFRdBEfE2LhVpdOtx6Vj4p+kpYhM6x7?=
 =?iso-8859-1?Q?jZvvfUlylemJv9p6ce8uKop8VjpT6pNNEfWrIq5fBFEdyOZALw5PoMnTtP?=
 =?iso-8859-1?Q?DAEweFwURdFUqDjKxYzZbbEqxLMfJpNmYrGI/hyMv16mIs8nv8KVQo6sCo?=
 =?iso-8859-1?Q?m9qlsE1I5K7xgpMKSTZfYs4r5t1PgXTL1pxlA/q8LosKNM3rYEaDArGYpv?=
 =?iso-8859-1?Q?CnY+8ZzrZlizOiLlSjp7WkdJHYj0RWL5v09H/y/k4GLvQ3lZ9/DdETyw17?=
 =?iso-8859-1?Q?ILvjoQbMx2umwo+a9EmIKaFit/iikYn73ypNXXISqjRI0l0hx0IhsBZthD?=
 =?iso-8859-1?Q?9kaNQtUJQl44Tt1swy5WQVG+uvSbwFYxz9rY5Fh2DBj4z6Iy00U4YR0um5?=
 =?iso-8859-1?Q?ydEZqd+JaEoygDMS8v8NVNB4vKO53UDy/jw/TuGRyovO0zKT6untRms+g1?=
 =?iso-8859-1?Q?ZTE/g5ILUYf+c9La3lNs5Boz2pRFCKjohqwPopABUHe5bbymJsd/3X41SU?=
 =?iso-8859-1?Q?URdL/IG2sQGeJq0Iykme01o6LkopAhC6H9wJucKk5Wui2KNA1tSiq0lQs+?=
 =?iso-8859-1?Q?clrdH18PLFl9Izs0iM/EkAun3Eu6Z86U//5tF7cyvxZIxpQ9JIfVoRJ1Tn?=
 =?iso-8859-1?Q?2VLBax++Cr3jBY7h6k4oYVyUIWSSCAmLBsvIXcN8OmKZFsfe+2YuryIiV8?=
 =?iso-8859-1?Q?TiI/ZBbdkHQcDe2YE6pUK59RvYnHPhTToPamBSUqHErYt033670IsWOAWz?=
 =?iso-8859-1?Q?NMmVzxw9FtkbklCyrnaxToYZ1LLxT5J/JtT360+9oVVRR25eLxsisJ+X+5?=
 =?iso-8859-1?Q?1g3FIaBYDpSqA5WyVm6XEyWCKu8OBgOdW/Zjv19Ji5bX7i?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fd2815b4-e545-449a-7847-08d99a223822
X-MS-Exchange-CrossTenant-AuthSource: SN6PR10MB2975.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2021 14:50:01.1904
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OqkY5ci0MWWtoiXWKY50YJjaXEPkuQHdUDGXHlexLY1wJQuJ349QoAslkE39WSOpyZ/faKRqLJ8UyZXfDj8Ui8D1SyJ7q3tkLZnaRTcA0tk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB5842
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10151 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 mlxscore=0 phishscore=0
 suspectscore=0 mlxlogscore=999 adultscore=0 bulkscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2110280082
X-Proofpoint-ORIG-GUID: ixulPcD5rBB0rGThsRfdxZwWWxIs4FYo
X-Proofpoint-GUID: ixulPcD5rBB0rGThsRfdxZwWWxIs4FYo
Precedence: bulk
List-ID: <linux-trace-users.vger.kernel.org>
X-Mailing-List: linux-trace-users@vger.kernel.org

[Please excuse the double posting - the previous announcement was sent out
 with the wrong version number.  Mea culpa.]

We are happy to announce the availability of the latest development 
version of DTrace for Linux (2.0.0-1.8).

This new version is based on BPF and other Linux kernel tracing features 
and is implemented entirely as a userspace application.

The functionality is still limited in comparison to the kernel module 
based version of DTrace for Linux (currently at version 1.2.1-1).  
Development continues in an incremental fashion to make the full feature 
set of DTrace available using existing kernel features.

WHERE TO FIND IT?

The new version of DTrace for Linux is available at:
     https://github.com/oracle/dtrace-utils/tree/2.0-branch-dev

The most recent release tag is 2.0.0-1.8.

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
     clause and program level (-S in combination with the new -xdisasm=#\
     option).
   - Improved trace data buffer handling based on memory mapped perf event
     ring-buffers.
   - Deferred creation of kernel level probes.  Listing available probes 
does
     not require them to be created at the kernel level.

   - [NEW] Speculative tracing: speculation(), speculate(), commit(), and
     discard().
   - [NEW] Nearly complete support for strings: string constants in D clauses,
     assignment, built-in variables, comparison operators, trace(), strlen(),
     strchr(), strrchr(), index(), rindex(), strstr(), strjoin(), substr(),
     and lltostr().
   - [NEW] Host/network byte order conversion: htonl(), htonll(), htons(),
     ntohl(), ntohll(), and ntohs().
   - [NEW] Symbol resolving for compressed kernel modules.
   - [NEW] Support to run dtrace under valgrind.

DEPENDENCIES

DTrace for Linux depends on libctf (part of newer binutils) -or- 
libdtrace-ctf.  While libctf is preferred, building against 
libdtrace-ctf is fully supported.  It can be found at:
     https://github.com/oracle/libdtrace-ctf

DTrace for Linux makes use of BPF library functions that are compiled at 
build time.  It depends on BPF support in GCC and binutils to generate 
the pre-compiled BPF function library.

DTrace for Linux makes use of 3 additional features that are not 
commonly available in the Linux kernel:

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
