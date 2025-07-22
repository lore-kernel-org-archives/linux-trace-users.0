Received: from CAN01-YT3-obe.outbound.protection.outlook.com (mail-yt3can01on2107.outbound.protection.outlook.com [40.107.115.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93C9F2836BE
	for <linux-trace-users@vger.kernel.org>; Tue, 22 Jul 2025 21:40:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.115.107
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753220429; cv=fail; b=OAY0u0hgbhGSBLbhVnLTLDOElvG0bSq1ze76qw/Ske/6RUc0BFpV4VFkXqN1MZu9u4XZhOLNmubSRcPosWO4oKhlwjpBtNoYYsmOCkRmFqzIElpxc5LbCAistbe9RX7GTK4u63rWJ2ban9Do0RY1UJIu+W9jPwlq/jo17qjbC+4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753220429; c=relaxed/simple;
	bh=u+SAxk2L1m6ADCrFZQZhq0hT/G4FxlsAJKNVGwEb4wg=;
	h=Date:From:To:Cc:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=D7Dk4++O6tBnHWsF7UTan2zyxsP5jCbfK0LwzBl6eN89ITSRL456PV5d0VXRsYZoEs//mT+upyZPJDsZVcOSgYGulWBQLLyFqrH/dFuyjOwGJt6UC9LfOVEToM4EKYNkAkYCpNhz5jjZHgMJCalZ1dv9lyysjRO6GsXMaC7JdbQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=efficios.com; spf=pass smtp.mailfrom=efficios.com; dkim=pass (2048-bit key) header.d=efficios.com header.i=@efficios.com header.b=jaeBqLtP; arc=fail smtp.client-ip=40.107.115.107
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=efficios.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=efficios.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=efficios.com header.i=@efficios.com header.b="jaeBqLtP"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UXk8BxtigpOA6Fhv1agZQO0hiKSDF0pWNsejdebXqJr4xfVN9PhsMXnbXnM3Duf2VUC4vUU4sK/vGj5FCjyDmgK5ivjymrnUzMGaVGTmw+t4sETpd+TDXzQvlPp29XWr/x497OkNte7Aw8P0ZV4fza7tWkorDbY//qvRyx/3qHiWdBhcWsDwiS+LR36TbBSNpto+SoquLBcwISuh4K0CHmHGlXGVcjLbsDSVM88gB68muwtxnqnuEFln74QIC7uW2yzUP4F8J01ufKL8LfcfhnkIYrpzCjJqB2X7N5mxgUU6Au6cRnr77ZI8Hm+E8j5FtV62D0mrVkVQQcS+bTQkqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PIXV8P5P/1QiZkuwZN9MnY1EmqRWA9UFQJd22AqJhMw=;
 b=ryRoXbMo73D0E/Y8eLjJN1Jc7YvO2lXsjnQRaT+kXyfjWgx5hJozYVA23ujVG81C8kAxVVGayQ6h5AYdOqEbxIIPbaV/aWLVycLWGciK33F3waHMNXefY+JCRMG26yCNweuyx1HPFFuQZmoc/LDSXCzPON1ShPI7mopc5V+k4hU77xSIWOw+QjZqojdWIuk/T5DqYppURgwaxDfmt8Ji6U57Dlz6j0IELqK9QhBTrNLhnwK7ja+YH+nc6AXfuhUkDmOpbcfD5BMabBoo0aBkA98eMgeP8tt+nbN4rcQ9UWBkwq43lljVbt3Cdmv8GVn20h8PMyRe8UWNdn8y49i++Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=efficios.com; dmarc=pass action=none header.from=efficios.com;
 dkim=pass header.d=efficios.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=efficios.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PIXV8P5P/1QiZkuwZN9MnY1EmqRWA9UFQJd22AqJhMw=;
 b=jaeBqLtPAOUVdtVAB2y06y0x6nksn59QR+bH7HGGaTn8vR0z9ZAA7c7WzTf66JydduudbPVkKV8+bUZxjmd4NDBmlo1udj2ICreTtdtfbdgrrqwtgRW1a59UbqdJks0Zn1efDk/87dtJ9ByGA5dW45TLg7TZCI6M/khxcREPhEGwQ6rriM538enK3CeMPt8E/jJIuwnC108uTUplFevmMipb+cE1WS75C9PXy97rKg4Kb+mosCgFPgyuYHuDypvdhauipocFoJqzuI7xAB6Q5y9XDyUM+VBdV52CHWzTqGT4yWYIkPR3QLzn7duL1lqptdE16x0+p8uX+69zkLkadg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=efficios.com;
Received: from YT4PR01MB10709.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:104::10) by YT2PR01MB9585.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:af::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.30; Tue, 22 Jul
 2025 21:40:25 +0000
Received: from YT4PR01MB10709.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::5de4:ebdb:2bf6:ee1]) by YT4PR01MB10709.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::5de4:ebdb:2bf6:ee1%2]) with mapi id 15.20.8943.029; Tue, 22 Jul 2025
 21:40:25 +0000
Date: Tue, 22 Jul 2025 17:40:24 -0400
From: =?iso-8859-1?Q?J=E9r=E9mie?= Galarneau <jeremie.galarneau@efficios.com>
To: lttng-dev@lists.lttng.org
Cc: diamon-discuss@lists.linuxfoundation.org,
	linux-trace-users@vger.kernel.org
Subject: [RELEASE] Babeltrace 2.0.7 - Amqui
Message-ID: <aIAFSIhhfcwEXbYA@efficios.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQZPR01CA0061.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:88::22) To YT4PR01MB10709.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:104::10)
Precedence: bulk
X-Mailing-List: linux-trace-users@vger.kernel.org
List-Id: <linux-trace-users.vger.kernel.org>
List-Subscribe: <mailto:linux-trace-users+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-trace-users+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: YT4PR01MB10709:EE_|YT2PR01MB9585:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ef63c39-4d21-40d3-0b1c-08ddc9685e6c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NEd6Z3RLTEEyY1FESGpsdGxNTW0vQjBPUHBNRUVKM2ltMnFtd3BMeVFjWTR2?=
 =?utf-8?B?WDdzWjR1VjE2dzkveVN4OVdKM0JQMmgxaDI2Q3BycHUrenpCRVhQd216S1J4?=
 =?utf-8?B?T2xSSnNUMnR0WVU0VmpCdkpwR1NtbXJOZkFKWGtNa1IvYVd4MFUrVyt1R1Jh?=
 =?utf-8?B?M0JBSjlPbnVrKzZGSjBOU2NLQlhPa3owQWNOaVFCMnhKRDNGbnVEM0w1K2FD?=
 =?utf-8?B?TFJqQmI4U0xtUkc5NXBzdVM5cWJSTnR6UUhOQVFBaEt4bDFvK3kvMlRpS3Yv?=
 =?utf-8?B?S0NCRUorL202eW0vd0dLRm1MekFXYVNtZlZmSGRjWGVBOUtyWG1pZWhhYzRF?=
 =?utf-8?B?TkkvZjZaZW9NaHFycFZ1MnpkK2FzMU5hR3BWOVo0ZFFZREJMb2tCTWl2bnZE?=
 =?utf-8?B?U3pQS1JyQkpVc04rOTNZY25WMnV3bDZWc0RpSmx0SWFmVEE0bGlFb2FIN3do?=
 =?utf-8?B?Z3Q3S1ZzSHViM0tqTGtVR0N5Q1RndlJzMC9MNmg3YnQyeG5nTFFJanNWdlRK?=
 =?utf-8?B?K1NWVEx4WTRPeTZrbEJEbGtJa1hnTFNHTUtHc25tWGVEeUEvRFh4dEhWU1ZR?=
 =?utf-8?B?VkFPVU50eFFhNE1WQ3h6QlBpWm5DZExoSzNObERWRC91Q2prWVpsUnIzTTRE?=
 =?utf-8?B?SVlHSE5zQnQ3UjRjQkhreXZRM1l6bFhIaDRQNW9iMHQ4R0M3RDg5UkxXMTJo?=
 =?utf-8?B?U0lScWFxa0RrcmlncnAxYjFKUDMxWGlNeUtEcEpydHhITS9ycm03ZU56Z1VL?=
 =?utf-8?B?ZUtXQjM2NmtZR3o2QlVqaTdHV3ZaYVpMdi9BSklMbmpGUlgvVXRhV1ZhVUtR?=
 =?utf-8?B?REUrRUsrYkNWNmpZaExIOER1TmxKSFN1QitqQW1pZjRkYmYva2tVV2tFWlZj?=
 =?utf-8?B?ZGdIdnBFMVoxUjk4SHh3dnpZSHhZVTR3UHJxbUxTSnJud3J5WEszQ2pJRkJP?=
 =?utf-8?B?czd2NURWY3FCSlQrckd4UDJEM3RsODFkc2JBcG1PcVB6VFhuWHVrSHR2M2M4?=
 =?utf-8?B?ZWRLT3c4TW42aXVhSCtjNkYzS0FvbUZGVVc4dFduNHBmNHUzZTFSaTN0a2Mv?=
 =?utf-8?B?MXVtMmRtNk9odnpEWFdkaEhUaUVyRTgxZmczVDJ5d2VBMXM1cVJjTk8ySDdo?=
 =?utf-8?B?Y0Z5N25RdmVWZjVPcmF4YkpTZzM3cmZQUTZlMTZxYmpnVSttamQ0N3dCdGdI?=
 =?utf-8?B?T1pFMnE2Y0h5eW9SZUFnQ1pnYVNpWVlVbWkvSGtvWkVRQUEzT2ppM3FYUGJS?=
 =?utf-8?B?Qy9raGhtNkpZb205VkhkRUNWMnpKUHZyU29XS3ZNeVdzTkoxZ1hEbWpQaDJN?=
 =?utf-8?B?T0p1VjZic3gyVEJ3cG5kTyt0MDZWTFFnOEs2TGxPYVJNUmwyamkvOStCaU9p?=
 =?utf-8?B?Zk5lRVdGL3hvUEppeG1kRmhPc0dlZCtJbnV4aERpOGk2QlJaaFdVQWJOazJQ?=
 =?utf-8?B?ZHRXUURWZG5pUU9mbDYwVms2bUoycXBSTzA1eXlRdmdGZkMwUUllMy9BeGx4?=
 =?utf-8?B?VjZVbGpGVVNUdHFuY0l4SzRMRmdmTk02MHpYQ3dzWWZHb3ZIdlJpY1JXSGVj?=
 =?utf-8?B?R0N3bGY4bE43MTRXMXRxZytWKzN3ZzBzUkdkMDdtQzR6S0UvK0M0WWtyZ1BR?=
 =?utf-8?B?dEh5U2FQOEhNWWtzdm5LVFBuRWIyNEo5ZDRXL2k3dld5bVZVVGFSR09SU1Nw?=
 =?utf-8?B?RUFZSkczbDhRZytGc1cycUQxUUx2TlowMXB5UGFNVVdxYUk3ZXVNWHhVOVNU?=
 =?utf-8?B?QUpzS0Jic0hDNW56SGNBcmpGMXo0MzNXOGQ2QitOaVg4QWJZbjN2cVBDQXVJ?=
 =?utf-8?Q?L7SGRL8uQILxxFJM6PEdLcB/ttSZF+QEoAy18=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:YT4PR01MB10709.CANPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Nm1vT0NqQmVtbG5OZ3Z0cllVaml5UWMwVDB5K0ljMis3b01vRnE1S3NDdW5l?=
 =?utf-8?B?c0dmL0txZW91bmhrUTd0ZUdyeExQNDZzaHc1bHh6TFJPeG90SG0wRC9CQnNl?=
 =?utf-8?B?VTZZTjU1UnBSQWZOa2dRY3pzRG9zSVZxb2F5bTdzZVI5Z0toM01CQ2JEZCs4?=
 =?utf-8?B?R0lEMmlZeDRuWHBPQjlMcTAwSUxNYWg5OWFBZTFiWENxeWExQlB3dkxiOWwr?=
 =?utf-8?B?dGZwV0RoNjJJSFRqenZPWThmLzhxWTQ0RXZEdjk5VitCTUV2S3U0WjZnU1hP?=
 =?utf-8?B?N0FtczZDL2pZdkhrM2RrenFJUzRJVFBUbDFmVVUzTWRpMHZPdG45ZHJVZm4r?=
 =?utf-8?B?OC9LYjNUTXJaQ3poYnQrclZxR2UxOHJlTmtTazBwdDVoZHl4MXBxdkFCQ1hh?=
 =?utf-8?B?R25yY1NGTXdoUFhMSko2Um52N1lkNElNS0VDayszeEhiZ05BRkN5ZlBhdnVn?=
 =?utf-8?B?eUpyZHNwY1NIdzVtTjVSUUxNU0hSYncvWnlSb1lGeTlIU0FoeEM4NFNVS3ha?=
 =?utf-8?B?SmtXemE1VVN0MFhHeUhUOXBsb21xck5iMStkc2llTWZQTWNvS1A5M05ucEhV?=
 =?utf-8?B?QkwyR2oxMm4xRkRyanYyQzFwYUFkMlRoeTNIdFRBWWUrWlgrV0JjeVVMQTlp?=
 =?utf-8?B?dlFoU3VQYThEQndRb1hzQ3VNc0FsbXlsU0crQ0RmRUhpNm9DVVRjSkhpNWhM?=
 =?utf-8?B?L1ozWnRIZE1SZThwVS91SmhvTERRY1BnTURqYjVhTXQvV3k2WVFYUU9vai9M?=
 =?utf-8?B?aFhxbWVZUmszRnlmaGxtZWVDb0lKSVIyZ2xqOXhjcnV1aWlNK05lcFZYb3pU?=
 =?utf-8?B?VGk2SU10UGdoREdWYnZraW15SENpNENZWTUzM0VOQTJYejZvLzZmbDArczAz?=
 =?utf-8?B?YzhxNVdZVjFNTWJYRytBOTU5MlZnMXdCZjVCUTRYY3dHcEMxeTBmWTJJSnQw?=
 =?utf-8?B?cXI2UHZGVk5KcGF0VDhIaWcrVitRdUxMR2p5akw5RysxQjBQYzdaQ0M3UUxO?=
 =?utf-8?B?ekw4QnJhRVBoeUJkOFZtVGJSSjVxMC9WUnhIOG0vRUdEOVBhaHpPWFRDKzlp?=
 =?utf-8?B?VWxUTmQwV3plUy9UcWx1c0tqRXVBcFY0RUk5VGQ5TGl0MTVTazBiWWhYWDgx?=
 =?utf-8?B?YjAwbXo3RnMxNGpaY25UbTUvUnp4RWpjSzY3bCszdGRiUERCUlVRSmtVa2Zn?=
 =?utf-8?B?dWxDVFVaK2JzbStCNTVMMlBtZ3JXK2VLRkdHS0hMMXc2WG5WV2luS1o4dWlh?=
 =?utf-8?B?bUtySldnQXEvQkR6Vk4zVDFBNEZoWmcyM3dHNEFBaVVxRHBJQmpURkEyRmk4?=
 =?utf-8?B?WHlmSWR5U2Q2bHdnQjl0Z1F4ZVEybkVySGp2QVRtSnVOSEo2OFZrLzc0a25i?=
 =?utf-8?B?b0F1MFIrOUNWNUFLVW9KK1Mzdks1SEpaME1CNFVhdUhWV09MeEpiS3RCV0N6?=
 =?utf-8?B?c3Zqd0pxQmFLb3FtS05yYVBvS3BVZVVPbExoeDVWVjVkK1QrMlB3Uy93TGRJ?=
 =?utf-8?B?L2tuTUtHUXVGTkUxdktDQnBsVWs3QklxK29UMkQ0dUMwZkNWTlZhRnBIZWRX?=
 =?utf-8?B?OEp0dDhxNDBOYk13aVQvNENlYW9md1RXMmNWWjRLdmoyeWlqb0hNTDgyaGhn?=
 =?utf-8?B?S0tDNHYwQTVxczhUY1NCNGljSUVrdEd4VzV6M2xaY1ZoN1IrbFcxSmZSSE95?=
 =?utf-8?B?c01JUFB6ZHhJSVA4d2VmcXFZMmR4K3VaeUU1bDV1VmhiQzBLOTNZMU5CeUNj?=
 =?utf-8?B?enVRZ1pSRTl2NkhKYUFETTNibHVaUkFHMWptLzVpVlF2dTUwd1VTZnRZdXha?=
 =?utf-8?B?UXc1OFZTMW1HcEFHQjg1aUF2TGU0UFV4ZHBpK2NESjZYZnNOV2VsTm4wZVQw?=
 =?utf-8?B?V3BNY2kzZjZzU05ITnI5OVVGcmo5RGtsNWcvanFJeG9IcDB2VTNpM3h3TWtV?=
 =?utf-8?B?ODdScmw0RlFweVVSMGhNV280bUNjejEvZ0JmT0orNisxQkg1eHRjYzcweVVp?=
 =?utf-8?B?MFY0NUxsQXFUcWpIK3lRaGhjRHI0NExxRmVzQitoTHpBbWptUTJJNmxITDhI?=
 =?utf-8?B?VXB4bmtIZUxBenVXTTVRTVhYVFNOTldVMzhTNG92blNDVWR2UHV5SHdJZFNi?=
 =?utf-8?Q?NB4ILC/LWQZHkGT3SBCGEP4D0?=
X-OriginatorOrg: efficios.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ef63c39-4d21-40d3-0b1c-08ddc9685e6c
X-MS-Exchange-CrossTenant-AuthSource: YT4PR01MB10709.CANPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2025 21:40:25.5993
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4f278736-4ab6-415c-957e-1f55336bd31e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JXI9dfDfl1LEjQjOXBY2P54t2vwerM+1kgaMZ2ZJjkaVn5udagtFJf2gj8K+2exAij1OmN8LyjR1ZW8NE3kYCg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: YT2PR01MB9585

Hi everyone!

Today marks the release of Babeltrace 2.0.7, coinciding with
"National Hammock Day" – the perfect excuse to kick back and relax while
this new release builds.

What's new since Babeltrace 2.0.6?
==================================

Below is the full list of changes in this update:

2025-07-22 Babeltrace 2.0.7 (National Hammock Day)
    * Fix: set proper size when creating new strings
    * fix: tests: use a portable invocation of 'sed -i'
    * doc: fix passing non-event messages in distill examples
    * configure: use single word for PROJECT-NAME argument of DX_INIT_DOXYGEN
    * Fix: lib: pass correct argument to BT_ASSERT_PRE_PLUGIN_SET_OUT_NON_NULL
    * Fix: lib: handle BT_FUNC_STATUS_NOT_FOUND in bt_plugin_so_create_all_from_sections
    * Fix: bt_value_map_borrow_entry_value(): use `@bt_pre_is_map_val`
    * doc/api/libbabeltrace2/DoxygenLayout.xml: use `topics` tab
    * tests: factor out discarded packet regex in test_packet_seq_num
    * tests: assign to `value` property in test_assign_str/test_assign_vstr
    * Fix: bt2: "trace class" -> "trace" in error message
    * Fix: bt2: correctly handle empty result of bt_field_enumeration_unsigned_get_mapping_labels
    * lib: fix typo in error message
    * fd-cache: fix copy-pasto
    * Fix: lib: destroy streams first when destroying trace
    * doc: libbabeltrace2: field.h: fix "get" 👉 "borrow"
    * doc: libbabeltrace2: bt_graph_run_once(): add missing preconditions
    * doc: libbabeltrace2: guides.dox: mention the LLD `-z notext` option
    * doc: libbabeltrace2: Doxyfile.in: remove deprecated options
    * doc: libbabeltrace2: fix some Doxygen warnings
    * doc: libbabeltrace2: "You can only" 👉 "You may only"
    * Fix: lib: call destruction listeners before changing the object
    * Fix: bt_plugin_get_version(): set `*extra` to `NULL` when missing
    * Fix: bt2: delete some exported module names
    * Fix: ctf: handle non-map value params in queries
    * Fix: src.ctf.*: the default CTF 1.8 clock class freq. is 1,000,000,000
    * tests: update to tappy v3.1
    * .gitignore: add some missing files
    * test_output_path_ctf_non_lttng_trace: use `--tmpdir`
    * tests/bindings/python/bt2: fix issues found with Flake8 7.3.0
    * babeltrace2-source.ctf.fs(7): document the phys. trace merging strat
    * fix: python: monkey patch the proper sysconfig implementation
    * python: replace distutils with setuptools
    * python: Use standalone 'sysconfig' module
    * bt2: use SWIG_AppendOutput (fix for SWIG 4.3.0)
    * tests: return the proper TAP exit code
    * tests: test_dwarf.c: initialize `tag` variable
    * Update working version to Babeltrace v2.0.7

We've worked hard to address issues and enhance the Babeltrace project, and we
appreciate the community's feedback and contributions. As always, we look
forward to hearing about your experiences with this release and how we can
continue to improve Babeltrace!

Happy coding, and treat yourself to something pecan-related today!

Important links
===============
Babeltrace 2.0.7 tarball:
    https://www.efficios.com/files/babeltrace/babeltrace2-2.0.7.tar.bz2

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
