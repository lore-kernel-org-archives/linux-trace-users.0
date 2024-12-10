Received: from YT5PR01CU002.outbound.protection.outlook.com (mail-canadacentralazon11021137.outbound.protection.outlook.com [40.107.192.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91B11228394
	for <linux-trace-users@vger.kernel.org>; Tue, 10 Dec 2024 20:40:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.192.137
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733863228; cv=fail; b=nW8nVf8qe4qA7YbNlqxUG7yvJQtqFI4j9jauLUE2ZOGv5iP2WokW0rLRFD4BotRnE8YWTU6QGERqoIsJDDVjiuj7HSyVnVup2XfGHTECcGRl75KfXRHvYNS3+PMi7wb2F3wXhaogMup1u0nEDcNyX4Q7Sghr/NRsaEeSE2p8LMI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733863228; c=relaxed/simple;
	bh=/dVHARRzprrk4Cffst6QXwJlIygJZx+FDYOJT0k5tfQ=;
	h=Date:From:To:Cc:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=Hwq0kWQqP/wfGEzB1ECIJM3eUiq4aZ9NB7R+sfBdNBiCQ0YHv8HEzQ6+GXpfEMMG2GfK2A9gQidblmrDogq2ZJpINfMyDzU66ZuU27+FXPgCwwJl23wZXVPO0PfviquR01KIDuCuHa/E5J/v8aU63VhBd8v4hsdU+yBqo1z2UzM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=efficios.com; spf=pass smtp.mailfrom=efficios.com; dkim=pass (2048-bit key) header.d=efficios.com header.i=@efficios.com header.b=HJBgiVVZ; arc=fail smtp.client-ip=40.107.192.137
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=efficios.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=efficios.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=efficios.com header.i=@efficios.com header.b="HJBgiVVZ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ENhKImnzTnb87NFrBL1nyRKGRKU0CEc0o91Id53cPemp/huq9GFNpiiu3IBkJMwXp7cIaCSVQNAY7xh33iJKwIyBRvuZMfy49wNm98papvlKV5oKHdDc6FEEgMJcLCBf6+ssyLizg6ktfkD2HWASOssSTj14Cy5qetmzUEHoCbDiH1Qj3dnF183uQZFi+FMaT8GzlLVXBzXh7jrKXkow4utBSzv5ZTqp1m+Wbo7hWSzu7mRiQjgT24HHsqQ55nVQ1IkDHBoVxK7uKmGJzKpuBUKmTZLqZzilrwScPOVUgQdlyECWH9VcMiSrwifG4WkUhVz6jb8lnzdf5bDFNPrD6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8/r/f4A2qyr6ZB6pPSsZ5s1beDtzhkT0miHoyBijwsM=;
 b=YmaCpDyDay+FhvIlyTrBg5jzEB9Xn1y3DockAhVV/e3WA/04v2KyxA5RbXhIMRlL98uIxYzmGqyMVXcNEQgnWQNVop4C2r/gjX1V/LXv6kJZa9i6rvXC97zpm2IDxV2ZaKLBhYsP7So4iYKQXsXXd0Bp+xnuAyEGB15V1AmyIdwS+v0kBMc2Wsg6OiT6kdb5yUdktWx9JDHI/5BCKdRbRtzdIaXEdbjJZ9USWeFEXlfLIS7hSd6IsFO38CxZi83m50CZquMpDhmc+YPKQfD3WyWoXMYhsQ0Wutd/Uwu93OhMdorT2AEu7qi2Ro3CCaEyZJgJFAQjUOdBjIyzOg12qQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=efficios.com; dmarc=pass action=none header.from=efficios.com;
 dkim=pass header.d=efficios.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=efficios.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8/r/f4A2qyr6ZB6pPSsZ5s1beDtzhkT0miHoyBijwsM=;
 b=HJBgiVVZ/PrKuN6dRbSIIZGjcX4KPe70k3pmEyAt78Bzkn4baN+N3D0kF9lj8jRHfr1426bbEB9POPMUiZEZ4ORH6idmHpXK1vWKnxh5y7E3gca6c+5H9jYtgd2o5ZDI1iUICVLEDI0yyopc57vhiIe2sAdZDFlk9+vjCOgmF23E9+cgTcgH6YgjT8rBMsciBHlmsP2fFKZi3dpUnAqLgG8CtqGDjvpx4Dmw4b6aZ+EHV4vQqxWJXTP8rFg8iNzSLIIMfK4dGbGtX9DEepkskE1gWKGKp131VKujJ0sBkMoCf3GN9LmckN/YBvPB4mlL5UEAo0WQSuvxC7j7EtupEA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=efficios.com;
Received: from YT4PR01MB10709.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:104::10) by YQBPR0101MB8669.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:55::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.14; Tue, 10 Dec
 2024 20:40:21 +0000
Received: from YT4PR01MB10709.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::5de4:ebdb:2bf6:ee1]) by YT4PR01MB10709.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::5de4:ebdb:2bf6:ee1%4]) with mapi id 15.20.8230.016; Tue, 10 Dec 2024
 20:40:21 +0000
Date: Tue, 10 Dec 2024 15:40:19 -0500
From: =?iso-8859-1?Q?J=E9r=E9mie?= Galarneau <jeremie.galarneau@efficios.com>
To: lttng-dev@lists.lttng.org
Cc: diamon-discuss@lists.linuxfoundation.org,
	linux-trace-users@vger.kernel.org
Subject: [RELEASE] LTTng-tools 2.12.17 - (Ta) Meilleure
Message-ID: <Z1inM_swNHvYXMXA@efficios.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-ClientProxiedBy: YQBPR01CA0037.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:2::9) To YT4PR01MB10709.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:104::10)
Precedence: bulk
X-Mailing-List: linux-trace-users@vger.kernel.org
List-Id: <linux-trace-users.vger.kernel.org>
List-Subscribe: <mailto:linux-trace-users+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-trace-users+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: YT4PR01MB10709:EE_|YQBPR0101MB8669:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d5cda78-2417-41ca-3b89-08dd195addbb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?kMTWcWaK7FPzKxgX+/jVgNwUTIT0xJOz4RtUqQsfUQp27RbAEG6vqltBPTrA?=
 =?us-ascii?Q?o7BnDu/8N+lqOa9oaYJ684hom3AVA17507SjwMWPuEAzsPzsMMbBsJqVMvtw?=
 =?us-ascii?Q?hABwWpDtPx4Kjz56H++BEZYbX5BxVYqjciMRwWBn0nQGuRUXCyZdjKBSAEpc?=
 =?us-ascii?Q?zpLfBSjH1A7YG8In01DzMSAkRlzhVCvH5zXXOpFCO7xegcPA9K0InGLcGmvN?=
 =?us-ascii?Q?hgNRzAlsnbulE0WQgZaWRlOr3hYi4/7EqnDD1/XN9lwhn9PCwlk3gpTbyro/?=
 =?us-ascii?Q?W1GgyIRwJD9kyuudUfZwdxYOERX/YlBexh3tM2D1c1MQ0kGfllElbBgoulp/?=
 =?us-ascii?Q?njgqx/pi1oevYaRebUtQHXO9WGHl/XLmeiHavErIWI2mc98BwGT5gxk+x+jl?=
 =?us-ascii?Q?J5EAhi2xSlOxlmaUeiVjrp8Hdk+zHH7asYW8z5OnJv5x+9XqYGL952Wj72iA?=
 =?us-ascii?Q?/x19nHbtJgQnDfs1R/3jnsVEIzbE9LnTcSsjBidLpJkeIYj+P23oKFGKNDr0?=
 =?us-ascii?Q?1Uk4ILOMLmXeN49EmJZHJsE53cQe+pZ3N+rYlwo/OtwlIBsUT1xdDbemreip?=
 =?us-ascii?Q?KgMlny7jf3ABwZ+X7uJAbGCaBK+hfWO7BOQwD8A38twzFXbGwb+Hh0lP+gFO?=
 =?us-ascii?Q?f+A/JAgIqb15IAmDO5LAaHnROsaXg050Swbpa3LZ7f4py4eunDn6Qhptw/LZ?=
 =?us-ascii?Q?dX3buyHrgKPgDMtnbYfDOGgo/pHY1dYhBSLM5arPS5I05Y/7XVaHANzKxYhy?=
 =?us-ascii?Q?dB5cZtPvMn9ESIwbyrU7kaYmUjBSzmtnuW26cZjhcsy2tGHJEI4Jjkt483B5?=
 =?us-ascii?Q?BiY1nNr2cQZIZyCKR4EO8qLAIGnqGGDpkJd8bL9r2AoH+Thwq72f5NeGoK19?=
 =?us-ascii?Q?yLOdR1lO4YfPfwEwBbet1VLCZIdVGBSv0qAyVRXn5fnoCjFbFzecVs7ZGZz1?=
 =?us-ascii?Q?cJ2cLz9O2GLUJkI2H+BUKi5cLCyE+QSYLmBz0npeS93Cn23qWg9o+WW5+L1H?=
 =?us-ascii?Q?HVL93PNSuBjlr3EnB8d0onPl//yGsQRwJx2ggC7cca0ugvt9CxpWcvM+qWOD?=
 =?us-ascii?Q?Qont0ZmzMDSApEFwFL9eYnKgdeS5qXtUZunfCKiV4alhr+xU6VeHVnReeXRM?=
 =?us-ascii?Q?wxRD8hTLl/AEuGT/xfrgur4T6VXHh7ta+Iu8Z42J2fQMofmOZxeiXKjfgOzy?=
 =?us-ascii?Q?wOzVYrvf7LoiwG4yKHwcYTJwNyx+6O0acS/0ddwedM1yXfr1okQ1k9bZxkW3?=
 =?us-ascii?Q?1wTR44RHExujKh06yE9hQxM2zi7dJY1GJaiS3v8N7nj6SbMQPkY0z23eiM+D?=
 =?us-ascii?Q?Z0Y=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:YT4PR01MB10709.CANPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?nfobsQpx33w4OTGdsNx+eCnDEP01ECjE/eh9fZ1Tbg4LoPjLQIsJDNlGn+rw?=
 =?us-ascii?Q?LliSbZX4r035bQBcX4K5YKko5U2/tSoZmTTGtQBQflqNX9FC0znU4a/A1BZa?=
 =?us-ascii?Q?Prn0mU2xBCRo4zp7GVNs8jnWpXmEddCOGRUqv0pIlb3Kf8R2pIi2sOAVDC+p?=
 =?us-ascii?Q?Ovj33dmx7s3oQ1BDvo+ht6Cmy+RiPOJxCAJK49z8pUWJ6QAYnd6d6fKDqIbu?=
 =?us-ascii?Q?YNgxHaLVX9r6DTbHjfjufaJ4tW0prmUHkIqqddHy+oySthDsLMM9LgZPimRA?=
 =?us-ascii?Q?wfyC/OvkPEjQpiWIBN1pf+HU27TwRyF25DM8EdCuESjShEh84e8/EVp5n+Jr?=
 =?us-ascii?Q?VzcVTiKZREfu3aA0++v2dXzNsucrzePGLIlrHthSd9WH5pJW9QiIFNWrIOFU?=
 =?us-ascii?Q?XtsKbbsAomaSTqBw2RjeJQWPZnIfdckv6DFnemJdEyZ5e+cV7E4tCIaCYP53?=
 =?us-ascii?Q?Yck6PkGEs1iJo83VposGDdq2UgVJ7BF2w8xILRv7uaTG9ouCao1CPVfl7CQg?=
 =?us-ascii?Q?JgW4hj/oLpeGIwQ5IAdMdeECFmE4ljFDktRChW9oehv09k1is3ejjz5yhAun?=
 =?us-ascii?Q?vi7JQ269t3hQvMqbgnckVnbpELDRxXqxWXQv3JG1/r2pRsRUCvyGEdw9nxMT?=
 =?us-ascii?Q?CfB92H5e+5Tpgh40HtO7N/YbUS13jtzBm+w/1we+08dypGXfiKgjSt1NvcYf?=
 =?us-ascii?Q?L0A9wSiTTNro1zARTV5EcjaxEKKX0qLa8pun1QrA7bW5btUfjRNJ8Im/V4cc?=
 =?us-ascii?Q?tkLGj2peeyrUtZQIcN/syHOo/vXRxKGyWkVhWNOuIXaEJVPGCrhwNZ77Gwat?=
 =?us-ascii?Q?7S5y/gPzH++EnFz2HG4HBYj7SFSt2nGC7MhuU76R5nI9IVpqgLzbkmOIejdc?=
 =?us-ascii?Q?mDBPC5u3/2Y1lF7r7Xj1I53P+kt7bGyc7wbVjkugLdGXXpdRJMpnOxxkFOhW?=
 =?us-ascii?Q?m0R3zG0UsnFoLK2oDh+lYolFWOBIY4vuhi2enuHaUe5SYLvLR6lvzsW+CI0J?=
 =?us-ascii?Q?71r3rsYVmhNbFM7tqR1PaozLYksW0G7RZPqkeaaJQesStioxWQhHVTTFfWMb?=
 =?us-ascii?Q?qW5bMWV37aOPjVJfHbxzv212e2btu7TpGm+lfd4BACRYGhFvY/eY8ml5YtdT?=
 =?us-ascii?Q?wrpsf30I4yUz8dBjZDPFvjFsKmCbiozT1HrOPKWNmwfo661mSdd9zXcMGsla?=
 =?us-ascii?Q?QacU25XHcfoHBgQLte7xPj2Uo2LWr1m37485QGCrB6TLbyEXWDYv8G5GOQR7?=
 =?us-ascii?Q?sXpmCrKmqX/ztAbOqUT0HkRRKzLa5vsvdMTvBU1AcN8i72X7fsZzYTExb4ic?=
 =?us-ascii?Q?AH5bTT6uNViF94vmeelUiG7737LoEUL5XzPE/Gf/+VD9T6GsFAEPZUnvoGov?=
 =?us-ascii?Q?8j1hmBW5ya45sIFzQNbNMUlIblG9WHvgbb882PuuJ40avK7zpv/2MRlnVzgf?=
 =?us-ascii?Q?C4fHjgP2t7hwWNgHaVz7whbjJ4OuxmlYTksl9xtTQ0aYcZmDD9TJkQ/0kSJ6?=
 =?us-ascii?Q?tinTbHK5L8Ewqjf7aQ7RE+Mr/Bsds9+ahAY0Qtb4H2tXuQ1ig401x+ZzNMlE?=
 =?us-ascii?Q?3f5xblo+OEfewvkNMyKlZTR9WMMnDndUvt38EYJL?=
X-OriginatorOrg: efficios.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d5cda78-2417-41ca-3b89-08dd195addbb
X-MS-Exchange-CrossTenant-AuthSource: YT4PR01MB10709.CANPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2024 20:40:21.5679
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4f278736-4ab6-415c-957e-1f55336bd31e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wjq8gH57v1qcQbRSJQG2TwrD2iq0dGSwW893TZwbEVeq8fZExhOZa61TPEzuHIce+AUdI743Xpv97IWL7v7kAg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: YQBPR0101MB8669

Hi all,

We have just released the seventeenth bug-fix release of LTTng-tools 2.12 - (Ta)
Meilleure. This release addresses an issue listed below.

2024-12-10 lttng-tools 2.12.17 (National Lager Day)
	* Fix: lttng-sessiond segfault during session destruction

As always, please report any issue you may encounter to bugs.lttng.org
or on this mailing list.

Project website: https://lttng.org

Download link:
https://lttng.org/files/lttng-tools/lttng-tools-2.12.17.tar.bz2

GPG signature:
https://lttng.org/files/lttng-tools/lttng-tools-2.12.17.tar.bz2.asc
