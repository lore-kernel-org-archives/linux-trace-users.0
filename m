Received: from YT3PR01CU008.outbound.protection.outlook.com (mail-canadacentralazon11020133.outbound.protection.outlook.com [52.101.189.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5FF72D7BF;
	Fri, 13 Feb 2026 18:52:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.189.133
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771008726; cv=fail; b=KRx0AtbqG8J+qTSnMhgMPTorgp2uXOH9gtfxkufr1rTp5Ce+AalG05ck3HgCxzj2TCR5yFWeT82WG74ju/Lz9v1hDY0h0YkbHxwUKFCVnq3xKbjdWgDpkjgxYQAiG1z7ckypXvdiqTMBm+PRKlV73yPJB/Fz1ECNkUT0I4gvcRc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771008726; c=relaxed/simple;
	bh=HIn3GS2rFc9oPiDDw21zbcq0h4/ZgKX3cnmTZMzvjPE=;
	h=Message-ID:Date:From:To:Subject:Content-Type:MIME-Version; b=b/0zP+u80jYSoH5l4VkOaN1i+1sZSRlMdQf1uCROM1wABR3POWfCfPSDyQ78wEjSDN0uaCRrbUmSrdIhxRdw/r8/pczEJQddM5SAMsG5+KxRQq4n4STaSuiG5yodo/zKQ0cOYpmE1cGhkpFh1yDMsqt2NN9MrRmWrm+14Q/ofnI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=efficios.com; spf=pass smtp.mailfrom=efficios.com; dkim=pass (2048-bit key) header.d=efficios.com header.i=@efficios.com header.b=IABIK9Bc; arc=fail smtp.client-ip=52.101.189.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=efficios.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=efficios.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=efficios.com header.i=@efficios.com header.b="IABIK9Bc"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BAquVA8/cRWtoMv5aFLtJIJIf+MtwA5bRuZIvA+gX/b4RTENqoduJCLyewZQ2gLPwPI9NvEN5jVzAhRTsFNSCOHJY1t67ArkzAHC6PeS68by8vwwz1r9BD7lKJ1TbkcPbux4TQ3JynByMwxYOvCZLwRjhG9o5r61L1y5koDHgmHuouAx5MPWKF+jkQGWWs5s6ie8LmDS5Zx7yCzWud68b4qGi46N5WU4u79qFLSkKiOLkPRD4ICjW+1msX2+HpbhywfGVYFjEy1PZU8vTmBjIvbgxzk9rPTbFiCmO847bL0xQbfKa/h1+KAgyynaxpPDyjWtGWLKsewtTaOA07z7LQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2r7lM+218TZtJ9ovZfffjdH/Vjwob6uR3YarhOUdms0=;
 b=wkRNi1jp5ka+137nq35Y9KCAHkp6xhbuihn+WlV+IMUfUN1CsNrLq6Dmh4Baengs/P8OStUHxnciT8axULi+Zc2rP8Q/xVDhocb/XkwNKC+j/BhSAfqXyx0WtOahOmCFY7PEoVIZmIMfiTEU8H5kk2dODUkXOZWYIRWVO5IhzGKPcd3b/Fzl7e+RiyfRToapTZ3MRt9RPTWANgNOQHprfubuFqhLXFRIe0QAoIXH4UV3ZXp3gZixY0MVWNd76omHcxC8Wz25UwpaKMVdIdvDY1d3XzrdC70C+SMuwZUeYxj0ogvFgS5rc2c3qnnpaP1hoVtvSrykk23RiqiIFQPa5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=efficios.com; dmarc=pass action=none header.from=efficios.com;
 dkim=pass header.d=efficios.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=efficios.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2r7lM+218TZtJ9ovZfffjdH/Vjwob6uR3YarhOUdms0=;
 b=IABIK9BcGPhbr0eBePEYXs1Mup81grB0bCaZ4/IWsv9m1LMzRX7Din5sNFT+6K5R+O0kP0q2hhSWUmWTOuUM+jFhjNOeILPBw1/+naDkfq2xg54J1t+KV28LqasscswqIAIHZZ4ErLn6CX4KHdwkEIzR0q/AnzAKVz/JOcnYzMK6Pg0ZScfKlOATDl6CDG/5nNLoFbzIjl+7vXdJVsZy8p/sgnV4MyOF5dssjMajBoXhdez3aLbbjJpP0JFbXgwH7c4ucLh6fApkvIvf0aaXTWUhKz9e5vVrudrAe1nv4yRSIGvDcazQRmMhZyxoXoRHL8BsNS+DPHBJkqGeRHQc5A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=efficios.com;
Received: from YT2PR01MB9175.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:be::5)
 by YT3PR01MB9378.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:a3::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.14; Fri, 13 Feb
 2026 18:52:01 +0000
Received: from YT2PR01MB9175.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::6004:a862:d45d:90c1]) by YT2PR01MB9175.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::6004:a862:d45d:90c1%5]) with mapi id 15.20.9611.013; Fri, 13 Feb 2026
 18:52:01 +0000
Message-ID: <6e27fd47-0c9d-4ff3-9684-0c4696aaa84c@efficios.com>
Date: Fri, 13 Feb 2026 13:52:00 -0500
User-Agent: Mozilla Thunderbird
Content-Language: en-US
From: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
To: lttng-dev@lists.lttng.org, diamon-discuss@lists.linuxfoundation.org,
 linux-trace-users@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [RELEASE] LTTng-UST 2.13.10 (EOL) and 2.14.1 (Linux user-space
 tracer)
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT4PR01CA0497.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:10c::15) To YT2PR01MB9175.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:be::5)
Precedence: bulk
X-Mailing-List: linux-trace-users@vger.kernel.org
List-Id: <linux-trace-users.vger.kernel.org>
List-Subscribe: <mailto:linux-trace-users+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-trace-users+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: YT2PR01MB9175:EE_|YT3PR01MB9378:EE_
X-MS-Office365-Filtering-Correlation-Id: c98a6099-96ac-4694-5436-08de6b30f916
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YjkwbzhvWXA1Nk45SUc5cWk5VHhtUlE5b29wdGhrcFlrNVZkbHhIU0V4WGpC?=
 =?utf-8?B?dWtPcWkxbllTVzlCQzFUOWNuT0JKT3hUMXVDN1pZd29VQUU2d1RUdVEwcXdE?=
 =?utf-8?B?eU9HMDNHT1hIT1JLbFo0M2pneVNnM2NCbk9ad3V4T05kTFpBMGJvRXlYbUFR?=
 =?utf-8?B?OVF4RXhhVlB0Z3dYcW1zUGFiR1BTUHF3cUx1Y2ZTQzRyYmk5VGZwaHJnNUF4?=
 =?utf-8?B?cEZaanhOMEppbnVMMGltVzhHaUxtOHltZGJadk01Y1VBaFI0TGZPUEtWWmZQ?=
 =?utf-8?B?V1FqS2JFaWIvSFZzTWI5V2RVS3pwcXpNWkYyeDNBWVZCTU9YREozTURaaEQx?=
 =?utf-8?B?ODFsc3ptVEp4Tm9pMzcwZDl0dVYyVnM1VjVtemtVOFdldjhQNklzSmVPQkVi?=
 =?utf-8?B?V2ZkNEQ1SzY1aWQ4Vk81VFZiWGxNbWttVEZoVU5GRWdhczUwMnF3NlJKa2JK?=
 =?utf-8?B?NEkrOXRLS1paQ3NyZmNEc1daYzluNkZjYkpQREZ3S2sxNUJ4eFlLSU1xTDlo?=
 =?utf-8?B?TFhkR1NTeUp4RTVNVWZBbUduYWdYT0xFaXVyeitBSjlEek01b0JWVW5YS3U0?=
 =?utf-8?B?VFpVSDRFckM5SmtML2hYS01wWmYrekNVY21yNjArdjNoVVlYRHNRQUhRME9a?=
 =?utf-8?B?MkcxUUk5NTI2S0FHRVZMbU1HZkp1aWQyMkxsaW1QRkljKzAraUxHQ0prMEpG?=
 =?utf-8?B?VTIzZUxNRXp5VFlxOW1IeS9ScHpWTlphWXFKcjY2dDdNWmZSYnhJS1ByTVR6?=
 =?utf-8?B?SmNKMkRDdDdNdWlUa2RwTFFJQVI3UG1oU2NKT09iWSsyT0w1VGtQL0ZGbHlC?=
 =?utf-8?B?SXY3Mmx2em1VelBvSW4zUmduT2hnbUYzcTRtM2pXTWRnTVpTcFc4a0tNKzh5?=
 =?utf-8?B?a0VlbW9YdXF0b1dGS050cEdtQWtQMEErbHhvckcyYkZjaHU5cldqdWIvZGJk?=
 =?utf-8?B?YWRkVFcvQTRCZlpmZjZKVmIwVGNqV1k1dHhNZm5nQ0h1V293OWtqdWsreVFi?=
 =?utf-8?B?RzhpV0tkckxqcm1wYzFhN3JnQlc2OUdqbC8xOWFDekRuZ0lneWMwVEk3SDBB?=
 =?utf-8?B?V1d3SlVTUzRVOFRid1NlV1pNdWtzd0dWbWZSSXIydDFRdit2aGd1YytKVnB4?=
 =?utf-8?B?SGtlZWZrQllPRGIvMURSTzNpc2I1Nk1ZbFNnbExVTkR4Q0VBVlZzMnpFUXpV?=
 =?utf-8?B?UExoREFtY0pHMmorbUdkSzZ3TVBsd0VHSG12d1VtK3dQUzRRYmEzdnNod3Zi?=
 =?utf-8?B?aUFkaU5TY3k5Slh5NzhWOWNFREt0TC9jSEdRcFZISWdhYzg2VGFQeVBqVkJx?=
 =?utf-8?B?VUgvZ2hxMXJ6dzA0OENOZko1WUdzeEpZL2NJTFNxWVF1ejBpOHBrUG0xb2Zu?=
 =?utf-8?B?d1dSVUdLRTZObWxqYTlhdWR6ZDE0cUVlNkxMMHdtakphY1ZCeHVkTWkwNUZE?=
 =?utf-8?B?R0NtNjZTVnF0WVE5aHNQNzYzcEloK0lJckZ5aDc2R1ZoOU5DNmlpSG5MV2Fl?=
 =?utf-8?B?RFBEMlRSTmVremFrTHBUWGdzV01XdWxmTklrZFhIRlpvc0FQeitmVlBycEEv?=
 =?utf-8?B?aDhpWXVwdFBMZHZ6cmpGdHh5ZmJ6bTJLcXhmMXhuTjVNS01uRjBHSDcxazda?=
 =?utf-8?B?RDNLb2lqeU01eFgzZnM5WlVnQU9ZK0tISE9UV2haTHlHZ3hYSmVwMDVEaFVk?=
 =?utf-8?B?eTV4QVc0R1dZTHVUZmtLM0hCSVdBSXBrUzFNbDJ6b0NNamlpV3ZmdnFwT211?=
 =?utf-8?B?R2RPOWRvc0RxZzYxSTVDdm5wZFN3dlJQZEV2RTdxUnNrQ3ZYT3NUU0k4N2pC?=
 =?utf-8?B?RDZKbENXOVZpWTJXcjN2NUg2Qm5pZG92Nm4rZXc0M1duMmdoTEQwN1NvLy9H?=
 =?utf-8?B?RWlENHl6Um5MM2xDR0Z4R25HT3dWc09jOUNoajk2czQ4bUFmUUhCYi9DcEZE?=
 =?utf-8?B?ellhb3ZYZmZlbHVBZjJsRDFFZysvS3NNNG1pSFZkT3p6TVphNFdJWlIrMXhN?=
 =?utf-8?B?bUcxOFh0clBIemlpcVhBNkxoU0dqWFp3M2d3cHFEV2IzQk81M3dheHRaOXMy?=
 =?utf-8?Q?f+PF8A?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:YT2PR01MB9175.CANPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UFB3RytGSU5XMSsyL3ZOY2dYM0htWDRqNjZwNGh2dE1uc2szK3RTeVZXS2hT?=
 =?utf-8?B?WXdheVQvZHh6b2dsdG1uM1RmVDZMSTNGUmRNYi9nK2E5Q0dPNWx0aG5TdkFS?=
 =?utf-8?B?Qk5adkFUanZoT3ZtL0dSRUJ6YWI5ZE9iWE1RNGFiWkdZMUNvSkRhZzhJTW9n?=
 =?utf-8?B?SVQ3ZHFNUUFOVmJFaHhXYTJNd0MzcWxTczkzVk4weFhmQ2s4N3c5OG8yVWJh?=
 =?utf-8?B?N0hpVmhKSzJXMS9oZVVMaEluZEhrNEl1a3h6aTJQekQvNWx3NG9YNHBkbjB5?=
 =?utf-8?B?blo5eGNlYWZZbVlFajljNTAyZ0VnT2VUV3FuUjlvOUdTckk1aWdCaTh3Rk9l?=
 =?utf-8?B?RW1tMjlxNmtuZW02Sk1VbXl1TDFPc0w1TzMxemhkdkRhb1hsNzRLbnAvQXZO?=
 =?utf-8?B?VExGRit2VitXRnVsbG16TVF2TWxHWjRxTExrcWIvOVlLWTJNZVRFdFZtbThs?=
 =?utf-8?B?VGl0YzV2NFhwOE1LNm5qUE1RTmExY05mbE1lZy9PTUVLN2hoOGYyRjkvbXRL?=
 =?utf-8?B?aDRNSW5KU1c0TENNSkdHendQS1M0K2ZueWVTTzhyRjJPaU5SZlVqM01tcWZI?=
 =?utf-8?B?TGZWNFBneGZISEVpVjlKYVJ3c3ZHS3hFWlpidG9ScmVvNWxIcFc5ZC9Ob2Nu?=
 =?utf-8?B?c1NlWW1qUDlzK2duc1ZySXpTNEI0aW5PM1dGaHAvWDhpOThzdDJqZmowWkcw?=
 =?utf-8?B?dXExdHFZd3dXLy9iNzZFUWlIYytTd3RjZE42Rll4VVozV3dQYi9TU3AyT3VF?=
 =?utf-8?B?MTVRQzZwTTNkc0p0NnBhVDE0ZjU3YWFTNnVmWUV4aDVDaSsvc1UzK2h3d1VW?=
 =?utf-8?B?ZTJ3TEU2YjExc3dodG9SWEpBenNGekYwcURwekV2a29zMi9IOXIyN2FhY2lB?=
 =?utf-8?B?SEVFKzZCVDk3L25OazNsUW41cFFxMWZUODFLRC9ZK2JPWUFUd3VBYVdjalZ1?=
 =?utf-8?B?WFhueEZMQ3VGMkFJQ0ZaamxVRFk2K2NvYXNxdG5HRy9YaXhhRkw5cnovNi9t?=
 =?utf-8?B?Nm1Tbnd0MmUyT2VyVW1nZ2s0R2hGSS9FR3pXOENRdDRLSmExZnB1QXdFTWxD?=
 =?utf-8?B?YmlVZ21rWGtjbnVWUTZ5WlQ5eGdoQ3R0a0F2ZVRDdlVUYjBGVG1saTZheXRr?=
 =?utf-8?B?R0dpZmZYdGhTeEVvMnJad0NGVUxQZnJZQk1pVHF5TnVNUzduV1dleXJuSXZH?=
 =?utf-8?B?aVdoR2ZIbVB2ZFA0TkFYNjk1clhqeGw4eTA3VXloVEV2dVJNc2JHbEFxV2Ru?=
 =?utf-8?B?dXI1ZllqQ3JXSVBDY1pzQStyeDh3Q3VKenBwUUdzUHBJM3Vta1RWMmtHU2w0?=
 =?utf-8?B?OFIycXFmQXlTMkJNWG52d1Bsc0dLRTdKTk9hVkVHbk55WjErTjZoZ1VRYTlQ?=
 =?utf-8?B?U1JORVkxZHcxQXJ4b0NDb0dWU2Jvb3NUeFZHaE9QU29kckErTFUwcHIydk5k?=
 =?utf-8?B?ME11UU44bkFpUDhiemV2dXZSWkZlUFJkQUt1TUxiSUdZM1FrYVc4MUZ0L2l5?=
 =?utf-8?B?QjdFQWU0YVFmRWY1MSs1UGgzaVd6d0ZDN21OZzRQUFVPaUVHblYvTWtuaEtt?=
 =?utf-8?B?YUpIR08yK01iTG1FaUhud2N2NFViVUswYWZpSWNsL3p6Y1VmRmtaU3pUVTVK?=
 =?utf-8?B?SWE3NXpPUVI4RUZqZ0dqVXB2T3hQT05DSUpLZUZoSm4xc1pvSStPdVQ3K1ls?=
 =?utf-8?B?N2k2WGRCMjQ0cUNlNStqOW9wMlQ1TExZK242dmhhSWduamhtZlpyMHQ5UElr?=
 =?utf-8?B?cTVIa0NuUjh5UmRaUnh1OCthOEJoY0Jjc1BXZVptUElPclNsWlVybHd0azJS?=
 =?utf-8?B?UkkvdXdEa0IvNlhzQzRnWlIwaTFDR3NoUTBGQmQwTE8zRyt3V2tsZEdFYWpU?=
 =?utf-8?B?Mzl4dERKS1dpcnQzS2lBNnBtZEE4RXVuRTJJN0ovQVNSSlduL3RQSFg1em5W?=
 =?utf-8?B?Y3ErMTJaRHl0QXdKbWU5eCtzUmdsOU1LR3ZlRW5hYjNYZFJwTWYwQjJBeXpi?=
 =?utf-8?B?SSs4NnFKWlQxVWFSNFAwa3h2bExzWHE2YlVOa1paVWVHSFY4WkxxeEllbGgr?=
 =?utf-8?B?djBtV0JFTmwyY1BKVUdIV01mYjA3RDY4c1V4QUlFTVQvSGZaZ0pwWFo1OWg2?=
 =?utf-8?B?QnVSQXdoWGE0ZmVCN2dDWGhBUmROYnIyWldVYU12MDdHOG9ib0ZEd2h0eWhl?=
 =?utf-8?B?Rm5WMXMyOU1HZXZqSk5uMkswZW5ENVpmUUkvVFdzR0FlSCtMUEFsOXVoZUhU?=
 =?utf-8?B?dTVWd2pYZXRQSDZwMk1lbHNzQzhJYUVvblFwejE5Q3NSUDBFazBUdlZhZ3oy?=
 =?utf-8?B?blgwMDRMZDZ3L1hNR3N0VmUrWUdGOThPcCtod3dRTUNxRmk4d24zQ3BZVWNl?=
 =?utf-8?Q?NUWXjYB9RsVMxGcgyrZTCW0/7bu2Y2zidYS1L?=
X-OriginatorOrg: efficios.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c98a6099-96ac-4694-5436-08de6b30f916
X-MS-Exchange-CrossTenant-AuthSource: YT2PR01MB9175.CANPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2026 18:52:01.6552
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4f278736-4ab6-415c-957e-1f55336bd31e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hRqHgX/ph3a58Fa1eW5ly3K9PGSpS/NWGhJRZd55GmrFfOb9mOvp7TCcR0Ow4EVSptodMurEz33YYTwmPvGbdC3UOjtHWg8rS5Hveb1GDLo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: YT3PR01MB9378

Hi,

This is a release announcement for the 2.13 and 2.14 stable branches of
the LTTng-UST tracer.

LTTng-UST, the Linux Trace Toolkit Next Generation Userspace Tracer,
is a low-overhead application tracer. The library "liblttng-ust" enables
tracing of applications and libraries.

With the upcoming 2.15 release of LTTng-UST, this means 2.13.10 is the
last version of the LTTng-UST 2.13 stable branch, which effectively
becomes EOL.

* New in these releases:

2026-02-13 lttng-ust 2.13.10
         * Fix: ustctl: sigbus handling: statement with no effect

2026-02-13 lttng-ust 2.14.1
         * Update .gitreview for stable-2.14
         * Fix: ustctl: sigbus handling: statement with no effect

Project website: https://lttng.org
Documentation: https://lttng.org/docs
Download link: https://lttng.org/download

Enjoy!

Mathieu

-- 
Mathieu Desnoyers
EfficiOS Inc.
https://www.efficios.com

