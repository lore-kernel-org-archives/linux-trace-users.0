Return-Path: <linux-trace-users-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B025C7EE23
	for <linux-trace-users@archiver.kernel.org>; Tue, 23 May 2023 18:58:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233536AbjEWS6Y (ORCPT
        <rfc822;linux-trace-users@archiver.kernel.org>);
        Tue, 23 May 2023 14:58:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52824 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233378AbjEWS6Y (ORCPT
        <rfc822;linux-trace-users@vger.kernel.org>);
        Tue, 23 May 2023 14:58:24 -0400
Received: from CAN01-YQB-obe.outbound.protection.outlook.com (mail-yqbcan01on2079.outbound.protection.outlook.com [40.107.116.79])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 17AE591
        for <linux-trace-users@vger.kernel.org>; Tue, 23 May 2023 11:58:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IrXzZD3s1ZwKraCawHFUzdAAQJCSAdowb6gwQhVlWm67Jk9nxYHah8lBlCUpzPJJjywdXaaMq6ovQFmUXoaJPG5x2/liwytHL1MZvCh2i5NP70sCvQN10i09Se3d05RrkSFOCQ/C47+vS5Q6wjnfmdf+p0pKNHCk0K7YPzivXqVAnYrF94mHqiEb/qjMG0pLijbvetVZakS3RuclnRASdQxV4T2qV3oj2Iz7RVwkPRWhPtCIHqpRuFDkhlnGllAddLDvE1Fa+w+J3605Qx9qJz5AyVWUvWhAFVuersExRys4mDXGu3fc1wInUmzgoKm7f0DlhI77QIlYeTGeI605Yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ig4MNLrBqCKHTnFbats74MAOAt9rN3utEj3dld2aWrE=;
 b=WbRS9a8RXhlDV1M3QkcvDpd6VIp28jahrF3vE+PY/KTJVMgXPW2ORCC8+Vpln/5SjaAR0Kyl+c67okDcAUAq+2AXWZQJz3U+DV0nb+A05sYbgYDePmD9vKC98hKrga17cpZwmOQ90kq8a7mkor8gGwuprmq61dyCuaXQ5L7MxTQBXrTGT3FseweVqEiKVgCsuxn9pajr4+pL20Hio98/q+6fsHMhSDa4y9pRki6GLb+V3LNhV2ONnYEkzbj1DxXrBuG8+vXgZRwdRpcKQTieRus9ZmVoNUysEOIK3pmtNsAEQ3/GbBBb2USijXIn4dUHUFl5stPWOP7poWNli+gMqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=efficios.com; dmarc=pass action=none header.from=efficios.com;
 dkim=pass header.d=efficios.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=efficios.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ig4MNLrBqCKHTnFbats74MAOAt9rN3utEj3dld2aWrE=;
 b=BWMVnOghH0geVCpfhwqG3W+dJbhPUoQRgPTkpkXrvqbNSpXJuN9HeHL55Imovzlcc4mUEeGohKL4WzClehxciQspYdPDXtPJ9bm6C9KVUxCSIJ1dayuVtSosQQnjY13kTCCPFk4n4Mq12OsGjC0UHVy+3k+j0csBxMXlo1FxZ1lAc1omHp8r/ATKwPeHo1Q/7kDZWWJqOB1QhSRXs9BSxUxRKrI5H4WPLoqJzieSmzFEUvEBs1splpjufwxjgp+UY4OpWhjv/BvOqBXF/yI/lcmlEdD90R36w6t75WwbIF7YP2LD6LuhKt/mOPvjPbkAloiC2e+eQ2zMNJbg8CdhGQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=efficios.com;
Received: from YT2PR01MB5984.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:4e::11)
 by YQBPR0101MB9104.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:c01:5f::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.29; Tue, 23 May
 2023 18:58:19 +0000
Received: from YT2PR01MB5984.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::43c8:88d2:4710:99d5]) by YT2PR01MB5984.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::43c8:88d2:4710:99d5%7]) with mapi id 15.20.6411.028; Tue, 23 May 2023
 18:58:18 +0000
Date:   Tue, 23 May 2023 14:58:16 -0400
From:   =?iso-8859-1?Q?J=E9r=E9mie?= Galarneau 
        <jeremie.galarneau@efficios.com>
To:     lttng-dev@lists.lttng.org
Cc:     diamon-discuss@lists.linuxfoundation.org,
        linux-trace-users@vger.kernel.org
Subject: [RELEASE] Babeltrace 2.0.5 - Amqui
Message-ID: <ZG0MyPrucP4x9VA4@efficios.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-ClientProxiedBy: MN2PR20CA0050.namprd20.prod.outlook.com
 (2603:10b6:208:235::19) To YT2PR01MB5984.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:4e::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: YT2PR01MB5984:EE_|YQBPR0101MB9104:EE_
X-MS-Office365-Filtering-Correlation-Id: 1d934b15-f837-4158-5be2-08db5bbfac2d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SVeBlQgg354002zOAtEmYixUwRQDFgUQVwpfgdsn+kni7PaKY0tJRkq/CRMpm4uZIBJkbHvNKz65y9YQCvXEUvsA7k80LGHioAaxxmlPRwcd8XBjY73/fHiAJDKKB7F03/klxZ5gDbvHzze/VMo4wAlSDb/PKD1C067WiLce8j3M9/bB7RJsvMppYdsUN/qLQO1XQ9o2lq6V1gAE01toRBSh2R161dJ833iW5w2AnWRpDZ7PPaKrR1L4aMWlfyi0d2fcwN1Xs47c3Dqak3WJm24cWuULB5vpuWgGVF79baD+XHmoGaevZl5YaSoGF4c+8AE/6dxLfuTADoI4U+5LPmzB7jZXppPLcoMJkGJ0I1CnYGCGhhThxsC3Ps/pDdfVIDjz6Exsp4qHHVtpooB2A00KR7CP/Y+XIfqRc0InIjBwExQv79/kn4lzjWYcNKlK8hR2fC0OhqlsR7NviIziw+JIGa03YI9prqAa9oNj0m2+EBGHUS/48b+z51ldVufWCQjGzRMcBroyfrQK0Pr5FC3QZQdHDCTfIpr0Sx8MP6MzjVlz2BwFYaat3iDRvLERLPnyuk7F/mVwAxCruC9Z3A==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:YT2PR01MB5984.CANPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230028)(366004)(136003)(396003)(346002)(39830400003)(376002)(451199021)(38100700002)(2906002)(2616005)(478600001)(8936002)(8676002)(6512007)(6506007)(36756003)(6916009)(316002)(4326008)(5660300002)(6486002)(83380400001)(966005)(26005)(186003)(66556008)(66946007)(41300700001)(66476007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?3bNIPgXabToRs0bNCj9C7B3qqKUJvKuspi4M7dvtggFbJk4Fbkp3WdUlLqJ4?=
 =?us-ascii?Q?+aB3raonNeYT+/g1HAusQUvUjUPlHKv26wgxF/o9yBC24aZWViC4gjB4uVur?=
 =?us-ascii?Q?y0ShGS3yUKqFTuyXK8oNWkvaR6QKNdegzD3Km7SuPCazNL1V+u5gaNyFpVFp?=
 =?us-ascii?Q?qTVQiHzhXzdXOdt9TIgbA7VY4ZIuvtb3plhDpTomZ3yAiZvgN9oYZ60oPPM3?=
 =?us-ascii?Q?VpvXXYVn+n+EODAArf+e5TyeG7YdxQ/K87SqcSdjo1RymsHdUy6gfsFTDQtJ?=
 =?us-ascii?Q?7eYpZ6njr9AdFKLS94m0E5YiLTeNulcTIzeYg5TSFW3KTBOPM5c8lAPWBKcg?=
 =?us-ascii?Q?aOxV8H7lJh01IiRZJmYNXtJp6tw9pbweFcTIBoHSl3WZQI6rlNb+Hp109bAI?=
 =?us-ascii?Q?YNfBSVpABXitK1kqRIRbH6iU69Xgpy5Zkiyym5VNo7P+7TjirvunS4IMOMq2?=
 =?us-ascii?Q?Mm51RYBsTmojKiP8TUvQqrt5QGhpTWmqfzs/1SDQ0WSI7MLdeBwOPKmGb+NQ?=
 =?us-ascii?Q?i3wFmC0qmnsKWOXCLto7T1uy4EWlO9fdR7cVdeTqIvWIyVu/kJZngPRoF7B2?=
 =?us-ascii?Q?jRGciJcVvV8OUVd7MOaY7eo7hp697ypy80LyofSIkT/uLtxJDY+1qryhoQy3?=
 =?us-ascii?Q?64PKQ2PZa+lO66UuTcwG1E0+bG8zJJK/U0hGfxDKexHTUiB3ldA72GdTNNFZ?=
 =?us-ascii?Q?/upYltK16nkqmPAjMNec8d3CoNU0jGNbpUecNsndE0XgbEcmIDY7Z3DhIt7j?=
 =?us-ascii?Q?IXnbF180F+f5Kw3tEe1J79C3sHI1CQ7l9MQOa95XWzU4DIsTWd4Wdas+ZOBA?=
 =?us-ascii?Q?KPwiYmXpU5El4bl5rQryuPV+dFWXj70QhBoQDMgx+WRx7NqhL1voUDgRuCNB?=
 =?us-ascii?Q?wxWoDxDK7/LcCv/hoXhUCZm/RBHSJOY7bygKWl9rm0ZtAZ8/eQAVz0f8tzn8?=
 =?us-ascii?Q?PI19yjRo61PS4u3WLnrqTs0R/JZLztf3mArzd9oLhqZpQPv/2uWSHICUnRhi?=
 =?us-ascii?Q?2nwmvja5yB96KAkANam3oaFFpQ/XO0OXMCkhVAY9nlRBuDtwZDweFTxPsj4q?=
 =?us-ascii?Q?toSpL+zYMQnlHzfpBdGb3VavGTPsivn5ZTqPNb+3EgoQf38zfo9ADY8ukVyQ?=
 =?us-ascii?Q?+MBqjpuV3rFp4XpNmsdMgdPuDJ6mBLRKdQn0Kz8Zh/d8KUqwMKEPprkEaanU?=
 =?us-ascii?Q?bK6BfHnteAjzX//nv951loFbdsN99Qs2dhdqPBDOnHGJPCbBU2VHwX7ycgDr?=
 =?us-ascii?Q?PNXgvgWv+W4lCW6Nxh+t1lYs8EvDQhpN09wuRKagNuTw5LZba56fRNAhfgIY?=
 =?us-ascii?Q?lNyexHu92NymWV0O/8fGStSyKm/6fjqKe+bAbhA9p4gFJawuSY4KfoI2GF+E?=
 =?us-ascii?Q?qMKtt568FptNkFabIlKQWljHZ1f9qUJ3TIp0IQgIsA7apFXTnU0SCSMqJHID?=
 =?us-ascii?Q?pszg1GJ7hchyjxYaF8iYgPOkQUtv36pC8VNJMOkh5jSwWFrZU1bVFFg9exvJ?=
 =?us-ascii?Q?3asQNgj4BdPYJaky8bqInN6voaoIaWydgqGFa0M7xyhcfZPTtFI05I0pSM6G?=
 =?us-ascii?Q?+VLEqsWV9kdNwDa8U4DOwq/rGpy1lbhAegWx192G?=
X-OriginatorOrg: efficios.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d934b15-f837-4158-5be2-08db5bbfac2d
X-MS-Exchange-CrossTenant-AuthSource: YT2PR01MB5984.CANPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2023 18:58:18.9496
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4f278736-4ab6-415c-957e-1f55336bd31e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hMTIuB1HbPTmMv/w/H0rhRZvnHALWrO57hvS7SfX47fyk4EEhVkpH+99Ku1gVa0rv5pkU+5W6SwXC5YbEMbrEA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: YQBPR0101MB9104
Precedence: bulk
List-ID: <linux-trace-users.vger.kernel.org>
X-Mailing-List: linux-trace-users@vger.kernel.org

Hi everyone!

Today we're releasing the fifth patch-level release of Babeltrace 2.0
"Amqui".

What's new since Babeltrace 2.0.4?
==================================

This release contains a number of plug-in fixes. The full change log follows.

2023-05-23 Babeltrace 2.0.5 (World Turtle Day)
	* bt2: honor build system compiler/linker preferences
	* Fix: clear_string_field(): set first character to 0
	* Fix: src.ctf.fs: Not resolving event common ctx
	* debug-info: fix -Wenum-int-mismatch problem in copy_field_class_content_internal
	* fix: pass exec-prefix to python bindings install
	* fix: document proper Bison version requirement
	* cli: use return value of g_string_free
	* babeltrace2-query(1): erroneous parameter used in example
	* Fix: tests: print real values in a fixed format
	* Fix: bt2: autodisc: remove thread error while inserting status in map
	* tests: src.ctf.fs: add test for metadata with invalid syntax
	* tests: shorten names of session-rotation trace
	* bt2: ignore -Wredundant-decls warning
	* ctf: fix -Wformat-overflow error in ctf-meta-resolve.cpp
	* ctf-writer: fix -Wformat-overflow errors in resolve.c
	* Fix: src.text.details: use write_uint_prop_value to handle unsigned values in write_int_range
	* Add `dev-requirements.txt` for pip
	* Fix: src.ctf.lttng-live: consider empty metadata packet as retry
	* Fix: ctf: wrongfully requiring CTF metadata signature for every section
	* Fix: src.ctf.lttng-live: session closed before any metadata is received
	* fix: obsolete warnings with autoconf >= 2.71
	* fix: explicitly disable '-Wsuggest-attribute=format'
	* fix: set stable branch in gitreview config
	* Fix: ctf-writer: list of reserved keywords
	* compiler warning cleanup: is_signed_type: compare -1 to 1
	* Update working version to Babeltrace 2.0.5


Important links
===============
Babeltrace 2.0.5 tarball:
    https://www.efficios.com/files/babeltrace/babeltrace2-2.0.5.tar.bz2

Babeltrace website:
    https://babeltrace.org

Mailing list (for support and development):
    `lttng-dev at lists.lttng.org`

IRC channel:
    `#lttng` on `irc.oftc.net`

Git repository:
    https://bugs.lttng.org/projects/babeltrace

GitHub project:
    https://github.com/efficios/babeltrace

Continuous integration:
    https://ci.lttng.org/view/Babeltrace/

Code review:
    https://review.lttng.org/q/project:babeltrace
