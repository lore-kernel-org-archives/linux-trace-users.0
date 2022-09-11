Return-Path: <linux-trace-users-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F373ECAAD3
	for <linux-trace-users@archiver.kernel.org>; Sun, 11 Sep 2022 19:55:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229457AbiIKTz4 (ORCPT
        <rfc822;linux-trace-users@archiver.kernel.org>);
        Sun, 11 Sep 2022 15:55:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44664 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229597AbiIKTzz (ORCPT
        <rfc822;linux-trace-users@vger.kernel.org>);
        Sun, 11 Sep 2022 15:55:55 -0400
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2073.outbound.protection.outlook.com [40.107.21.73])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C8FC27DD9
        for <linux-trace-users@vger.kernel.org>; Sun, 11 Sep 2022 12:55:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XVPx7WLt9nKVFERVBrk5dk4aqP2So5R9I0hwc7FzmhAWCkHEPG0dNbt9iw+7EUhKNM49x7oNRHVFSbWWfJatZ9X/YMNUGfkuh7lzWuhCxPAWgn+48XgYldywEeNlzM2gEb6piKwFlosF/Wu6foMNbrutl9WCdkvj2MblbntGFhEBCsAFvhczj1jKV6Zsq3n1FF+s+o8g3NpbV6bMoVvLubhTMhyMLsTYABEroo+TzKC3V78kILa6UBujQAwLy6jeAwpjC/k7JeRTqPsj5ZKtAK09AuRY2RJeksJ5UQUNPtXizVIdLMr6QXUacQbaD1eRffBabQyo5mKAXUAaVFlcyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YsLBx3aCyXQFS82H8KTV/GIVMWgiCsP7/5UZFXRMABU=;
 b=mbKNnXVO+nNWrFA9marVaHYCGeQfIRcYpp/SRMGjcsgbu9dQ4N/shJgCLJmqOmYQV/PewWzMEJkP1ZSoXS+fZf3aOY1KKWvXid4sR3kn+tUjDN7OJdWbeMJ309ww+vwrEizbd2/CMFuCzeNoMYmXor1IzDZHa5u0SXAz3wmZNo01ouV6iLbMESTfZ3QiBS+KA+CVT9a4he0tKECS25MmocvePl9Cm7ZRkNy0LCH4SDB/pGC6AJKVSr/I8bTQx6UshsXetMqrskqAXw5CdB2+/3tka7WMF4meGs5SlNooBL1+dehxeLhHqsciCHHDXKFFScHvBlJBs3EPADRnxNElPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mobileye.com; dmarc=pass action=none header.from=mobileye.com;
 dkim=pass header.d=mobileye.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mobileye.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YsLBx3aCyXQFS82H8KTV/GIVMWgiCsP7/5UZFXRMABU=;
 b=XUVxLW08iSQRL3UJZdTE+Gp2dAeyDKQalsi6CP3qhyVBC0HHo9oOl2vRDxQPTMndAh7Lg67NWssPw/QLrUZb5n5O2z1t9yGoTueZQT/9027dyr5iMNBAHZOqbqMLCJ1AR3cZYznsCVW8ZJ2gzoNHR0kaz+WuyZFcDJtJ8Xt+wEY=
Received: from VE1PR09MB3535.eurprd09.prod.outlook.com (2603:10a6:802:ad::15)
 by PAXPR09MB5701.eurprd09.prod.outlook.com (2603:10a6:102:23c::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.22; Sun, 11 Sep
 2022 19:55:52 +0000
Received: from VE1PR09MB3535.eurprd09.prod.outlook.com
 ([fe80::5910:72a1:41b6:b6d5]) by VE1PR09MB3535.eurprd09.prod.outlook.com
 ([fe80::5910:72a1:41b6:b6d5%4]) with mapi id 15.20.5612.022; Sun, 11 Sep 2022
 19:55:52 +0000
From:   Sharon Gabay <Sharon.Gabay@mobileye.com>
To:     "linux-trace-users@vger.kernel.org" 
        <linux-trace-users@vger.kernel.org>
Subject: trace-cmd: Using the python wrapping to read trace markers
Thread-Topic: trace-cmd: Using the python wrapping to read trace markers
Thread-Index: AdjGGGIENSccTSwfShiBEP1qQs0qFw==
Date:   Sun, 11 Sep 2022 19:55:52 +0000
Message-ID: <VE1PR09MB3535D091888EFAF84EA09E20F2459@VE1PR09MB3535.eurprd09.prod.outlook.com>
Accept-Language: en-US, he-IL
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mobileye.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VE1PR09MB3535:EE_|PAXPR09MB5701:EE_
x-ms-office365-filtering-correlation-id: e6a48a1f-52fb-4c6e-d21d-08da942fa1a2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: C0y3Y5fZpYTTJEbbF7Ulr0YneSwgvtjrS3Q6L3Oj4y9WQmR5O/EZmoJfLiZAY3urqdNPho/NalZhIhRB1es6eP8E1ClfgAg5DxowD/WIwxchGPrKGkntF7EWM1Idy231nVfX8zc5wtTGHztMw1S3W9/fOMNnWyOlVvav8FpnaoF/3IuCjy7m172JDPAlbrD2d4cK1Om+7cGawGyyOUHAZiZNX+Ll88GJkphlYKr7FvBRqlN1Db4s5L0xcyZRAUS1qeDo7T3F6GeTdkiKZNMoXHU9P40QfckTAqjzvooGv9CU+9c8wZKxVBpZ44HczyUmaZlLMACA2JntHbnGyA0svRgEK5/iefqsnorz0ZQbbWm06XaI3fc4/GHvkdLFgCd4X9Xi1IrSkOUN4c4g0Rq4++htmt46bNBsDz3aK+MHnsHah/alBzJy7cIMogQ9HTFW/aTKOpzCgqfWcPbdvoaFffFE9jrKiIzF39LtFxPINGCZ+frA+r3O9pnXy434hjHnNsO7Qpc5Zg8BSv3YQ6JVQv+RJnFjZt/tSoVuWbQ9Xqg2DJ0vWiDQC/CdO5V4/2x1PB36m1L+AUXbgNA34tNqbbESe3jMkCb+Yurm/RUEHHTvxM6zcCqfaPXJVoywx86OQKArIW83aLnD0Fe49WZeBDaGrrlzWINt7WqZg2hj6x2pGqfAq52Y50L83VHGKhH0pGg9WpfjfCl1JOffIH8acQ9RNwU5P3j/qVXgv/hIIYaxal39ehRMA4BNgACLVriotOVz227IuewplkBft21Rd+8VNou+v57UCql6hBKo2+M=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR09MB3535.eurprd09.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(376002)(39860400002)(396003)(366004)(346002)(83380400001)(38070700005)(966005)(2906002)(8936002)(33656002)(186003)(478600001)(52536014)(71200400001)(5660300002)(122000001)(38100700002)(26005)(8676002)(9686003)(66446008)(66476007)(76116006)(66946007)(66556008)(64756008)(82960400001)(316002)(7696005)(6916009)(86362001)(41300700001)(6506007)(55016003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?/CqAGQL+AE1F1gZp6UkIHT16yVveIlc/dCHk2QI6Eqosd7lM1BIqu2w8m69a?=
 =?us-ascii?Q?GwJUFXpAFEesG+Y8d6gQHP60V3ZkQi1Pnrix9QlGAOLQsVDI2ZGxuBy6d3qp?=
 =?us-ascii?Q?mi0/vhm6WUDovhEqUsFUyxIxukTvH0G92FoIr1hkcGzKTTWm76dvnJCxqXgp?=
 =?us-ascii?Q?lDstDgGeScBhCuGtuOx4fsvSPyN5GpfTYVE//ou+FnXSPkceGmIgTpptplNJ?=
 =?us-ascii?Q?M42/3p93cYZ8IxTpNAJ6CdYY6pw5DXvvL/PHra3uKyjb/sbKLtMw5pna27WA?=
 =?us-ascii?Q?43aq2EsVfqoavfz5DNHRRztMOzcYw8rPCVLLZ+aW4fKKuZ029VScKwDo4dFX?=
 =?us-ascii?Q?l3BCJxEjq3nJJ5/4DxA18ZRe5LMtZY+w2kMh9hFcaRVRwfGXW515oD8dpKGc?=
 =?us-ascii?Q?L8aaeH63N4aOfXyrzpdFDDyo+Cx+Hv3EkmTkWxA/ONFWezY6Smb3WqHm7zYK?=
 =?us-ascii?Q?XkUyhFrZNiHEKVUZbWJ/i4yhUt9mIsXw6nf4xhQw/q/2p/V9sk/2O4mKcl9j?=
 =?us-ascii?Q?ScAHuAUeAJb/Xee2Rc+JF+ChTt6Tdpk49isK/pB33ciQa3DKb9FakxAZbjtA?=
 =?us-ascii?Q?WsocRaMk+5o/Bxw9EDTRLmeXAVTWX1mHXpVZSDjHnw7Hd1XIwODPE6uFbDw0?=
 =?us-ascii?Q?gx16KHwDgyGJ943iEzoUQf5D+OLSXX67epWqNyMkzYSi7+n90k+XKFoRp3z8?=
 =?us-ascii?Q?ohq9bnb5bI55OkodEWVh6sLHsjcAjiqbW05YgmPzsFBt6Tk0gV96k0vZq/ii?=
 =?us-ascii?Q?BfySeaNE6jxsUw6kphPmQZ6TsR/TxzelR3Cf/rsPVPxcEQsVlYQF1g/TVRWO?=
 =?us-ascii?Q?S2iSq1uxePMYr589JfLqAxy5YQPHKsG2ZbUTkarEQOjVxn3B3QnFPtqoqvJZ?=
 =?us-ascii?Q?QMaUiBZdhbDpNEbYXPBerKT28JjppGnE/PxvEKCcY+P2roghFHTdOAE5lG/X?=
 =?us-ascii?Q?vWz489MxNpoHk8aM+QprncG6QEU5R51gwPAn58QlwrkauTN5vEm/t+SwsnFL?=
 =?us-ascii?Q?SdkexGn89O850c86MAyd134BpZsi6Sdba+flqEQ7BHNojPkDn+ZYCTwANwQt?=
 =?us-ascii?Q?2lJD9DQnlNe+8yJSppxpafVdOoygEYb8aUHf3j9t7Hr5bxjYknInBAzm+rGI?=
 =?us-ascii?Q?54GiTOE0Jnl6mnrQbrEaz3/S4okJ3nnAwAAFmMmKXEIPX5H5qartl+J/WdXo?=
 =?us-ascii?Q?llWvuSzx5kb8hOelAJCXk6zQj25O+LSkL4ViqY5MUGVtOdD+4HPPD2KJBKoj?=
 =?us-ascii?Q?Xo3EeK+envnrcGJW6WqN8sjFCna5BUjE1+CzZAu33a087T64FElAgrsHDWZY?=
 =?us-ascii?Q?lACx44AgUo93z+ItaHLCN/5EZe3NsvKVepOHY7pRPMRN7aPOLu+33ziOvjCq?=
 =?us-ascii?Q?4/Mwx3EobZdooWSgfOPHN/9d7mZ7U8ztYxksiGa6AVFid6s+N3kEDwDnnTpz?=
 =?us-ascii?Q?WJUU9GeTGXTSkCYYY8Myrg2KDm3MwwfTTpiOGM8CxcccVlRyn1IF1mhR8RRU?=
 =?us-ascii?Q?sMSIahXpgFduyazWispDXagsms9ZB8tyUCY7//A9RKrN8pKiZHzKfR4Ql/KI?=
 =?us-ascii?Q?XCbIjoMG9bEWhKSWEESDmtzorsCfYv2LbD8DxcQs?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: mobileye.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VE1PR09MB3535.eurprd09.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e6a48a1f-52fb-4c6e-d21d-08da942fa1a2
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Sep 2022 19:55:52.2366
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4f85ba13-6953-46a6-9c5b-7599fd80e9aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4jVTXptV2eUcNn8hpGjHBkL08tW7898kERjYgwUcljWOWdqlJkmdRtqNb7qRWPHbtnsi4iZ1Jz2IjLBKW6SVLw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR09MB5701
Precedence: bulk
List-ID: <linux-trace-users.vger.kernel.org>
X-Mailing-List: linux-trace-users@vger.kernel.org

Hi !

We are using this article to generate trace markers:
https://lwn.net/Articles/366796/

I am responsible for reading the trace.dat binary into our tools and we are=
 using the trace-cmd python wrapping.

I'm trying to use the python wrapping in order to read trace markers, so fa=
r unsuccessfully (See below). I've noticed that the trace marker string is =
written directly into the event, without using pointers, indices etc, and t=
hat the size field in this case equals zero (in bold, below). So I'm guessi=
ng that the way to read it is a bit different (using the method for reading=
 regular string field does not seem to work). Here's how the event descript=
ion looks like inside trace.dat:

name: print
ID: 5
format:
        field:unsigned short common_type;       offset:0;       size:2; sig=
ned:0;
        field:unsigned char common_flags;       offset:2;       size:1; sig=
ned:0;
        field:unsigned char common_preempt_count;       offset:3;       siz=
e:1; signed:0;
        field:int common_pid;   offset:4;       size:4; signed:1;
        field:unsigned char common_migrate_disable;     offset:8;       siz=
e:1; signed:0;
        field:unsigned char common_preempt_lazy_count;  offset:9;       siz=
e:1; signed:0;
        field:unsigned long ip; offset:16;      size:8; signed:0;
        field:char buf[];       offset:24;      size:0; signed:1;
print fmt: "%ps: %s", (void *)REC->ip, REC->buf

And here are some of the methods I've tried to access the "buf" field above=
:
field_name =3D "buf"
// method 1:
f =3D tep_find_any_field(self._event, field_name)
if f is None:
    return None
str =3D py_field_get_str(f, self._record) // (returns empty string)

// method 2:
f =3D tep_find_any_field(self._event, name)
if f is None:
    return None
data =3D py_field_get_data(f, self._record) // (returns empty buffer)

Thanks in advance,
Sharon Gabay
