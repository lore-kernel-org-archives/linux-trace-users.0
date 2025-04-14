Received: from YT3PR01CU008.outbound.protection.outlook.com (mail-canadacentralazon11020103.outbound.protection.outlook.com [52.101.189.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 162CABA49
	for <linux-trace-users@vger.kernel.org>; Mon, 14 Apr 2025 21:40:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.189.103
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744666804; cv=fail; b=mC/XqcUu8e0YpslYTcU3XZyO67XfYocCEKXB6w3oz48DCdzNznUegp+9uqS4PvwEdRe6qVD+ilFOrm7uWLrjkHmigz3e3SS+hsXxDi2IvD7/vbBwaeg1gGDCPF3m89VyzxCt693vON140TPt8WLNchc7k/xKpQCrEmctrm1LUgU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744666804; c=relaxed/simple;
	bh=CLeNKFDVr8TsZGQB0+nQ/E0r0CsbssWgquiAmLy32cY=;
	h=Date:From:To:Cc:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=Ml3FH7gPi6+/+MbagTA25ODeHP9yGQbb/gs4r73bcqZMYEE748+FsUF3fgoaWw8/HitEC49pej8mnYbEMtsWfF1SzigFzplYSX6cpAbJk/mO3z/WKmVxU+XUQTxJKgqQnNto21TeeGlXSnWsNfmHAeRNkivA8iwadIv86gw76kg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=efficios.com; spf=pass smtp.mailfrom=efficios.com; dkim=pass (2048-bit key) header.d=efficios.com header.i=@efficios.com header.b=TzZjia+i; arc=fail smtp.client-ip=52.101.189.103
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=efficios.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=efficios.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=efficios.com header.i=@efficios.com header.b="TzZjia+i"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aeTPN8AHI9iH+hyIldRJ8Erxwmk5MxhEBeUVh4UYr+VY78fdDT0x35n5kxXYwxP9oW/kl7liOymP5FNFqe56+454+9P6SB7/QdEzdhLn87cMGZSQo2pp5NPnE+3pRdQbL60wqpBX+hRJ/VsvIV9fExxbW/OwtX/JwUe0OIHyksFiEJHoxaFuOQnTrPKu4IN/jUTiojj2a5I9URVmT24x0yitPlN1tOaOf2dtLh5W1aRa/ZSRJ8DfzJ/cdihNMZvkXFfRp+/45txr6BHPhaBsv1lwaveAvFNh2DScFIkq2zY5hbD5Wk3G3prOEWwmVWuE3wof0DVIfsZPJRF4S2WIZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1eJtb/YmOY/JR8xk/P7gbsaI+Er3ylauVyJD+mkt8dI=;
 b=q20zdTnxDC5p8dhKU98d4AjsOxG3ZTesscu1sIjAn//jaWXlXWxLfEcMVe+jzhFaIEkurDrXkmJwuL2pHRdHvwwcBae4Ke0KXPLxzStEE9hlsbLC4FwQaZthcFg0qZkZ5a3F/JecLSMGCxh1Ult2wf72k4AYU9YGrgcXjtmQ11RyQduhwH1CsH0aC7FQmc+njig9pdSHVPy2x+b86oG9/gMnQJJlqiz0mUq7mAjssD47enhnwSm85Fx83kiuxDQWyYeZ6kV6ALT4VFRTCI9BdfvUkOTEWDlwNqT5UmoWH+xuC08tKNy+N/TLepCimOeiWMgwx1S+qygbrh5dU9lsWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=efficios.com; dmarc=pass action=none header.from=efficios.com;
 dkim=pass header.d=efficios.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=efficios.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1eJtb/YmOY/JR8xk/P7gbsaI+Er3ylauVyJD+mkt8dI=;
 b=TzZjia+ijRM+wv3pFxHydBKd8pXqcEMnomPWrSVzxis5wJTUfVahpCl6s+mHGVCqvfUJdoXlLRmuzdTZzbEd285aVBfpfkTFZ4zC65qU4cHE9B9ArQe8TkrqS0cGDqmvyffixtOOviw12nfE1pgRd+axQqL8G3Ccj0l4kV/8UaTHyUW9D7DdeT7nKMW+YUP/FxratxfCQmV9KRmelqj02cn4FMcIaYz89x8XYiInSgkVYPEFVRF1f2A/FEYsE/CRTJ0pKP1itPaSWDplC4Ybhaf0zEtwOHx0/ZFpSpTGlqI3T1K3uAYqB8MGUiYaBw5kkyp5X40tP11TeS172ePSlA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=efficios.com;
Received: from YT2PR01MB10714.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:f2::19)
 by YQBPR0101MB5323.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:c01:41::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.33; Mon, 14 Apr
 2025 21:39:55 +0000
Received: from YT2PR01MB10714.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::e91e:67ef:3478:44e7]) by YT2PR01MB10714.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::e91e:67ef:3478:44e7%4]) with mapi id 15.20.8632.030; Mon, 14 Apr 2025
 21:39:54 +0000
Date: Mon, 14 Apr 2025 17:39:53 -0400
From: =?iso-8859-1?Q?J=E9r=E9mie?= Galarneau <jeremie.galarneau@efficios.com>
To: lttng-dev@lists.lttng.org
Cc: diamon-discuss@lists.linuxfoundation.org,
	linux-trace-users@vger.kernel.org
Subject: [RELEASE] Babeltrace 2.1.1 - Brossard
Message-ID: <Z_2AqUiWV6YyDXVS@efficios.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQBPR0101CA0033.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c00::46) To YT2PR01MB10714.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:f2::19)
Precedence: bulk
X-Mailing-List: linux-trace-users@vger.kernel.org
List-Id: <linux-trace-users.vger.kernel.org>
List-Subscribe: <mailto:linux-trace-users+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-trace-users+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: YT2PR01MB10714:EE_|YQBPR0101MB5323:EE_
X-MS-Office365-Filtering-Correlation-Id: ac69b756-b74d-4376-c726-08dd7b9ce517
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZTJsRVRNUkZSMzQ0WDBNaEhtM1diMUVZNG95QzlQUW1DaGJGd1htQlNaSzlV?=
 =?utf-8?B?Sm5SNmwrNXczTjR2bVZpTk9RZW9Xc29RYUtaMVcrRmhkajhnZUplY3pCWm40?=
 =?utf-8?B?QUl6OTRoazdFRGN1c0FKNW9ZZVpjUGluMWhEcHIwTGN6UDcrNGF0bWpKYnNj?=
 =?utf-8?B?cVN6SVFFM3FUeHkrclVnekFyWURqSWRZL00xWTFmN1RWSW9vY2pUTnAvMEQz?=
 =?utf-8?B?bjROd09VRWtNL0RjMjQwMUJrWDhDNE4zelJrWWlIMERBOWNvQnBscWRlcERC?=
 =?utf-8?B?UnFKZHNkVmlzblJid0t1UWN4ays4a0R5bUVRNHF4Qy95bUd2eVlHMlhvTVdF?=
 =?utf-8?B?Zi9MQk0wYXQyZVpYT29xUmFhbjN6c0FKaG1vOEpNZXVpL080OTV1YlR3MzRn?=
 =?utf-8?B?eXF4TzVrRFZYcGJuc3UvOUVMbW4yS0MyWXJKY3U4enFPQjVlQmZZdElvaGt6?=
 =?utf-8?B?ZFFCMUxqSkNkaG1KcU9KdjhoYnlDS0o5aks4Sk5SYUdkUEcySWRBTU5YYXR2?=
 =?utf-8?B?MmhBRTBkUld6Y0J0KzNpZkRlM3pGd01JRTI4QUxMcVFySUJlKzcyb0cvbE1x?=
 =?utf-8?B?bklTK2tBdkRSTk1zU0NTamNWdHd0c1p3Z28zUHF5U0Iza2s5aUZncUdDZkxn?=
 =?utf-8?B?ekdzZmUyOGFWWGRyMUdKdURyVVBtandHUmh1Qm52Y25uVG9HSkNRcUZnbjhT?=
 =?utf-8?B?YVJIeW0rVGtyZ2JBNkQ3M0ZFWkpaVko1R0I3OG1sclJIK1ZSelBweU1VNDlz?=
 =?utf-8?B?Ykh0ZEhJQjFxRDJZN2cvaXpXWWV2T3hOQ3VlU0JGMGxKb3h6anlwdFlMTDRD?=
 =?utf-8?B?TXpqSVVtQmZqajNzVDlHdTJPMUdlaU03dTFyY0pJUjVhcThFRGpicXNLYU1Z?=
 =?utf-8?B?WnNBY25qVFVMLzVZNDJFdlQybjdOWmRwOHIyeGlsWi92aXQvUENRWFptWW1w?=
 =?utf-8?B?djJ0S2puVStmTGV6QVJUZStSWWlKTS9qa1hpVVd4N1dmUHBhdllkRnpFZGht?=
 =?utf-8?B?Z2gzWGJHeHUwVWxnaVRtb2lXMjhjM1VBMWxrMTRRQkd6TzE3MWpmYjkwZFA1?=
 =?utf-8?B?dmowZ3V6YTBaaGJRMmpnL1FLRys2akRveFpwNWF3V1VYVjNodUZhVHE0Z2tx?=
 =?utf-8?B?ZWgzR1NINjNVTHliNzE1eVRDN3cyRXJBTld6NG9oN0ZyWXRYZS9BNEJXM0hn?=
 =?utf-8?B?cVF2VXFPRGtjMS9HdldUL1ZlaWU1Z2hFemJWWjBwWnIwY0ZPOTJtOU9SWmkr?=
 =?utf-8?B?UEdkVHdtb2JYbHVCcUVvbEtudnVwQ2hZUnZ1K1hmZ0g3Z1gxVDBZbllPSDFE?=
 =?utf-8?B?MEM0VXhTRUFOZXFob290WW1RNkM0SlMxTnp5aXk3R2swSmtLV1I2Tms3MWlk?=
 =?utf-8?B?WnJ4ZVpFTU1GbDcvcHVsWHcwWGpsODVHamVzYnZXbTlBcFNCMXhTM3U2QzdU?=
 =?utf-8?B?YXpzUjgxU3pTVnlwUXh4ZXhFSEJIYWlZL1dVT2h4OWZROU9Va0g5NUNXekZ0?=
 =?utf-8?B?a3EvTEtHTEhKRnlZUnpMaG5Wa3JpL2JTM2hiWXlxTGJtQndrR0krRk5vc0M2?=
 =?utf-8?B?MzFSbEZjM2ZUR0V1UUNNdWN4Nk9TR2d5RnVCWG9acWE2NlRHMTFlNjdjVkUr?=
 =?utf-8?B?cTgyYldsTVM4OXd6THBRazBocXhsaEFTTFd4aDFIdEpZYVh0aHJSaE9EOC9j?=
 =?utf-8?B?bWVZUExVVENkS1BEbFZVbHZZQUN5WGFxREZLS2xxR0l3OVlGb3NTbDFSTGJV?=
 =?utf-8?B?UW1WSGdkUDUzYk9WMHJFT1FGYXlHMWVWUlA1MWZrYlJ2L2s4NjhCTVJQNmEx?=
 =?utf-8?Q?ZW65vDdE1jLGp3ERCc5YNyvOFmpHhemxHRjMs=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:YT2PR01MB10714.CANPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NWhGSUxyUFEvUVJmQjJBejIzMmh2WWhjNVRPdndvaFZSN1hWQTZCNmk0V2Yr?=
 =?utf-8?B?bXRvZVV1QnVIOEwvQXVQcnAyNjhKSXJEZ292d3J4WEFrWDVQWjZ5RElNWWF0?=
 =?utf-8?B?bHNkcC84ejhwc0Mwdk81Und6V1gya3NURUU5c1Rwa0Q5WVBITk9pMUhzR2Nk?=
 =?utf-8?B?cU9HbnRvN2xob0tEVzBmWmRTeFJ3dXVFN1B6UWVpRGV4YUFZUnU4bmZHQ04y?=
 =?utf-8?B?RHM1VWhiN3hJVmpHOTc4VDI3eDc3ZzdwUHQ4b25McVNPZVBaSlN2eEpiYUR5?=
 =?utf-8?B?TGd0MjcrTTdqMEQ0dGhTZ2ZGNmZmOWd3dk9kc2lKZDFrV1VQOEdoS2tTQ2pV?=
 =?utf-8?B?T0s3YUZSQy9zQjFMcTNEWmVrWm9KTGtJZUpEWmF2L2o4aUFCZzZORGZscEVo?=
 =?utf-8?B?aGVJZ2hzdFVzbHlYaGZnM3c1dTNoVDJOelh5ajlzbStxUHFVTHNxV3VVelFi?=
 =?utf-8?B?T3BwQThGRFhTclY1aVRDOHVyOGxidnRoZzRoWFhndERPZkw0R1NzYW1jY0I0?=
 =?utf-8?B?SWFnM2ZoZUErdlBFYkRLa3dYSHptY253UVdkUUtsakZNSzFITHVkT2ZGVkxK?=
 =?utf-8?B?MXlybkVjWVEvS0dxcmlpVXArdmh3OWw0UzczNEpIY1hwNlpXL3F3Wk9EeFdJ?=
 =?utf-8?B?U21QNUsydDBLSyt0UFVsL0dLUnY3TGNBQkcxMUl5Q3Flem82QmZTNWFVdXJ5?=
 =?utf-8?B?Q0dZblZ6Nm96RExFMnMxUzhJV0s5cEdxMXBUaTk4Vm1vTng5czR0ZVJaSHNW?=
 =?utf-8?B?SzhWQmkvREt3blI1NHFieGk1a0VTT25lSmM0azNkU2ZuZlc4S3ZOQU9pU3FQ?=
 =?utf-8?B?eG4zVnlVelhUQ0hFSTA3OEh3R2tGQ3ZiZXhKTGdHUHhQQmhkOTRIQlUyMklx?=
 =?utf-8?B?UUo5TE9wWVpkTlpLNTl5cXJjaC9tZE12Z21mUVdLVGMwVGdmNUV2MWFaK1J6?=
 =?utf-8?B?aHh0N2l0MFVPK2pLci9NQlZIOFhZNU5ueEYzb0hteERUcWYwUU1SMzdkeG5O?=
 =?utf-8?B?QkdCS3BOY3k2eTl3MWZ4dnlDK3FWZVNaZDlqKzl4VU1Ga2puLytHZ2F1QTR0?=
 =?utf-8?B?bkd6eHB4QlhoaXZINmR0YmJ6dTVEUkY0dWt1WEpXRi90anJIeTVNcWthenpY?=
 =?utf-8?B?YkdkTFFFUmYxU21vcG10S08va2txZEdQNjBvazYyRFlKQ1p1RGlXUkVRSFN3?=
 =?utf-8?B?amFDdExsWC9ZYUIxRlpoZzllOGNJRVZGT2ZNM0U1K0xYMTk5UmNkMWJGOXdR?=
 =?utf-8?B?QWg4M0NVZ0RCVzhKU1RFNERsRXJCNHUrbVZ2NjlzbjlvY0F5RjdsalFYQ1Qr?=
 =?utf-8?B?RGN6ZVcyaVdyWGM3YXI2NmNxeDVwbXdLYk55MzBjWitXZW5xekY2eUlWalgr?=
 =?utf-8?B?L0ZMWXA1TW9jaDkxUnF0SVNLa0gvVnc4Z0hvbUl5c3dSQmg3c1JWMlBpaGRt?=
 =?utf-8?B?bkp5aXNhTjdmQlhzVGpqOE9STStyUDdReDNBdmNCc1N6d3phaTFpZ0JLNzE0?=
 =?utf-8?B?UGsxcUJVblY1NHBDYlBjTEl3aVhtdlpSdS81UWRUdDVzdXhXTmVublpQc1R4?=
 =?utf-8?B?TGE5RE5DQUFRQVJKb2dNaFlscHlTYWc4aDhObWx4cmJrNTRhaVlCcm1tbXox?=
 =?utf-8?B?MGNnd2hZaGZIei8vaEtiYlVvYTZPellzeE5HWU1EVVV2cnE2LzY5V0RtQjl2?=
 =?utf-8?B?QXZGZVVVMXNDdWNoTGpyNmhtQW11bElyMVJ5dVdieW9MUjZRa0RCakI0SHdL?=
 =?utf-8?B?SnN2YUV2WEE0c2k3TmpORi90cUtoZnlHWk1tckcvLzdxOGtRbmc1V0E1YU54?=
 =?utf-8?B?N3E4eDhLbVV0M1FjdU1IRUNRekZzQ0owRDBiNitudTZreXN0WHpXWE1ZRUI2?=
 =?utf-8?B?TDBuYVJ4QlVkODA2RVA3WnI3UFlZYkh0aHpnSnlhNDJQSGkyTllzM2thTGM3?=
 =?utf-8?B?TStjdm5iUlpKdE85ck9RNFFqRjM1bkJCWWRWUXBGaDVLU1hzbVA3SmNxRGtG?=
 =?utf-8?B?S0tYb2MwYnZqWmdjSkIwTXNKT3dmVVpIRHNvQlp1aHhxdUlob3o2QXpXMlFa?=
 =?utf-8?B?K3FveUxBTXhJUkNtZGtlQ1NjNVltcVpQcElXQ1p6S21kVUp0eXNNcktQWDlC?=
 =?utf-8?Q?tNahGU4XPLkTsz2j6OhCWvr1x?=
X-OriginatorOrg: efficios.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ac69b756-b74d-4376-c726-08dd7b9ce517
X-MS-Exchange-CrossTenant-AuthSource: YT2PR01MB10714.CANPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2025 21:39:54.6703
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4f278736-4ab6-415c-957e-1f55336bd31e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RTLKB4eOozUoZrcyTxHeUXFNYvWx5+n5L4tB25ItbKENTx5AmSoits40tcJOtymbGfK5CkCES+HdL64PL1MP6w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: YQBPR0101MB5323

Hi everyone!

Today marks the release of Babeltrace 2.1.1, coinciding with "Pecan Day" – a
nod to this versatile nut and perhaps a call to enjoy a pecan pie or other
pecan treats after updating to this latest version.

What's new since Babeltrace 2.1.0?
==================================

This release focuses on improving stability, compatibility, and documentation,
addressing issues in the LTTng live source, build process, and API references.

Below is the full list of changes in this update:

2025-04-14 Babeltrace 2.1.1 (Pecan Day)
    * src.ctf.lttng-live: remove lttng_live_lazy_msg_init function
    * src.ctf.lttng-live: fix comment formatting
    * README.adoc: Update working version to 2.1
    * fix: export bt_component_class_sink_simple_borrow
    * fix: building from the release tarball without flex
    * doc/api/libbabeltrace2: use `<code>` i.o. `<span>` in `<dt>`
    * Fix: doc/api/libbabeltrace2/Doxyfile.in: set version to 2.1
    * babeltrace2-sink.text.pretty(7): add missing default param. value
    * Update working version to Babeltrace v2.1.1

We've worked hard to address issues and enhance the Babeltrace project, and we
appreciate the community's feedback and contributions. As always, we look
forward to hearing about your experiences with this release and how we can
continue to improve Babeltrace!

Happy coding, and treat yourself to something pecan-related today!

Important links
===============
Babeltrace 2.1.1 tarball:
    https://www.efficios.com/files/babeltrace/babeltrace2-2.1.1.tar.bz2

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
