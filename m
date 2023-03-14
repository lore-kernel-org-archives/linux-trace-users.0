Return-Path: <linux-trace-users-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CB17C6FD1F
	for <linux-trace-users@archiver.kernel.org>; Tue, 14 Mar 2023 04:17:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229519AbjCNERR (ORCPT
        <rfc822;linux-trace-users@archiver.kernel.org>);
        Tue, 14 Mar 2023 00:17:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56788 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229448AbjCNERN (ORCPT
        <rfc822;linux-trace-users@vger.kernel.org>);
        Tue, 14 Mar 2023 00:17:13 -0400
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3654594760
        for <linux-trace-users@vger.kernel.org>; Mon, 13 Mar 2023 21:16:46 -0700 (PDT)
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32E3u2Ma031245
        for <linux-trace-users@vger.kernel.org>; Tue, 14 Mar 2023 04:16:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to :
 subject : message-id : content-type : mime-version; s=corp-2022-7-12;
 bh=de8bKWZZh+rWj076VIiNq6FftbwyP0cQI4Dc1Sb6/Ig=;
 b=phzm0WnGKLMFZQ44BMsK8SwcDz13fp+x/zB/FytmXdVf/I+3lDaXQYIQBEVSJkUriSYz
 i+5NzkInsjMp1CsQDZG8MY3Xesw6gi+jYfxMffejUJyHvLnj+qquA/JsqU838KtEV1W6
 FIeuTIyT9p0kIws5+bPhwRhPQ6v0GU8k7ky3OBgo+Zr7t+pjC4dW7hc5gusurObyjCp5
 m0SCU34i803tOtXz+GVVs3jhp5SoYw1fbj6u01gf5wJh+KfUfEhyd+FM9ETMIlXvOsKh
 ktMXYT5rKYxr+p9bGsHh7t0cy4utNV5vn1+g5bK1tp9xhpJVGOJiZxBxU/17NykdFSeg BA== 
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
        by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3p8gjbdkkt-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
        for <linux-trace-users@vger.kernel.org>; Tue, 14 Mar 2023 04:16:40 +0000
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
        by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5) with ESMTP id 32E3DMwA002421
        for <linux-trace-users@vger.kernel.org>; Tue, 14 Mar 2023 04:16:39 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2174.outbound.protection.outlook.com [104.47.55.174])
        by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3p8g3c37dj-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
        for <linux-trace-users@vger.kernel.org>; Tue, 14 Mar 2023 04:16:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KHPoQ4RvqQ3NYWTkYKp2rXAz+pvb/291yT7BwRuRADtiWKG3YCf4y1cAS0PUOk/S0lS7S6If9tJe31jFzyJ0sJulIOMtlkyl1NwzLtMt8H7Z0ZWmLksiFYPebjWhkLOVr0d4PH0QU5DtoOmt0bcVj8wq2GqFu9OIWOKZvI2Wpol5TihSTdG6ns1/cJMefSdS2xDTqm3C9p3bwVp27tmKhfS/8Yo5YebcgGI8kWFu69wFj4Y91JdkJmsV4EimLdVPZd6PvOmKPwNGLwcXBvdj7GHTFGH/lJG79bzA5mEU5YWYe0RzDnCqsHGl1AHnehwHwqarUBHtI8mvrhX5npsmlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=de8bKWZZh+rWj076VIiNq6FftbwyP0cQI4Dc1Sb6/Ig=;
 b=Ir9TmGl0WBli9P2xC48opGW8A1AUH1yN2RIoCLgNMwiF7f+4Qy7/HGy8CbzAO6zDtclmDb6nmHyOInKTgT4VohP9oVZYrSts9oYOgckM7sFfpQK8w8quwMqbh4rfSJNMq7kB5bwQSAE86RjXNjDH8lBniv13B5B7c9H5fH6ezDIxGJTSyEJQBOaGLnUkMT5KzeEs0Zra+whKlB7Lr+cztVjoFDjwULCJBhganJgzSiK/elH+WQKxuJJNWT3jEDl9ry6yTgubnohkKovWMwkz3RT8ssHCjeI5ka8Wa86t2oX2qRaLeOaWgLwHQ1ckBkxKq9Cyg0F5zBELKOalZA/Zeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=de8bKWZZh+rWj076VIiNq6FftbwyP0cQI4Dc1Sb6/Ig=;
 b=xhAv///dqqCbJPjqmGe9Fa55Ixv6fh2vSRUU32DXEW2QC9quSPojPnJB/bR1QpfABJSlBhLyVz87LrFM9aBtFUTyPrt4G+OR9zvZecoYswz8hfeUiZSvlfhpRkXBhdJTLPAMqLb7IMJkCbnsq6Ql7Ez36AqanZvJDleLSUBaxDY=
Received: from SN6PR10MB2975.namprd10.prod.outlook.com (2603:10b6:805:d2::10)
 by CH3PR10MB7233.namprd10.prod.outlook.com (2603:10b6:610:121::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.26; Tue, 14 Mar
 2023 04:16:37 +0000
Received: from SN6PR10MB2975.namprd10.prod.outlook.com
 ([fe80::fa15:aaf9:7c7f:9768]) by SN6PR10MB2975.namprd10.prod.outlook.com
 ([fe80::fa15:aaf9:7c7f:9768%5]) with mapi id 15.20.6178.024; Tue, 14 Mar 2023
 04:16:37 +0000
Date:   Tue, 14 Mar 2023 00:16:33 -0400
From:   Kris Van Hees <kris.van.hees@oracle.com>
To:     linux-trace-users@vger.kernel.org
Subject: [RELEASE] DTrace 2.0.0-1.12
Message-ID: <ZA/1IV6QBMflW3qw@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-ClientProxiedBy: DM6PR06CA0081.namprd06.prod.outlook.com
 (2603:10b6:5:336::14) To SN6PR10MB2975.namprd10.prod.outlook.com
 (2603:10b6:805:d2::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR10MB2975:EE_|CH3PR10MB7233:EE_
X-MS-Office365-Filtering-Correlation-Id: f1ef3bfc-0a9f-4ea8-76a8-08db2442e78f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Y6h3X9ocVmfrBXAsI1CyyChdVVn/tYhJZRxJ+HgaFv5C4ATscVy7HlayojEUC1XcGdw/+aTgW6I4IstDvvUhDDvAd4PYaBksbtSL5xYzhK01XRSyJek/ZKL6q/6rGXoPVSb+6YQ9sBL+rN126AmoYWn75syggfmQUJdgRabJGL1bAYQ4Zg/1oNvcStrRhgQgHBO+W351j0811oFR76aEojz3PuD+XQNIflacfWAp02X6gsOENFNSq0oJzOwAIi+GXvcXoWmtsTKKdXC4cmO/n9aJ6PQejgHDDlLIsqvtCQs1Mwsa+rf+RzVFTHCMbsa0Sio0XuW7UGKcw2ApwKqNZEd4tb9HCw4Be0fpC6ALXlQM4tiCFCnvUrRlOB300+PTYmVH/3qjczYDgnkgfNGuatPTR+jaERH6mzn2bdhZOZkvFspbt7XJJxJ5iUOoKBDIfGVDPhuiO48QqnfYrhOMw8IIe7XLYCFWm/1Z8wAzaK0UBloQANJ7/IxBzmEI+FBCVhPSoMyeXRX4vEcbz8qafFGCPMTKCSwO9h/Kmf/PTpK9AxP6eIYdIZbPie3sk9gnzvUiMr4fr4H5uxdskyoKBZGQTFTfUzub+WiRoBDp0J2SKLbVX5iqWwtrKVhJ/QvzPY8gbW+9VaMIYhvKOx6qSAQSNx9WqXXtrNN62Cq5h20=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR10MB2975.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(396003)(136003)(366004)(39860400002)(346002)(376002)(451199018)(6666004)(316002)(36756003)(38100700002)(86362001)(83380400001)(186003)(6512007)(6506007)(2616005)(5660300002)(6486002)(478600001)(966005)(41300700001)(2906002)(66476007)(8936002)(66946007)(8676002)(6916009)(66556008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?XJZsAEUumtKxjVmPncnj8YCz1WxEd8Epx4BLbZKdGbQBqRXp5x2MtQiW/duj?=
 =?us-ascii?Q?ei8DTWtCHa6hCbQYQYEzLp4oSXijdaNW/5IWwdvbiaDZ5+VidB1/T3+q7cU0?=
 =?us-ascii?Q?IzQf6akJBfkS+z7yzkDwWNQdgxM5WJkxrLdKCm/KpleGos9ocDSRrX7Thk7J?=
 =?us-ascii?Q?9c4nIjI993ssNSILdwU0hvoiq6hdrO116k3nkqN8xv1miAQVBB/2/UgOsjGh?=
 =?us-ascii?Q?jkQKzY0EdZ9fqa/kfg9GDu8F3sY4SjdrX5qjGkjqNnRa9h6YyUFHK1HcWUZG?=
 =?us-ascii?Q?JLDjqwxr7tpSNZFNpg42VkNBb+EQF1o3fho2ECorDuAuXbNLzE3d3YnMfPOD?=
 =?us-ascii?Q?PXE7Pfy6I6oq7o+VfgRrXvcWrQas2is7h7DFYFfJ8MMX7ZDK6VGvVg4FI8HF?=
 =?us-ascii?Q?AaGpLI0NUoMZdSnj6fgEuFgA1ZfH1kRR54CYK4lQa+fpxu+GEU7wsfxYJ7u9?=
 =?us-ascii?Q?83SdOFviOIGrcalFbSAEWP/13mn8gv0B3oMajC+pfjRgYXbxH7DuFXKh3vgI?=
 =?us-ascii?Q?qPPs3oLmB2r8r8cFdEDpmM059lIHOt1Xi9eoF4rAITFGiLVJkxmmcE5/4hdw?=
 =?us-ascii?Q?uUIYF0QTs3jsGwEFTySDrewcC2F6l+US9NVRBmM7njhKLuNTybN1Q1YtMLaR?=
 =?us-ascii?Q?ulVRzx4xe7lWC7KfgxCcVt14KI8UuypiFl++wdqWFd28doWxJLR50wtUShFr?=
 =?us-ascii?Q?k73+7Z9m6zbbgmLDzGZqHaX0REhBayPrwSR84PrgAYemocVCK4c+6xdBbC1i?=
 =?us-ascii?Q?Ga/tFMWRsjGzz1ZveBwmtaEii8Ba9Hbgm1YfH4jKFSPjqPggGXNBd3XhZfzs?=
 =?us-ascii?Q?pI8gucLh6mDACsfA3Fcmaxnwg/dYHz+xxvKuQUt82/URbyIeiSAhVizfbMGp?=
 =?us-ascii?Q?1G14kSpokxAuS1+pD2R3b32US/R0TLQK7oO2wXJll1IdjXI68mAK7ykKiPgq?=
 =?us-ascii?Q?7VooJUu8wGck8omOlxnjJZ4vK49nXkYuxxnT+3xBtwbHjBG2dUUp6LxakLdH?=
 =?us-ascii?Q?fU6jJVsvEojQ9wcpYb8QaP8r81muQaCcLQyzstUpfK2g4kADXN1k0aVOk4vl?=
 =?us-ascii?Q?8YqRTY33vUnK5CDgZLBBt/ChDZAvhY0cR3TmGTrH9zQGAzFI0xYitoSHTQfi?=
 =?us-ascii?Q?2jUNOBElJNIhxo7dNvVzPttgcrd9smBbSUH4YyBrCKPqiOEjq0u9VTZsFqr1?=
 =?us-ascii?Q?ZH+GhGP2q9vvFViy/TPOqK6DfHiYsyP0IBDeOuRedKqUj39RCWXteo8vIxBI?=
 =?us-ascii?Q?ruMHh+uDPiPTBHLWbj1JwnCeJf8m0qqkwi692QWMEOzQBzCA0r9FPOpFuU9K?=
 =?us-ascii?Q?5OB/k0H5NezhIaxXD3AbqTv4TFVzEhiPsrYhsroNw6Q9ZHHpXgdj0vORHgGV?=
 =?us-ascii?Q?6M0wzVhsChShRXMxcuwKn5AFnVBZLUEQ64UnR2DqzqEcdAYRXdi/pLYxLYMp?=
 =?us-ascii?Q?WfrPU9pkM+pclVz3sybSGXB5J+Jr95WJB1SBsf0I0KGCA+/FE6ovbLoHw+S8?=
 =?us-ascii?Q?7HMcjvY5tiHimV/pEUnWiSC3PVT/k8u0fuOspj5f/6/gXabUBNldeQb80dzL?=
 =?us-ascii?Q?FHm2sbCv1RE2sqCTEZwk8f2z/AhzhtkLXV2GDhPE/v0MFHe2UfqWvdALJ+5/?=
 =?us-ascii?Q?KeKFTyYMwReE+CLCURIrkRE=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: z8oZHJbc7X7ugtjk8eVd0tg8OTPbqQEwVPI6n7clYBJdtHUNXOc293YGNys/6ExyygVEaIxjY6U3pkc/zkPVFwB+r4qxI99oxNK+pxJnDt1WWxl8crSU0b2v5rbC3LAgrF3fRyevMnzfLOFwP0qM6sil0lBqm0JQU8qXta6EG7Ktsr78m+1p0wDaxkBB1w3fJLIZshHmFka/seltbAjX3cQ2NbKYIzt8+zal0Mtj8ZcfYM3K71HgMJ2lOb45Md7j4XrcPBb4UBtu56tF+IIOP6dqcCFCLG0W5t+nYuOQcKi+7y/viADMLmf6/2Vr6WHPXWPk71toV5bhVqfZnakoCc95DrxPGDXeeb9UUvwp8SzFNSMlVhgYVNgR3V8YNvPbd7tlB/ilntkbEIzCcbr+hVo+uMk22kSTBA2g3jFIs6QyOV+wnUhSXVGZtz+VMtIsOhTsNp8KDLrFRkN1kyHmxDoOm50//yKA+qSaxshiq4GtYn7gOLTyqA/cXhDHaI9PT6mL66qyOrfdGHsHKgM6sv3/qfVAbhO3kwmsblnchkYVx7RUtLekfBueBYZSyOX67ZdTeROGWdfD7iNxfvEI1rAQt/TgFNc6cXHKJ8nDaXFuA2STDQHfw3UBzIWccvQlXRH0nWmBkjwjLcKC/sWp73A+B5uPurrnaRuG2QH64pXOMFzplu1x2+15vKJyItxmjU//LDpj2xtNqu5dw0aoX6O0UdkbU7B8hT2YxS7AztBo8i/biTiFA30+oYn7NVH7Yi7nGxaGTthvwgH/fDA1Ww==
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f1ef3bfc-0a9f-4ea8-76a8-08db2442e78f
X-MS-Exchange-CrossTenant-AuthSource: SN6PR10MB2975.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2023 04:16:37.5374
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 30BIZ67B89Jywe0Y6VHh+x/AKJ2iLRRxJIInKgrcuJoywgKcZU4zQfPdmV83rK/sxE5v6mmom5seOqd/eusTenJAHigCyMdzLfklbvfEDPM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB7233
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-13_13,2023-03-13_03,2023-02-09_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 malwarescore=0 mlxscore=0
 mlxlogscore=899 suspectscore=0 adultscore=0 phishscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2303140037
X-Proofpoint-ORIG-GUID: 4m_NptRyQC3xJikbUfMG0bJ498A9tL42
X-Proofpoint-GUID: 4m_NptRyQC3xJikbUfMG0bJ498A9tL42
Precedence: bulk
List-ID: <linux-trace-users.vger.kernel.org>
X-Mailing-List: linux-trace-users@vger.kernel.org

We are happy to announce the availability of the latest development version
of DTrace for Linux (2.0.0-1.12).

This new version is based on BPF and other Linux kernel tracing features and
is implemented entirely as a userspace application.

The functionality is not entirely on par with the kernel moduule based version
of DTrace for Linux (currently at version 1.2.1-1). Development continues in
an incremental fashion to make the full feature set of DTrace available using
existing kernel features.

WHERE TO FIND IT?

The new version of DTrace for Linux is available at:

    https://github.com/oracle/dtrace-utils/tree/2.0-branch-dev

The main development branch for DTrace for Linux is at:

    https://github.com/oracle/dtrace-utils/tree/dev

The most recent release tag is 2.0.0-1.12.

FEATURES

  - Providers:
      + dtrace: BEGIN, END, and ERROR probes
      + fbt: Function Boundary Tracing (FBT) probes
      + sycall: System call entry and exit probes
      + profile: Timer-based profile-* and tick-* probes
      + sdt: Statically Defined Tracing (SDT) probes for kernel tracepoints
      + pid: Userspace function boundary tracing
      + usdt: Userspace Statically Defined Tracing (USDT) probes

      + [NEW] cpc: CPU Performacne Counter probes
      + [NEW] rawtp: SDT-style probes for kernel tracepoints with access to raw
                     (untranslated) tracepoint arguments
      + [NEW] proc: Process lifecycle related probes

  - Aggregations:
      + Regular and indexed aggregations
      + Aggregation functions: avg, count, llquantize, lquantize, max, min,
                               quantize, stddev, and sum.
      + Aggregation actions: normalize, normalize, printa

      + [NEW] Aggregation action: clear

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

      + [NEW] Built-in: uregs[]

  - Actions:
      + exit, freopen, ftruncate, mod, printa, printf, raise, setopt, stack,
        sym, system, trace, uaddr, umod, ustack, usym

      + [NEW] tracemem

  - Subroutines:
      + alloca, basename, bcopy, copyin, copyinstr, copyinto, dirname,
        getmajor, getminor, htonl, htonll, htons, index, inet_ntoa, lltostr,
        mutex_owned, mutex_owner, mutex_type_adaptive, mutex_type_spin, ntohl,
        ntohll, ntohs, progenyof, rand, rindex, rw_iswriter, rw_read_held,
        rw_write_held, strchr, strjoin, strlen, strrchr, strstr, strtok, substr

      + [NEW] copyout, copyoutstr

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


