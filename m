Received: from YT3PR01CU008.outbound.protection.outlook.com (mail-canadacentralazon11020104.outbound.protection.outlook.com [52.101.189.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73B9748E0CD;
	Tue,  8 Sep 2026 19:50:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.189.104
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788897040; cv=fail; b=ZWj4oCFxC2dmYOmEly3PsqValKeHeBmMX9Pg1coRNrspGQqd69havX0g3WLIuAz393gvY9eDilLZzfcY4WLNLSQxNYSZgCb4HVwaGIL+PRDqPOHo7JFbC7GDyc4yk4dA1xkzCOIpOFoi6QUYFIW9lmYBuxsWmIpCISLsaofELT0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788897040; c=relaxed/simple;
	bh=iB1Kq8LREO/U2veu/CXraqbYgzOEiQtuhp3QHpnD6Rw=;
	h=Message-ID:Date:From:To:Subject:Content-Type:MIME-Version; b=QMNoMBkwwS89f0jBBHLMpCg5QsodyIPMCS4F65wiOGBdgtDuMH+pmRUKubPQWGAg9ith4hxn1JqFwW6LSFl+TzPZ5bEH1A2Ni1Ioo4Jy0satua6RkdmBdLl013WBLcSR12hGJOYBp77JPnsEQI5Vfoby55RPJlnJM9kfFmn6Omo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=efficios.com; spf=pass smtp.mailfrom=efficios.com; dkim=pass (2048-bit key) header.d=efficios.com header.i=@efficios.com header.b=JAhfBthO; arc=fail smtp.client-ip=52.101.189.104
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=efficios.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=efficios.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=efficios.com header.i=@efficios.com header.b="JAhfBthO"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hkZq3zxOVttvuJ5XzxFNrVDzMuNhQ0nntaKpBGcsQPFLDerjucZxu8T+v+G/XxVrSZEkspsDKtucAtjj03g5BLWSZ7etBtJzhK7ASgIzeVr2ufL8ArrbwxaqHKo1vqeSbmHAFcRJuvzCfm/9KrKRyG7fjh06LYsgg10Wcje4BnK2NPrf+XrGQZGFnHxMzuR3FcB+Q2oxlEYXeHgk+6Q3OOSbPa5oCf2q2LuPaULvX+DLdCmflz/HbEtpNeQss2fQ3Sc59XQWNzM+apoKMe8WAKDGqXF68C7pJJGhv2lZ8oFAV2I1563sxqE86qj28jXMfS9AEwwTkOMv1hLVqyE99g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=75OHHzLsy3Qf1LCsyF1owUOAt/hW4CHpr64kITO3fu4=;
 b=mEAFMHcpzkc3RgpxQMfwx8kCnl+jjq0Uwtppo2Ohj4WHIa+/RnMlndIB/lmdXLHsJND4M5rgcc/KhGE7PLALSMnIv7RM8WnNOab42RPYpdej2+WT0UQoQxgRFf6VPAhxSoNS2FvYQnIv7z+kmDsy9sDxE+Bwx+dfyVea4kTls4a5d8oMvbc8VfedSF/J/Jqezk1f0uC7eBJeN67d+T09Sen8pwaltEVIt3AHFEEBmEdvwQu9+9X/xJkwqMzOodARb0P9nlveDOOaPi+RoFb2tYgAdwnOUOkwkxdvs77aUtrQfDicvUNxH3uWGY52IrlBVEJD5fcvJiuST5uyt/yvHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=efficios.com; dmarc=pass action=none header.from=efficios.com;
 dkim=pass header.d=efficios.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=efficios.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=75OHHzLsy3Qf1LCsyF1owUOAt/hW4CHpr64kITO3fu4=;
 b=JAhfBthOaslJhHun7FAJKcJ6O0YC+Ym3FgDPBfZTSzm2O8wT6ymasxSgRbu1PhLtrxlgo9wNAVaJ7ko6sDOpLBLbjZ0JNfnfcHB1FmudN/+m0W5mx7F2pLudLsxWKVtGxcsyjQDpFhAX+yqYw3LwEiyx6RO+Z5Bd/pgDEMcbBCAzwcOxDy+VcW3R+JiZGOi6UdfvOoRAhreXeV9POucHm3+SwI7yjO34M1/DYM27Q7znQ/hxY0e0sltv6j9iDkdc/o4dCP5lKJL+VCmF8Up2cHg5WatT6t2ZCUg18KsHEU2uWZzSV7eo+9NCfNH0bCjEFmkfRXZiZxy/S1oUnxkiCA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=efficios.com;
Received: from YT6PR01MB491026.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:1d0::10) by YQ1PR01MB11904.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:ae::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.7; Tue, 8 Sep 2026
 19:50:34 +0000
Received: from YT6PR01MB491026.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::6b9e:a901:67c5:7ddc]) by YT6PR01MB491026.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::6b9e:a901:67c5:7ddc%6]) with mapi id 15.21.0406.005; Tue, 8 Sep 2026
 19:50:34 +0000
Message-ID: <9e5ca6e9-1b5e-40c7-b38a-1a47ac3d9198@efficios.com>
Date: Tue, 8 Sep 2026 15:50:32 -0400
User-Agent: Mozilla Thunderbird
From: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Content-Language: en-US
To: lttng-dev@lists.lttng.org, diamon-discuss@lists.linuxfoundation.org,
 linux-trace-users@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [RELEASE] LTTng-UST 2.14.3 (EOL) and 2.15.2 (Linux user-space tracer)
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBPR0101CA0090.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:4::23) To YT6PR01MB491026.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:1d0::10)
Precedence: bulk
X-Mailing-List: linux-trace-users@vger.kernel.org
List-Id: <linux-trace-users.vger.kernel.org>
List-Subscribe: <mailto:linux-trace-users+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-trace-users+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: YT6PR01MB491026:EE_|YQ1PR01MB11904:EE_
X-MS-Office365-Filtering-Correlation-Id: 50231c34-5331-45ff-ac05-08df0de2723b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|23010399003|6133799003|10067099003|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info:
	oY3bYwrUpg5OQVMNOJAuBKtV84EV8Wde4z4nzlWktWL0934pux1RF/5asFtl5kf8576LG9Q23/lwVFV7iL50cd00dUQCRaZU7H5ME+Kj8QLZc+3/HAYakQ2Kr83Cx+h01nxq7S10OmNmy0PMt4xuJCS+2yWbgfl5q+Kj8iBOhIMh+yNwGe8/5fczDb53xgOAo+V8HFBrFZuCodAQGy5xVJvcfQY7GetGVZRfAd1+BoQQiz1I0jzVEnfDGniHcqeTjqSq5BMHTzMgkDz2REtY6Ihyokgq0yQms6rG9ykhb182b6kkYqCPy3QmDtq+yLlIJ2I3udBt6DLhhjk63CfvwVsYoVzhJ1lw3QpPSartljoWgcNlZxyfzGDYMZUq9Wc5k9L7vEnx6K9AI1dMEViTXNsllWGipzvNB0/wlWm62qeoxl0ymxKiW2Mp/3MUW5hRcfsMAI5vB6vMBnl2BWCJCbHRS3sbmFy00ZgKlgcbekUAxxJy52fR4FUoXjbKLCtY54F9m6/0rwZiVh5ZvInNPU2QuO3nrdUs0Y7TcjfBBQDfxqFf9SmuLHOgLfqnkWF+jQ/i42JwVD/aSgjdLmD8gRJAjmlcdt3m5P+ERVLV1d0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:YT6PR01MB491026.CANPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(6133799003)(10067099003)(56012099006)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VVhXT3NSZUpDRHJPbTZqTFFEeTgwSE96V0Q5bktsSTBQQ01TeUw2c1JLMkdH?=
 =?utf-8?B?cDR1TTJXSzRLV1VuZm5ESk9CV1MxQUNyLzd4am5ZemFKVEYrQUhHS0F6QmhX?=
 =?utf-8?B?S3NpN0tUZFNZTFBPSzZpVFM0b0NIVUtxSXJONWhoT1Z6dGlNc2t6RllQUGJS?=
 =?utf-8?B?a21hako4d1FUWXZWK2RLZGIzWXJWc3EwVW1BQktGOUJodDVPTERRN3FlTUNo?=
 =?utf-8?B?cUpWT3lMdkthWHNWZFNZS04yZ2pwcHY1ZElaR2hZYTF1SUFVVnJpK0xXaTFV?=
 =?utf-8?B?WDQ0a09UYWdaaU5BdEdqRlZRSWlVYlAzQVhJamcrQ21BM1lmTFhKTTE4d0I1?=
 =?utf-8?B?ZWFrL0lSYlpIMTNXN0xQdzRMYkZncG5icU5QWWdyNFg5R1lkNGswMkZnc3U3?=
 =?utf-8?B?ZWowMVlZN0pYTHNwNy9lQTc2cldidDY5emRFVVVVL2hEd3FXRmlEaW9iNWZu?=
 =?utf-8?B?dHBiS012Ym5vNHZ1bTgybjRmdzQ1ZmxsZGVMcWxJc3VrZ1RGemxXVGsrcWtl?=
 =?utf-8?B?WE9yZzBoMkd1dHkrREVFdXlKSk5TNWVoSDdkcGNvdHRKTjlHcFRFekF4VDRj?=
 =?utf-8?B?Vlo2dG5CNVQ5TE1GK2FZY1UrRGFzODJGWXNERW1JYnFLeU9uSFJqMmFxMVY2?=
 =?utf-8?B?MXBld3hPOGJFUFEzNDV3QmZDK2FYMDV2bHhDd0ozU24zeEhMa3FudVFGUHM3?=
 =?utf-8?B?akhDME9qSWZVZTFOeGJRWjMwaU9ITjFvSXVObXZsS3FQdTFJM0JKVnAwL0hY?=
 =?utf-8?B?SXdnTDJMc01DTnVHRmQrT3Y2bHBxMHJtY3Y2MlNwUVM5L2djbnNvcGJsM2kr?=
 =?utf-8?B?RzFRU0V2ZVhtaE93bFVGWkFaWVRGUGRSRjMwUnh4NXhKNWVpYXd5ZVhjSDE0?=
 =?utf-8?B?Q05nbmcwRXRXZDMwWFFDN2sxYjUwTWk0VFdMNDN4RmVRWnZMdzZIay82bUYr?=
 =?utf-8?B?VE0zZlRhZVhqUEF1eXNzUWUxSzB6SEFtcEZYVWRFSlVOWk4rK2t5VzkycE5i?=
 =?utf-8?B?cytYSGN3QWtWcng3bElTTVRoWEJBME1HWjhWRG1HcVlmaEVyWnJ0bVY0dnpL?=
 =?utf-8?B?eHBvYVZTc1ZXbE5oa0tzR3RtbEdBL2JhSzIvMkxSRVQxVEpmTlMxdGk1bG5O?=
 =?utf-8?B?UVNMRUJlek42eDNyaEVrSys5SUoxN0JEZE1mU1J2RlRuU3dSQmQrNTZQRjN1?=
 =?utf-8?B?djNtc2JJa3FTSkoyNzBhVmt6MldVVEFuUXREclNIZ0VTOVhHMWd1aWEyUGZJ?=
 =?utf-8?B?OVVCRXBERGxRTjhCMm9zRHh2T0hIeDdHamFDMC96bEVhWGwwWHIvNW14SVpI?=
 =?utf-8?B?RTJQckZRVTd3UjZocUtxcXRYRXpGbnc0SHd4T1hTNndLckFXS1hYTGFXNytH?=
 =?utf-8?B?U2ZxWjJmTWVyenRGcWhsVnJUcFRxSGdrSkZzZWtLS1BXTHJaRTlVcjlMNzE0?=
 =?utf-8?B?NWhxM2ZFRXBKZnNralhlbnpxTWRRT3d0akp0Y2xmRzBFVjhya3orSjdLZlVZ?=
 =?utf-8?B?VWxlSmM5TGdsVTRDMVY4TFpGVll4SVNLZjB1amFJa21HNFQrNkg1Qm5VZ1Rt?=
 =?utf-8?B?Vy80YnM1eXBQVVdPdjBodTJmRmRDckRkTTFJY0xMT3pNakQ1clFTR1kycm84?=
 =?utf-8?B?cXV6UFJyUkpSMUF6Ulk4eGNJbHI4ZGZWaXk3M3JHM2c3aEN6dksxQXhMeVgy?=
 =?utf-8?B?TXBpWWNYWVNTNEtLdFBNaXA1UFB3cUo5K3dWQ0ppRlRWMzZnOHBlbEl5TE41?=
 =?utf-8?B?VE9FdGNoRG44ZzN0Y3Fja1E2ZnhPZ0JvKzBiNEFxd2Z6UnI5eFpZbUJ4YTJX?=
 =?utf-8?B?ZmNyRHlEYUhUd1lIa2VGbWhlK21XU0hVNkUxZDBQTDd0QTRaTm5aYlNmWGhE?=
 =?utf-8?B?azgzZGJKRVQ2QnBEUzlQT1NBZHJJNk1adzJ4cnEvbmNwYVAzS0s1ZjZNemt1?=
 =?utf-8?B?R2JYMUx3aUtwU3lNQ0dRZmNHMUpQLzlsT0trNHdrSTV5enBkMDV2YXNqajJx?=
 =?utf-8?B?OWpobVhpTXFaa1RwR0w3L2VtL000WFU0K0pxc0V2Mks2R2IrUFZ1aG42aWNv?=
 =?utf-8?B?NXlFNUFWeVM0NW0xdjR2VHpIMjhRTzYzOTZOVW1MSFE5TFVXT3J1b3U0Z3VR?=
 =?utf-8?B?S0l5S0tuZFQ3RWd6T3M0eWFBRHlFcWdpWUtHd3RwTDNHMjUya2dkdlAvRG5L?=
 =?utf-8?B?YUUzODI1SVJzdTdkQmYxRHhsa0U5K3BoSm50bi94UWt0UDYreVYwQ1R0Tlhq?=
 =?utf-8?B?UEhFdlJGdUVIOGNsY1V4cUZpTFVxZDl5bHVZTlBYdUN5QStXVkgzOHRnZ0lW?=
 =?utf-8?B?aDNEZ25qVENRUytuTEhUUlZaTkhseCtPQVQwTHRCZVRDMHEwWk1UWEcrSjFM?=
 =?utf-8?Q?owfR4vy22qUAeqIc=3D?=
X-OriginatorOrg: efficios.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 50231c34-5331-45ff-ac05-08df0de2723b
X-MS-Exchange-CrossTenant-AuthSource: YT6PR01MB491026.CANPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2026 19:50:34.1375
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4f278736-4ab6-415c-957e-1f55336bd31e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cUkhyF9mxkVMqZsN1HGM//8Xx30YMqFaE6Lgc1xsg9mCSBOaSY9MhLXTUNihVNMeojlhJ0io1t4n9lw7dYWestkAAWuz+J7jtOpqK+xRldM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: YQ1PR01MB11904

LTTng-UST, the Linux Trace Toolkit Next Generation Userspace Tracer,
is a low-overhead application tracer. The library "liblttng-ust" enables
tracing of applications and libraries.

The most relevant bug fix can be found in the 2.15.2 release. It adds
bounded retry loops for per-channel buffers, thus fixing a regression
affecting the supported event throughput. This regression was introduced
by the robust ring buffers in LTTng-UST 2.15 and affected specifically
the per-channel buffers.

Note that version 2.14.3 of LTTng-UST is the last version of that stable
branch. With this release, the 2.14 branch of LTTng-UST has now reached
its cycle "End of Life".

Please upgrade to 2.15.x or 2.16.x if you wish to benefit from new
features and future bug fixes.

* New in these releases:

2026-09-08 lttng-ust 2.15.2
         * tests: Disable coredumps for expected ABI failures
         * Fix: lttng_ust_build_bug_on undefined behavior in C++ builds
         * Fix: ringbuffer: retry on wrap-around contention for per-channel buffers
         * Fix: Introduce concurrent subbuffer-ownership retry loop
         * lttng-ust(3): document lttng_ust_field_unused()
         * lttng-ust(3): document LTTNG_UST_TRACEPOINT_MODEL_EMF_URI()

2026-09-08 lttng-ust 2.14.3
         * tests: Disable coredumps for expected ABI failures
         * Fix: lttng_ust_build_bug_on undefined behavior in C++ builds
         * lttng-ust(3): document lttng_ust_field_unused()
         * lttng-ust(3): document LTTNG_UST_TRACEPOINT_MODEL_EMF_URI()

Project website: https://lttng.org
Documentation: https://lttng.org/docs
Download link: https://lttng.org/download

Enjoy!

Mathieu

-- 
Mathieu Desnoyers
EfficiOS Inc.
https://www.efficios.com

