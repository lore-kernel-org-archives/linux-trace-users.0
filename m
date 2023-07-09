Return-Path: <linux-trace-users-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 765ECEB64DC
	for <linux-trace-users@archiver.kernel.org>; Sun,  9 Jul 2023 15:39:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230099AbjGIPjy (ORCPT
        <rfc822;linux-trace-users@archiver.kernel.org>);
        Sun, 9 Jul 2023 11:39:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50836 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230082AbjGIPjx (ORCPT
        <rfc822;linux-trace-users@vger.kernel.org>);
        Sun, 9 Jul 2023 11:39:53 -0400
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (mail-am7eur03on2064.outbound.protection.outlook.com [40.107.105.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B9F2712E
        for <linux-trace-users@vger.kernel.org>; Sun,  9 Jul 2023 08:39:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ofEbTSwkqeQBBlBc0rOFY90n8afV1GjmdGhMLFmQ9tux6SVJoycQplv/zDqaPRiY8aVJiQojIM1OR8ieLlnA3tnQu6AurxjmYWke0plWHLNVDpT+Za/mrxrJJ5QFy5VVEi8u5q+Kp14AOrIpLWXpZTK4nh/l1NKmDftQ6guvsN+cYQGue1M7keeA5CKSE/pLB5OVPMlWIq8Bn6+0nSOUEbdz2YTHjmk5pYmqCZzQNZjsdEz/1ygMPR5MOLnIqKukYsysGPdRBXAze6SayKHsEB+a45PtrsawtmUQkw84TRP+uJZCCXgR+mC3hd05bumWXuaPjN1wNuWPzDGD+PsELw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lByYZQzi6vdIRc7t+O4KZKtaDUkdVUVqsdI/Mg4pjLQ=;
 b=OqCnjNhtttuA3nT7kM8wBMuqbzylQBuVlRvZTIRWZ4HK8s6T3Uc6/ORpx8XynwhYOg59REABskpeOu/d2DnLgPB58/kaxuAww2wKEAAYlmnMgYWimrRnZyyrPBOz9E8EZ5+0b3VGYK76ioMk0dZZooz8lCzDsk4WFjKaz+JyhqDG6KGHT8icMTAfKcKRFGNxdH/D2Lnwj96yzLBAcjBRA9zfR0j/kCr7IlKpsZW1ilHkuxSNvPVskgC9r2sBhgkhBs/SHsv68tI9Q/fye5CmShGwjD5udaI99+DKVTsWB/AYepVe7wL7GZJCLUmpSCQHD4k3B7TgS9P9I3o+hi+Pvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mobileye.com; dmarc=pass action=none header.from=mobileye.com;
 dkim=pass header.d=mobileye.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mobileye.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lByYZQzi6vdIRc7t+O4KZKtaDUkdVUVqsdI/Mg4pjLQ=;
 b=Lwmz38A2G3py/8GDFs15UhdDAp03CfuXLOPONfnctJkjKTu6JzzPT7L/ctNGoGElQtz515J/tdMICku0xQZS12og6KEz68y4M/swul26cYGNTkvhmO8c8G4TK95aP0jCLQscegZVJXf9r97VUFDR+u8ZAU6TnMnwMwnTdxwv3ss=
Received: from VE1PR09MB3535.eurprd09.prod.outlook.com (2603:10a6:802:ad::15)
 by DB9PR09MB5489.eurprd09.prod.outlook.com (2603:10a6:10:332::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.26; Sun, 9 Jul
 2023 15:39:47 +0000
Received: from VE1PR09MB3535.eurprd09.prod.outlook.com
 ([fe80::71e6:9dd9:b71f:4422]) by VE1PR09MB3535.eurprd09.prod.outlook.com
 ([fe80::71e6:9dd9:b71f:4422%4]) with mapi id 15.20.6565.026; Sun, 9 Jul 2023
 15:39:47 +0000
From:   Sharon Gabay <Sharon.Gabay@mobileye.com>
To:     "linux-trace-users@vger.kernel.org" 
        <linux-trace-users@vger.kernel.org>
Subject: cannot run trace-cmd split in parallel
Thread-Topic: cannot run trace-cmd split in parallel
Thread-Index: Admye5XSU9ZSItasRWquiwWlfXe/oQ==
Date:   Sun, 9 Jul 2023 15:39:46 +0000
Message-ID: <VE1PR09MB3535122A0DA44242886307B9F233A@VE1PR09MB3535.eurprd09.prod.outlook.com>
Accept-Language: en-US, he-IL
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mobileye.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VE1PR09MB3535:EE_|DB9PR09MB5489:EE_
x-ms-office365-filtering-correlation-id: 41024fda-9979-46f2-465e-08db8092b987
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: zPzqeIptfVWhY9ODQ4IPQzvug8NhzyvGUicB4WhLiUfXSHoeo9L2imEIOaTUAIBp8ImdNDWEmcbL1BypJ/WLg/tDJ+IyKWe85b5IapdJ/ID1ou6ev1j/YMqvunyJ/KrzXiKgr/MiBvJjBbRCFnbtnRkCWOs2EN5gWEY4D170WKMH79dnIu1dBJJzCG8KgovX8NwccDScLLfMigYxlNcZR3PTdG7ofDQvRTlriToCZTidZESSvF10vtwTc7LUk6B6WNy4pwEp7PjQW2tT5hkFV67bzrT9XM3oCakCGYf72MqJXnezyE7dnD2JTRGOHRg6E+LHtuk5qlJwkGi6sbU77egy+88YvKJlufhpW2tdgiHw0FnX2zfgCfPFyDtNwVs/IS91lo+1Ra3Ix3p/lhKYb4oBNPzs6VC0Zdxu3cS/Ve2RS+3TjQ8pB+R5B/HnTtPBjpUHg3dzQxV0QBWYFG4/M+awgNdqLS0M+k5V+2twGLfatpQXTCU86f1UlEXkaemDvy10lnNCUNOuPn8X3Tr1/z4io0URQ1Fci8uE5B5z0sCmy///GY2RaOqGNbzhkqxqL5eKZdz2wM8T62l9mq5cTBkIIOrlU9dBEkLOeyBkPSAhCVvp8WmCKS3UGkSYkUrc
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR09MB3535.eurprd09.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(346002)(136003)(39860400002)(366004)(376002)(451199021)(38100700002)(38070700005)(86362001)(55016003)(33656002)(71200400001)(7696005)(66946007)(76116006)(82960400001)(122000001)(26005)(6506007)(478600001)(186003)(9686003)(2906002)(5660300002)(52536014)(66446008)(316002)(66556008)(66476007)(64756008)(8936002)(8676002)(41300700001)(6916009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ckhpTDdWcE9nVDZrNm8wVkRBS0ZWUEloeHZYd2JVUGFWL3NSQ1Fwd0NGZmla?=
 =?utf-8?B?bnUvY3B4aVkxN2JDd3lEQW1kZDdOV3dyR20rci9Oak5kWlg1cjF5bmxFM1Yv?=
 =?utf-8?B?WHl5b0cxWExIYWpHOVA3U1dzUGNwM3FiN2RnOWJrcTF5RjliUXNyWXNzYVJm?=
 =?utf-8?B?NDgxZUNmaU1HbDFNeWluVk1sRXJGTVRUMlh4MHNSeVJ6RndveWlFK2s5YkRU?=
 =?utf-8?B?ODRhM1A1YTVZaUFnQ0djVVRFLzJJNjZUVUUrK0lPMFN5UTNUeEJMelkxeDdm?=
 =?utf-8?B?RndqRTVOZ3BobXh4eW1WRWl0cS9tQmRnbVpycFFlb1pBM2doQkIyWlBBWXhW?=
 =?utf-8?B?czIyV2VXVUhjMnFQWkVJejlFRXExYlZuQUU0K3c5MzFDL2wwQkpoU0Nab0Fn?=
 =?utf-8?B?RjNVbzdIL0lNVndrNloxUFE3SnpCdWVoTnU4N0hIblNXdms2ZGU1UlZZZ083?=
 =?utf-8?B?TFMxTFkycjRLcVM1cnJlSXdIR0kxUy9nUEI0RDRDbmZJK1IwdDlVV2hQYnJq?=
 =?utf-8?B?d1lodVJGQUgrUmxhVDVJUGk3Mk1ORU5XbnF3VFhJU1pJSnN5cTNvcmZTTDdt?=
 =?utf-8?B?L2YvaTllTjZnaHBQUTM4QzlNNVJtQzNDWHpTaWd2K0M5Z1U4T0J1b0NVWXF4?=
 =?utf-8?B?SGVQY01sQndRNUNWSmhFLzRGdlJ6bitodmx3TENnUWZNN2Ira2NBeWRrbG5m?=
 =?utf-8?B?SkFEelJVdmFIQmQxbHgxcTJwVUhpYUVrNGNIbGJpN3REMUw5VzRPcnZiNE5j?=
 =?utf-8?B?VWtOczBWVGRnbW5tOWhKd0xDVEh1Y1Y3NW5EQWp5QjZQWmJ4SkgvTTBxNjhp?=
 =?utf-8?B?Y1YyK25LSWV5dWYvWGpkQTFYY0xjMDdpN3pNdzdmb2tjWXZndGh2RE1ZVjZ0?=
 =?utf-8?B?c1JYajB0MENpZGFkRXVUM29LNUt0NWgwdmc2UEcxaFdpNFhiM1JVNW9LdmV4?=
 =?utf-8?B?WEdDbFFzSkxKRy9ZZWF0bFpYWWhiVGw4bWlKSzhIQXZZRk1hSzZsK1VaL3RJ?=
 =?utf-8?B?WEQwN043QUdqZFY1MmFXdEhJYXFRamNuMi9PRmVvM1NEM1NEWktFZ2pKYmdv?=
 =?utf-8?B?VVJ2dUhHQWZTbDRhWVRiZ0NyTFdCb1Z2K09Bd3d0Tk9TM09QbmcvMzBUbzh1?=
 =?utf-8?B?Z0djSldIMVA3UzFQVXdEUzhDcS9zalJYa2dHNWlpL1hxV21JNk1sZXkrWWRj?=
 =?utf-8?B?Q0ViYVZkS3dkSDlremQzQ2VlVDJGYzFlNXduWnlBdkErS1M5WlB4dnRGUENU?=
 =?utf-8?B?OG9ITmQ1eVk3ZWRjZkRuSGJjV2kzOTRnc01WeU9wdmtmNXRHUWZBTC9yOFoz?=
 =?utf-8?B?YkE0RmpqbVArNndHVFNjdXowNjgrUys0eUdRNmhpZFVzanpZSVVySWdwMC9G?=
 =?utf-8?B?bGJnVnl0aVl1MjVLZ0dNbGFxU0FMc21Fd216M2NCZENmM29RdGxRV2xCTjEw?=
 =?utf-8?B?Zitpdmt2RUtuOENmUzB2d1Vrb1lOcUhpOXlPbjZxS0QwREl5cGppbnJCZXFq?=
 =?utf-8?B?WWMyampmQkN2ZzVnVUpwNUdWTm9aZ1ZubGZKQkJ1SkxYQ0lRUVhDOVFhQ2l3?=
 =?utf-8?B?dXpBUGx6SngrKzdnRjRnR3FGQm93QVI1Z2tVeVN0MDhzWW1TWTk1M00zMjNO?=
 =?utf-8?B?dDdpUUVNeE5EeVIxeFc2cVArclZSME9La2hVL1RBS3NRQW1Nbjc1UTMxNE1H?=
 =?utf-8?B?TmVlSVdrcVBFSjRhalFsTnpYQXVXbHZ5S0FuMUh6VXljZGNkQ2Q1ZlZQQWQz?=
 =?utf-8?B?VjNQYTJtdU9Mdyt4MG0rb2ZBN3BuNFdNNmd4R1N5MW9LTmVSNWhCVnAwMUZv?=
 =?utf-8?B?VFU0TnJza2xXYldqNlR5UDRHVzVNWnNaN0hwWFY3S1hTNnhGVUk2V20rK2F4?=
 =?utf-8?B?VFpQOXVwbmdMMTZkRW02RHFVK0RnYkVTWmRKNGwzZG1NK0dGUWV6UUdtbHhl?=
 =?utf-8?B?U1lUVWdmR0pGOHBHN2VjZWNPLzNmOGthU0E0Y3c1c1hpenRkWnBvb1JSNFgv?=
 =?utf-8?B?UzduMVpzeTdwWW01QW5peU9ydGNSemVOTmtTaGhTS2k4c2RldDRITkMxejAw?=
 =?utf-8?B?M01TbUtlUkgwMWNkOC90VGNUNGwxNzBmZFQyVHRsTWZxbllKaXF4RWo1U09P?=
 =?utf-8?Q?0X58=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: mobileye.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VE1PR09MB3535.eurprd09.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 41024fda-9979-46f2-465e-08db8092b987
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jul 2023 15:39:46.8842
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4f85ba13-6953-46a6-9c5b-7599fd80e9aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nci4kq+guxbeTBAZ1yqB/dQPFjANJWzY8dKOaer76WQDKF8GGpiZ3RTx5WDfPaI8JUSr/OhBr3BeLEBksdOaOw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR09MB5489
Precedence: bulk
List-ID: <linux-trace-users.vger.kernel.org>
X-Mailing-List: linux-trace-users@vger.kernel.org

SGkhDQoNCkkndmUgYmVlbiBoYXZpbmcgdGhpcyB2ZXJ5IHN0cmFuZ2UgaXNzdWUgZm9yIGFzIGxv
bmcgYXMgSSd2ZSBiZWVuIHVzaW5nICJ0cmFjZS1jbWQgc3BsaXQiLiBBY3R1YWxseSBJIGRpZG4n
dCB3cml0ZSBhYm91dCBpdCB1bnRpbCBub3cgYmVjYXVzZSBpdCdzIHNvIHN0cmFuZ2UgSSB3YXMg
c3VyZSB0aGUgYmxhbWUgaXMgb24gdGhlIHVzZXIg8J+Yig0KDQpXaGVuIEkgdXNlICJ0cmFjZS1j
bWQgc3BsaXQiIGluIHBhcmFsbGVsLCBJIGdldCByYW5kb21seSBpbnZhbGlkIG91dHB1dC4gVGhp
cyBoYXBwZW5zIHNwZWNpZmljYWxseSB3aGVuIEkgdXNlIHRoZSBzdGFydC9lbmQgYXJndW1lbnRz
Lg0KDQpUbyByZXByb2R1Y2UsIHRha2UgYW55IHRyYWNlLmRhdCAoYXMgZmFyIGFzIEkgY2FuIHRl
bGwpLCBhbmQgcnVuIHRoZSBmb2xsb3dpbmcgY29tbWFuZCwgd2hpY2ggaXMgNSBuZWFybHkgaWRl
bnRpY2FsIGNvbW1hbmQgbGluZXMgcnVuIGluIHBhcmFsbGVsLiBUaGUgb25seSBkaWZmZXJlbmNl
IGlzIGluIHRoZSBzdGFydC9lbmQgYXJndW1lbnRzLiBXaXRob3V0IHRoaXMgZGlmZmVyZW5jZSwg
dGhlIGlzc3VlIGRvZXMgbm90IHJlcHJvZHVjZS4NCg0KdHJhY2UtY21kIHNwbGl0IC1pIHRyYWNl
LmRhdCAtbyAvdG1wL291dDEgPHN0YXJ0PiA8ZW5kPiAmIHRyYWNlLWNtZCBzcGxpdCAtaSB0cmFj
ZS5kYXQgLW8gL3RtcC9vdXQyIDxzdGFydCsxPiA8ZW5kKzE+ICYgdHJhY2UtY21kIHNwbGl0IC1p
IHRyYWNlLmRhdCAtbyAvdG1wL291dDMgPHN0YXJ0KzI+IDxlbmQrMj4gJiB0cmFjZS1jbWQgc3Bs
aXQgLWkgdHJhY2UuZGF0IC1vIC90bXAvb3V0NCA8c3RhcnQrMz4gPGVuZCszPiAmIHRyYWNlLWNt
ZCBzcGxpdCAtaSB0cmFjZS5kYXQgLW8gL3RtcC9vdXQ1IDxzdGFydD4gPGVuZD4NCg0KSWYgeW91
IGNvbXBhcmUgdGhlIG91dHB1dCBvZiB0aGUgZmlyc3QgYW5kIGxhc3QgY29tbWFuZCwgd2hpY2gg
YXJlIGluIGJvbGQgYW5kIHlvdSBjYW4gc2VlIHRoZXkgYXJlIHRoZSBleGFjdCBzYW1lLCB0aGUg
b3V0cHV0IGlzIGRpZmZlcmVudC4NCmRpZmYgL3RtcC9vdXQxLjEgL3RtcC9vdXQ1LjENCg0KQnV0
IGl0J3Mgbm90IGNvbnNpc3RlbnQsIGV2ZXJ5IHJ1biB3aWxsIGJlaGF2ZSBkaWZmZXJlbnRseSwg
c28geW91IG1pZ2h0IG5lZWQgZmV3IHJ1bnMgdG8gZ2V0IHRoaXMuIEl0IG1pZ2h0IGFsc28gbm90
IGhhcHBlbiBhdCBhbGwsIEkgZ3Vlc3MuIFN0YXRpc3RpY3MuDQoNCllvdSBjYW4gZXhwZWN0IHRo
ZSBkaWZmIHRvIGJlIGRpZmZlcmVudCBpZiB5b3Ugc2VlIHRoaXMgaW4gdGhlIHN0ZG91dC9zdGRl
cnI6DQrigKYNCmxpYnRyYWNlY21kOiBObyBzdWNoIGZpbGUgb3IgZGlyZWN0b3J5DQrCoCBjYW4g
bm90IHN0YXQgJy90bXAvLnRtcC50bXAuMCcNCnRyYWNlLWNtZDogTm8gc3VjaCBmaWxlIG9yIGRp
cmVjdG9yeQ0KwqAgRmFpbGVkIHRvIGFwcGVuZCB0cmFjaW5nIGRhdGENCg0KbGlidHJhY2VjbWQ6
IE5vIHN1Y2ggZmlsZSBvciBkaXJlY3RvcnnXqQ0KwqAgY2FuIG5vdCBzdGF0ICcvdG1wLy50bXAu
dG1wLjAnDQp0cmFjZS1jbWQ6IE5vIHN1Y2ggZmlsZSBvciBkaXJlY3RvcnkNCsKgIEZhaWxlZCB0
byBhcHBlbmQgdHJhY2luZyBkYXRhDQoNCkl0IGxvb2tzIGxpa2UgYXMgaWYgdHJhY2UtY21kIGlz
IHVzaW5nIHNvbWUgZmlsZSB0byBzdG9yZSB0ZW1wb3JhcnkgZGF0YSwgYW5kIHRoZSBzYW1lIGZp
bGVuYW1lIGlzIHVzZWQgYnkgYWxsIHByb2Nlc3Nlcy4NCg0KQ2FuIGFueW9uZSBoZWxwIG1lIHVu
ZGVyc3RhbmQgdGhpcyB3ZWlyZCBiZWhhdmlvcj8NCg0KVGhhbmtzIQ0KU2hhcm9uDQoNCg==
