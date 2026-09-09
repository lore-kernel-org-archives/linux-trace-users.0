Received: from YT6PR01CU002.outbound.protection.outlook.com (mail-canadacentralazon11022142.outbound.protection.outlook.com [40.107.193.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F2C15616A5
	for <linux-trace-users@vger.kernel.org>; Wed,  9 Sep 2026 13:29:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.193.142
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788960601; cv=fail; b=tExQXuGeQvv0MOxndeNrNyZlhSlfDAx0jVu/zIoB1wueUbbYucuCS5kfSIqZDPcl37Ewxr2zfZfivXbXrW+HhcqdOgvmQeM7PhPOfy+CYWcfSJFro5XLifuMKqILCXQUOfByiWFgZB1cdI2DT8e0qnhg9BOcnil8xDvVzXBUp3A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788960601; c=relaxed/simple;
	bh=aoXvxKb6t9sVGqNa95gPSy8A/64lkSl/1//f5dx4IrQ=;
	h=Message-ID:Date:To:Cc:From:Subject:Content-Type:MIME-Version; b=SNTuuqdNp7oBSzjI8hd74milSHaX6l59BupaUGbzn0Cwybs7GFc4DA91bOtFlHB5po9X3kOdHiMD11e0affuV+dGr/VrFp71uvmKGUFm+MXgr3idKHKo/nVsqhp1IoNFZX/9+bPcfUo8RL2ePdK0ICGiLz7ujPPqcCnyPnq8PQ8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=efficios.com; spf=pass smtp.mailfrom=efficios.com; dkim=pass (2048-bit key) header.d=efficios.com header.i=@efficios.com header.b=HlYXtisS; arc=fail smtp.client-ip=40.107.193.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=efficios.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=efficios.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=efficios.com header.i=@efficios.com header.b="HlYXtisS"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sGPxMFm6uMdqlbWd4ySRvxj9y6NQU7r4cQBdPYpC5sDvt3tQc801qPie3xOAn1Y2PBmiZQqe1xA2YhHsN7c39T0qMqgau1gCYN9uyK+7M8NQ6osK8zIVjFwXXTg2HkVWYtVVgMTOYUWBGKI+V9y/KILvyg5b5H1SbWddM6GQ2M2ebHIx2RmyZgAu6mL0KhGcN+7PE/uI0mfP9kR4S/y+qMfHRMtw/Ij2I3yd8KVX2T2Gb/iJMZAnMbhqRcQ2u6BfeI2Di5ZfuqiLQ3eRxwx06IxvypKaM8+LcXmjcaVLxa6YqAB5Pgrue2Ngzdp5g2+2KOs2/zMmUW4ehukPh0ahnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t9mQ9zPjj7Ee1hj5e+L85RBvKQ20D52uxh7UlhUIXX0=;
 b=ngYxglNjnnEXMAH36lQuIh6y2JG87ptlLHm1csbc/0UjVZNMMeCEJ9J9p+I5uYD/VaPPMItODuOeYEtV70241Z/OHYhX+6pvVZS804jsLX0ZdqP5GM6FUwPd2d/RFH8U9ob3k80tJlcImBjRexRXxnzaSg6NY8QhcfwroNTB79BM8kdtyMgjmWJ22dV0DQs7nefJmETm9hLQv0KkJucV0lfnQtjvQTZF61NP2zli0Jz2EitHOtaadsUSZoHIMSAYFUdvVkJNxLq/6dVAa9ROH+JHcQtNE6ipFuR3hs9aTnf/fZhdtqqZg4jBw37C7RY67aWYH/aLoUs7zlSl3XRQOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=efficios.com; dmarc=pass action=none header.from=efficios.com;
 dkim=pass header.d=efficios.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=efficios.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t9mQ9zPjj7Ee1hj5e+L85RBvKQ20D52uxh7UlhUIXX0=;
 b=HlYXtisSfidWJ1/McU0tHSC4N60POxPZM+XDfAA7lDNbsjAqKBSRpZHIIrBrj+ZDZg0vPIWfz6pMCITB8gcPMnS6zVb7uIQJZuuMpBjPWBKRnGL/S1w1tusSU+AsEilszNgJZLPZSdrnslVxDzjoj8T3Q74hibymGIXeRfOBE7WMf0l1Gklgc5z8c86OFhafyD6Hco2BrUzK23TOmPgq9gXhvhLUXixiuBBaGBJ+qenqOwI2CHW9SAFV+aXCSRk+9vEEbngYzWRpeZbR20Q+JbgssfpjNYmnGz6Pw2qmWyTk/cUy/C+DsIcmB1ksdrOBxLT08Ljxd+leiND7I3mwEQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=efficios.com;
Received: from YQXPR01MB2357.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:c00:42::24)
 by YT2PR01MB8454.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:b5::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.8; Wed, 9 Sep 2026
 13:29:31 +0000
Received: from YQXPR01MB2357.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::4c7b:7dec:7e59:918e]) by YQXPR01MB2357.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::4c7b:7dec:7e59:918e%5]) with mapi id 15.21.0406.007; Wed, 9 Sep 2026
 13:29:30 +0000
Message-ID: <ecb20671-5c82-4d00-a6d5-45c8badce8a8@efficios.com>
Date: Wed, 9 Sep 2026 09:29:29 -0400
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "lttng-dev@lists.lttng.org" <lttng-dev@lists.lttng.org>
Cc: linux-trace-users@vger.kernel.org,
 diamon-discuss@lists.linuxfoundation.org
From: Kienan Stewart <kstewart@efficios.com>
Subject: =?UTF-8?B?W1JFTEVBU0VdIExUVG5nLXRvb2xzIDIuMTUuMiAtIFDDqWNow6kgTW9y?=
 =?UTF-8?Q?tel?=
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT1PR01CA0105.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2c::14) To YQXPR01MB2357.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c00:42::24)
Precedence: bulk
X-Mailing-List: linux-trace-users@vger.kernel.org
List-Id: <linux-trace-users.vger.kernel.org>
List-Subscribe: <mailto:linux-trace-users+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-trace-users+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: YQXPR01MB2357:EE_|YT2PR01MB8454:EE_
X-MS-Office365-Filtering-Correlation-Id: a9fdcb2f-f9d3-43a8-7cd0-08df0e7660f5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|376014|1800799024|6133799003|10067099003|56012099006|3023799007|18002099003;
X-Microsoft-Antispam-Message-Info:
	hPp9U13ntDrY2Um9zhUh2c3rRHVDspr+xN1rFwTj8/mivlynCXAvGAIaEA+5UjlKiVJ3ne1ITnnivO1Y7vE+9O4O5ZN1b+/ouiQa1mcJSqZvEv45/Y4xr65SZ7lXLvOm2l1Wmhfsmu8Ll7j5NLggoDgoIW9Q8sFhTorG3HznBIAIg9IQDb0UfOvvYJ8Y/zT9lCl3elGy7j2qKw84qYRgocrd0SeIP0WWuV6jaF/xpdc4tfihcbqOkULcwExZLcbaMhLj2yjCKiAqZ2DH24rENzYtbjFGFA4MidBGu1QmxQmmNuaUXACP7gDAuQjr0M/vThqljLYjwdn/3MzjBlV7wojEWNSskwxBRf4Iaj6lLYc4UbdtNBxVEYbv+Fl/nnh+95HbRHWS2rRu44KI9IjheKy16hVmzzrplP42qQX3w58uirSBBjodqfUUx8ru29v4XUWwGEcq6V3RRjDGN02BMGkhCaf13mIVlyvF+ptoWqhRc95w66inoL0AQwqWPAkTUNXIJYqIR7igzysNN2m9uhHpAdAiVcFiHQDoGXlGxKrU7ny/fk1F4W3AszB7E6ZdLrMm/zSPZS8ZsvDRKNJdW+5+hmucTHAFSyNntkFNLBY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:YQXPR01MB2357.CANPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(6133799003)(10067099003)(56012099006)(3023799007)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YzNuakVCa2hrT09Ca3FhNU45TnNoakhwZkJ5bVpmbjlwTE9aK3lPTVVwbmpm?=
 =?utf-8?B?Yzc1ZTd2NHUrQVM1Z3VqRTl5NjJDMFdjYnUzeUsyQTNTU3ZhUDhMZUFtd1Fo?=
 =?utf-8?B?c3BwUUl5d0w5TkpFVmhNL2VLVFkvZ0N2aVNDSDVnTlJWVUFKOHZIQ0o1d3BG?=
 =?utf-8?B?WXIweWhOOGRJY3dwZHBUeDlqSmQrOEpUeVVZZzJJR1NEVjRmYU1rL0tDQWFO?=
 =?utf-8?B?UEJlak95RmtlTVpkVHhKRk9PVkl0SzBLejVsYVJGS0lveDFmU09jM0NOdlhI?=
 =?utf-8?B?OGQ5bGpUR0QvR0IyZUcrb21SRDhSa1BQaFpoQVJFSCs3Q2g3WURVamprTzNq?=
 =?utf-8?B?U29jaEJTWDN6c1pYOFQ1cjd3WWhCRzN1aUg5bVNLUW9nanZiV3VobFJNcldK?=
 =?utf-8?B?KzhiUUd2RXNLMjN3bjJGSUZMSDJBT2lLNVBSWUtOcUlSRkNTSWhuQi9IaWEw?=
 =?utf-8?B?bWVZRHRYeUxmdGtQa3VGQU9QRDdGYzFsdURabmRKTy82RnZNZTVSQURYWDBD?=
 =?utf-8?B?WlZFdUFVdVgvc2dCMzJPZThFM2ZJK2Y2ajE0YlJxbTFNOGtXQzh6bms5RFlW?=
 =?utf-8?B?QkpyNHd0cDFFWTdSMFpjU01wSXhRcmJMUCtvTXhRQmZzVVhWOFgrYjh6NDBO?=
 =?utf-8?B?d20vQ2djN2VVTGxxRlE5Y2FVUlR2aGdUNU9JM3kvbG8xUTlMM2pFNzVmVXR1?=
 =?utf-8?B?YU44TkFDRm5WcitWUWNyWWgvNzQ3dERJL2RNZVBWUXhpRE1UZGRkZkFyMG04?=
 =?utf-8?B?SGhDV1c5aERrMUVoN2R1UDdMbTlNNjJqc1RRTkIvOVVoWWZVMU9vbkZwbFFR?=
 =?utf-8?B?bXBzS3VRZXZMN1dHOXFPbk1aSVFNRGtCQzdtRDRQUWFGeDJMQnpDQzVkRFRi?=
 =?utf-8?B?dXhWdFNZalpSZkkyREdaTnROUUFsWTUremRGTHliUzBYbzI4WUhVbGNJOVJ2?=
 =?utf-8?B?YkdxQThoc094UkpPNmlMZEN5Um1yYmw0UVc0dXFHT2dPeGpQQUpQenFBTTdO?=
 =?utf-8?B?cjhoVnFhaDNDSU1KU2FXcFNlSkhDQlFOQ1krRU9vdFFqWjFwRk1tblAwVHNY?=
 =?utf-8?B?aE5LQmFWZ1BPRXJ6NlZudmJBNFljckV3dUNmRnM3VnZLeWJzTVZ0YndTSkRr?=
 =?utf-8?B?M09vMUVRVnY5eGVwakFURVpadTNUbUdHLzNQR3dOL1VFbGZRampUaHNrRmlN?=
 =?utf-8?B?eENXL0hRZXFGbk04MnRDWWtBRk9VRlhLZFBoRjdMNytLVkdmNXhXOE5iWWxP?=
 =?utf-8?B?aGphcURERkxQbWNoeEs1Z0lQa3pRMGVzanVyNEZwTzVSQUM5QjZFUnhvaElk?=
 =?utf-8?B?NFdzQ0EvM2dnbXJFSmFLWnE4a2tFcExYUTFXZlNtNFIzWGVheXpNUUo4SEw1?=
 =?utf-8?B?UEVmOEhUejhvKzNrdGErSldCdVE2SUVSb3VuczJSL3BhdGZnYWdGZklwYlZK?=
 =?utf-8?B?UTkrRWY3VHBNbGxzTFRjUmZzZEtIYVB3ayt3dXp5S2lnSVNUVmJoZENpREhP?=
 =?utf-8?B?YXRTcDlkRnlaNkRTeWsyU2RzVG9xeVhOcUdpYzVMVDh5VnpUaVpUTUVlVzhM?=
 =?utf-8?B?Tys5Q3dGYWV5ZnowSXdTcnpNWjNoUzZ1NkFzOHVaN0JtTCtMREZhY285WE1o?=
 =?utf-8?B?WUJoVjhUY3VFUHhrZ0NxeU00cEJyVmM3OGxZbmNmQ1Q5aGhNWmJHcXMva3pJ?=
 =?utf-8?B?dytxVU5BR2RmVzF2QUx6Rnl0OStyZHpUR3dDUHdYdDhnclJKMVNoYVBLeER0?=
 =?utf-8?B?V3NWeXgrRFkxNk85dVhIdzU1QjRCNU1IS0Y5VFpNRHQ5bFhvbk1OaS81dEo2?=
 =?utf-8?B?TDA0eGNtbmxKbENWdytKN1VLSlZaY0d6ZER1dDBKLzk0bnpXTitKNG51OXFO?=
 =?utf-8?B?Zzd4L1VOZ2dGWFdTSXg5V1F0SzJ5ZDZ1d1Nab0pXV2FrK2dCVHNNZ29ZVUMx?=
 =?utf-8?B?eElvVUlEWDU3V3U3Qm9OcFVnL0ZCL0FOWVFnNU9ENE5YT0hMTnFwZWFaSFVU?=
 =?utf-8?B?MVNvVmxwamFpcC9ZcVhUdEhScUJpM1ZwekkraHNSZDBRcmJGR2Y2aGo0anFk?=
 =?utf-8?B?MHlwSkVzaEhObmF1dFp5a2hqQkJubThKZmRIbVBvUGZNai9UV0NzZ1FKaHY3?=
 =?utf-8?B?c0hNeFViRFBvaUY1QkRWanBrQnd5NmNaTW9Odjh3U0pWdndqRHZWK1N3R0xP?=
 =?utf-8?B?Sy9NWFROVUtXQlZid1cyeG1hTGVlelY1N2c4N1BBcitwSmtaTC9vRkVjMmE3?=
 =?utf-8?B?N3FKazBmdERxTWVmaHlvV20wbVJURWJBYXR1UkY5c2RTUGgvL0U0ZkRsbk55?=
 =?utf-8?B?QnYwYzhwRlRQbGEyaUUwYk5jVGRmSjVkV000Y3d5VlU2VFFQdWxIQT09?=
X-OriginatorOrg: efficios.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a9fdcb2f-f9d3-43a8-7cd0-08df0e7660f5
X-MS-Exchange-CrossTenant-AuthSource: YQXPR01MB2357.CANPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2026 13:29:30.7302
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4f278736-4ab6-415c-957e-1f55336bd31e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZiCDce2rYh9HxzoaSYFb9N3aV+r1AEKO41y8MuEP10MMm2FXa1OQ5zIJ4tUrEqp2gqmSjn0GLVYFuuLRPxIODA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: YT2PR01MB8454

Hi all,

The newest bug-fix release of LTTng-tools 2.15 - Péché Mortel is now 
available.

2026-09-01 lttng-tools 2.15.2 (Ginger Cat Appreciation Day)

         * tests: Use version-appropriate GDB logging command
         * sessiond: Allow missing UST app channel when modifying events
         * tests: Add regression test for sessiond assert
         * tests: Backport `disable_recording_rule`
         * tests: Backport `possible_cpus_array_len`
         * tests: Backport consumerd pid fetching
         * tests: Add debug option to GDB scripts for automatic print 
statements
         * tests: Add option to limit the number of tests skipped for 
missing requirements
         * tests: Add helper to fetch logging formatter
         * tests: Add GDB helpers to lttngtest.utils
         * Replace removed Python 2 C API macros for SWIG 4.5.0 
compatibility
         * Fix: ust-consumerd: oldest packet lost in snapshot of active 
channel
         * Fix: common: check load data type in filter globbing validation
         * Fix: common: bound filter IR nesting depth
         * Fix: sessiond: validate filter bytecode generation length
         * Fix: common: harden trigger-list header decoding against 
short payloads
         * Fix: common: validate action header length before dereferencing
         * Fix: common: daemon abort on invalid log-level-rule type
         * Fix: common: validate action list payload length
         * Fix: sessiond: sanitize agent event-listing reply
         * Fix: common: sanitize event exclusion count on deserialization
         * Fix: consumerd: crash when consuming a packet with no output
         * Fix: ust-consumerd: crash when flushing a stream that has no 
chunk
         * Fix: consumerd: no packet produced for idle streams on rotation
         * Fix: ust-consumerd: reclaim timer resumed for a single 
channel only
         * Fix: ust-consumerd: crash on deferred reclaim without an age 
limit
         * Fix: ust-consumerd: reclaim timer not resumed after explicit 
reclaim
         * common: re-arm a cancelled scheduler task when it is rescheduled
         * Fix: ust-consumerd: lock inversion between reclaim request 
and scheduler
         * Fix: tests: lttngtest: taskset_anycpu() retries the same CPU 
forever
         * Fix: relayd: 32-bit overflow of packet total size
         * Fix: relayd: NULL file handle dereference in GET_PACKET
         * Fix: relayd: live viewer can reach unattached sessions
         * Fix: relayd: size overflow in the live viewer GET_PACKET command
         * Fix: relayd: reject zero tracefile count
         * Fix: tests: stall-buffer timer relies on a packet-count artifact
         * Fix: ust-consumerd: stall watchdog ignores snapshot channels
         * Fix: relayd: incomplete session base path validation
         * Fix: relayd: stream channel name allows path traversal
         * Fix: relayd: stream path traversal via reversed strstr() check

As always, please report any issue you may encounter to bugs.lttng.org
or on this mailing list.

Project website: https://lttng.org

Download link:
https://lttng.org/files/lttng-tools/lttng-tools-2.15.2.tar.bz2

GPG signature:
https://lttng.org/files/lttng-tools/lttng-tools-2.15.2.tar.bz2.asc
