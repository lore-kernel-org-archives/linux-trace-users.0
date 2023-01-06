Return-Path: <linux-trace-users-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BFA3C3DA7A
	for <linux-trace-users@archiver.kernel.org>; Fri,  6 Jan 2023 19:10:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229877AbjAFTKW (ORCPT
        <rfc822;linux-trace-users@archiver.kernel.org>);
        Fri, 6 Jan 2023 14:10:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51244 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229547AbjAFTKV (ORCPT
        <rfc822;linux-trace-users@vger.kernel.org>);
        Fri, 6 Jan 2023 14:10:21 -0500
Received: from CAN01-YQB-obe.outbound.protection.outlook.com (mail-yqbcan01on2079.outbound.protection.outlook.com [40.107.116.79])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 82F4C1A21C
        for <linux-trace-users@vger.kernel.org>; Fri,  6 Jan 2023 11:10:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K0xF2dEXaBsKe7mHRBIraupOdVeJ0Dy8S5uNpniYxWuTPSEd/Li8+DJL+8R3dksTxwdZ3X5tjPRXGv7Lr/fliCYheuweYspBgGZceeX+ovmEOYtK9lRisYvDlCvoiDkRdqIuDoWcsLLxT3N0BJDHKmx5Mh3kzgW/mYMpn6zwXuF1lnbGAgrntAHFCpwugWn4g4qRjkpjXBtGP50Wf7b6b7wMleM01/E3H553Gt4mfP5bowGZMEbnd5tPxPif6cwdQVMDB6wK2VYW4Udmm3FbqUtHXNMIxX9SgxskLTU3u1QpFucdgPGN8ZHhFFj/k7p6FU83fDk1UiWjtms65jCIuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OPbDAkG1eUgPY/IelZf5YYZ9Pw3KzBseR4iFC2kyK/I=;
 b=Z/eyK4iWK76UtikLUH+ZFruafWuh5jG+OdoLoWy9ThwKGL44E/7mlrjw3yU3R5zKa7ixG1yS3nZSOnCiZiez6+gBX7zeB58AQoAI0cRfnH6be5D5jp03GCiI76ud1q00t7bVB3eydb7ke8a9ytiiAfM/mTs738zIJaE9J4gYh8tBE/WSRo1KBsigPTaxCgHojousxux1HcUTsoHZ88/IV04rVINj7BNDth6U4r3ic5CvuD4Kf4LHvDrOH2x3kuoI/9ob27+WdWBmpR82/uLFl/JLbRmJH4+fyFFZfZ2XyT4/ZefLeRCXW15B79TEd6VlLAZSRg8i86Cf3RnnHFXhoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=efficios.com; dmarc=pass action=none header.from=efficios.com;
 dkim=pass header.d=efficios.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=efficios.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OPbDAkG1eUgPY/IelZf5YYZ9Pw3KzBseR4iFC2kyK/I=;
 b=e2iahbebRoR3IjzzzSZtSJW9LBmRO+x2uPep59csQH5wDb5Nn2+gpR/Ru80QbAMfCemuV2cQy6ztvSytDAVVDnKD60kYBqxVV6cginvZDVj+dZxUdgSx/UPfq7T/wGhcqN111IWLBSk1EAxXBQL6oQxDdhM9xDNOgF7KTNr1g36y7Qo/DdYhN2yYYxIjhXxqdumsL0G2rSaPoPS31n2FKmZzimsjdSTSjrqjbh3e/J0Q6x5sDmTi1SKWGrrV8HGTJ8gwsil+Ae0cSXGBXQNvfyVnr7PPCOeLCDYakvJAscp55Nlgdt2yYnUZaPeuSxHvuHH2qGULY0nEWC2BiE1OTQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=efficios.com;
Received: from YT2PR01MB5984.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:4e::11)
 by YT3PR01MB8195.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:9c::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Fri, 6 Jan
 2023 19:10:17 +0000
Received: from YT2PR01MB5984.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::eed5:b4fc:c863:b2a]) by YT2PR01MB5984.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::eed5:b4fc:c863:b2a%8]) with mapi id 15.20.5944.019; Fri, 6 Jan 2023
 19:10:17 +0000
Date:   Fri, 6 Jan 2023 14:10:16 -0500
From:   =?iso-8859-1?Q?J=E9r=E9mie?= Galarneau 
        <jeremie.galarneau@efficios.com>
To:     lttng-dev@lists.lttng.org
Cc:     diamon-discuss <diamon-discuss@lists.linuxfoundation.org>,
        linux-trace-users <linux-trace-users@vger.kernel.org>
Subject: [RELEASE] LTTng-tools =?iso-8859-1?B?Mi4x?=
 =?iso-8859-1?Q?3=2E9_-_Nordicit=E9?=
Message-ID: <Y7hyGFwLWGQ2KMWc@efficios.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQBPR0101CA0335.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:6b::20) To YT2PR01MB5984.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:4e::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: YT2PR01MB5984:EE_|YT3PR01MB8195:EE_
X-MS-Office365-Filtering-Correlation-Id: b7b34c80-70e1-486f-d1a1-08daf019a5f8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mv1/GeEc9iY46MKAptrXrpB3rDtVFPKhoQBUTCpkdsk0uoNO2fQnAm0R3LbcX4zM3O+fBsDIkxsJzRkTnHaMvgXGmSdaDonvIUYHQHUq0TCtgG3A9fg0/1r+o7zVeBH0wdjSClAA5YL3UKvIZS8eOrnQpFV0w2/RaYOTH4ZllQgtUSVJFnAPvtgJtsEqO8XLUuqk/bE7IypwflCTuAgPs0kQd9R8F9iK5lQsGHpjdKroWUUYNUvLp2+eW+/YftuvVEVW86kdgnjLr8l/bLarUN2Nb6KtUEVs1EhEBC4jU8ikWkFeWZnDK0/kW0JajIYbvjj2GacVdWiMt2x0/CZTsF5lHfuCTbEto+dMioBzaztJQUupR+h70dDDfhMvevYF57JHdvFw2hHxfHBwWjXycqIe2al5lJSjlg+vfAwwECZ0zoDiNbsd4WLCyIl1Xvl9t1tO/b1FLJxlJznjaH4jj+mKcSBuJ2p8niRcEHvzc9vCm0Fka5O/zPX0XIxyaRiKjB281OderyfKVnR8rJRTG7zHdoAJ9oySOYYRfQt6GmvM81cMbNfa6tetqf23S9LahWGK4hwa1GoX10uw7Xc8T8WdXdgq2hdTQGA5K40F2KO1ATIhskUUvbwG95H+vFkbY3fui/L41sBrmPog7iITycCE9nYEHBoVlzdN6ls95AU=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:YT2PR01MB5984.CANPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(346002)(376002)(136003)(39830400003)(396003)(366004)(451199015)(316002)(4744005)(5660300002)(2906002)(41300700001)(54906003)(66556008)(6916009)(66476007)(4326008)(8936002)(66946007)(83380400001)(478600001)(6506007)(224303003)(36756003)(966005)(186003)(2616005)(6512007)(6486002)(26005)(38100700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?DR2Afl7QnF6C+Y0znikU0ktDRHIjR51MBelnREy9vZllAJwYYs7csnKh3P?=
 =?iso-8859-1?Q?9QoKc2g/D7L3yL6v1A1bfZ2cAR3516Z1pn003DwR4WiLXLkkhwol9KUt9h?=
 =?iso-8859-1?Q?Kl0pXYYDHSvqsnT3Ltc7WnDQ0+IZmfRlkgQq/fdnMpCxrs6HPFfaefwxZq?=
 =?iso-8859-1?Q?udF2So+Yx0SK1H+dN6lZVoBy1ZmnDCYJ4sAjOKlWRbavbVbUFmWxUiklb0?=
 =?iso-8859-1?Q?q/jKg3r7/4IMLWNYV3ctL80PWqPHdWZcVbRL9mLZVpqGothFDQcduJye+N?=
 =?iso-8859-1?Q?glzNpDD6xL4dAAHZh0wi8cgUgPM4EWkPIj/nJm6ZzwS8wFawFdJFE7JO2e?=
 =?iso-8859-1?Q?jGGuVT/yrr09fvAemR/bps1+HbxwATiKSUkAkWuNGkaUUO77VedTSPTaCD?=
 =?iso-8859-1?Q?a7nyJkLp0B4QNc7o2zNiQCxaE/lqfOUhY5Yrufvnytf83D9h233obprPjf?=
 =?iso-8859-1?Q?Zl76YxPd+E7T9PgGBjtxTetG/ciWvEXZZZfWvcPmyXOmpzuxHi4ikXORsn?=
 =?iso-8859-1?Q?WsGIyzz67hQ6qGTIhDKlU2UyKRpBDDLnjJI0W33vV3mO1ocExg0bkWCGcG?=
 =?iso-8859-1?Q?VLWtI+A+t4iEO16pi3Pw7O/PBX7VYjn5CR3sZR4LA+Y6R1MxwVvARYtuF/?=
 =?iso-8859-1?Q?yFiGUqGUzLmmcg1Eqhwk/1oVCvJNcRd/SAPn5yM/eT/aUXxl4g6NKsRAEt?=
 =?iso-8859-1?Q?sePhzRVxsl1vRrmNb7b5/YIw+dJffz7P6Maau9i9ehoblfi8P2ztcfjLq8?=
 =?iso-8859-1?Q?qO4mSDlfarC8Fpl3EXVnJmORpjJybJG8kwI4MQ8JxmSuFPEYZBiXU5W3YX?=
 =?iso-8859-1?Q?ZXbRzegkMoKEwXPF600Ogixm9i9NkTLOzLRVhPkH5kA69/ndGJWLlYnVWN?=
 =?iso-8859-1?Q?dnwPuOmKSxhm1cyu88AXU+NvA4/ndR1/0MbEZmu0HEsC7i0rLA69/bTV3I?=
 =?iso-8859-1?Q?XFTZ6CctRbU6DOQlreCd0sZy+Uib6KN/TdTCJMbvG0pmGhhb5zMmFDhfJk?=
 =?iso-8859-1?Q?nQvQjMfvsFlkFLvL9A6AjzACJSvm+X6DDRlmaKGp9LwC7Zbj+l8U9ZFuee?=
 =?iso-8859-1?Q?xqnmJQ6PcIi4iSin41vL/2NbZwv8NdBsE4hFuBhopnSF5ATPSSczCsuITx?=
 =?iso-8859-1?Q?lA3kP5yzbMfzkmSWNlgdc+aZUvlKJPlnpdnNAWCaHTfgPflsNInzu5hSOb?=
 =?iso-8859-1?Q?Dv8dOpDry2bkCoGgD4iCpn8s9+BVlolD7HwZ4Wd51uAesymZtWXpT5qoRE?=
 =?iso-8859-1?Q?+QrZmm4SeHmWs8pDSyty5CbgCTM7jHNmTBCgLfDvUqlUJ3fMy7eAinP9zo?=
 =?iso-8859-1?Q?UmwCQJ1uLy8JsaNDx5BfBhUM9y5Kd56m1mkxZf+5rra7jBdCtsYojsjLh4?=
 =?iso-8859-1?Q?tfovTc8adlYiodr3oLZNurG7LeM3vfyY05dti08C8GvuZuZXsSF7QkPYdy?=
 =?iso-8859-1?Q?JWmXYr8dlfz1RrJWkC8sNGwo/eau9ljIv2JKOeFgL3qmsiO8Xwsn0hDiiL?=
 =?iso-8859-1?Q?PDDSnAa1ugz1fHA9t3yzZMG1YBdSZYPcqWqbOpqwb1kMXhtxthN5p8CAqh?=
 =?iso-8859-1?Q?y7LYOGcQ0UKNZ2VpDGIvkKAlolhEFjBT8KVfMU7fbBfHSoJjbVRsZX58Q5?=
 =?iso-8859-1?Q?01JZaQbn3/m62Kjyevt3osa6Zoei7P+Ocb?=
X-OriginatorOrg: efficios.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b7b34c80-70e1-486f-d1a1-08daf019a5f8
X-MS-Exchange-CrossTenant-AuthSource: YT2PR01MB5984.CANPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2023 19:10:17.7148
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4f278736-4ab6-415c-957e-1f55336bd31e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hJReP52BQp3awhvVJiA24i/OmdgTGrM/xoJSHrw4dRXo4YBAH6IPMhormRQ3C4fKGPTUGxl8MkWqT5qKJNIsNA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: YT3PR01MB8195
Precedence: bulk
List-ID: <linux-trace-users.vger.kernel.org>
X-Mailing-List: linux-trace-users@vger.kernel.org

Hi all,

We have just released the ninth bug-fix release of LTTng-tools 2.13 -
Nordicité. This release addresses a number of issues listed below.

2023-01-05 lttng-tools 2.13.9 (National Whipped Cream Day)
	* Fix: lttng: poptGetArg doesn't provide string ownership
	* Fix: relayd: missing space in trace creation logging statement
	* Fix: event field value: assertion fails on empty string
	* Build fix: rpath of test libraries results in non-reproducible build
	* Fix: never use 'no' in a command variable
	* Fix: sessiond: abort called on undefined client command
	* Fix: consumer: snapshot: assertion on subsequent snapshot
	* Fix: sessiond: instance uuid is not sufficiently unique

As always, please report any issue you may encounter to bugs.lttng.org
or on this mailing list.

Project website: https://lttng.org

Download link:
https://lttng.org/files/lttng-tools/lttng-tools-2.13.9.tar.bz2

GPG signature:
https://lttng.org/files/lttng-tools/lttng-tools-2.13.9.tar.bz2.asc
