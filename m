Return-Path: <linux-trace-users-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BEF42C3DA7A
	for <linux-trace-users@archiver.kernel.org>; Fri,  6 Jan 2023 19:12:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231786AbjAFTMM (ORCPT
        <rfc822;linux-trace-users@archiver.kernel.org>);
        Fri, 6 Jan 2023 14:12:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51836 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229877AbjAFTML (ORCPT
        <rfc822;linux-trace-users@vger.kernel.org>);
        Fri, 6 Jan 2023 14:12:11 -0500
Received: from CAN01-YQB-obe.outbound.protection.outlook.com (mail-yqbcan01on2083.outbound.protection.outlook.com [40.107.116.83])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05A726A0E6
        for <linux-trace-users@vger.kernel.org>; Fri,  6 Jan 2023 11:12:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ieRr6lgdA7WWGo1iNbmMi14aM2ByMH59DMuXeIK7gfHfPiG6tutWhGNm5gtQB3eQLXokLa4vWZg/K8EdgyqvRFe1rqz2if5b4pjEyrxY2FnWOloORSqyTZUmXjtEh6/5nTOSSLhQPvI5rSh1fu6Y5YOV/qXnQo8fu/saeZ1+CoQgf7mXnDqBdyQRInEfaitFlW+s+bUnRezUEywQq45S8qh85gyLUFkrx0R2AeVWIE9JGeijp2MMlWCxSleO6P4dqgM7y/aFkm8iDuCWp8r/KHTVAwmU1qzlQCv9Rt1xCrSzh9Sii8eoLQ45+4l6wFIxd+Rq6mtrmwaFrhC+BTI5fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jPCY83rYE0NC7Bn8skpxNxm2GC01UvkC/YnRz/EormQ=;
 b=Vsu1LTBTE1qnaExzoo0uw+Mj7JVfEjRjGn473nripe06PZ3R3pw7mMzhwx463C1i4z0eM3Kc8zFKeUn2ECtJETVe67fR4mWxDTKcCsfBHN98UafSIwXOGIdabsZo58DbkG6zqPMv5YzU6KMKmn4AOLFRQ43TruLtXd8gQM03uH96lQLjx+KK3Vd4zEkbkjOE1PoDT2oAIM7IHq5ADtmCQC3C1lxsub3bhagD6G8ix0LtTJQC5Goga4h6FKZJSodTOMzag4daiQxvqCmoV5hOFWH1mHgLJJXQ0CcBM5MGzQHC8NoeFWHIiIhFBNihquS8bGCEZPybQbgf1Gp3iia4Vw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=efficios.com; dmarc=pass action=none header.from=efficios.com;
 dkim=pass header.d=efficios.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=efficios.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jPCY83rYE0NC7Bn8skpxNxm2GC01UvkC/YnRz/EormQ=;
 b=kfYqOKFhkWfUbhtU6ip0+0wDDSNK3cS/HtIO8Ngan6N0tE1VDOcT4PRyUtZIzduTbtGISWoc3o0MlXJIX0gQslmkee2O5cU+tIwkhHOSTWLnjCfsPqHEnAin6dECgEbKj2/4Mja7KvGJ6ZBKI+ztUuC36kMLdEjXJVLiSpKJJ0s4pqQ4JAnjgDy28doc1CM5On7oe3kwTn6FXvQaktGwkXOPq4T9oxpHAPB3yTg7GXt++HIKagZfOITcYBxoVy4meS6AMxeh7T6buTEgyo+d89mRsOXAkf+TfYgtS6TpU3+sJovhTP+WFHFD/s+S/uLtIOsIhIlYi9UnXkm6WJtbeQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=efficios.com;
Received: from YT2PR01MB5984.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:4e::11)
 by YT3PR01MB8195.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:9c::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Fri, 6 Jan
 2023 19:12:08 +0000
Received: from YT2PR01MB5984.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::eed5:b4fc:c863:b2a]) by YT2PR01MB5984.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::eed5:b4fc:c863:b2a%8]) with mapi id 15.20.5944.019; Fri, 6 Jan 2023
 19:12:08 +0000
Date:   Fri, 6 Jan 2023 14:12:07 -0500
From:   =?iso-8859-1?Q?J=E9r=E9mie?= Galarneau 
        <jeremie.galarneau@efficios.com>
To:     lttng-dev@lists.lttng.org
Cc:     diamon-discuss <diamon-discuss@lists.linuxfoundation.org>,
        linux-trace-users <linux-trace-users@vger.kernel.org>
Subject: [RELEASE] LTTng-tools 2.12.13 - (Ta) Meilleure
Message-ID: <Y7hyhz9SsRZidNbg@efficios.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-ClientProxiedBy: YQBPR0101CA0208.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:67::31) To YT2PR01MB5984.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:4e::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: YT2PR01MB5984:EE_|YT3PR01MB8195:EE_
X-MS-Office365-Filtering-Correlation-Id: aa839cfe-bae2-4afd-adab-08daf019e819
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6AzOY3qX5/LrQHl4yxtDA5X2U79yXpzqMgGFvzjK+PtimsJgqGPwWnSNAotYROHnrbfUc+xn/4f/AFrJkYTiwd0mxgcPX43WuW1t0QR1raHNX5Xhehg0eqIJhFHs6B9E+09gvx0jMocxNxUnUfeHLPS8ZkrW2L26n/hCfeQDfPjOqUGMOnyznFS4yIb1UUww0IqVWD9FFNcqM54VCj5DVLEXBqAxfJBDRcgnqoFlQjr48X/jYxH6z/DMsEbnuyMwj0jM4Q5O6hoKqd46/ixUa3Dr2XAH7nAOSWIW0xrOfUzaCwWVNzSCYYi08XTXLyLaUHF1/OvYVM7o9j+sfYs4SIa4IVoHMq9aypxTzDcVFRTpmF+bx53kv33/H/T9SV+uVVmaMIJx/ySvTyzhDQDb44jzt5Owxa75Yt6vxTcWaJDfpwq83dLsTiVC3Mihryz4SNMmWqkkrsbSF+YxxxBJSohJwVpS7AzLtuDwV4C25espSfqVCDhoIyKSshDwpgh0QG66hyVS+WxHPFzv68f35Hd0xrRY2IltXE2tdNjqRq/fq7WhT47e3jx6KzqoIItEjgUthOM58wJJ/NicFJ/L6FziTLoqhu0Pz9qZH5wcdRHfxvsgXdKrWHZtcroUCHugwriQLFCBn6xwo0uYLLsHqU8PUy+DlCeRNMA5YofKaK0=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:YT2PR01MB5984.CANPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(346002)(376002)(136003)(39830400003)(396003)(366004)(451199015)(316002)(4744005)(5660300002)(2906002)(41300700001)(54906003)(66556008)(6916009)(8676002)(66476007)(4326008)(8936002)(66946007)(83380400001)(478600001)(6506007)(36756003)(966005)(186003)(2616005)(6512007)(6486002)(26005)(38100700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?lfWBI1OXGnrMxId40nEho6gw9fK2rQAuMoh9T4YV40YyfSwa8S5yhx2N9g1K?=
 =?us-ascii?Q?KNU87nSnoV25S3X//49xSRxy2Z7fJkVBrbInWn9sheeDe4QG6wKJGIBqgJkX?=
 =?us-ascii?Q?Us0TRHMGbY5AqxQGPBocHFBHbdnR5sMZ50FZn0wTdslj4y0TpVw+SwWOReLL?=
 =?us-ascii?Q?8p4HaEDOJcKt8xcCAUKNXGuX0yvNLgMkBmow1xYIWaucyf5kmr8fhXppqKS/?=
 =?us-ascii?Q?pNKuSaH1uaFA/UnjoD0xXuZX1wAF4Vhi6XSE0nG6uTx27pJ1hoo25vun/ND+?=
 =?us-ascii?Q?LskK9ZsToAiQUDUelG4UdoXGU/SHzMQU/cVEjD7zvjiqVmRrjUa8lchP4Wqb?=
 =?us-ascii?Q?r/bLuRW4jcxO+8Z4xtMLuZl7eEP1Zbc6a6fwkxAlVsAEJ7U2wB0lOTWqj8xW?=
 =?us-ascii?Q?E/gtAlGEywu13QOsb0X3iXOVJX58RM7PmZnX3/raL/H4W9zYGh2T5DExzX4s?=
 =?us-ascii?Q?ZzRrHltlRsGlMRkg/k95P8eCg/rN5SMy916JIg/dfv0RR6Iz0fP9Pd8S/etB?=
 =?us-ascii?Q?1sU0aZ2lkys0rFxsH2s3soySdGsIhMLY8Jn9Ck5wGh3wK7yuTSWLH+ls3il1?=
 =?us-ascii?Q?KY/YWuoNHDlop4f4LbiY1Adgwu+0UBc7WQ3DBXeZnigkUTqR/L0QeDaA2xPl?=
 =?us-ascii?Q?AvdP7qsxJ8BCzozsLnLmOZdPQQPD30t9lkp681ZcZ9cIozjyYqZ6bbB3ncbi?=
 =?us-ascii?Q?D0bQ+iNr8z0K9dMvNseOQUul7elwPVoyq0SzLadRY6Cub4h4MIDr1JkLY1Hg?=
 =?us-ascii?Q?y4qAJ8wBhrTcPeAeLA/x/0Dy8GJz5IgrlydTF8xSN17/nIRLjUlaPStSVNKG?=
 =?us-ascii?Q?RQwlLWAuJlnSQqmGTLkfxRd5XVN2g6faY4G1gfIgdLpFEOvIlX5lFTIhgwUK?=
 =?us-ascii?Q?EPM4m8h7/e5/7UthYOcs2/+xJJV4B3O2BVY6/S9eNOkOFIDGFo1Bk7Ru/lm/?=
 =?us-ascii?Q?x0HfnVbCih5srbXxZdZ4rgRveaHtF1iBjZD4BwgPh/f61/mfcyHaYZqz3LO6?=
 =?us-ascii?Q?jUusez1qPA3MyBAqCMLTr1I1Ly6jHdTApE0A+wlkasLzhpJ/awkf/C0IKk54?=
 =?us-ascii?Q?S9TrovS4UMCRGEd5YanDqzGzFfMbkaOXT1GwhQXizaJN8DF/5LUt4gcs8zlT?=
 =?us-ascii?Q?1QSlILE1W+uMBMmTdDROQvIBu5FIA2/AmKkGeVg3DuSKdzPCmSSUQ5cA2Uhb?=
 =?us-ascii?Q?WBHIQR/zazKInqi+yLVJlkJh16iiTzKIxOVDUz8SHfdodBTq+u2tb79oYIlK?=
 =?us-ascii?Q?rkjdaNPOaEUmyz/2mBCOMKDmBhSur9ZbAEUt+0IAOX2w0U7AfZ0rTzjJVIn7?=
 =?us-ascii?Q?o4v6pAgEjXzduSOTV3T/eQTEjU1ma5Q0HhhNFunsK+9LsSm7GsxE7W4gzITZ?=
 =?us-ascii?Q?YFyjV0xAaPhsF9E9uxdpvm6Rb82kDL4ZhA4DazOcj16TGoS5+H7zpPwJBrAI?=
 =?us-ascii?Q?X5c/KlSYtHPMtDN52jm8J2zL30Uwbz74DpWmA5v9UXfi52ZybCsTDEKx6e4d?=
 =?us-ascii?Q?iwPw7OnHtNIHGD3gdvdqy8iU2AlKLGH14iFUlUcqwudUpXWxjOaylt82u3tK?=
 =?us-ascii?Q?qFMkkUILAF7fpsPe2XZtwpha66b4KUhTxBZyoX4I?=
X-OriginatorOrg: efficios.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aa839cfe-bae2-4afd-adab-08daf019e819
X-MS-Exchange-CrossTenant-AuthSource: YT2PR01MB5984.CANPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2023 19:12:08.5973
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4f278736-4ab6-415c-957e-1f55336bd31e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rUbdfx6v3zDjV8/JWlZqJEPbw9x2T7JNpduDDtIb+6ImgGk3cTdjUvugxdQL6Hm3sVPoHKYuZmLKYfaRCJcKVQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: YT3PR01MB8195
Precedence: bulk
List-ID: <linux-trace-users.vger.kernel.org>
X-Mailing-List: linux-trace-users@vger.kernel.org

Hi all,

We have just released the thirteenth bug-fix release of LTTng-tools 2.12 - (Ta)
Meilleure. This release addresses a number of issues listed below.

2023-01-05 lttng-tools 2.12.13 (National Whipped Cream Day)
	* Fix: lttng: poptGetArg doesn't provide string ownership
	* Fix: relayd: missing space in trace creation logging statement
	* Fix: never use 'no' in a command variable
	* Fix: consumer: snapshot: assertion on subsequent snapshot
	* Fix: sessiond: instance uuid is not sufficiently unique

As always, please report any issue you may encounter to bugs.lttng.org
or on this mailing list.

Project website: https://lttng.org

Download link:
https://lttng.org/files/lttng-tools/lttng-tools-2.12.13.tar.bz2

GPG signature:
https://lttng.org/files/lttng-tools/lttng-tools-2.12.13.tar.bz2.asc
o
