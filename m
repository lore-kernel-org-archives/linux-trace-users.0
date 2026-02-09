Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E231B25CC40;
	Mon,  9 Feb 2026 05:58:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770616723; cv=fail; b=c+vELWIQ7y5M4p/BpLiJzO1NrXqDdbHEMX0OTcKdno7puAOPBGKVeEmb9pNJ45v6qcAB/RiT7HhKHfBg2VmBgTCdRCvgSVMvPtdztAaBzw62sl/jBvBRKL+P800XSsuxj6ZVT7kmuna4LZcJ7v68Pz4W2vK/jAjjk5J6Pr/yciI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770616723; c=relaxed/simple;
	bh=cC740N8R5NrmZgiZqVIgvLzssQHkberv82EuqqzPtRo=;
	h=Message-ID:Date:To:From:Subject:Content-Type:MIME-Version; b=hfRCSFic9KPETlXl+og7klwdFv2Rn38+00NZuFEKarlHhy6bFRozfaEDc9lhhRco/BKdLMGhSiry2CvrTeDuppnFeXF/4xzQJ/LVpWVH5BfqEztA5qy8BFNV0CAn4Ug8NjNLxotOpfCi0rFkAu1ZpS8Bde+3Km/q3L1QyLn/o7g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=dKF851pf; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=OtUIK+MP; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="dKF851pf";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="OtUIK+MP"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 618Nf95j1506622;
	Mon, 9 Feb 2026 05:58:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=corp-2025-04-25; bh=ZZPll6m/qtSxG51s
	ako08frX8hVoyQCxDF0xkBgHfec=; b=dKF851pfbg9JZWE3vK4idVcgxM4kqh+2
	4RTCTemL9R5Q/68qhysiMNjyuykB70PZGWeuhQfB2SzqeWUMVXt9AWNboEd4eDqC
	x2AlOoaQ+o3uw8oVWwWiUWVF7/I5f6LCx/DR4Clf3abXJj9U+Gs0vjB7ixdoCN82
	38TbdT4BepEfIp0awdIkQ1uLMIzZgi+SUS1HPOgrGN4EuPyf6qCKtIxhZhuppl29
	BNmB8eJjH2qalOufRW7X/iv+K5S8wHiJnvg25nPiW1YAYXdLfr3rmNTg94eeEyS7
	q8uagzwNlnfzzFjbnPYgG57EBa9nBJm/cQsLyI+9Xr+bQwFuxHH/yQ==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4c5xf3sf7x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 09 Feb 2026 05:58:41 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 6193ahBe031888;
	Mon, 9 Feb 2026 05:58:40 GMT
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11011021.outbound.protection.outlook.com [40.93.194.21])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4c5uu8n0kj-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 09 Feb 2026 05:58:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hqC41TPojmyRS1yc09F8HiuRTUZqz1vOn+Bx56itAV3ePgazT/7oK9lA4VauwduPU8VpugytyI8AOzTTFCUXad+QFkgIdzhH9PCeiweDkn+Ty/pkE3BCBWsMA9G3BVS+vXXfHc3YnbalceKLSC+suH9ZQRU++n+VAifVCvARFArax60ENiiWDU9b7p18bQpqQMqG4fG7JbAZdqrl9IF2laCzFKDFToksRuPGunAhbvK/dpcAc+8thjdUAIIZmBRDOun9VvGQ4LNwJrMy9hrYP8nif2Wi+zmS3XvTTkPv4is5josbT8t1gBu7nDNPe/G2xcsq+ZaUri4AZ2sGC+ArBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZZPll6m/qtSxG51sako08frX8hVoyQCxDF0xkBgHfec=;
 b=xInRQOEErAhgPGY+cK5FbVdduvjvNVrv+Cgj1xF6ePJQj6VVXfhvAgXfz7pdh84zQ3kn9mc+zPN0AOaTop9h8wQY5b64mwl3LMqIpRnaG/G5+tckSVFZvFvyNq8kqJt4trRCu5mxsooutmPO/CnQ2uXKieeJ+9DZHXx/bb4r6dWl6wlLBNwzID21fmR05oaUyiinrAk3j68BovCDOLqJnnDR6Ltgx/7anQFiKXuPNwVb7VSbMY3Ofii/MMNVvEdqPsKv1b/kCompLaDTNLrsIZTXzUZjUnXKn7ob7VnfWiShxOFDHilsSbb6zS4xpoLIPIMzpN0pPAqpD3A9BhoX+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZZPll6m/qtSxG51sako08frX8hVoyQCxDF0xkBgHfec=;
 b=OtUIK+MPVIp5HDXGInjG1iT3ji95s10sPfKf3ZfSnxhrSXQDbCLfvOryEWlPfRb7VlUpIep/yilztEhsBtVYYq9cM7X0hnxjPRUCwzoE0WLRbioOfprOKRywIqrfFL0gv+84CcsiOoT3xZmxaeT1bhf6YfhZRjx56h/YKs1tVjI=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by DS7PR10MB7299.namprd10.prod.outlook.com (2603:10b6:8:ea::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.18; Mon, 9 Feb 2026 05:58:37 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b%6]) with mapi id 15.20.9587.017; Mon, 9 Feb 2026
 05:58:37 +0000
Message-ID: <a93f8a01-47e8-04a4-4b83-b125590d21cf@oracle.com>
Date: Mon, 9 Feb 2026 00:58:36 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Content-Language: en-US
To: linux-trace-users@vger.kernel.org,
        Eugene Loh via DTrace-devel <dtrace-devel@oss.oracle.com>,
        DTrace mailing lists <dtrace@lists.linux.dev>
From: Eugene Loh <eugene.loh@oracle.com>
Subject: [RELEASE] DTrace 2.0.5
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR05CA0007.namprd05.prod.outlook.com
 (2603:10b6:a03:c0::20) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: linux-trace-users@vger.kernel.org
List-Id: <linux-trace-users.vger.kernel.org>
List-Subscribe: <mailto:linux-trace-users+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-trace-users+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|DS7PR10MB7299:EE_
X-MS-Office365-Filtering-Correlation-Id: 9cfbf44c-2105-448b-a654-08de67a04477
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dkdRZ29VYmxrTExndXRPRy8wY3hWT24wdmVyZzNVb1FraFJPWWYxYkphdFgy?=
 =?utf-8?B?RC9xSFo4NTlnRGpjeDhIUWpGZ2R1QVpvSEdDbld5YkNJRk1La0tlL1dWL2NV?=
 =?utf-8?B?SHpxTlU0dVdjb0NtcW9PbUl0UDUxWWQ3ZytkOEViczRPYXNrQXpHWE8wU2hK?=
 =?utf-8?B?NnhKV0dkYTVhaUtFUVhuU0JZZTJvZkFsWU0yeHEyci8zdklyWmJGa3IzWU5V?=
 =?utf-8?B?WUx1c0FWa2Y1ZWhuZE92M1VNUDJjS2lnekhINW5FZ2E0ajV6aVdxZ3diNFd6?=
 =?utf-8?B?eXkxUHRZZDV4M01FTjMzUGdhOUxuM0tuS2NpVU9UT0hSdzFBSmdzQkhLTmYx?=
 =?utf-8?B?TndGTkNsL2hGcFZtRUx6ZXFKZGtKeUlrOGVuY2NxbWlVTzVxS2tzR2ErMHVN?=
 =?utf-8?B?WjliMWY2SlFLODhTSzFHMGVNUW9vQW9hMTVYNHduZ0w2Ri9GTk4zM2VmekdH?=
 =?utf-8?B?T3RJbWQ0TzZ2WHBRLzlEOXQ2eHdYRVcyLyt4S1hIUjEvZkVFbXpQbW5udFd2?=
 =?utf-8?B?U3RCS1BwRWJzeVpwRjBKVHcxTHFUbVNzMk5RUDltTitYTVV6cTBaTUdIV2k3?=
 =?utf-8?B?c3hjTzJDSWxuTzRwU2VNQVdnWVhwalN3Q1lzdmRLWFRRYjhUejdtZUFsdXlV?=
 =?utf-8?B?QjNVWk5iWkR3c0xXQUFGbGxpVU53UUVBUEFzNEdYM1N6Uis1WW5PZUFzMnU3?=
 =?utf-8?B?T2tkNnAwZk1uejRSRjh0RnNzNVlneVVEdVFqdWpPZ0REbjJ4dUNSZEVtQWZS?=
 =?utf-8?B?aFJ6d21VdkxrSVcxODVBc0F0dENWZmRZMVFXbEczc2VPd1MvWk12KzVTc2pz?=
 =?utf-8?B?dVlXZnV6R1Fvd2h4ejU0bTJlY1k2UXRsc0lER3UwbkZYNWtmbW1kbVNBTlI4?=
 =?utf-8?B?NUJNQUdHUk9mZVR6ZjVGQURWdFJvRmxKYzhobmFUY3laVk0xaUN2ZU1zODh2?=
 =?utf-8?B?SGpKVGhyeFlyZ0QvaThrc1lxZXlHZTFmZ3NoV0JvWUZQV1dYSUdzQ25kRUVv?=
 =?utf-8?B?VVFzZkF1Y3BkRWV3dXNUanNSV0NLb3kxZ0xNRVVFSGhkdkwxY25CRDl0VmZT?=
 =?utf-8?B?RXBzcFJabWE3Y2xxZ09HbmNvMG9MV2tURkNicEVKZ29HaGRTNC9BVXE4QUl3?=
 =?utf-8?B?S0g2QXh4WlhJOE1pam5oa1loV0dWblZYcGhCU1dOUWQ3bVh2UXA1UkoxRGJE?=
 =?utf-8?B?TWVIYzRESjlZeVJ0bGpjbndUVjNSNDhERjBmNHJHQ05tdEFJMytGOGMzRXFB?=
 =?utf-8?B?S21nclFmQlN6VTFkT3MzVkRCaGdkR3E2ZktsMTFOeUJUYzA4QlFFSFhCZk8x?=
 =?utf-8?B?S2dpR2JOeUNpeWJpRGVWZUZHQ0RwUjJjbGgxTUYrenVTSHd4WDVxVG5sMitZ?=
 =?utf-8?B?SlRUMnVvOU1iZHRzUzJLcXVwc0V5MUJic3BncjI0dExlTnNBNWplM1FCMHRq?=
 =?utf-8?B?R1RMcEFlNXhTQ2dpdGo1RWt3cHA4QnNveG9QR3NLUlpHUEhVdjZ1OGdXaHpY?=
 =?utf-8?B?N2F5OW9BU2txQ1dGTVBjOHFHNjBvYm9VY2tBUHdpeTBzNTRHSGpwVzZIMWxp?=
 =?utf-8?B?ZlBlK3hsWGtjZzlGRWdxby80VTd2QlI1eDhCc25IVGY0aHl0T014bjlXVEh2?=
 =?utf-8?B?VGVKeExCK2pyTkx3UXphcmh0dXlvUkFBRUd6S3RZOWNIZ3pVbE1TVXdJWVdB?=
 =?utf-8?B?SFQ3aHJSSnJraVl3ZTlmektDMTEvRjY1RXh3T1hFQTFzdTU2RWphbFpMcWVv?=
 =?utf-8?B?TmtjdHIyYnp1YjVBcFF5NS9ncDB6aE4yaGF3QXJ4RzRNV2pld215VmNhZk5k?=
 =?utf-8?B?cFhPVHNkODk1ZWVDdlRncnFGUCtxQTgwVmJmWm96VTEvdGR0L2NEb0I2eUFq?=
 =?utf-8?B?RmVEWFhsY1lDTXE2bzUwZ3RYZzZaSUp2akRpeEs2YzM1dEJIZjZBSGRVSUlO?=
 =?utf-8?B?QjhGMmdMalQ3TDB5dFc4eFBvdmRhWmZXcm5rc0kvSHBtZlduM2NBRVA3UG5E?=
 =?utf-8?B?bnVCNVFNNGd6MEoyV3VMUUorc2J3aUFRckk1VDVhZ2VhTWNNSVJIYUJPZVEr?=
 =?utf-8?B?d0FqRHdRVDVGUFN0K2svUDU1YnZ4TEluc3VOekVSRllGQzNyYUdQSkkwZEVi?=
 =?utf-8?Q?9K14gRBvjzZOg4nQeT6JUkWYy?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WXpxOGNod2VTbDV0SmlwK3hENFVTVUw2WnNjODE2eWFlRW1Wd1l2WDlqVmov?=
 =?utf-8?B?enBEbkFDZnExZ2xYVU1BR0VSdSsyY1BiTmJsQmRnam00VEp4aG5HR0ZPYzBR?=
 =?utf-8?B?ZlpZOXpmNERsL2d0L3Y3cmFQUFUvU1Yra2FQYytwTTNvM0Z0K1JyRmZKUTNr?=
 =?utf-8?B?aTFMSnVYdXdBMVJTNEpFd1NPTUlFeml1cVVndGtIS0JaZGE3VGdzT1hSQzRZ?=
 =?utf-8?B?SFpFYkdScFZpMU9adWJpanFZTVJEcCtqOG5LdUxVNHprNGZNVTQzTWhLR0hx?=
 =?utf-8?B?ODVJOWFWRkdmYmNPYllLWXhmYzRnWnNpZXlQOE9zZG1wVjR0UHVvY3g4YlpB?=
 =?utf-8?B?TE0zOFNvaDlEYW9nbEZlbkJpUDdwa0EzaWxaZUVMejgxK2Z1bURHSC9OTjFK?=
 =?utf-8?B?S3p5QU4xeGV6bkZSR0w2dTFWTG5IL3JOY0J1eVprTUozdmx3WWlSSmpoUEJa?=
 =?utf-8?B?aVhELzVvWnJTV1lKQ3ZYVm1TdmFwWjJrMmM3Vi9RT0pRSkpHdFBrU3luUjda?=
 =?utf-8?B?ZUhKVFFqMnhtSWtiLzRnZGNJdzRrbm9hS04vNTVka3MxNHNRVGtwOEF5Wjl4?=
 =?utf-8?B?N3IzeEhHQWZwaDBzT1RCNGJhdFA3Snk1c0Z0TU1rd1FwMEVUK25RVE1tNktp?=
 =?utf-8?B?NUJZWVVaaHE2eEpCVFhHZWYvaUx5VnRBSFMxOFpqSTdkL28zb1lUS3VUREJz?=
 =?utf-8?B?cnhQSk1NOUJLTGxQTWFKdnJhbEorQ1FLTmdnUVFDak0rRnJJUkJTMTVsWXMx?=
 =?utf-8?B?NUdxQ3JZY0JFbG0wS3p1M2haV1ZLREVUL1BVdmJmcFUxUTZ2MXEzcEE3Ymp0?=
 =?utf-8?B?NkJnMWZhRm1hQm5xeHFKQlNhZ3JjNjZBdUZXQ21XWWFDeGEyTTBpRjU0bFJV?=
 =?utf-8?B?NEl3WVpkU3EzbTZKTFdXdmxFSGRSZDlrdGRrZC9UVWU1RVpFQ0M3aldtWXpk?=
 =?utf-8?B?Nk5jNGtodWw5aW90VUhhME9rWUJ0aXUxVTNYdStFTUtFMk16c0huVVVDeStI?=
 =?utf-8?B?bGlxTVpTYWpaYW5TQ3BKZm0wREJtMEJRYnZMbzByVkw1RTR3cm01ZFFnQnBa?=
 =?utf-8?B?c25VUXFMSnVHOCtjZkFmZ1VqdWw1SzRSWldqK0p1VFN0d01MK05YWlRnYzQ1?=
 =?utf-8?B?TW90bkQ4SzlPV1BrdGF4cWxvYWpydkN6QjZHcVFBV1ZoTXA2R2hkcnMwb2RP?=
 =?utf-8?B?ajd1aVdaZHY2NWwzWCtZcWcxanpiMDJwVG9lMG1MNVV4UndQWERhcy9CcnRH?=
 =?utf-8?B?ZUE4Y3krZnFYZUNiUEQ2VVcrd2VvNnBUbGpLTDErd3pRRzN0dTN3VlUwUUdL?=
 =?utf-8?B?Vk4wOTVRa0NkZG1ncXlhRWtUV09FMVhqY2VWNitOVnNMbDhaY1dxLzJkVmVE?=
 =?utf-8?B?L1hFc2dsaXdoWUU3NlNlNlVMM01Od0JENXpuZCtYTDJrcXV0RURGTWFvQXRp?=
 =?utf-8?B?ZHI5QWlhdUkrdGd5a2JRbGRVcFJ4dEpxaTA0K0Ztd2FacTNtVDlTbGxFbDlS?=
 =?utf-8?B?eEJaMlVrVGIvTE0zL1hQc0xXbm1pTVZQVVZZUXlNMWNJZkwyRkxSdFQrWVZV?=
 =?utf-8?B?Z3RJc0NDclNNOUZSVnJUZkFvdWN4SWFrdHgzRVRFN3JHUk5lMWUrTGhIczlH?=
 =?utf-8?B?cW9LSG1kMExqOUd4dWRxeE5FWFVHcnNlSzFPUFhPVXA1QmlwV3M4b0thNmlC?=
 =?utf-8?B?cjdIZTNuWWtsdmNrakpwSnZNeWdYMThJK2NuNzI2L1NRbHlxVWJzdXE4VG11?=
 =?utf-8?B?N3VPb2krQ3ZQSHFNLzljYmVjQ3ZHbWJiWVhNQXBpa2lNV2xIUnB0aHNWckNM?=
 =?utf-8?B?UnluTVN4VVE4dG1UZHZzdVFTZzRodnV1aVdyNEphR1VZaXpvMWlEalA1c3Nq?=
 =?utf-8?B?N1BzMVVGbHpxcGcvb0Z1cC93TFZiYjVwWVNQUjV5UyswWGpXaEVQQXJOVTV0?=
 =?utf-8?B?QUtZclE3dk5aTDlmQnhSTmRwUHhiU0RKbnFPMWpHRmlZUkFEUExuUlRWenN0?=
 =?utf-8?B?L2wrWVFkZnp6SXB3OG1FMXBhTGtTV2dRTlhlY0FJaHJFNEhDekJlQmZrZlRX?=
 =?utf-8?B?ZkFpekZBcHpxbmVqbU1wS2VzYU4vR1Evazlrb2YyeDlGRHFRdW9NcEFqVVB4?=
 =?utf-8?B?cGpmenI5MDczOHhVMjBMbFplWXlCUUtVWm5udGJFSHdHRklsM1JLUDE5RmFv?=
 =?utf-8?B?UERTVVVQaEdrRmJwVkk4b0lqWGxqakxWemtxQng4MFhKOWEvQ2dmeUxWdlF0?=
 =?utf-8?B?REE2T3RZMWxGU21FRVE1d201R1lRR1BDMFdVVlZEdTZReGhyRVpvdnlLU2FG?=
 =?utf-8?B?T0Z5Mmxob0NTd3B2WTZuNXR1YWpRYVN6b0M5Uyt2YTZaNzg1ZlRnQT09?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	xgYa6vpS+OXRJyzTrpZPjedgsR0/tOHB+nk8u2HmDq28rpMKmND62Uj84yhyxPyYbwd4n/yje+0MTXF5/ZN1XzCnNBR+yQGLdQ1H6xKTmUCvWwF2NYABo10HJa7sHhcC3LXX1DkHByisvS/6AhYSGfv89ijiQWD63xLMxN4mP++LqgKtnfNmiqbjUooc9v715lMgRMhBoZ+VLdAIJuqCKK0qhq6qOfqruorzWGrxszhUjXHRcDiCI05Nz3dEdkTtTs2MbKqZHQkn3OQYIxmsLkxsexrfpj1+HNgx2d+3KlCcMliKv11RZhMR31kBkYlQfePv8lzRJEfhl8iCnf53ktk0z8vs3p7BrHFbxKKbZsyveuJw7JnklD3hcOEZUkmf77aIWl8kIhsj1AE/5rjQsn2KSQKVkYZXyiCoSEWkUrRTtRhMQ9ka6NHkEv41Lobnx7Op0oii++EDC6dj+1shQnHa3TO13/uxm7DfeWQwvbu7oFqD6CakfP6uq1YO0g+9tI74kT/VziQNugKTLqGeluQ52DEqJy0OSqJwKOFQIlCafCLmGMD41e6MknCJH6u+mF2qoVxJzcWhwLmqs+11baan4emMRMZKVdxEa/+0Kvk=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9cfbf44c-2105-448b-a654-08de67a04477
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2026 05:58:37.5493
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VkWhWbicoj8TjsFiPBs/L0HTamzGwPDwINWi4llEUFXGTFv8XJRKp111p87sFULMy14SpPb2KNBWZDLbtbrqzw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB7299
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-08_05,2026-02-05_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 spamscore=0
 malwarescore=0 phishscore=0 mlxscore=0 mlxlogscore=999 adultscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2601150000 definitions=main-2602090048
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA5MDA0NyBTYWx0ZWRfX58haHdlsU8j9
 ypHhY8+WrRZq+C9pThm5YA7+jCkDGe0jbPFSJhzNQXA1IeoPZXKG9SAgCBm7YwjwkS0UAhwnU3w
 5Y/d4f9jTKilXSaLBQtLJGclsbQG5r02oYOXogeNDy4ognnCLQ9FGLvi/xrdYh5b3jYCXtRLF/L
 lsJCRTwJI3TKdRafI/oSLNNqmvv+L+GKfi8P2hqXBnCaXG+Ng6WHhmiQuH+u7NVqxlyz8kFw7Z2
 I3k82ThOLQLN2693sKvYXb4hL1X55nRA8lCj5eEbzA9NwMTIqVGkT3f1T9JYodwqqM+dgRiJggm
 Q1tTSyAs6L1QIWjj5SAhOtN0o11kx2CXTdAh6MirL0Ur7jFgnQQ6oh0fAtEQv0l0814B2PrxObP
 bOAUS2teXIrVaUU6EsWcXLP/letsouvgPjlRB1GR68aKkhCy5kqcRU+H7GYa9P1ZR741nC9RPfb
 vYwR/Wmnl0W0B14ol2A==
X-Proofpoint-GUID: 8hZwI5t-DQ8kd3Y6hCEdXiGB3t2c_mi-
X-Proofpoint-ORIG-GUID: 8hZwI5t-DQ8kd3Y6hCEdXiGB3t2c_mi-
X-Authority-Analysis: v=2.4 cv=KLNXzVFo c=1 sm=1 tr=0 ts=69897791 b=1 cx=c_pps
 a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=NEAV23lmAAAA:8
 a=QAxXmohcHrSUnsWra9cA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10

We are happy to announce the availability of DTrace for Linux 2.0.5!

DTrace for Linux is based on BPF and other Linux kernel tracing features 
and is implemented entirely as a userspace application. It can be used 
for tracing on any Linux kernel that provides BPF based tracing and BTF 
type data, although (as mentioned below) improved functionality benefits 
from an (optional) kernel patch.

The functionality is close to being feature-complete in comparison with 
the kernel-module-based version of DTrace for Linux (version 1.2.1-1).  
Development continues in an incremental fashion to make the full feature 
set of DTrace available using existing kernel features.

WHERE TO FIND IT?

The new version of DTrace for Linux is available at:

     https://github.com/oracle/dtrace-utils/tree/stable

The main development branch for DTrace for Linux is at:

     https://github.com/oracle/dtrace-utils/tree/devel

The most recent release tag is 2.0.5.

NEW

       + PID-specific uprobes.

       + Fix bugs:  proper output when CPUs are not numbered consecutively,
         let both rawfbt and fbt probes be seen, do not convert "__" to "-"
         for stapsdt provider names, argument handling for multi-location
         user probes.

       + Support non-libctf environments for tcp.

       + Add the DTrace Tutorial to the git repo and install package.
       + Update documentation.
       + Update LLM context files to forbid "if" statements.

FEATURES

   - Providers:
       + cpc: CPU Performance Counter probes
       + dtrace: BEGIN, END, and ERROR probes
       + fbt: Function Boundary Tracing (FBT) probes
              (Using fentry/fexit probes where available)
       + lockstat: Locking related probes
       + pid: Userspace function boundary tracing and offset-based 
instruction
              probes
       + proc: Process lifecycle related probes
       + profile: Timer-based profile-* and tick-* probes
       + rawfbt: Function Boundary Tracing style provider that always
                 uses kprobes - it can be used to trace <func>.<suffix> 
symbols
                 that are generated by compiler optimizations
       + rawtp: SDT-style probes for kernel tracepoints with access to raw
                (untranslated) tracepoint arguments
       + sched: CPU scheduling probes [partial implementation]
       + sdt: Statically Defined Tracing (SDT) probes for kernel tracepoints
       + stapsdt: Probes defined via stapsdt ELF notes and probes created
                  dynamically via libstapsdt
       + sycall: System call entry and exit probes
       + tcp: New provider making tcp probes available
       + udp: New provider making udp probes available
       + usdt: Userspace Statically Defined Tracing (USDT) probes

   - Aggregations:
       + Regular and indexed aggregations
       + Aggregation functions: avg, count, llquantize, lquantize, max, min,
                                quantize, stddev, and sum.
       + Aggregation actions: clear, normalize, normalize, printa

   - Speculative tracing:
       + Functions: speculation, speculate, commit, and discard

   - Variables:
       + Global variables
       + Thread-Local Storage (TLS) variables
       + Clause-local variables
       + Associative arrays for global and TLS variables
       + Full support for NULL-strings
       + Built-in: arg0 - arg9, args[], caller, curcpu, curthread, epid, 
errno,
         execname, gid, id, pid, ppid, probefunc, probemod, probename,
         probeprov, stackdepth, tid, timestamp, ucaller, uid, uregs[],
         ustackdepth, walltimestamp
       + Inline variables (e.g., cwd, root, ...)
       + Variables can have [u]stack() values.

   - Actions:
       + exit, freopen, ftruncate, mod, print, printa, printf, raise, 
return,
         setopt, stack, sym, system, trace, tracemem, uaddr, umod, 
ustack, usym

   - Subroutines:
       + alloca, basename, bcopy, cleanpath, copyin, copyinstr, copyinto,
         copyout, copyoutstr, dirname, d_path [dummy], getmajor, getminor,
         htonl, htonll, htons, index, inet_ntoa, link_ntop, lltostr,
         mutex_owned, mutex_owner, mutex_type_adaptive, mutex_type_spin, 
ntohl,
         ntohll, ntohs, progenyof, rand, rindex, rw_iswriter, rw_read_held,
         rw_write_held, strchr, strjoin, strlen, strrchr, strstr, 
strtok, substr

   - Runtime features:
       + Reporting of drop-counters for trace data that could not be 
recorded
         for the principal buffer, aggregation buffers, and speculation 
buffers.
       + Pre-generated translator files to support kernels from 5.2 to 
current.

   - BPF support:
       + Direct compilation of D source code into BPF programs.
       + Efficient use of pre-compiled BPF functions for library functions.
       + A bpflog option to request the BPF verifier log for loaded 
programs.
       + BPF program linking of dynamically generated code and pre-compiled
         code to facilitate code sharing and code re-use.
       + Improved integrated disassembler for generated BPF code at the 
clause
         and program level (-S in combination with the new -xdisasm=# 
option).
       + Improved trace data buffer handling based on memory mapped perf 
event
         ring-buffers.
       + BTF type data support.

   - Development and debugging:
       + Support to run dtrace under valgrind.
       + Configure script based building is supported.
       + Improved support for building and using DTrace on upstream kernels.
       + Installation paths for all components are configurable.
       + Header files for USDT (sdt.h, etc) have been moved to avoid 
conflicts
         with projects that supply files with the same name.

   - Documentation:
       + The User's Guide is included in Markdown form.
       + Example scripts are installed under /usr/share/doc/dtrace/examples.
       + A context file, explaining DTrace, can be used with LLMs (AI).

DEPENDENCIES

DTrace for Linux makes use of BPF library functions that are compiled at
build time. It depends on BPF support in GCC and binutils to generate the
pre-compiled BPF function library.

DTrace for Linux benefits from an optional kernel feature that is not 
commonly
available in Linux kernels:  CTF data generation at compile time. This
provides important datatype information for kernel and kernel module 
symbols.
DTrace for Linux can be used for tracing without this patch, albeit with 
some
limitations.  This additional support feature for tracing is available at:

     https://github.com/oracle/dtrace-linux-kernel/tree/v2/6.10

Please consider joining our development list: dtrace at lists.linux.dev
and/or our IRC channel: #linux-dtrace at libera.chat

     Enjoy!

