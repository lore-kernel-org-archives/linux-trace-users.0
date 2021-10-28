Return-Path: <linux-trace-users-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 645C1C433EF
	for <linux-trace-users@archiver.kernel.org>; Thu, 28 Oct 2021 14:24:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4C4D561139
	for <linux-trace-users@archiver.kernel.org>; Thu, 28 Oct 2021 14:24:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230265AbhJ1O1B (ORCPT
        <rfc822;linux-trace-users@archiver.kernel.org>);
        Thu, 28 Oct 2021 10:27:01 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:17996 "EHLO
        mx0a-00069f02.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230258AbhJ1O1B (ORCPT
        <rfc822;linux-trace-users@vger.kernel.org>);
        Thu, 28 Oct 2021 10:27:01 -0400
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19SDs8Dr015522
        for <linux-trace-users@vger.kernel.org>; Thu, 28 Oct 2021 14:24:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to :
 subject : message-id : content-type : content-transfer-encoding :
 mime-version; s=corp-2021-07-09;
 bh=nUlaL15OmYB4iZF1VvZf3AQ+xCbisA8Cm4vuwMrsQ8w=;
 b=wAuoIEKXxv/DxOzkCDqiI89+h1/unpCccL6KTr1+FvwnNCwJttzRyvKJBaVIFYbKk0dh
 luhd81LqXTSQtGAqPmB2nCokRM7nIDV1K+l+eQ9DzgWCDInbPh3lXs+jHAyD31g32K+w
 6+sifpy79QZQtjTfqGPKiiyNUN5SGgdkCJ0oC4Fe2rLInb1x+roBXfKTA2gcS1MQpaKl
 QyFvyJwSIgdK+8otHptT2Er7sHV78/COYrEg9BfAFnGPStM6KtaQ4GWAIK8EwiQb7Czy
 dr01qqra0PnCXEwiAOwrqrzThRQo/kh4vc5L2Xi3lQJWux7pQVz+pdV1qGVjGwbSSWuh Fw== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
        by mx0b-00069f02.pphosted.com with ESMTP id 3byj7rtxwu-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
        for <linux-trace-users@vger.kernel.org>; Thu, 28 Oct 2021 14:24:31 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
        by aserp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 19SEFKmc123852
        for <linux-trace-users@vger.kernel.org>; Thu, 28 Oct 2021 14:24:28 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2177.outbound.protection.outlook.com [104.47.59.177])
        by aserp3030.oracle.com with ESMTP id 3bx4gbkje6-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
        for <linux-trace-users@vger.kernel.org>; Thu, 28 Oct 2021 14:24:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bhkeaYWGDYDNOdeaBorXRlzQgz3utvLfeDmJRziiuQqabGbnfFjKEShR72r68FEJeTHU+KAt9DuDAghzkFHVwB9vcyPRNSeO3DHEyHwuTllhJ9WUOz+wkSgYH2w8h0iALtat+0K0jLJFcFnDaHi3jA6CAHaRcg4quPPUkv3HX7GRW3wkeZVyl2YM2sPyatKvDOczD5pVFufl/Q2DtOIbj6P9dG226rbSk5uXI1HDCxrAsuHOq6vDjO1nh+2HFbuWF7rFbvQ6nROczNdx2RC0gCduqoSo8ZUmSfmrTundRPG/6D8anPyqxVwv31BmXDRqYIqIrEfYo7dho+3tgo1RKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nUlaL15OmYB4iZF1VvZf3AQ+xCbisA8Cm4vuwMrsQ8w=;
 b=BfG8LBugXXuSTAt1XZZjO5d3ax0rPlg70UE+NRV/tHLZ+NVpDIENuDrFLBNa0YRhom8YPwbZ7IBCkDqlBGr210n0PvVMQbE2X/CBLkcK3KY5FO0O3cHFA94qx9iizkjdGAWswzRCVSupNsLgeoj0USGsMjlLrZfD7qF9YI+vZW2U5O618thq/1N2aMv1XmCYBmAM/OWxTppjuD9dHwiIHQq3D6fe4oTf9fuiQkxAk1bkeriDaVTIu0WmIygZhUikmdGXOFd/kpYH38HKdbq8ROVHyWSvOfVLetFF3KXpIMQkMHEgl5dm9anG+3l6nO0ixFp2or5QAGHUyoKSfTfWRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nUlaL15OmYB4iZF1VvZf3AQ+xCbisA8Cm4vuwMrsQ8w=;
 b=P3i5hgQd8mp9Hm9ttekFho+120lVr14m7vMPu+jwmtPxWUjM1h3teehTRTS+yhh9UIZCiMgVBUgz2WuOxavCBQt2tcqpZ2bkZeB/2pwezwCBZhwc2ECkTJP+1lXnhIhMGc9dexsuI8hE7kVgkD+9Cra5KhvmAJQcF9Hj4ydmsLk=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=oracle.com;
Received: from SN6PR10MB2975.namprd10.prod.outlook.com (2603:10b6:805:d2::10)
 by SN6PR10MB2877.namprd10.prod.outlook.com (2603:10b6:805:cf::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.15; Thu, 28 Oct
 2021 14:24:26 +0000
Received: from SN6PR10MB2975.namprd10.prod.outlook.com
 ([fe80::15f9:229e:a7fc:4326]) by SN6PR10MB2975.namprd10.prod.outlook.com
 ([fe80::15f9:229e:a7fc:4326%3]) with mapi id 15.20.4649.015; Thu, 28 Oct 2021
 14:24:25 +0000
Date:   Thu, 28 Oct 2021 10:24:23 -0400
From:   Kris Van Hees <kris.van.hees@oracle.com>
To:     linux-trace-users@vger.kernel.org
Subject: RELEASE: DTrace for Linux 2.0.0-1.7
Message-ID: <20211028142423.GB1608@oracle.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: SN4PR0501CA0024.namprd05.prod.outlook.com
 (2603:10b6:803:40::37) To SN6PR10MB2975.namprd10.prod.outlook.com
 (2603:10b6:805:d2::10)
MIME-Version: 1.0
Received: from localhost (2606:b400:8024:1010::17c6) by SN4PR0501CA0024.namprd05.prod.outlook.com (2603:10b6:803:40::37) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.13 via Frontend Transport; Thu, 28 Oct 2021 14:24:25 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1d4867c6-e3b1-4011-e937-08d99a1ea4f5
X-MS-TrafficTypeDiagnostic: SN6PR10MB2877:
X-Microsoft-Antispam-PRVS: <SN6PR10MB28774255F8033FB4E2FB65F6C2869@SN6PR10MB2877.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3513;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1k4ccEuoEOItbnEl8KBvnl6UdtIa70ZLm6us8iP1j6FgMNyUmJfceJyD0RyEo70aawDj3uO4nOzZ76rnowub4JzFdJyD4t1Gcw3DFRyWLl1hHrkteqM4VgRaOShV45XJpjwBry9QS+Xa1vTStFXuG6NNFtEDfQer1Nj/3k6vPALJgz7sti6xVQQS179OetrgNlowt5r4x4wzCxBec72z2QAViN26aXxPk7nMTA9BqRWpANygfFSiRRKtzrCwWzTdoFDSrnQsuYGEgY/gfnRIHuFWiA8XW4ncLR59QU4+f8+bzQlZpDJ1AErmvm+nrfrafKWfo/lcvcm+xKyenZS2eWP+ER+9nd+xqp8yJ58WIlrtxX+IyYTjcfJjwD2yiWCmNO4+yOf1SkqQ2ZAcua9NDQElV0Qz8HI9EjIJcGBr+X74b7gzItBB3ZiVsghJBbtPQfeaz/Y8DAvD6Bfg1Lf9dnnjh1FYOIqZeB6v6ttCDbN8CxLFB7TS9rdp2JnZK13QtTuaciIYhgUuwNavjKij7q0JqxLCef0iamlRfarJWtH1LoaNXEJByQwQAxTISnQaAvznpk9AbSNN0AozrVmrUY1zJ5Ag9t4QUQa6JxwPEbolI2spTsbsejKVyK5ZWv5Pf9Ew7lZDoHt8UoTIIeFIsjTwYrDNfJHcQ6yVtFuYL5KWxoop7XxuMr1QUZigkajune6kXzmY+JWPxZIUlOs6znw+RZuXDIwaZ96NqvKKuW6fz+d+WvDfElT+R2mcYqzrD1v9b2AH+YixfbI+L+mITA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR10MB2975.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(38100700002)(33656002)(6486002)(2616005)(66946007)(86362001)(36756003)(66556008)(6916009)(966005)(2906002)(66476007)(5660300002)(316002)(508600001)(52116002)(1076003)(6496006)(186003)(8936002)(8676002)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?8DfLEr7Vi6WhYFXVjZ7IvjE9kNTGYGOp4FmBSf7lgESFdjabfgB28Doq/x?=
 =?iso-8859-1?Q?KQQMNsyvBHU6jVylGdIyQWPOpBBvk2dUPi+eT0TJ+Bs3du+K8QchpAnRY+?=
 =?iso-8859-1?Q?v05sSyWv1YMkBphA1oj9SbS8prq0mAo5rxSCbDWdcL1gctc1HavnP2RcZe?=
 =?iso-8859-1?Q?zzA+ro26iWCt9ymi/qZ5txCOt2PE5YRJFP39DUvziHGoS7rii2Sp3uzUzo?=
 =?iso-8859-1?Q?emI8tSPJkjP9Klz0DEqYYCHSV4OeWJH5jXO7nQ6arE/NBHE+TFul7RyjUh?=
 =?iso-8859-1?Q?rFVW4/d+o+V4u4TgqVvb3G2GMSQbhtE0aOh3vMIxFAPZ2br3fIU2plelB/?=
 =?iso-8859-1?Q?QTHG1L8t9SZv7ppBRSmFaMJ6r4Dy4VS7bR/ByMOuU3QW+c1fANEKxPjoUV?=
 =?iso-8859-1?Q?nJItWlWOg3TGp0p++VJihlRfcPN3NDZuLfvvEIszd7i+0LnjGeirpzZU7F?=
 =?iso-8859-1?Q?U741vuj9Yvqt99morjzNRZpNRlFQqfTKEXQU0tRYyHr4ldP/GGuiS3aG2k?=
 =?iso-8859-1?Q?jn50sVdDog/vQMNzbWsbh3fIpOrqb8Yb5lBMR1yPGwk7ln1O30otaToEXN?=
 =?iso-8859-1?Q?AJN9P0UKCAZVsSDkHUcGqdegkm8A3egvt4SCESm/U6nqma394WMB8+p8Rj?=
 =?iso-8859-1?Q?iffwohokmJMG9anHVmhJM+J3nZBMIf5kBX71ibLbiblq1uyGwZJQ5ezfFx?=
 =?iso-8859-1?Q?0/m19rMxzGAryBAtwAmLA8a0Fl0OZJLlfiFtPIILy4GYNBh8uu8vpCq3rZ?=
 =?iso-8859-1?Q?bXGb+fwFbaWIVrWE2BtqUpZ+mQK0IKQkIY3HwCIsgdlkYBJJWxUB110GOz?=
 =?iso-8859-1?Q?Uu1IlXeTSnwLdUUWu0wvbTcVfKxY7pZ6N6U/R0nUJfq5FIxNVXzx13woQj?=
 =?iso-8859-1?Q?54dPzahDhmAIv1telwDW3NEme0qg3jmBvu2ANS8hyb07SdtN+kV2mHECgX?=
 =?iso-8859-1?Q?S8uVYWoFCQ0gGpZeqsKhsUJetQZFHwulhEWCR8pWqcweCF1yYWZV9I2PwT?=
 =?iso-8859-1?Q?Z48ik2+x36Ys8BUC0fVmOM8Jbkj7ubk7oocPAlhPkNGuP6OOy4t6aV4yBl?=
 =?iso-8859-1?Q?xMYeWYwWP0uuWIKNUFBgp2zqEPNMj4EOxu1bIzdhAMGzCKHqRSwYuDSajD?=
 =?iso-8859-1?Q?edd9Dlfu32bkz3FKIZJMyecWefHnXnA6laEg7evS+hosnhzQjvPrtshsac?=
 =?iso-8859-1?Q?X5emjjwxqpn94za1Xr8EX2OXC5g4NLArqUogn2km96IERw2yHq8G1LK4sB?=
 =?iso-8859-1?Q?2mseKZ+aLTNH01oySvduXj7iQntT8G3Vkmx7N/WBLqTfaf2sstCuF+mXHK?=
 =?iso-8859-1?Q?FlcnxEeBIibSmpge4qHhpGnplk0j8z6bc1WHarvZildwk4iOvTYWebd53w?=
 =?iso-8859-1?Q?oWXL2ILYTT7YZUs1P0uJqlWgmCo9AXh13u7PVtne9uFPhNrP2PiiJaDKTA?=
 =?iso-8859-1?Q?kG5p7RAVL0s/q5/Y7cT6e25M4M3QGKzHP+JwDFflYwNow53Go5mqlXZl0j?=
 =?iso-8859-1?Q?k0Bz/36hT0rXO3N+ln5imcAZyQr92xO3d98QZPrSrgFuWF4cFTC3rO160Y?=
 =?iso-8859-1?Q?dCQUr4NTGOL9EZ6tKCGVpmkBsS71dc82HmOjq+vhg05eQfFYT544uSYwl5?=
 =?iso-8859-1?Q?ATQ5rtxgxM3TkiCD1CxQdPc7W73BP+hVWz0wvhGvyJBQYX2VAhNTr5uLHQ?=
 =?iso-8859-1?Q?vtWfsEgij0wqKPr7HAuO/h9ZPosbS8vzXL3UAIV2l04a/+66hoNs6LNd+g?=
 =?iso-8859-1?Q?D475R+5qdvZfE39b0P6UFAeuz3/fikRR3W8SvXJIS1KZHk?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d4867c6-e3b1-4011-e937-08d99a1ea4f5
X-MS-Exchange-CrossTenant-AuthSource: SN6PR10MB2975.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2021 14:24:25.9270
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0tvMepkI9YjgwGXR3aWq2/55GdswcYbb+D4rAqKitf64wpxKRddN6tfXPGdoU8us2Iwx7RF0rxK8Hidd+8spV+MnZEvGcQcYwouCSCiuojc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR10MB2877
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10151 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 mlxscore=0 phishscore=0
 suspectscore=0 mlxlogscore=999 adultscore=1 bulkscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2110280080
X-Proofpoint-ORIG-GUID: Z3ii9VtdE0wkrNTeunRbAP_spE3kPTc9
X-Proofpoint-GUID: Z3ii9VtdE0wkrNTeunRbAP_spE3kPTc9
Precedence: bulk
List-ID: <linux-trace-users.vger.kernel.org>
X-Mailing-List: linux-trace-users@vger.kernel.org

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
