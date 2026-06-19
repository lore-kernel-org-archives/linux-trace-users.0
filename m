Received: from YQZPR01CU011.outbound.protection.outlook.com (mail-canadaeastazon11020087.outbound.protection.outlook.com [52.101.191.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2C9D18A6CF;
	Fri, 19 Jun 2026 18:56:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.191.87
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781895386; cv=fail; b=Np8wpXy/ERHAvUmE1W8Z24zRp004nafKASfOty3aXbtPr/CXYcPeMrkMTSmaY75wiPOec+ziLxK6Y1VN4cD67TP6J0i5vt/XXtpKgJTFW2v1JdilgEwyUO2P2iEO+wd9SxsRJqkugaGJ0oFY32a3fJygYvfywzQwuRAWsLGCzuQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781895386; c=relaxed/simple;
	bh=DpyWtfl/HU69cBExkYIVvo4i/7c4J75Y0Gz3ws/SBTU=;
	h=Message-ID:Date:From:To:Subject:Content-Type:MIME-Version; b=mxsWp5wEGuSdv/urh1COa0uHZPz86dIqA62e8p5NBlc6iWhEO6tOK4J8PhIGYGxN+6LnxtTDtZwj4cS9pxPUBz2HlbvyUfwn8fIQEoTUUDzNYnmo8rQmChanHi/+xAexNLZjczSsz8eD9k0Cd9xkeJcIw52ot4gE1qERAWGZ2Ks=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=efficios.com; spf=pass smtp.mailfrom=efficios.com; dkim=pass (2048-bit key) header.d=efficios.com header.i=@efficios.com header.b=U88lSFtO; arc=fail smtp.client-ip=52.101.191.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=efficios.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=efficios.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=efficios.com header.i=@efficios.com header.b="U88lSFtO"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LExKh3zOgtAZxP61QgfnrpPW6snT6H4g/aSJ9CQRDSlbEqfn5aeeF9MD+dIWdRzPJLCl4i+oLQotsPLrN0IDJ8Z8nY7i1nrNBlpbm7xoPXdYVewD37R6qiH8XeffacnRgGk5Hz+7td7QPqzXCUE46nC2NEGxQXg1GenP7XV4debmR02utzuHqtGWzy7bDOuBG22MMd0xa6I0jD7z0j4YTqu7+7FDS7GgfWHxQ5l0VUE0kgY4jhtx53fma7p4elbaI+/Kb9byGd9IzN4FvpsHcZhH8kwQgO0mQTm7oRgGOvCUAF2phsPAYBVxg/AV/5gWUHkNZYd00pYp0D3+N8qdlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nYLYZvUXL3i8ms6X9cjfWZ730kZvHkYWyCykT51L2nc=;
 b=lw/8Q7rIIyRrjMJXoDhU6F1I/WUIhcPR3IE9kaMNfUPB6+rNxPlucN8w3jKx4MOwLZxm57dqzNkuqHWfdYHn4jchbiJMrY/MNR5bvvkrvelCUbPAaCbARL+xMu9PQymTJHsEy+n29t0yBFPysIj/eP1veGMCf0iHjseVk+zO2bX59sgEh++4fNcrcrclRbadzxfgvlR9XaecPREk8Gn0efq6kB02PkbdWPllAUHRbmYZxDGDz4b87Uv6wtRDnyMzDSQZHDzZPBfOfwwjViXZv37V5pp6vLfVlTxtvXSBB5CxUkF6roDQuLzbHURX0p86ZWdLlz1Gu0v1fzEeHIpm2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=efficios.com; dmarc=pass action=none header.from=efficios.com;
 dkim=pass header.d=efficios.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=efficios.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nYLYZvUXL3i8ms6X9cjfWZ730kZvHkYWyCykT51L2nc=;
 b=U88lSFtONrSMS4YzCQdGOgMbaOHjZOg/mGXHwocftnmyl3BH97fPJM1A+nx5Sgar0AuMxwe0FxhuHGxnNsnRKR1u66zd6QwbvJainH8dzJbvCIV9DtqYXzJ2IFT0b25NMqFmWRskAcddPrPBeByBG1Z8iba6ZZqq229PZehiclTdnge+nSUuYd7ZhfBFFK7Qs4x+ON2CTlA2IdPV2/XRypM+3gIc0IRckxm3fI42ZQEc+V9vZxo9jPnExG8GK46RR0BUF24DVavHG97qOULpFQTJsSoETp0NCpALM3svNzTHIcErezilQ+m2Vf2kJZZ8eHiFWg6iTWS9Desc5uDIMw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=efficios.com;
Received: from YT2PR01MB9175.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:be::5)
 by YT3PR01MB10651.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:95::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.7; Fri, 19 Jun
 2026 18:56:18 +0000
Received: from YT2PR01MB9175.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::6004:a862:d45d:90c1]) by YT2PR01MB9175.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::6004:a862:d45d:90c1%3]) with mapi id 15.21.0159.007; Fri, 19 Jun 2026
 18:56:18 +0000
Message-ID: <394956c8-9e78-456b-845d-54a3219214d4@efficios.com>
Date: Fri, 19 Jun 2026 14:56:17 -0400
User-Agent: Mozilla Thunderbird
From: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Content-Language: en-US
To: lttng-dev@lists.lttng.org, diamon-discuss@lists.linuxfoundation.org,
 linux-trace-users@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [RELEASE] LTTng-modules 2.14.6 and 2.15.2 (Linux kernel tracer)
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT4PR01CA0134.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:d5::15) To YT2PR01MB9175.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:be::5)
Precedence: bulk
X-Mailing-List: linux-trace-users@vger.kernel.org
List-Id: <linux-trace-users.vger.kernel.org>
List-Subscribe: <mailto:linux-trace-users+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-trace-users+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: YT2PR01MB9175:EE_|YT3PR01MB10651:EE_
X-MS-Office365-Filtering-Correlation-Id: 2667494a-1989-4f1e-0584-08dece3471f7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|23010399003|366016|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	0CHYHUHaNapb+tJS6hAQF1Mi9EkWr+S0UUcA0u8rinyE3QUlDkLkmberQna6Yi0Vn68JDGsRgoEkKFdBGCS6bLdGnn9mipGM7gqf7f+ayiaHnAkZKqMXaatgYrfWAtsb3ZvjiEQdRQw3F7GNwx+HEmzlcvCsP0yQG5Gh2oAva4GfoRVIpHvextA5Hxn3KP+WcVOciDOUIutzusAV1YLeYo7mMzmthzx10YeuAdaw5jk2zmnwBWqa7DX76O5pEst/B/dkqpusVltYGALOOaNgE5gqyGfWYyMxgGLAnvN/HEOHbNe/HdP2rH/WGpGA7xDVXp/A8+MAisS49B3DfksuayagC59dahHl3nKXj3edAcG+0yqMyt3hHaoNBwjc6pWE0hJkbcM+yEozc4Pw0waTLq+VjPzz7bQ3I6mDBxoUqrAGlaMh7gcexz+RR/9ADrNiylg+9GEX+kIZAFDEl15+qtPt5sv0TWstAhv26liDR3ngPEDbgkugH4otfduh6oOBKEyI7nRi/YM+h8iZhKz1Hs5rk5zbW9nuQz5y2ViGZymkxav6xbM1xH2lj7YpmVKUIRf1C3PZcoSKnFzl+IesXSO0FtWFV+6T5rNUKoaRhsM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:YT2PR01MB9175.CANPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(18002099003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?azBVYXpBZVF1TGtsYUg3OE9SUG5UcSt6bnZ0cWlpUkxENUk1cHY5R3JiOXFG?=
 =?utf-8?B?cmpLMjVpR09yRHluY2NJdWx4WWlrRC9PUUk1RnBMazBKL2VZa1JqckgvWUpP?=
 =?utf-8?B?ZGxqcmljWlV6S3MybHpWdVBaczIxRElGUlI2aUtvanVLb0hJaTd2K1ArK0pR?=
 =?utf-8?B?NmgreTdkajRocFlTaWlRNENJK2g2ZkU3WHlUaEZHZ1J6eDIvNVhRdlNMZ0JT?=
 =?utf-8?B?WlFkSXVYTUxaQ1R1eTBMMGFjZTdXQnNkNi8ybkpwMXNLZ0NxV1RsRlhlOHN4?=
 =?utf-8?B?cWN6bmNtNGVJNVVDd2M3bTZGZ1JKblVkT29vRkRtaC9IQmNaMnUrUFo1aFhJ?=
 =?utf-8?B?ZGJWMnBzaTBwZXIvd2VMR3NlOUNhMTZlZGk5eVF2UkVGZFZoTWRpNlE3NjJJ?=
 =?utf-8?B?aHBBL0VFZzhOUkpCS2tCSWlRcitNbmFtendud0cvcjJTTjgwUkgyOVFpR0xC?=
 =?utf-8?B?OGM4U1BxQms2U2dFL000bkh0QzE4OHBGeVhnOUdHeTgrMXVGVWZCYWZhK2Jj?=
 =?utf-8?B?bnFLR1I2R09aTEhiRlh0bUVDT3QrWkxIRHBTVXF1Rk5mZFBYeUJXWnhtWklO?=
 =?utf-8?B?eDVVMWt1T2E1RnNkUFRyV2RqSnk4a3VjMUo5NE5VVFhIV3kxcmtQVUJSNmNo?=
 =?utf-8?B?elhFbVpWQmNJQjgrbTJra1ByQnRUcjlLZHZsRHh3a0Z4RGd1bDRoSGR6cTdp?=
 =?utf-8?B?Q25JQXgySHRRZHFJSFhBd05qOEFqeTkvMTU3M2VzMmNrelpvUy9iR0JUUHZN?=
 =?utf-8?B?dkViU2s2TlZZYlkyVUJEVER5YzJlY2FVeVpRZG1MekluNmptcURaa3ZWa2hF?=
 =?utf-8?B?VFhqQ1UxUFpkSUFWalYzZ09oU1d1OTROZXJibTkrWGhwbzlBSVhQVGkybzEy?=
 =?utf-8?B?aTZWZkpDQW5MVHVmOTNNcFI1K3Q2V2RvdllPM0NoK29pQ1ZDYVA0eFpuSkcx?=
 =?utf-8?B?OFMvQWdwQXZBZXplZzBueTJtMmtJLzBTMDlZNXRlWWhzUGtnWHZ1T2dza1lz?=
 =?utf-8?B?OUVrRUpNSE9LckQ3S0s1VmVmWjlHOHFXRlJsSmdwWmxGdHNhODYrcFJQYlI5?=
 =?utf-8?B?WDVSSTB3dW9FaGJmWUZGZnJ3ajlQZmpLMmNlakJrZWRHeklLUHFHbit1Rjhi?=
 =?utf-8?B?eEhub3lYRGFlWEhhV1QvR2U1OG9DNGVMem4zakVWSlFCWEh1d2wwQ3QyRlJw?=
 =?utf-8?B?cTZ0aTZBVkt5Y2ZKajFLME5XMi85bEhWOWk5S0hPeTN5eUhNRVBVWGxodHRu?=
 =?utf-8?B?SzNXMkc4Zi9DNFlqR0NKLzcrcjBtci82c2xnRXZxMEEzN1piYk1iTHR5dTJC?=
 =?utf-8?B?RVBWWFNYZDNBbkp2U2JjS3pvbSs5M2U2ZWgwUFd2a2paMVFBck5ocGtVb3JS?=
 =?utf-8?B?VUY5ZVczVE1oTlNYS0dJR0hZaGdmRUN4Znd0TUdNa0M5U291azNURHp2ZFgy?=
 =?utf-8?B?MzJiMUN3SGpjKzlmelYralJ0ZHVkR0FYRmZpSDdlbTgySTNrZjV5elgvNGgx?=
 =?utf-8?B?elR2eWtGa2ZUaUhweFhYazFuODBUUWpHekpsNDhzekpxazJOTWc5VVI0L2do?=
 =?utf-8?B?MXE0dVpDck9YdnZINlNJYzBRbEVCc1IrUEZzYW95bStOOW9TSEFCN2dRbEts?=
 =?utf-8?B?VlVzS3lYVE5FRm13Mnh6UWtnZmoxT25wZUFXdTFCY1grTGJqSFk5a2svTTZ0?=
 =?utf-8?B?WDA1cVEzSW9lK2lyS3NKZUFJZTlpbnVmQ2ZjSEtIRTVMbDUzbUxpYUtiR0xr?=
 =?utf-8?B?ejBUUUxCblluaUVHbDlUd0RTNzh5eWN4MGI2d1RSS2pGT2xTWmhOL0ZQRXBN?=
 =?utf-8?B?M3NSM29Dd0NsZGtpaFFocGZYZHFMbWQ5dVJRcTlZbysyNTVJVStSNlUwMnhp?=
 =?utf-8?B?cldYTUNobS83TXh2aGQvdUNIVFYrL2RKK2pQOGZ0cDREQnMvZEdzazE1L1hJ?=
 =?utf-8?B?Z1NzdTFIcEtiSU9Fem95bCsvbjJuUm55NHZyMW95UzdhZy9JcVp0WElxczlK?=
 =?utf-8?B?TTBtU0lmQm01OXNESWl0MXRCTnkwTGR5SFN3TVRFYWtQZU5hR1hwblN0VXVB?=
 =?utf-8?B?VVRWQXhISURyOWFwSnd3c0pmWVZHTnpLaUtITnZjREtMTzdSWit6N3NMbGcy?=
 =?utf-8?B?K0E1ZEowK2F1UGRoczI3czRWWWgwM2doakQ3N2ZKeERoYU5lTDRwUVdGaGpR?=
 =?utf-8?B?cnkrS0dlSWk2WkU4SXJEdFVFT1dNS2p1RnJJaE14eVoyTlp4aSszRW9kTDFy?=
 =?utf-8?B?UjB6anM1T0JGUUlFcU5nNzVIYWFzZzBMWU1aeDZpM3RNaDFrUGpNRHNCMnVB?=
 =?utf-8?B?dTZPUEtMaktlK0F0Rmo3Y21TeUUyZktBUU5hMG9Rb1BGRnNtcE1sVVRQcXZs?=
 =?utf-8?Q?j7ImZHqtEgfmcp70=3D?=
X-OriginatorOrg: efficios.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2667494a-1989-4f1e-0584-08dece3471f7
X-MS-Exchange-CrossTenant-AuthSource: YT2PR01MB9175.CANPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2026 18:56:18.1651
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4f278736-4ab6-415c-957e-1f55336bd31e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qTf4tmywG5YiKvC3kUcxOj9Mm6+9Wiv1022qUkRf71ED/jwEFtNwUE1fXgrPqeYHVF4ReigyM+GI3YazKtBfL1kqgCMyJvEpiRCbgZbFdzI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: YT3PR01MB10651

This is a stable release announcement for the LTTng kernel tracer,
an out-of-tree kernel tracer for the Linux kernel.

The LTTng project provides low-overhead, correlated userspace and
kernel tracing on Linux. Its use of the Common Trace Format and a
flexible control interface allows it to fulfill various workloads.

The most relevant changes in these releases introduce support for version
7.1 of the Linux kernel.

* New in these releases:

2026-06-19 LTTng modules 2.15.2
         * fix: leaked file and fd on channel create error
         * fix: backport: hrtimer: Reduce trace noise in hrtimer_start() (v6.1.175)
         * fix: ext4: widen trace event i_ino fields to u64 (v7.1)
         * fix: ext4: delete some unused tracepoint definitions (v5.13)
         * fix: ext4: enhance tracepoints during the folios writeback (v6.17)
         * fix: btrfs: tracepoints, use correct type for inode number (v4.18)
         * fix: vfs: widen trace event i_ino fields to u64 (v7.1)
         * fix: treewide: change inode->i_ino from unsigned long to u64 (v7.1)
         * fix: mm/vmscan: Convert pageout() to take a folio (v5.18)
         * fix: mm: vmscan: add cgroup IDs to vmscan tracepoints (v7.1)
         * fix: hrtimer: Drop unnecessary pointer indirection in hrtimer_expire_entry event (v7.1)
         * fix: hrtimer: Reduce trace noise in hrtimer_start() (v7.1)

2026-06-19 LTTng modules 2.14.6
         * fix: leaked file and fd on channel create error
         * fix: backport: hrtimer: Reduce trace noise in hrtimer_start() (v6.1.175)
         * fix: ext4: widen trace event i_ino fields to u64 (v7.1)
         * fix: ext4: delete some unused tracepoint definitions (v5.13)
         * fix: ext4: enhance tracepoints during the folios writeback (v6.17)
         * fix: btrfs: tracepoints, use correct type for inode number (v4.18)
         * fix: vfs: widen trace event i_ino fields to u64 (v7.1)
         * fix: treewide: change inode->i_ino from unsigned long to u64 (v7.1)
         * fix: mm/vmscan: Convert pageout() to take a folio (v5.18)
         * fix: mm: vmscan: add cgroup IDs to vmscan tracepoints (v7.1)
         * fix: hrtimer: Drop unnecessary pointer indirection in hrtimer_expire_entry event (v7.1)
         * fix: hrtimer: Reduce trace noise in hrtimer_start() (v7.1)

Project website: https://lttng.org
Documentation: https://lttng.org/docs
Download link: https://lttng.org/download

Enjoy!

Mathieu

-- 
Mathieu Desnoyers
EfficiOS Inc.
https://www.efficios.com

