Received: from YQZPR01CU011.outbound.protection.outlook.com (mail-canadaeastazon11020084.outbound.protection.outlook.com [52.101.191.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FB4B2BFC60;
	Fri, 22 May 2026 19:09:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.191.84
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779476943; cv=fail; b=bzifawLRq9aIwycpVFvnqLZ/GW/Jpjv+byHkQ03lTSDA+IR8MNdstiI1QPoJuCO7I+GIbs/3dNFo5/6Xj4Zxo4tcEZ/5JVIFoPLKA1S8mdE4zEBT4M+NYXwRIOWUU6CnfF5BN9I1bS2+NB6VFiimEQrO7XMqTQsfVfHRSQMcO8c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779476943; c=relaxed/simple;
	bh=z7QAbyZmkJBPwuNszqv6AL1SVmO4fa83H6V+LpNYLAI=;
	h=Message-ID:Date:From:To:Subject:Content-Type:MIME-Version; b=NxRCp7uG9obSCF14GH8/jPtbkc5tjIMgsBUKvqeeWp3+2HrovkvdWnMytr0IkZeK/9Bcerexpar/nlg8YnKpAMlJ6p9hcsU558ar6o33Gfb2z0cQTW92tp1yRIn9W6LMy70T5uf7gTALIGbONatAyMdRCJOB8C+3rMk+v8jmkAI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=efficios.com; spf=pass smtp.mailfrom=efficios.com; dkim=pass (2048-bit key) header.d=efficios.com header.i=@efficios.com header.b=IMRlRVoE; arc=fail smtp.client-ip=52.101.191.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=efficios.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=efficios.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=efficios.com header.i=@efficios.com header.b="IMRlRVoE"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ytu38NPxYEP2GKmDiBmeVNgZDZoW38kllJi52nzM3HVje1lz+me4GXhs7kow0g2u6C/Gam+aPnAsjMYOAVlKgsPfbZJ5bTeYHyVuMTDH9uZ3EjERu2ftXbnbdahC79DTfD+CO+jOi8vWQp0Ocvwc03FF+7XZGBnL+YskeTkgbA/jeNLwPaASbQZwxQdj+7ZQLd584wY461mGkJCE7ARPVuH96XazdFAL8mV6PEG4K1TFj25cwq7s2/F6JpxpteDuuunuhSC6MIL4/7gAXD7N8zecG8BU6/o/IHyAyJc0ggmoyBRgOyv5KX815fPTiP4IZksNXwLUpe9rfMD5WrJ3qA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HR0aYUObw92zvivQtsu+RnPTLc/uKNnLxj7DAHsKYcg=;
 b=CNIaxxk8+Ea8mNt/MiPqfsIaLvxkiHoM/fk55QToBkYqnYO5GOHGJbnAsieQhoSPO2XaJTTf/i1Z174gO6uR8ZveoezB/0wzIpQXRQeGV6ImLEn2WdIQtSKYVx1L6FEnwHnAbtdsk3IccLCp97wDUWIqjPcPnvYuqdYQOIlorwsC/bnmN4Y9RFw3MhxTe6r3xj62kz33wUmLvbZF2C5iXw8awo78/w73fjVV65uOQg/A95CaPXyKaIFI7inb3OF3MAbKWzv9lMguM/dzddPp06AC57xLPfpVKasGbjNKNYsC9UNWC/x4axhOMc0Ib/BtBl7BJMqcd6f98yIw5u1Ijg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=efficios.com; dmarc=pass action=none header.from=efficios.com;
 dkim=pass header.d=efficios.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=efficios.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HR0aYUObw92zvivQtsu+RnPTLc/uKNnLxj7DAHsKYcg=;
 b=IMRlRVoEmtyTpCHClFXZuOjsNIQTU/UFF7u5J2UW2l+BrZlSCfEfpneIGU7NGdtj20LuUvAYT++dIvBLMynNddo7MkDxlMhEOxtRvB2LeNL6gkbPCw/zujfC/yj9x2hanyjEeaD8H2ay+lsmtJcvxmMD/bgabPOesbNczcF0Jw/k1XNN0eDBBih+1xDW9KKHyJj6RuodNdJZYJfMG2X54hsiYJkgZZssYpUM96CRDS9JBLWKgUUWeTKvOcgBr7EpI6ueMinh7gtMxwH5jfWUQBxorDjRLfQZ/Q7T9k7I5DARRoagUojiRdnwCy/a8gPzmEzhJA8u8ZTk2LKDKLaYTA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=efficios.com;
Received: from YT2PR01MB9175.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:be::5)
 by YT4PR01MB11898.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:16a::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.9; Fri, 22 May 2026
 19:08:57 +0000
Received: from YT2PR01MB9175.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::6004:a862:d45d:90c1]) by YT2PR01MB9175.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::6004:a862:d45d:90c1%3]) with mapi id 15.21.0071.007; Fri, 22 May 2026
 19:08:56 +0000
Message-ID: <e5fe9c15-f9b0-4d00-8fa7-3562759b4ca6@efficios.com>
Date: Fri, 22 May 2026 15:08:55 -0400
User-Agent: Mozilla Thunderbird
From: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Content-Language: en-US
To: lttng-dev <lttng-dev@lists.lttng.org>,
 Diamon discuss <diamon-discuss@lists.linuxfoundation.org>,
 linux-trace-users <linux-trace-users@vger.kernel.org>,
 linux-kernel <linux-kernel@vger.kernel.org>
Subject: [RELEASE] LTTng-UST 2.14.2 and 2.15.1 (Linux user-space tracer)
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBPR01CA0083.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:3::19) To YT2PR01MB9175.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:be::5)
Precedence: bulk
X-Mailing-List: linux-trace-users@vger.kernel.org
List-Id: <linux-trace-users.vger.kernel.org>
List-Subscribe: <mailto:linux-trace-users+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-trace-users+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: YT2PR01MB9175:EE_|YT4PR01MB11898:EE_
X-MS-Office365-Filtering-Correlation-Id: effe22b2-ec22-4ad3-de6c-08deb8359290
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|6133799003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	VpZRUhR2tkyR9I+tLMpBSB/pWqGmHHWBPZqkm1+hcz6m3U7/9IPHIEg6wzvLYA2bDOCdBeOzjOcV2FQe+o2Gcn47rGx3fa0ZOYu/cdaDu7dJ4mgbbPQrpj+8BBdQFH7e4ssmZLcqsmwVszuLADEztxe/xUVOxFySPu4ZhYCcAbfkQTnk1dZp5Gv0pEyVdkWjmAvOerxQprJ6m/4fvgjSB49M5kt7VOc8UZQF8CZAYXGrCBaR4o1wlu672wX/dxpgeR17jbe6OH8EgAScRC2lxLqshbaoBuM14Ve5Dxv7SILioCfeTkeutoDAi9cN/yrBjEC4htOeY/iELyt08xtFycvZUXG3xj70+v/54Ovy16kvjTOogkJdKnPgpZ81W1TDaHIwYAdtphmK7zxP4dSBvNhqRuKUycf8UJxYdlGTwNY2IXglu/++lJtPrwr6rcuuT7sB8GFUd4vH4IgHaPaHne63otWhnQ2+NrifOFdiZ7w0g2B12zR4itCZ/JnW4A76ONMym84NbwN2lKXzx4SBTSfDAX2CaCZjGJEyhx0/zVi4Mq8jeTkMoLWbK2CEAQM/bUTCa06T+RKclmCd7CYas4H7oPDrRpAe5pj+89YrK3xqShZJv50ICP8HTkCzKKPsdx0riWOYtIdTEKE8uTjqNA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:YT2PR01MB9175.CANPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(6133799003)(18002099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R0hHb1Fralh4a0kyR2hGNXpFbHh1bUMyRkdab2hZdVYyZ2pLNUVWQnJhRmdX?=
 =?utf-8?B?SmpadUUxQmhlYVZhNTZHclFwWVE2YXpBSkhUMHVIclUvSDdQU3hiL09jYXJ5?=
 =?utf-8?B?TUExUDdvVFdqTG5DdW10cVFha0M4RWhGRCtTbVZHQzV6aHNCNUdsckRTVkFa?=
 =?utf-8?B?M3FDdWk0L0ZJQUdGeVJIWmtLMWtNaWp3MUZXd294N0N6bkR0bkhmcjlXQmh2?=
 =?utf-8?B?YTJ0OGJPSnNHSVBIQTc1bmQ5bzY1NjRYQ2J0NUZiQTJrZE5yTFVNMkR2VUxa?=
 =?utf-8?B?VmhsUElROWp6WVJxNDU5dlY5ZVRkdUhXZUlVRWRZSVR0c0dOMXNuSllheml0?=
 =?utf-8?B?UVpUZlRYZjltckIwNkVtaGkrUUZEVWpLK1draWYrdnFkRnRKOWRkRjZIUHZV?=
 =?utf-8?B?cHJOUmx4RWc4aDg0blYvSzRiOGF0OGVqSjdCYStzYXdBUk9WWWNTSm80VXli?=
 =?utf-8?B?azBpYXhjTkxqMnBtV2plUGp6YmtuOVQ4eWJNczJ4dWFTRmhDcGJidzF3M0JP?=
 =?utf-8?B?bk5objVpWm9oU0JwMmQ5bEpWcHlCQTJ1RG04dCtTR0ZldURyWUUwaGhpU3VJ?=
 =?utf-8?B?YmNYZlN2WTB6Sy9SZ2x0c0VHdGdpMU1vb1NySkwzdFVNbUF0Tndjb2hhUllK?=
 =?utf-8?B?L2Fyd2xWQnQxdjVVK1J3M216MmdTWTJLTURsQUFHV2ljNkloaTFRM3A5cVow?=
 =?utf-8?B?Y2t0aURxQTh0eVpSaFRsWVpPaU5EeTBTd3F0Q2NiSFJDQ3MycWQ5OHVuUmVm?=
 =?utf-8?B?MVBFdDVTRmlkRVhya05jSTRvMmdZK2FCVXRKLzR3TW9kcDNpOFgwNWdER1dG?=
 =?utf-8?B?bGNGcDAvZmY0NGx3QnNWR3h5VTViSGRFVnBEZllHRjRqYUp0UXh0Y3IrR3BZ?=
 =?utf-8?B?cXF3YkxPMUk3VnI3aEN6c3ZTWHdBNEpEek9LZ2VJbmR6ejEyM0JsdjlIbUJ5?=
 =?utf-8?B?bHoyV1lFdDdjaGcvMTNhbndPMWtXUDVhWXNBdFRkUUVqUGJqcUpjZjlSWktJ?=
 =?utf-8?B?WnpBRUxKL01IOTNCSXBBZEhGZ1VmTW1iaHMveWN1OWhaZEF1dHNWU3I5UU1p?=
 =?utf-8?B?R1JNeCthTzlhcnBOZWpYY3lQQ1RMNWxNbmFudTJ6YVRINENnSlZvRW4wZGtB?=
 =?utf-8?B?Uk9taTg1MHlYZDNyWklTQ0NYYk1USzEzNFltQ3QrbUd6Y3Z5d2h6UkZNSUh5?=
 =?utf-8?B?SVErMkppQmFBeUVyVlhkUjRZTHNTbnVtZGZZckJtejkxbmd6YlhLOTh0bWRz?=
 =?utf-8?B?dFZkMm9kaXRBTGlEcTd3cThqU0tuODlhU3B4K3hJUWJ0UFJrY2YwVTdiMWc3?=
 =?utf-8?B?UkVkOGRYdlBadEkyRFl6VDVMUnBEelkvMFFmSzk4VkgvMVhjQkl4SjdwSEFj?=
 =?utf-8?B?dWhxT0ZYNU1yaEhJY2pDVjBubnJJdzF5L3g5K2JUUGdFbHB1WmZibG9ZeUMw?=
 =?utf-8?B?ZjdQbTNCZU1UNHNxR3pSbitrN2hsSEg4Y2ZUd2tJbi9UMzJ0ZURZamIzcjhr?=
 =?utf-8?B?SHRHdURhQ1pVdmEybTVoVnkzNjlGbnpUbi9HVllLNGRBOWp5ZFArTDdhTmFD?=
 =?utf-8?B?QVYwbWc0eEVRZC90QUVCRnJ4T0FScWFleUhDYWs1bU94c1lJMjFwVkVEQ3Rr?=
 =?utf-8?B?OVhrTytwenBoVnNyVjVqMXpZWU1Ub0NKS2ZiQmZHU0FSN0NTZ0lhNUErcDZ4?=
 =?utf-8?B?YWNTOUZvV1F4MkNDbEhkM0NUSEVLbnlPdnpYTnEwN0tPTE5obFJTMWliRjBG?=
 =?utf-8?B?SThNM21xbmVWRVRRWWQzK2xwc3JwcHM0Rm4rWDlaQ0Q2VWtobmtkSzVUR2Ra?=
 =?utf-8?B?QkRDT2hZSXU0eEM3NG01cEkxbkhPczFVVDFLRzZFdkZFOEowODBuRVN1ci9O?=
 =?utf-8?B?Rys1RjVJck0rUUhsR0c2MTZZMmUzamViZVZTU0RmZVJsTFEyRHJOYjFHbTRL?=
 =?utf-8?B?eWVUL0hDYUpJZTIwbTc4MllPcXg0YVlydU1LeEM4QnRZc21CSTcyNGxUT0JO?=
 =?utf-8?B?elR0c2JJYzh6WnE3ZFJwTzMwajdRSk54ZW1ZbnNoNmQvT0djMVlkYWtIVFph?=
 =?utf-8?B?UXk1Z2pJc0pYbm4yUk5NTnRMRkZ1cGZpTFJVVG5PcmZDNHQzekNiOStWSHpV?=
 =?utf-8?B?aDZHZUlKUWZzc2JxOTcwd1pmL2xTcmgrZldFQ2ltcGk2NzdvSzFxYXlJZFFq?=
 =?utf-8?B?RlI2QnJkblJrajFpbHdieEowVEltRGluTmNyaFJ2Q1Nldkt0Mk1wSXBmM2VF?=
 =?utf-8?B?WW9tQmpkajJ4N20xbmhVZFVyUmE4YmFkcXNNM3JINm9DNThaVzlSejc2SWNi?=
 =?utf-8?B?Y0d3RUsrYlFuaThYdko1bHpMVGxWYnFSZHgrL0t0NmxEK3lSbkRVK0F5azdv?=
 =?utf-8?Q?eF4GDjTZhN2bCAUg=3D?=
X-OriginatorOrg: efficios.com
X-MS-Exchange-CrossTenant-Network-Message-Id: effe22b2-ec22-4ad3-de6c-08deb8359290
X-MS-Exchange-CrossTenant-AuthSource: YT2PR01MB9175.CANPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2026 19:08:56.6965
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4f278736-4ab6-415c-957e-1f55336bd31e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KBeLE5aZTtj28Y4eV6uY+8RINMMjjSFbwLfKm3gF6mM0YVurlnjML0fmf+77ZPDXbK+bQYI2xP+sGauetsmDEjU7Ivr4D/pBmPPR6RSF/hg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: YT4PR01MB11898

Hi,

This is a stable release announcement for the LTTng-UST tracer.

LTTng-UST, the Linux Trace Toolkit Next Generation Userspace Tracer,
is a low-overhead application tracer. The library "liblttng-ust" enables
tracing of applications and libraries.

Those releases contain a few bug fixes, the most important being a fix for
missing "per-channel" buffers field header initialization, causing per-channel
traces to be sometimes only partially readable.

* Detailed change logs:

2026-05-22 lttng-ust 2.15.1
         * fix: return negative error code on incorrect message size
         * fix: check shmp() return value before dereference
         * frontend: Change likely to unlikely
         * fix: use decrementing counter in zero_file to avoid underflow warning
         * fix: initialize LTTNG_UST_LFILE struct in ust_safe_vsnprintf
         * fix: initialize sigevent struct before timer_create
         * fix: close_range inefficiency with hash table fd-tracker
         * fix: excessive memory usage of fd-tracker
         * fix: check for NULL before dereference in ustctl
         * Fix: stream instance id mismatch for populated packets in per-channel ringbuffers
         * doc/examples: add upper bound to minimal CMake version
         * fix: warning with gcc 15 attribute nonstring

2026-05-22 lttng-ust 2.14.2
         * Fix: stream instance id mismatch for populated packets in per-channel ringbuffers
         * fix: check shmp() return value before dereference
         * fix: return negative error code on incorrect message size
         * fix: use decrementing counter in zero_file to avoid underflow warning
         * fix: initialize LTTNG_UST_LFILE struct in ust_safe_vsnprintf
         * fix: initialize sigevent struct before timer_create
         * fix: close_range inefficiency with hash table fd-tracker
         * fix: excessive memory usage of fd-tracker
         * doc/examples: add upper bound to minimal CMake version
         * fix: warning with gcc 15 attribute nonstring

Project website: https://lttng.org
Documentation: https://lttng.org/docs
Download link: https://lttng.org/download

Enjoy!

Mathieu

-- 
Mathieu Desnoyers
EfficiOS Inc.
https://www.efficios.com

