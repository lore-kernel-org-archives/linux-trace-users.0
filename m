Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84E0323AB9D
	for <linux-trace-users@vger.kernel.org>; Sat,  8 Nov 2025 00:50:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762563010; cv=fail; b=XbPCq3xQiDp3utT5Niz6RIcRw+RK+K1/76Oc2JD6s81apKNBoXFdVwPRQtNYBqPaNLblMXEiscRTPpX8KlRFtycP+L3OSPQwiMEq4C3DrPr8bfLxisyQMa+pSrqKj5TITSVCthoum4D6NqyktUSA+N2DIPY0DxrgyZf35l0sb54=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762563010; c=relaxed/simple;
	bh=T0/2pPpvLWGhRD0UZbWJC9t83z/+NLyql9s4dAkha4Q=;
	h=Message-ID:Date:To:From:Subject:Content-Type:MIME-Version; b=H6Vn0KSAJVVjVA1YFAM86Qx2axUMrs0fth0/8zM1TyXW+dFIZK3sme2YGg/hMvwwrbCtHLqxj2D+m8QttCebhuCuNb70pPnwABC0A7E2Q0J0PKSBfhzZ/7Yu4bIrDwD7y/dk1EzoQl9XpYQ3bay4VwREPlXBqcnzKgfkhjJpFfQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=KcGMo1Ce; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=dWIK1gkt; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="KcGMo1Ce";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="dWIK1gkt"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5A7MNNGY028607
	for <linux-trace-users@vger.kernel.org>; Sat, 8 Nov 2025 00:50:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=corp-2025-04-25; bh=TaiGb58d0AmzVZ1G
	Qnce87xotmmNXOgePRgkx9xYSNA=; b=KcGMo1Cex+139XhlmQ2rRuGi2AuUj3A4
	Wua2YXwTwomyOGOsqEBScvz31nUyT1/CM051LuUk6O0sqhb3JUGU7SmFSWSFgcEL
	/cTTvKDG7777b5OSn9t8ZcZ1LjjzduV3GF2rcACFEdjI2zFpjvYktYwmlPyXVw5f
	ZouRf10HkHLsJHGydlsuTVXqRQj/LE5Je4PLMr+T1mE6+84l9biRNPMnb9V6OpIW
	vX/DosQD9WSIXbkGvZcFpk+DAzC/0VdnnWpPqiewKMWZpfyEaNLSmfuclnTpAmWc
	JvRf5W8XDn4xPSoyunKwG5McgVDTuUoqp0pyODzM8C2Qk00Ar3SI6w==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4a9s8686rv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <linux-trace-users@vger.kernel.org>; Sat, 08 Nov 2025 00:50:07 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 5A7NR2Fx010866
	for <linux-trace-users@vger.kernel.org>; Sat, 8 Nov 2025 00:50:06 GMT
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11011043.outbound.protection.outlook.com [40.107.208.43])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4a58nef3nh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <linux-trace-users@vger.kernel.org>; Sat, 08 Nov 2025 00:50:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WLFw4wTPFuN5rLnosvLgv+ys1N1b5iTlVp/pjb2IaisIaeT2VFY+45Ofn1azqgMVuIMZz7AF9OkGhhdz0elsijHliCQib2v7BSyMjohsjFzD07tzUDwNrKGJkNSuICnObQbm6XK05oTFdHQW8ShwdxgpIa/N4rgRc6lmwXdXpbj+ajADtV99XmCdr8pKCxoW2jEksZVKERq5A9d/FbNiO9ll7rcWwiH42ihhWhu1ecag9r8chgujzuG4njIE9NiwZoiM/kTKz5/mV1ID84zz7kh/pqM1Z7VLVZc3PQst8LQaVTRPb6ruYzRoas3v6r6PqhQu4lpZ6bQHOKR5yYwFRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TaiGb58d0AmzVZ1GQnce87xotmmNXOgePRgkx9xYSNA=;
 b=R8yJ1qk7CZg69NpV3kRVfZNAGI2apP04+NN8Gkj0Sxd3TwhoNKyaHjiLA6krJ5j59lUbL3LUHrQvqY1y3d1241NTEHWiZADxMCK74coQgCtL4+0JEpr8zFVVy1O/xvh2XftJ14aI1/7nbAcMRJeMEDAqxfKkfMcmJd/H+z4sUmy89LXFK+wOGrVYD8IVpkP3hoQ9RoDAuBihCMmzHiH38KTlzQ5HH1WNN7ixrF+toBS3usTDGR7jAB2a6WKP098u29V2TNGBRakO41s1Jzz2/MQ0Vb3lP9kqJ2LV6w2SynIR74fnhWNGokhHHF2FlPYwM4wKcs+qlxTVIBE6bCSRcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TaiGb58d0AmzVZ1GQnce87xotmmNXOgePRgkx9xYSNA=;
 b=dWIK1gkt7ihqKyZ5meyEQdvqIQWiuP8vEHHHq4VIIUEnUAsPlDOH73HUmtb7L4Eh9yJ1wZ5YMcFiRkAjz1e1DevRK50IsE6TDnT33iUdiYFPPdsu1J86FL7LKwapHzeyhoyFEmp8eEufrMOAQL2Qm+lYcfeUEUuj2qH+1r+QwY0=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by BY5PR10MB4274.namprd10.prod.outlook.com (2603:10b6:a03:206::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.13; Sat, 8 Nov
 2025 00:50:04 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b%6]) with mapi id 15.20.9298.012; Sat, 8 Nov 2025
 00:50:04 +0000
Message-ID: <a02d7729-a0cf-809f-df44-303788d3029b@oracle.com>
Date: Fri, 7 Nov 2025 19:50:03 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Content-Language: en-US
To: linux-trace-users@vger.kernel.org
From: Eugene Loh <eugene.loh@oracle.com>
Subject: [RELEASE] DTrace 2.0.4
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PH7P220CA0170.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:33b::22) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: linux-trace-users@vger.kernel.org
List-Id: <linux-trace-users.vger.kernel.org>
List-Subscribe: <mailto:linux-trace-users+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-trace-users+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|BY5PR10MB4274:EE_
X-MS-Office365-Filtering-Correlation-Id: 855f0de3-43d3-449f-7795-08de1e60c169
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bjJYVFhxS3BFQnJSbXEyMXdjbU9LdnBGbm5FVlRNS1BWU3RtSlVqV0dDajhH?=
 =?utf-8?B?V0RsN0FJaDVPNHZsMlAwVFBYUi81TEdYMnRDajBuT0Zyb3c2Rk4vOS9zakth?=
 =?utf-8?B?L0ZXUmp1aEh0bmxGSzNVbjAvV0lGK2RkQktuOVVIUjRHTTFZYlY3dzRwNkZX?=
 =?utf-8?B?MlBrcGZVaTFTSXVSVC90dTFDa3VIVGoyakl6RG1PeTU4NmUyMFYyRmpEcHJQ?=
 =?utf-8?B?WnZDeTA3WXB5ai9kMmdYVHZ4TnZMditCL211eU1idXZkWEdzVDZwVzlSOE5D?=
 =?utf-8?B?ZlRYb0NUT0hzZnRwUzQ3d1NpWWhVNE5TSVJwUGk4d01kUUR0SU9FOEtzZUR2?=
 =?utf-8?B?S056RUw0WU5PNTVTUDkrLzJ2VG9DRkxWdXdoM29uL0hhcjVYOU1WRmREK2R0?=
 =?utf-8?B?WHBJWVcxU2lLbGdWQjZSS1pwUi9seXNNd0lYblZ6NGJkVmlHUUNDZ1JnZVFi?=
 =?utf-8?B?ZW0rL0ZBZHFoMlhCUWt2bGpSUDlVNWEzSFJMUEJadGEvQWd6ZFc4TTJXcllR?=
 =?utf-8?B?NGt1ZlhiMzBxZUZpRXFJOFBIbkRicjlBdU4wQlE3WGZqK0x3WDUwckVHWHZl?=
 =?utf-8?B?TFphMVMrMG9YNG9TcHdoV2RYOEZIVEVTMW9iTng0eUIvbVBGa1hmdXo4dzFu?=
 =?utf-8?B?cUNlT2phTkpsN2ovUTBOd3V6cTJBenBoM3VJRTNEUFVsZjF2TUpVWDJnL2t4?=
 =?utf-8?B?ODVkTEt6c0UwU0dHcjJGYnlTTVRQNXh2Q3RyQVN2OVF5MHhVK3lRMzMvU3JO?=
 =?utf-8?B?ZWFzMkFMTXVUZDdoemp2ZVJjMDVXU2YxdnBob3lCbFZTRmNVQUtuUjhEcFFW?=
 =?utf-8?B?MTJBWW1Ma1lHMCtRYjhpME9KUUFIYmVTNjlZOFFRdVVGSzh6dU1TK1YzdGc3?=
 =?utf-8?B?LzNJa2J3MTYweTdzYUVUeWZjWUtraS9DcThjNlQzdjBzbUlidU9pNU5NM0Zn?=
 =?utf-8?B?dFhKQ2lDZ2tORldKQ2xud3h1Ty8zSitBb1I4dERvMm5VTjJuaEhHbjBGUUF0?=
 =?utf-8?B?NzZXc0FzTmVQK0FHc3BJN2VGenI1V2NvRXYrMHdvKzc0NG0xZzVFNmcvVXhU?=
 =?utf-8?B?YkFXWmhSUDV3L2ZqZUw0Mi9FeFR1WkY0VkVIK3F4b0MwczZZcTI5WGhkd1lE?=
 =?utf-8?B?dXl1eksrZnoyYm5vMU5KWmNSai91YUFXM3RqZFQrZkRTUlJ4bEVkNXRvdUIy?=
 =?utf-8?B?cnZaMWFxclhySG43dGpYTXJwYWtWRU5PbGRsVXBuR2Q5V2NUa3hDVWNLUlow?=
 =?utf-8?B?cEtRNHZvd0VTWStXUGNOdDN3NTRtckV6ZzJZbUJUWVBhRG9pZlJndDd2SDRV?=
 =?utf-8?B?dmw2VjV6M1NKdnk3Q2o0VWhsZktGcjNEbFVTNG9nd3FRZmRsSEhmYnRvU0R0?=
 =?utf-8?B?Ylg1dTN3QVlKMnZCUkI0Rjk1YmsrK3ZhTkdXeXhKSWVreUdYVXlIV0VaMlNH?=
 =?utf-8?B?cGVLU25pNVQrTU1VU1J6Ym5ObkEybllNSElvb0g0clZpUEV3eHRMcDlBSnlj?=
 =?utf-8?B?TmFHOVVZRjJCcWZ1YW85VU5lYldsQkVwc0NqQ21scVpDeExLc0VkQ2VXcmhP?=
 =?utf-8?B?QTliYUhiVFF5Q1FJS2kvNmFRZ2E0Z2JFczNtTGZoQkplUEVoY0lmVVp0d1Zs?=
 =?utf-8?B?Z2ptYW55YVFsK2p5UTBQYk5TTU9hTndxK21NM2FqamxZQjBsZUVpMldzeWli?=
 =?utf-8?B?U2d2a2p6RXpTNEkxM2FKZ080VmFZYW8vV1FxSTlRM2t2Zk4wM0dCOEdFL1BO?=
 =?utf-8?B?RldEcEo3R09YUzEyQ3E3dU1aNHhGazBPd05aMkJxM1IwUzkrT0Zsb3ZOTjd2?=
 =?utf-8?B?UTZzTktRTk1pdFo0VzRDTEVJUjF3bElCZ1pQVlk0NlZITjU1MWdBVjZkMUJQ?=
 =?utf-8?B?TzRYMTM3andWcmp3QkZkWmI2QVlydWRVdUxYeWR0NURDSXZaOFNrbHIwSmkw?=
 =?utf-8?B?MUFmMno0UHpicG4vc2p6dDkzM2lRUU5JcUNzZlhOekV5SkNuZ2s5eGVEZ1Ju?=
 =?utf-8?B?dE9LYWVSc2pnPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?akZBd0dZYTNpZGFzS3RjZXlxZTZGNnlMNzlka25MUHVFSGQybkxRbzA4Ymhj?=
 =?utf-8?B?c3Jlb3ZYekk1dGdLUWlybXJCOU5EUW9CTU9SaDZLWnBmWmcyN0c4TFZyRTVk?=
 =?utf-8?B?TGtGYzJBcjdOVHo2QXBlQVFGT2hncU1FNWpadzdLd3ZWc0F0WnNmcFgvd2xz?=
 =?utf-8?B?S2xvc2FxMFdNbEdHZ0VxYjBwTWpuejRNekg4RTlPM3NDemNRV0lLYno2QmFn?=
 =?utf-8?B?b3FLTGlUYndRNkFnK004bExja0luQ1U3NlltcEtEd1pZbjFwVXUrdzQ2cnVU?=
 =?utf-8?B?YnROejYxbUIvQzcrSnBLdS9IRVMzRTM1UGx3VFNHTFN3THpwejVkaUFmMHZv?=
 =?utf-8?B?UG5vWFd6cWUwcmRFOXk1YytGNlhHb0FPc1FmRjlGZnU3ejF3LzcyNlY3aVVk?=
 =?utf-8?B?NmxNUE1YZGIvOUVNN1ZRS3NuU1BUbll0VU5McEhsUVhNQzZWTnVsWUwva3A2?=
 =?utf-8?B?QXZlM2Y1NnlDa0kvUUM1MXFZeEVndnY1QkZPRHlNVVlueTgyTGRzK2N6RVNj?=
 =?utf-8?B?b2ViY2g4eFV0M2srYmFRU0RQWGl1T3VPZ1pDR0pYNVNOT2J4ZGxGdzhsd0JZ?=
 =?utf-8?B?anhzUDZ1aTUxVEJwT0cxdDNMY3poZVNGbko1eTVSS0N3YUhFOCtaTUFXNWFQ?=
 =?utf-8?B?bVIvUkFzTUVBeGtKS1Y4L1hrOW9xS0N0am5wRTJ6RVA3T2h5bmJvVzdpMWht?=
 =?utf-8?B?VkpnN3g1SUJBSlFxWGVHVWNhNnFGT2lZV0oyVTBuVklqOHY5SGdaZDNOd0Ns?=
 =?utf-8?B?ckQycmZWOVJKRCtaS0poalcvaWhlN0hrK1RVcEJ6b0g5RG4vR0lYMlNCOVdF?=
 =?utf-8?B?ZlM5ZHNjYzNJL1g4dXRzTUQ0YXlDZmk0QS8zUG9Qa2haeHRFK3c5RXdwWGtS?=
 =?utf-8?B?b0lNTVFNODRTa1N5MlhaYVRxNzI3MjBYL1BycnUzQk1pZ2RpcTMxay8rZmxS?=
 =?utf-8?B?N29tWmZGTy9aY0N0b1k2TkRjckZSdzBDbnNsZnRRVkVyR2U2VkpXYlRRazl3?=
 =?utf-8?B?c2J2Q0xKajJZQWllRzB6MUYvd3NzZEw3M0hvalRxN0duQ3pMK3BZMmFvMkRU?=
 =?utf-8?B?ZWFqWDFJODZJU3BFanJjMDdTbG9RMnRJTjJXdFQ5K05iVHZBdllyTVpuTU1v?=
 =?utf-8?B?WW04Q1ZKR1kzYlVCdGY0OGhDT3RyOGhMMGpRVUJPZ2FhVjk3QXBSaVpoMVVv?=
 =?utf-8?B?MnRBSzhVRW9ta3YwT1FHQ1BRQ1ZFdzJmaUx3b2VXVFQ4U1haZXVmb2J6V2F5?=
 =?utf-8?B?SHJwam5qVGJaSFFCRzczeWdsMWlkUityUjJEKzd2ZmQ4UXlHdnlvbHU5WXdx?=
 =?utf-8?B?UWFyNGJKVVkyYisvSzF4bXNmbkNHMkUrR3hkUWRYeHEwTVRad2h3RmdzNEt1?=
 =?utf-8?B?dy9wczlqMGc3aUFGUXBOZFprMmFTR2thWE8zMlhSVlRRQTJUSkdPV2dDbi9M?=
 =?utf-8?B?OHFWdEhJSXlIdzNReXRNZk0zY1I3R3VrcHBSbU85aWo2NlJGY3VTcThuSXJl?=
 =?utf-8?B?L0ZCTFE3ODJyTERmRmxFVnhHb3h4SFNaOXhWVU5SczNuV0sraDEwU1BBSU56?=
 =?utf-8?B?dmxSdmZtbVNhVUl3MjZEM3I1MVBieTd2M01HS2hjdy93MXJTMEZ4bjd4ZjBL?=
 =?utf-8?B?MHg1V2xkaGVJVGV2M0FLNnVLYi9NTUc1Qmk5c1ZWTDlISjI2LzhDSjJQV0lI?=
 =?utf-8?B?b25DaElYUk4zNEdoVEQyVFkrb0RLenJKQ3lKOElxZG0yUlRJMjl1eTZ3RE4y?=
 =?utf-8?B?aWljTjhxZm5tcXJNOUtRbGlkRGF2UjFjV3hLSUdaMnRadGFJVTh0WW9PNE90?=
 =?utf-8?B?anU1L1U3Y3h6ZE1KWitwYWdZRy9CQ1BRaGh1aDgyNlUzd04yWlpxNVc1RUxQ?=
 =?utf-8?B?ZUszRDlFcVZBejQzMHpaWDRQTDhMY3o5Qk51NWxGSytMVE80WTh2NTl6bklI?=
 =?utf-8?B?aUN5NWZ4NExmRFFLS1doOElWNjlKRVdYMDQzZFNacURObCt4aXhOcXlzZVM2?=
 =?utf-8?B?M3NjOTBxZHVIbkxzZVYyTTJvWFhIQWNnMlRvL0lrSXRzSWNlaG5rdllzamhk?=
 =?utf-8?B?ZTRvY3BSVG5qVFZoKzJjbDFSV2RtMjFEUVU1YWxMOGtva1BVamtUc1NLTXk0?=
 =?utf-8?Q?XKNFfZb1zGi8Nm29fwO4b/DG0?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	IOHnF7p0D7mqH5m04XUNI+R2b8T25TIG8PLG4/Xh2LcxSIwFHBLc3zp13N+DMXjeTDxGO8PnjBkzRXw2JzWVaUh55CZtJMn1/SrOqRU4aU15SZcxyZfaq5h+YGhm2guVqLuO85zRkLIiIVgNkcwsCc1JQMBoBahwtDfOLGNf24mrvm4JuTGDFv05DQx02tDSC/mUEWalAgVKZnQqksWTKuDB7S1y1LVuKJk3DMHxy2olcFAeOJsUFb6oG/En2wco8j9wTLHc+fhudLLOEcMQEzjmkt5bynmCR4EI3uF5CgEKVh8erhAQEEViY4UPaHssWzCaWj7/EE8XAcSBnZcj/YGoVEOt3vdgthoijDf5hr79s0LZl4iAohuJ6/RbD/18JKUxdus22ns1BIbKPinpPKPnZg40IYruZBXN93ce5oWkEcJwIqrEwp3ks1H2wCWJB1i4yrMW4eJPjRcKl8Nx9popccUg2p95XZL3aHnh7/cGEWEcZX6kGyvCII7cd/u7P86sSb+D3xC4FhKAc37g5Zttg/CCOwGKEAlU9jrh2cqfApXBlb6Y06HPIesZECGkfr5YpTHp6QCjsVStu1IxW2mhHLWpv0TqdGQ9UUKc09Y=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 855f0de3-43d3-449f-7795-08de1e60c169
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2025 00:50:04.5426
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9HXueQrhX+nhOVvdphzT477+d69w06rZfgci0P4gmK7+N3WKD8TVhc1UFP7LZjtbl0dbePp3M+io9hnoBJCJXw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB4274
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-08_01,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 bulkscore=0 malwarescore=0
 spamscore=0 suspectscore=0 mlxscore=0 adultscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2510240000
 definitions=main-2511080005
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA3MDE4MyBTYWx0ZWRfX3xY/goYTY+Cw
 sDHeh0aPec2/4ybn/0ElvhFsIloXoODyINwF/0WPWQ4o+xVHY8Jd7dmNc7NRaypsL1+aUAgDjti
 nlpI1B20HqB8EMTd58C5uTJTReSGnfiEEYAuKklILOCAnIfurXIjU5ninXwYxs/x+hiIRHY9Ky2
 3olaF2DEvoAk5/Q9DT61NmpHy5FL1ORnj7yqMwu8F4zb8U33ZwSNfyy9Xr4uMlo70x4l4OZDv2K
 NZc0Z9fTgKhlgff3OcubPMmzwOsFUE7CnWuGJH7mAvsFEL0SY+O1/jUr/kWI3asfgvAvq/fZEw4
 ny2iKLUSQguWrSn1S5UoZnfsbQt5QIC7pj8F2sppda5DOVk3Q/kq2jkZwBia9GCNlriMlogAEeT
 8nrw4pinWxh41OZ7G2li9powdpezOw==
X-Proofpoint-ORIG-GUID: Ydd7vJXb93pj_lq7jdkEoakrOmUuZdfi
X-Proofpoint-GUID: Ydd7vJXb93pj_lq7jdkEoakrOmUuZdfi
X-Authority-Analysis: v=2.4 cv=SdT6t/Ru c=1 sm=1 tr=0 ts=690e93bf cx=c_pps
 a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6UeiqGixMTsA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=NEAV23lmAAAA:8 a=3YnJ_1qNXy3FEqhECH8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10

We are happy to announce the availability of DTrace for Linux 2.0.4!

DTrace for Linux is based on BPF and other Linux kernel tracing features and
is implemented entirely as a userspace application.  It can be used for 
tracing
on any Linux kernel that provides BPF based tracing and BTF type data, 
although
(as mentioned below) improved functionality benefits from an (optional) 
kernel
patch.

The functionality is close to being feature-complete in comparison with the
kernel-module-based version of DTrace for Linux (version 1.2.1-1). 
Development
continues in an incremental fashion to make the full feature set of DTrace
available using existing kernel features.

WHERE TO FIND IT?

The new version of DTrace for Linux is available at:

     https://github.com/oracle/dtrace-utils/tree/stable

The main development branch for DTrace for Linux is at:

     https://github.com/oracle/dtrace-utils/tree/devel

The most recent release tag is 2.0.4.

NEW

       + stapsdt: New provider to support probes defined via stapsdt ELF
                  notes and probes created dynamically via libstapsdt
       + tcp: New provider making tcp probes available
       + udp: New provider making udp probes available

       + The User's Guide is included in Markdown form and part of an 
install.
       + Example scripts are installed under /usr/share/doc/dtrace/examples.
       + A context file, explaining DTrace, can be used with LLMs (AI).

       + [u]stack() is now a "struct dt_stack" (dt_stack_t) subroutine
         that can be used in expressions.  Its singular use as an action
         (putting the stack in the output buffer) is still supported for
         backwards compatiblity.

       + The return() action allows error injection by forcing a given
         return value for kernel functions that allow it.

       + Support for C-style // comments.

       + Aggregations are now snapshot "just in time" for better
         performance and for more consistent reporting.

       + Precompiled BPF code is more granular to reduce BPF program size
         in generated tracing programs.

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
       + sycall: System call entry and exit probes
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

   - Actions:
       + exit, freopen, ftruncate, mod, print, printa, printf, raise, 
setopt,
         stack, sym, system, trace, tracemem, uaddr, umod, ustack, usym

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

