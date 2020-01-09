Return-Path: <SRS0=WH8v=26=vger.kernel.org=linux-trace-users-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0BFEC282DD
	for <linux-trace-users@archiver.kernel.org>; Thu,  9 Jan 2020 15:56:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 97713206ED
	for <linux-trace-users@archiver.kernel.org>; Thu,  9 Jan 2020 15:56:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=teoenmingcorp.onmicrosoft.com header.i=@teoenmingcorp.onmicrosoft.com header.b="k//vX3Of"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732677AbgAIP4X (ORCPT
        <rfc822;linux-trace-users@archiver.kernel.org>);
        Thu, 9 Jan 2020 10:56:23 -0500
Received: from mail-eopbgr1320089.outbound.protection.outlook.com ([40.107.132.89]:7869
        "EHLO APC01-PU1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1729591AbgAIP4X (ORCPT
        <rfc822;linux-trace-users@vger.kernel.org>);
        Thu, 9 Jan 2020 10:56:23 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BiTxGBzNVv/OJSgN3Sp+fXgSmWeUr8GeF/yvZW4Y2q6Ge0urF49lgF2l/yY85Y/5kDHcI3DGKubMo4xL1NhXRskrUhxmkR0HbUEzBCNfNwguXNQwRscKW98p2xgRmUnl7Rq9ttOQL524SSL30Lc0sMFFtn8+u324wRfk5vQQMjd2xHbpyF646+zlkAmquQFQ0za2Z4KcfdrwhmYWtZxr7NTx+S4OPoAc279YZibia9G65DeFK4v8hzex9w6UPX93cpCH2OHVfGQqBsc4K1o/qClS/BeDxCv/zgZ6d1LAJAvsZMd73dCkSXaD9jshoEZOMurDd3amWpdhnAseDSxFeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zkC7wY334/PuMEgerBeWKWnU8lmu8c46b4WPaw0WM5I=;
 b=nIui+v4DChGC9NgdyREXogA0GKQi6WqPI7E+RSs87sznuhk8VV/cnkOHQOV+Fg8Go1fKjrjo6Qm6UMr48pudVNUxtHYtSRb0Idpo2q0SZtxYlnkFPsyxcn4FOSVybS+JMFCymgkStmgKn8q6us1lHVC/8wxwPTuBc9HNIGTK6vgRp0sKC8WBHfQlJHY5ChoI5Wxi0UsSw27zxVkEuV2cN0UdIWH8DLW6rrP4DWHnAYNSRkRv4ZAhb4c+a17vFEli+FE0p/9iura/3CVgIm2c6+Y83vwSQL4zownqGYtDVJUFBeqWYLWJKZX61FSkJoCAO8unuQzBcubBROIDOTuQIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=teo-en-ming-corp.com; dmarc=pass action=none
 header.from=teo-en-ming-corp.com; dkim=pass header.d=teo-en-ming-corp.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=teoenmingcorp.onmicrosoft.com; s=selector2-teoenmingcorp-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zkC7wY334/PuMEgerBeWKWnU8lmu8c46b4WPaw0WM5I=;
 b=k//vX3OfZr/wUDS8DNT2CL30BXGwXQLYOPrlQg82QtirxhZZTSeqtWxuiIDtPNKopOtul7ISkKg4PJL0SnTuKFSKLALdT2P3whWDdphZcAQjNHf4WDtKe5T2GGOKpNWznAeKBngyVROMkPQdcy0aH6KtKyQc+NejoAjh9xWPKWY=
Received: from SG2PR01MB2141.apcprd01.prod.exchangelabs.com (10.170.143.19) by
 SG2SPR01MB0019.apcprd01.prod.exchangelabs.com (20.177.85.86) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2623.10; Thu, 9 Jan 2020 15:56:17 +0000
Received: from SG2PR01MB2141.apcprd01.prod.exchangelabs.com
 ([fe80::81e9:67b1:74eb:2853]) by SG2PR01MB2141.apcprd01.prod.exchangelabs.com
 ([fe80::81e9:67b1:74eb:2853%3]) with mapi id 15.20.2623.011; Thu, 9 Jan 2020
 15:56:17 +0000
From:   Turritopsis Dohrnii Teo En Ming <ceo@teo-en-ming-corp.com>
To:     "linux-trace-users@vger.kernel.org" 
        <linux-trace-users@vger.kernel.org>
CC:     Turritopsis Dohrnii Teo En Ming <ceo@teo-en-ming-corp.com>
Subject: Singapore Citizen Mr. Teo En Ming's Refugee Seeking Attempts as at 9
 Jan 2020 Thursday
Thread-Topic: Singapore Citizen Mr. Teo En Ming's Refugee Seeking Attempts as
 at 9 Jan 2020 Thursday
Thread-Index: AdXHBUtYewBYnzPcR6mJgI/iXzGLkg==
Date:   Thu, 9 Jan 2020 15:56:17 +0000
Message-ID: <SG2PR01MB21415CA68CB67E9B5C3783D387390@SG2PR01MB2141.apcprd01.prod.exchangelabs.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=ceo@teo-en-ming-corp.com; 
x-originating-ip: [2401:7400:c802:de67:f1ab:6fde:d925:5c0c]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9658f2a5-c376-45a0-8132-08d7951c7689
x-ms-traffictypediagnostic: SG2SPR01MB0019:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SG2SPR01MB0019AA3EBFDE48E0591EC57B87390@SG2SPR01MB0019.apcprd01.prod.exchangelabs.com>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-forefront-prvs: 02778BF158
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(136003)(396003)(346002)(39830400003)(376002)(366004)(189003)(199004)(8936002)(9686003)(55016002)(4326008)(107886003)(71200400001)(966005)(86362001)(508600001)(6916009)(316002)(5660300002)(2906002)(66446008)(66556008)(66476007)(66946007)(81166006)(4000180100002)(81156014)(33656002)(8676002)(76116006)(7696005)(64756008)(186003)(52536014)(6506007);DIR:OUT;SFP:1101;SCL:1;SRVR:SG2SPR01MB0019;H:SG2PR01MB2141.apcprd01.prod.exchangelabs.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: teo-en-ming-corp.com does not
 designate permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: MJH3riBvacsYYRfnTsC27fPP5tHL7J1rPyl9ZJ1Je2MYx25RSYs2+3nOWWm9sUeUocZItX5TzFcEzSyXs+BIp0btuNGsVE6qbQdL74D6eIh3V8Nwv8iWf0wFXVXuYJIU5v52aX5wdRuHj/OOwRitbdFD5PnXHklgcgy0Gp6JUpMy9/eRaeg+LhyEjz/n7FueDacdffMstQ0yti6/mNOgVhFRswsQPWIWJ1Zfchvgrm1g+2LfqYKPH8n57J6zTNbGosrzr5IcwhAy5K3NRS8vns7z0pZZpzLat8GGsDpNEw6hUAZVxfc+NdOybMM57DE8d3lUMSylC1kPG+gNO6Q4pFiCWWXj5kQJcseY4ugyyBnpdId5r/TCaFw18Ee5HfPmgAWYrKUWw53KU3RL14frQ8mF5BoTJiLhdUdbR3xQlQPnlgVO7OMDNxYiG65G7B6ENNIi8hMX9gWSn6t3y0JWfuFP3IcdT8mXChVzp2tvzf9S+kLXUqRF8utkdtkQJMWEtCRE2yWaDRLO921ckguitA==
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: teo-en-ming-corp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9658f2a5-c376-45a0-8132-08d7951c7689
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jan 2020 15:56:17.4901
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 23b3f6ae-c453-4b93-aec9-f17508e5885c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: U3h5M5BTU8P4YUSnIwG8KOS95rs7TPlkZUshuIh8EfDa+FK03RRWxmUEZ+tdoFkR1qjReTYPSMjumRhTOeFeWeojEjNXSUeh25WO6PVM9bA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2SPR01MB0019
Sender: linux-trace-users-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-trace-users.vger.kernel.org>
X-Mailing-List: linux-trace-users@vger.kernel.org

SUBJECT: Singapore Citizen Mr. Teo En Ming's Refugee Seeking Attempts as at=
 9 Jan 2020 Thursday

In reverse chronological order:

[1] Application for Offshore Refugee/Humanitarian Visa to Australia, 25 Dec=
 2019 (Christmas) to 9 Jan 2020

Photo #1: Page 1 of Form 842 Application for an Offshore Humanitarian visa,=
 Refugee and Humanitarian (Class XB) visa

Photo #2: Front of DHL Express plastic envelope (yellow)

Photo #3: Back of DHL Express plastic envelope (white)

Photo #4: DHL Express Shipment Waybill

Photo #5: DHL Express Shipment Tracking Online Page, showing that my applic=
ation for offshore refugee visa to Australia=20
was picked up at 1619 hours on 25 Dec 2019 in Singapore and delivered to Ca=
nberra - Braddon - Australia
on 30 Dec 2019 at 11:10 AM Braddon, Australian Capital Territory (ACT) Time

Photo #6: DHL Express Electronic Proof of Delivery, showing that my applica=
tion for offshore refugee visa to Australia=20
was received and signed by staff Mohsin Mahmood at the Special Humanitarian=
 Processing Center,=20
3 Lonsdale Street, Braddon, Australian Capital Territory (ACT) 2612, Canber=
ra, Australia.

Photo #7: Page 5 of Form 842 Application for an Offshore Humanitarian visa,=
 Refugee and Humanitarian (Class XB) visa, bearing the=20
official stamp of the Australian Government Department of Home Affairs at N=
ew South Wales (NSW):=20
"COURIER RECEIVED; HOME AFFAIRS; NSW; 27 DEC 2019" and=20
"HOME AFFAIRS; NSW; 27 DEC 2019" at the bottom.

References:

For the above-mentioned seven photos, please refer to my RAID 1 mirroring r=
edundant Blogger and Wordpress blogs at

https://tdtemcerts.blogspot.sg/

https://tdtemcerts.wordpress.com/



[2] Petition to the Government of Taiwan for Refugee Status, 5th
August 2019 Monday

Photo #1: At the building of the National Immigration Agency, Ministry
of the Interior, Taipei, Taiwan, 5th August 2019

Photo #2: Queue ticket no. 515 at the National Immigration Agency,
Ministry of the Interior, Taipei, Taiwan, 5th August 2019

Photo #3: Submission of documents/petition to the National Immigration
Agency, Ministry of the Interior, Taipei, Taiwan, 5th August 2019

Photos #4 and #5: Acknowledgement of Receipt (no. 03142) for the
submission of documents/petition from the National Immigration Agency,
Ministry of the Interior, Taipei, Taiwan, 5th August 2019, 10:00 AM

References:

(a) Petition to the Government of Taiwan for Refugee Status, 5th
August 2019 Monday (Blogger blog)

Link: https://tdtemcerts.blogspot.sg/2019/08/petition-to-government-of-taiw=
an-for.html

(b) Petition to the Government of Taiwan for Refugee Status, 5th
August 2019 Monday (Wordpress blog)

Link: https://tdtemcerts.wordpress.com/2019/08/23/petition-to-the-governmen=
t-of-taiwan-for-refugee-status/



[3] Application for Refugee Status at the United Nations High Commissioner =
for Refugees (UNHCR),=20
Bangkok, Thailand, 21st March 2017 Tuesday

References:

(a) [YOUTUBE] Vlog: The Road to Application for Refugee Status at the
United Nations High Commissioner for Refugees (UNHCR), Bangkok

Link: https://www.youtube.com/watch?v=3DutpuAa1eUNI

YouTube video Published on March 22nd, 2017

Views as at 9 Jan 2020: 659

YouTube Channel: Turritopsis Dohrnii Teo En Ming
Subscribers as at 9 Jan 2020: 3.14K
Link: https://www.youtube.com/channel/UC__F2hzlqNEEGx-IXxQi3hA







-----BEGIN EMAIL SIGNATURE-----

The Gospel for all Targeted Individuals (TIs):

[The New York Times] Microwave Weapons Are Prime Suspect in Ills of
U.S. Embassy Workers

Link:=A0https://www.nytimes.com/2018/09/01/science/sonic-attack-cuba-microw=
ave.html

***************************************************************************=
*****************

Singaporean Mr. Turritopsis Dohrnii Teo En Ming's Academic
Qualifications as at 14 Feb 2019 and refugee seeking attempts at the
United Nations Refugee Agency Bangkok (21 Mar 2017) and in Taiwan (5
Aug 2019):

[1]=A0https://tdtemcerts.wordpress.com/

[2]=A0https://tdtemcerts.blogspot.sg/

[3]=A0https://www.scribd.com/user/270125049/Teo-En-Ming

-----END EMAIL SIGNATURE-----

