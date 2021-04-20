Return-Path: <linux-trace-users-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE239C43461
	for <linux-trace-users@archiver.kernel.org>; Tue, 20 Apr 2021 03:29:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C5E2861168
	for <linux-trace-users@archiver.kernel.org>; Tue, 20 Apr 2021 03:29:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229508AbhDTD3a (ORCPT
        <rfc822;linux-trace-users@archiver.kernel.org>);
        Mon, 19 Apr 2021 23:29:30 -0400
Received: from aserp2130.oracle.com ([141.146.126.79]:59888 "EHLO
        aserp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229773AbhDTD32 (ORCPT
        <rfc822;linux-trace-users@vger.kernel.org>);
        Mon, 19 Apr 2021 23:29:28 -0400
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
        by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 13K3PMYF168811
        for <linux-trace-users@vger.kernel.org>; Tue, 20 Apr 2021 03:28:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to :
 subject : message-id : content-type : mime-version; s=corp-2020-01-29;
 bh=0TVOPgrxndD102OTErhcZ86cdc5IYFbXOFMwP0miVIo=;
 b=p0JsNt9W3ZzItGKr9aB2jD2wTpIJ5ig7tVel0G4YI7Mz4sQ23MBVnGlKmLAlvqLbR7fl
 U63ElYMu4SmRVWop5Iiw24KUaO1uJdnic7c6pn2j074/N9M74eS/C1/Trac2NVaxR0h5
 GYYY6nhAo/yyhk6svBu0KSCK0nFgOdSPEvjbT7WW3VZr9vbDKoiSMAnSAoHe2ngT4qGi
 ccX/9ADpESJZLd6Csk439CslN3XBvDJm21+LsXISZTzn8s4G5zRy2hMXV3QAT3wIMix1
 LIZqv7TsU2KHIIZwUF7ifw50YIAlcVU0IQTavp2iNQ8Nl/p004Cki4z5eALkBadwxdB5 eg== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
        by aserp2130.oracle.com with ESMTP id 37yn6c5qu8-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
        for <linux-trace-users@vger.kernel.org>; Tue, 20 Apr 2021 03:28:57 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
        by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 13K3Jt1R151923
        for <linux-trace-users@vger.kernel.org>; Tue, 20 Apr 2021 03:28:56 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2174.outbound.protection.outlook.com [104.47.58.174])
        by userp3020.oracle.com with ESMTP id 3809erxppc-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
        for <linux-trace-users@vger.kernel.org>; Tue, 20 Apr 2021 03:28:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cyAHXcmF4ErlPCccTrnG1fXmJ6BUI3P7WS4QpNbJgAN8J3cRRzGL4JVR/OwgiHN09ehw3yaf+5uOhgAxk+XOzMQHXX3ZMYi7QsRZyVD4gdFtlydYNBSahiFP0dH8F3b6DkoaV5SUlPKMPjaWpWrc1WX8j4C9LL2sfjOUNMmEkjipTzbXAHEKj9bjghQ3L9DXjRkfq3M2FWWJwNmnqxjXefix4v/S/8kVTiGAwiqgSH5Q0XhJkR4+WfyUYwtKUT3s1OM0SeDFvAUgY0CnrggOhnunGRrPCPNWY/6Ep7soNINNzO1k6MSBenHSgpWXwLFBqHo9hr7tbk3xG5EpZWPQqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0TVOPgrxndD102OTErhcZ86cdc5IYFbXOFMwP0miVIo=;
 b=oOPAJRMc0abm9i5vYpvXHqb9ZGiq6AAAr7qxHfaSrK1WJAnfq4SnxuGkSh8DxjcVh8SIrhYUjGHK0V3Klfq8r2Btvq/UwlgaEG86e4rkaTLwSbMyEuib+GyHpqWzy5Q4kwYk/lYuMebVBX4xsk1dx5HF7OVJBbpHXvTRZICltktm2bbJ37mVtEPjAZKZvtCHGJ54cU8BR4DZL+MhSf3W8eW+LOEhp8Ufk4sELzE7+UPRJxVfDBALFuviE06S0E5fgr3zAKK12VJi4+uqRRoTSm+s+tfrS6P+N0/n16olqBoUW/9k/LfMk0R/c6B6YEeFevw5Ur08qqB/BU0z+DoFfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0TVOPgrxndD102OTErhcZ86cdc5IYFbXOFMwP0miVIo=;
 b=BuVmq91TO924XU/uoTRFOuwSFrx+DDLRHkSaEcyARzp4t16jWL/tiorhyCjUPlTnhrfHTL6v37dGc8wDqdF9M8+Ej4kl8y0nBKZ1Z+heI/gpVHvoQr7J23ng8Sz4Ot+VXOq+T/cLmhj0vL7gDOvBVLvHFjo4OEtRa5bUmrHlrDk=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=oracle.com;
Received: from SN6PR10MB2975.namprd10.prod.outlook.com (2603:10b6:805:d2::10)
 by SN6PR10MB2879.namprd10.prod.outlook.com (2603:10b6:805:d2::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.16; Tue, 20 Apr
 2021 03:28:54 +0000
Received: from SN6PR10MB2975.namprd10.prod.outlook.com
 ([fe80::3ddb:2379:b62e:e85c]) by SN6PR10MB2975.namprd10.prod.outlook.com
 ([fe80::3ddb:2379:b62e:e85c%3]) with mapi id 15.20.4042.024; Tue, 20 Apr 2021
 03:28:54 +0000
Date:   Mon, 19 Apr 2021 23:28:51 -0400
From:   Kris Van Hees <kris.van.hees@oracle.com>
To:     linux-trace-users@vger.kernel.org
Subject: RELEASE: DTrace for Linux 2.0.0-1.5
Message-ID: <20210420032851.GD27326@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Originating-IP: [2606:b400:8301:1010::17c6]
X-ClientProxiedBy: BL0PR02CA0046.namprd02.prod.outlook.com
 (2603:10b6:207:3d::23) To SN6PR10MB2975.namprd10.prod.outlook.com
 (2603:10b6:805:d2::10)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost (2606:b400:8301:1010::17c6) by BL0PR02CA0046.namprd02.prod.outlook.com (2603:10b6:207:3d::23) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.16 via Frontend Transport; Tue, 20 Apr 2021 03:28:54 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 45ab257e-3773-47d2-6410-08d903ac6ce4
X-MS-TrafficTypeDiagnostic: SN6PR10MB2879:
X-Microsoft-Antispam-PRVS: <SN6PR10MB2879EEC61BCE64AAEDA3D17EC2489@SN6PR10MB2879.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5wD1OhUbEL0UdDQaRkrBn3+GDT0GZ/mhUKGThp3zLkx8pmxxznsB+dMaIKTBZ85aueaqq5wg9DnI5ut3IJh9ahQ50WV3F7SkLX74t45p+NWHPVOO03ViuwWl4811zGlZeoiyVOEG52tIexV4tmGtQRhk4XN19EptMI4z6Kxo4IgnLeU60kHUw4FmRqh4ySBvd0ENkr7FYvnj16t7+qxhCJHC2SvnmaSX0TNABR6GxcaKK7BdWSfrljW2fu+Jz8snWIaTB/iH+pR8Uz/7Ju5cxYZG847iDBoKTIAySkflwGwwBRSFsIGMBCwKOOdcjbQIgU5lH6u0DMf3Oe7cdVQpObfQGCq8MQRldY3LwgohgPkJPQWyFx22ZM237cWogM1t1F7ZGiN2QSjV1UbJZEXxUFBwAwjd+5mMQgv8+nOLawIJflfs8zC+GWcALpdbA7z03fViKzmjUtGfV+3VBKkR4XjTNedcBPXWpXBF16VSKerkQSvkCmk77SF+IwMq3+m30iH6UcYA2mGyTQmVHzrILxb3zGqw98xlr97hHNbB/MQ4Tqr0OCkftA0ZEdRx1TS1ldhD8iHbcgtCYl1/dWpgNtLYOvq7fE08hzWNtDVUX72zqpGfEmSBlTLuSyOjrwmzmwjPDdZ0XnJdab7dQVDtU4bkfuMEraGX87FMDNZnBso=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR10MB2975.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(136003)(346002)(396003)(376002)(39860400002)(966005)(16526019)(478600001)(186003)(6496006)(38100700002)(66556008)(8936002)(66476007)(66946007)(316002)(52116002)(5660300002)(33656002)(1076003)(2616005)(36756003)(6666004)(2906002)(86362001)(83380400001)(8676002)(6486002)(6916009);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?Im1IlfLmpzTUukVnHIJyvawubmsr8onPEZO6xlzY/mjLVJSR060xHSNxgSgT?=
 =?us-ascii?Q?HdNCw5vSR1khtnYRQU4vkIDpIL6vBC8XWuaXh6A+yeOlyGLIRE2EQDQqb7SZ?=
 =?us-ascii?Q?KfwLc4XoUJMuwopLZEPlV5P9q/NPq8VyUrzGYCRmIz1/u7dNxocNvTVa0OV2?=
 =?us-ascii?Q?aIUI2ZJQs8aE+UY7DUC64VQV8MBYeIoFAXpt09RihKMfr+GNsU30PWBuf7Xp?=
 =?us-ascii?Q?APcTfQL2sLpCqCrH5njtCqsUZX2CXZDUzNe1xQQF9pdxVHv4tReW3cLpUvG+?=
 =?us-ascii?Q?xGfPoSA/ebYfARnqn3LBEGN4sDjPaSBLvRyIPk6YUTaos0aLm0A+80ahxJJK?=
 =?us-ascii?Q?YD9FE78czAl1r/IbmAeBJlbinEm1WDMkztEcBI3UStouIPkPa9CWXHp0q4se?=
 =?us-ascii?Q?rm5RC0Cn0Lo/OSLsfDZx/xUqtUOxbbj/oNQJ29FMsYLHsvbxvNGLGRF7LoUi?=
 =?us-ascii?Q?ZPWWomUItBzfs7wdk31bgPoWA3LIULpI9WZzUVzZjd+wfmHpaB/I69Ds8s+h?=
 =?us-ascii?Q?Xyzc32qm5/Xi6dtQ6Hs8klX3n4UD8cd0o+GolPbFX4dMhqoW8/44sLEZeDN5?=
 =?us-ascii?Q?emGofvMmgNJWJYP/lq4G2ngrRkwM8/bpXphBO25DK+t7s79xS/htb9bWcqbv?=
 =?us-ascii?Q?02AApSAOacr8fC+VUKKrwlKxrW7IQHAMwN3OXYcWpbsNFJxrtzZrQYHHdwVw?=
 =?us-ascii?Q?xqmq8RQ/i+WibkSsX9Yp8rJKYE/rVhTifG6A872mi47pxNq+/q5MdaTl0SEV?=
 =?us-ascii?Q?0AdBF3b0jPdu+p+DyE74NiX2+zLPkLB97q0OfpzSl/LzUYJSc7Evw3J1BHoa?=
 =?us-ascii?Q?m/Qss2PB/nsyp2icipX9zqzlWjOFpYsl6kxIzGTZ+uDeYrlrgaTbcyEWmgiD?=
 =?us-ascii?Q?yaD3e+PvKKsRFCNXg7ec7Y5FokqaV3/QDA69awak5+IeJYrUYTGo4NmNDu37?=
 =?us-ascii?Q?igo1m4C21qHvkhNfAaJiubaUBlGb2nlJkt5i2i+x4LeN11+lUNDo4QJ0saZm?=
 =?us-ascii?Q?u5uTBlA1ucXBmQZ+GajqoA1THxnsLG1mI6tuSI7jTx1DjILYJZ3e3kVr543q?=
 =?us-ascii?Q?ppl6lfQOMIb57q0TJveKC9FOiVScUvTj1VYfnSPJojq/alU9NIPuBU8SKv23?=
 =?us-ascii?Q?MrShrMjGJWrfsxlICKnUURfPL352uGEif8Ty9fYi+VBaMM+5UndCPVecZMTx?=
 =?us-ascii?Q?L4KzdIMO7ks1KjV+BUBFl8T+zoYCs9zqgHkXk/ZSDmu9ci9ejWqQwOs4nAGG?=
 =?us-ascii?Q?MyZ7zm82QI0hn3cc2tlQyCEZAQywD4w09PIVR+mB6KfjmPqxsDF+6fHYuME+?=
 =?us-ascii?Q?4bM19hEtNCa6grgtHwZSx5/1xcrlFRnncBSOO8aN2yAi0w=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 45ab257e-3773-47d2-6410-08d903ac6ce4
X-MS-Exchange-CrossTenant-AuthSource: SN6PR10MB2975.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2021 03:28:54.7020
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Nq6ZWUxmmyz6QLIwG3xtTMh6uItK1Ju34wOTaZFu0+3NWkhvBtfLGOfJV3KNgrXCnIl5i6nIFvvSCue3Q4wjZRHqFcYLqSgZ8dNjpsaPoMM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR10MB2879
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9959 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 mlxscore=0
 mlxlogscore=999 malwarescore=0 adultscore=0 phishscore=0 bulkscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2104200022
X-Proofpoint-GUID: 7aIEzTDmVRN9PdDAorA5MC739M4nnQ5v
X-Proofpoint-ORIG-GUID: 7aIEzTDmVRN9PdDAorA5MC739M4nnQ5v
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9959 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 priorityscore=1501
 bulkscore=0 suspectscore=0 impostorscore=0 mlxscore=0 lowpriorityscore=0
 clxscore=1011 spamscore=0 mlxlogscore=999 adultscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104060000
 definitions=main-2104200022
Precedence: bulk
List-ID: <linux-trace-users.vger.kernel.org>
X-Mailing-List: linux-trace-users@vger.kernel.org

I am happy to announce the availability of the latest development version of
DTrace for Linux (2.0.0-1.5).

This new version is based on BPF and other Linux kernel tracing features and
is implemented entirely as a userspace application.

The functionality is still limited in comparison to the kernel module based
version of DTrace for Linux (currently at version 1.2.1-1).  Development
continues in an incremental fashion to make the full feature set of DTrace
available using existing kernel features.

WHERE TO FIND IT?

The new version of DTrace for Linux is available at:
	https://github.com/oracle/dtrace-utils/tree/2.0-branch-dev

The most recent release tag is 2.0.0-1.5.

FEATURES

  - BEGIN and END probe (with full support for the expected semantics).
  - [NEW] ERROR probe support.
  - Function Boundary Tracing (FBT) probes.
  - System call entry and exit probes.
  - Timer-based profile-* and tick-* probes.
  - Statically Defined Tracing (SDT) probes for kernel tracepoints.
  - [NEW] pid provider support for userspace function boundary tracing.
  - Aggregated data collection support.
  - Aggregation functions: avg, count, llquantize, lquantize, max, min,
    quantize, stddev, and sum.
  - [NEW] Aggregation actions: normalize() and denormalize().
  - Pretty-printing for aggregations using the printa() action.
  - [NEW] Support for local and global variables with storage sizes greater
    than 8 bytes.  This adds struct and union support for local and global
    variables.
  - Direct compilation of D source code into BPF programs.
  - Efficient use of pre-compiled BPF functions for library functions.
  - BPF program linking of dynamically generated code and pre-compiled code
    to facilitate code sharing and code re-use.
  - [NEW] Improved integrated disassembler for generated BPF code at the
    clause and program level (-S in combination with the new -xdisasm=#\
    option).
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
