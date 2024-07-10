Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 771CE2B9DD
	for <linux-trace-users@vger.kernel.org>; Wed, 10 Jul 2024 21:11:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720645893; cv=fail; b=kBfOuDCUVb8MtPcYjm6V6LGmx1SwtGYNAMjZrv97K8c36WNLrw4bbFZVqYK6WxPsQev6hbPDbjcTdbeZC9cgtgnP9QyrqC4Vbx5KXGg/WOsofCwjQhWpmjO+247tZ9YzTZF/gXUlfKoFOSMxM/pYRrGzdibpi4dbMVADpbu1idE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720645893; c=relaxed/simple;
	bh=n6KFqOgqKFc+vKBr1HL0uq2ZVHFdXnOpKKBjev+9ihg=;
	h=Date:To:From:Subject:Content-Type:Message-ID:MIME-Version; b=ipREGuza6P+2CTP7e1XJTxrck6R8NY0XxAr1/f/bwXDao0DzMMMC2EtvTvs52GJFTUW6EVyX4TPWMv78t24aJnEFq3owpL8nWd9InYb7/Pq/9UIFOEczGpN8O8nzqWnBes2ECYWujbf135skm/8h+Vc8loSkY4shnKsqsK62msM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=I9ofqRe9; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=EckFcy10; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="I9ofqRe9";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="EckFcy10"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46AFbqlp019284
	for <linux-trace-users@vger.kernel.org>; Wed, 10 Jul 2024 21:11:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	date:to:from:subject:content-type:message-id:mime-version; s=
	corp-2023-11-20; bh=GvqFTLnDQ1iPro1UU+o21ed9L2oKnitPW15fgaEfnm4=; b=
	I9ofqRe9/8TEIh0pukfg/gJtVR72soyxm6mOtncnuPZ0fbrzALWznf/Ar1O8OLoA
	l8L2cdbJJi4cXtfAwnwgt6oPCPMpc6+vPkUcLcI+yttpc9be5Yg1LfkfgYFPy7Mn
	/FFaquol9dIy0fDSCjJRFOR2wDTLXW4hyC2kayG8BL1gogNw+j9ybv066rxSNdQe
	6U/V3gekvU8STvu+nz8O0RM1Ki5Wo8XUyiVaXFxuEClUCUzlCBB464d6MXMLlQnD
	ZdNB37Lt4PD0tzRftMX1khi3wx9rbZ1kxk3aF7GO47dHgJEg7x5gI6Qc+xDSO+d5
	0UZZNIttutupveNc6kh4Cw==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 406wky8bq4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <linux-trace-users@vger.kernel.org>; Wed, 10 Jul 2024 21:11:30 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 46AKCZn5033802
	for <linux-trace-users@vger.kernel.org>; Wed, 10 Jul 2024 21:11:29 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2044.outbound.protection.outlook.com [104.47.55.44])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 409vv1db6y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <linux-trace-users@vger.kernel.org>; Wed, 10 Jul 2024 21:11:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EYLpTLwUoMR3bDt33YXVSYhiyuDN+xzTfg11OVFmEE4tXnCIhyJGVftMHs+6+W4pmg3aCHL1b0R5vHdYxGdDz8oFxSjg7YFVkHdOP3yHvDa3Xs80og6nYkdCpYVSHsUwz2l1lS4thpnDIkY+cVjM8oBCiKE2me9Wxf1O9fUubkUaOCZR5e3MFBrcwcdqIeOCrIbgPDUJs1HADMu8kHD0kLDkbSTlIxHjZjypFSUq4yw6eZCKiiSyQYsfuwqRhRlFN3s3EcCWvcbbKjXfBWhk21ZDs10/Qsi/BPMD8JE29SQKPr+e1hV/b20mMFHsA1/+xh4ARBhF2vtmzb8jB5slWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GvqFTLnDQ1iPro1UU+o21ed9L2oKnitPW15fgaEfnm4=;
 b=GLnW58KYGaB1UDeFizE1X3vuf8nllFnWCqrwaxJRIufMZTHzTxTDkPwaoUBJSQMEjZ5Ix6liFkvY8KVaU/9abb5ccs+Csk6GE9nQNxaCBhlIZL8C1qZpd/OBdQTZCpO5FaLIXWAbj5IZQJVesmnkliQe+XTSwD7gc63vkaLB+b44JpVxtaffJFyGscHy50xVjVc+IlYjApFMwqm8Vma8BYPVcjAi/zuKmw9oGna9jxKCd/+un6X85T178W4u34czzlX9NRqq6GlQa8/pgCPusE1mQpv/sEIOq//ggZAsAUIB14NRHpBV229/D2/pfIlVLY4iePZnXMyfBbc/D8FAWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GvqFTLnDQ1iPro1UU+o21ed9L2oKnitPW15fgaEfnm4=;
 b=EckFcy10ZZ6zFIKVBN1D2EDpFq1j06VGw9FpvhIeccR9sOZF8yJnq5RLJHse0YS6boNF3bGfsZJhwBILmob/yjDf3qMMXYjuS+FLx74s+63hxbiKhj6xC1whEprS1FYUoE/ECvauRFxNMvy0xrYtoHOhMOwfYkOH8kt6HffmDKQ=
Received: from SN7PR10MB6287.namprd10.prod.outlook.com (2603:10b6:806:26d::14)
 by SN7PR10MB6643.namprd10.prod.outlook.com (2603:10b6:806:2ae::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.36; Wed, 10 Jul
 2024 21:11:26 +0000
Received: from SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29]) by SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29%3]) with mapi id 15.20.7719.022; Wed, 10 Jul 2024
 21:11:26 +0000
Date: Wed, 10 Jul 2024 17:11:25 -0400
To: linux-trace-users@vger.kernel.org
From: Kris Van Hees <kris.van.hees@oracle.com>
Subject: [RELEASE] DTrace 2.0.1
Content-Type: text/plain
X-ClientProxiedBy: MN0P220CA0028.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:208:52e::21) To SN7PR10MB6287.namprd10.prod.outlook.com
 (2603:10b6:806:26d::14)
Message-ID: 
 <SN7PR10MB6287C950E3522949EAED1D7FC2A42@SN7PR10MB6287.namprd10.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-trace-users@vger.kernel.org
List-Id: <linux-trace-users.vger.kernel.org>
List-Subscribe: <mailto:linux-trace-users+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-trace-users+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR10MB6287:EE_|SN7PR10MB6643:EE_
X-MS-Office365-Filtering-Correlation-Id: 116291d2-3f6c-4eab-6a14-08dca124dc26
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?VZYZIvGoieLjaRZlh42JPlAH531IWlhtPMlHToGjVE41b2tyoG5ObxGUVxhJ?=
 =?us-ascii?Q?q3MFtpAbzJN2/MuqQMBU0N8MrLG0EQ0RmItCxs+iOHxBafOSwE3U/Bud5rYl?=
 =?us-ascii?Q?S+HcyT74PWjlJ0d/NMa8+1Qsa4rEAnh1VgtSTPFL+aVKZg121qwcG9PqFgf0?=
 =?us-ascii?Q?2EbNdOA7M3TXuIyJxRN2JcXMmnMX/OEReKQAcOwhKwRt2Yeta1HQKsUGG/iC?=
 =?us-ascii?Q?qeLZrzX8b4BdKup8mU8ZvuBdL/0rwjqok6KHhz4Adv88e/AA2Nkzj0i6aQMe?=
 =?us-ascii?Q?+f/TdI4ZKzIsHh2u08ueB1/30LKF7d6AeSTI52fLaLOuBbpaILoLvi/1pMWa?=
 =?us-ascii?Q?a7fzCDDz6dhjwzorB00Cgl34DC3RIzIjkIA+br59gPJHXfY8Ctc76pnzcJIA?=
 =?us-ascii?Q?5U5yfQEygaFMdiR5y6RP2eMqFK4YKXghDQoH4hQ9UVLOivoOcRtLSs5fb54u?=
 =?us-ascii?Q?F4BPeFPTKCTAwpLRk79dssvtgBCP6mVqUJQj+tNUvgQiInUUIvuiaTM+LftU?=
 =?us-ascii?Q?eAA2qazXt05nep3TnVuatin6gSOqYOvIFUsAk/8fFmyXUsPHVon4GFiv1uim?=
 =?us-ascii?Q?tFPEzgXqM+8wAuY3kC7Hv5Cfdm71tgbyaqPQ04odbeg+fDeyazBhkQzIfK3r?=
 =?us-ascii?Q?htSgonT1VNidV7xMVuMK8TOzcth3HWr3xDOsmhSOkYA3UsY2+I/Pi8r+CpKx?=
 =?us-ascii?Q?N+wEgSgXs26EGSxvURKPSbSWQK4aRy6Ewa65Xo6RwyNP/d1dyslS6BC9r3IL?=
 =?us-ascii?Q?lNUDbyXcMpcsXSSdXeJKTheWi1dqGv/9JDvWirctSvkxzYVVHU0MabMO0THb?=
 =?us-ascii?Q?1PmbEUw0nuN+UresWPRYBRPIhlxYCCjTiFqfy4txtnqj2UblRuITsaaH+ZXe?=
 =?us-ascii?Q?Ml1R3dFU0DZP1OJmL/8JzMfjK/vpGauSbcBtiNpZqbcbbCVucLxLXIXKS+G4?=
 =?us-ascii?Q?xd+ubsnTkpQoY9kNwKwB3pdfAGue9yWkTwU3+qsj4dd4YKSd4FvFpb9BGHZo?=
 =?us-ascii?Q?011JwSnCC3IG4J5Rh6zRzxMlfmlYh//a8Y6j3b10PVIV7hYfD6EM6q/b0+dP?=
 =?us-ascii?Q?ttWxQr9VXsrTLTMz3ceHRZDoKRCQ+HoJuQ944OZiYXcnmSUs7U437lkPa+XE?=
 =?us-ascii?Q?mzc+zSvX/QpMMu1U4UF2BxzNdsM/+Czp6kUJ6T1rUixyAW0oYwwMCXI0ZFkm?=
 =?us-ascii?Q?i6ZT+O5uw4+TW2/YwHrchKqneL3ElskJqsaykAuQnbyVeSt+4uu/ohKoDyIq?=
 =?us-ascii?Q?dv/0FI9XMBTDHHqf6KG7zLjNVFYLnKdYszDdapFH/XSLMnv057RfA3D+yMIO?=
 =?us-ascii?Q?9p4qSgJWsa6b7Ux3jeRRLiPq?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR10MB6287.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?NYHTBf/rFVCpN+DQ2+GfJC+vRpZGg8Ix+69wt7bzoYNL/vRtMBF2BpPhX/pC?=
 =?us-ascii?Q?e9zyMFz61CFQ6jawlFBNqMuIuo6Yz5NpzHjcV8n2fFLNk5jA5/oXXAA22K5U?=
 =?us-ascii?Q?ElRjnHs+nUbCSH4eI6A4lpi1I8BoBWSDFGlDwdQL1PRhA9/w+SVWxIfkD8yZ?=
 =?us-ascii?Q?/i1liBmdTQ3lsdcHsAR1JrpkW/bREwtBImZw44DUTmYYphpzSP8+sGGGJ/U3?=
 =?us-ascii?Q?1LbDNlGpgJXq105e/sqa/sxlKUJNLJZ4aJ/BzDkpkyOFmnpU6v392bsPxr+Z?=
 =?us-ascii?Q?CmUHvc10rs+8HGVlwTdgOcOQEfGeFCrkmny9/gDNDV07WVNfQqW2H0xWwo03?=
 =?us-ascii?Q?atl3ciAje8TFH5LuZUE6eTV0ksYBZxiScspM59JGTcyizwXse2DyAV7BWoBk?=
 =?us-ascii?Q?A0wlBWfdpQmTV3/rdukODhZUUQNhv/mxT7migTkw9a3i5j49RwhAY3NwUuV+?=
 =?us-ascii?Q?65WusqEJ5S4+ZzfukQt4TamkEyZeo6e/vTtFVFh8knd3+FrydDqF4Zu4F3RJ?=
 =?us-ascii?Q?aCuN6RHB60e9UPgOXxEZOZD+wv/nzn+1y5F9Nnc6Vci2Zx5YYZE6vRJIgX4B?=
 =?us-ascii?Q?rRpB+ytHGTpnapctRqFPiRH+2I1QR/e8DySRi7bbOvSJVMmYZRebRnyLi0Gc?=
 =?us-ascii?Q?4ulsPNDvgGRRqv3mvtwMEPodKWqdbm30O2EojWs3NlwMQgzOpADig8cSiHL+?=
 =?us-ascii?Q?n8YfeseFLBGOWEfp0UYkp5mmBbsAdbQYVluIE7tdCNg3J1ibglUK0xWf2Sqz?=
 =?us-ascii?Q?xolYC8Bw3ekfhy3CypxDOe15nMKhkpR9tQddY4d+C86aIV7LwTT5F239LlmY?=
 =?us-ascii?Q?i4QMQNl8QbIqNtyjs7Nz6FOTjH6zVFX1joP48gsuYXuqay7GyBqdkNm21Vmx?=
 =?us-ascii?Q?59fuKZZkHlH7JA1zbhLXSlt8Bku+3fyYlaNVlnk3pFRpj0pdJit87JwabR8G?=
 =?us-ascii?Q?K4fWvmH1y1xBaPeRS0J72/bZu2EfSh6sKAZQy93+x8MIVuiK6As64Mpl1Pfu?=
 =?us-ascii?Q?WeHHqi8Dx4YEpu+T7R2zDUMCu1ccjkcQ95KEWqMvElrAJuDpydgwXpwjIXfb?=
 =?us-ascii?Q?HNzjgZzV3yQA0RQbB04dBzOPlPQbnR4Zbh9QSPFlAiktr9L5yvCdO89+Gtmb?=
 =?us-ascii?Q?j+KSjtKI++UHXqNPj97y5SJWAGcXmdF7sUB8C54KQ9vFmEfSaBD67H7137Ry?=
 =?us-ascii?Q?bQq0ijyzt8AUz7ElmO4wlMTx39jQHNbyxSjSukwatik8w5eH6LUAqciT68Sa?=
 =?us-ascii?Q?7Iw24p40V8n9m847CQAegxfgn8SUUeXRX59uKGU6BqgjK7dD0ws8JXzTlt11?=
 =?us-ascii?Q?PgaRohOaiojYM18Z6MbsTW4B+qY40vkstPN3Qfadk2dXma53NySa1fYRvp+E?=
 =?us-ascii?Q?DpEJtMCbA50npYy4URdFJpgGUcLcw+5K3t335zCFDOUx9j0iMUoZNdp4OKev?=
 =?us-ascii?Q?rsM6rkKZ2cQZxcZM3Wcex0QkC072RybGY+B9tUc7bPSWhWsHmAplFtnwiHjt?=
 =?us-ascii?Q?b0Kb/zLXlZAslNfwgaoplNIb14l8FD+Cr9gVQ9/PKCK+lrekRDOMTjHiKxgT?=
 =?us-ascii?Q?8DqjfnvMABUFrZWZ3yAZJLynzoc7P7fKiQFa63xmoHLEsGKatwOGwC6TiicG?=
 =?us-ascii?Q?nZqB/0izonyTxEw/6apqiLQ=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	BFY+qjnzdSY5L5vptx2ilMwPm+cLSSRetwRVjHYXsiVh5TKmrmT73dbwQH7HepIt2TP5BLmnqz9oL821egj74fWXJq7QdL4RoxadG4pZQwI2ibJhSQpgP5BY074sg/GHMY0BC1ZcbNzqg5Njlo9HDgwoemA7Ae6H8kmmpeGPOl3L01A4fzJzPUn2fNSHRrJxE1h9eNk6p/oqW4zL4o3Zcg0m2XXGtAwZ34QV6El2SD8nG+t/U6QqMdCsn0C/VdF6vcokx7HLp92Uc9HJlOCjeksoPmUUsTXZ4ldpgXbx0n5mTEUnEfjUPulffRnbjDbiR/atuJ8Cmg7RAOo/GZdNDuGfzO7gUYipUPCT+aj7NpvuCFXnXv8frVx7DJvfMlPqdRyuxtaJded4JdETAI9/vCeeRgN9Z5J1EFkRpaW8qg+kZftlbLCs3kXRv7JsqefLaN8c23S9+5LIADdi/K8D9gB/6pkGHnXSFUIvvT+R2EfqlE/PYlooUs4ge/pgSKAnnTcn6yroqiMtMdIZAOh48euQXmA+O8B4VVyaNpn/H2Bmd8vkOLfeg9mlzUPqzgqOUcC+0Kw+koGj1CTKfT61lQcZr3NS4yOg92JWmuC3Rb4=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 116291d2-3f6c-4eab-6a14-08dca124dc26
X-MS-Exchange-CrossTenant-AuthSource: SN7PR10MB6287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2024 21:11:26.4930
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s1bagQGaHtGfbJjQiGt2vAgZsbzZZNW+MyJ2IAJHwKDOXExVtA6YPGuNTxdyP1kDeBj1T17MxqWgpZ+JlIn+cpP5tl2tSc1aPyUKMvhSwPI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR10MB6643
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-10_15,2024-07-10_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 bulkscore=0 mlxscore=0
 adultscore=0 suspectscore=0 malwarescore=0 phishscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2406180000
 definitions=main-2407100150
X-Proofpoint-ORIG-GUID: hn7NlSr9jOeWThgVFszHwWou5_cUgOrG
X-Proofpoint-GUID: hn7NlSr9jOeWThgVFszHwWou5_cUgOrG

We are happy to announce the availability of DTrace for Linux 2.0.1!

This new version is based on BPF and other Linux kernel tracing features and
is implemented entirely as a userspace application.  It can be used for tracing
on any Linux kernel that provides BPF based tracing and BTF type data, although
(as mentioned below) improved functionality depends on two (optional) kernel
patches.

The functionality is close to being feature-complete in comparison with the
kernel module based version of DTrace for Linux (version 1.2.1-1). Development
continues in an incremental fashion to make the full feature set of DTrace
available using existing kernel features.

WHERE TO FIND IT?

The new version of DTrace for Linux is available at:

    https://github.com/oracle/dtrace-utils/tree/2.0-branch-dev

The main development branch for DTrace for Linux is at:

    https://github.com/oracle/dtrace-utils/tree/devel

The most recent release tag is 2.0.1.

FEATURES

  - Providers:
      + cpc: CPU Performacne Counter probes
      + dtrace: BEGIN, END, and ERROR probes
      + fbt: Function Boundary Tracing (FBT) probes
      + lockstat: Locking realted probes
      + pid: Userspace function boundary tracing and offset-based instruction
             probes
      + proc: Process lifecycle related probes
      + profile: Timer-based profile-* and tick-* probes
      + rawtp: SDT-style probes for kernel tracepoints with access to raw
               (untranslated) tracepoint arguments
      + sched: CPU scheduling probes [partial implementation]
      + sdt: Statically Defined Tracing (SDT) probes for kernel tracepoints
      + sycall: System call entry and exit probes
      + usdt: Userspace Statically Defined Tracing (USDT) probes

      + [NEW] fbt: fentry/fexit-based implementation where supported
      + [NEW] sdt: typed argument support where supported (using CTF or BTF)

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
      + Built-in: arg0 - arg9, args[], caller, curcpu, curthread, epid, errno,
        execname, gid, id, pid, ppid, probefunc, probemod, probename,
        probeprov, stackdepth, tid, timestamp, ucaller, uid, uregs[],
        ustackdepth, walltimestamp

  - Actions:
      + exit, freopen, ftruncate, mod, print, printa, printf, raise, setopt,
        stack, sym, system, trace, tracemem, uaddr, umod, ustack, usym

  - Subroutines:
      + alloca, basename, bcopy, cleanpath, copyin, copyinstr, copyinto,
        copyout, copyoutstr, dirname, d_path [dummy], getmajor, getminor,
        htonl, htonll, htons, index, inet_ntoa, link_ntop, lltostr,
        mutex_owned, mutex_owner, mutex_type_adaptive, mutex_type_spin, ntohl,
        ntohll, ntohs, progenyof, rand, rindex, rw_iswriter, rw_read_held,
        rw_write_held, strchr, strjoin, strlen, strrchr, strstr, strtok, substr

  - Runtime features:
      + Reporting of drop-counters for trace data that could not be recorded
        for the principal buffer, aggregation buffers, and speculation buffers.
      + Pre-generated translator files to support kernels from 5.2 to current.

  - BPF support:
      + Direct compilation of D source code into BPF programs.
      + Efficient use of pre-compiled BPF functions for library functions.
      + A bpflog option to request the BPF verifier log for loaded programs.
      + BPF program linking of dynamically generated code and pre-compiled
        code to facilitate code sharing and code re-use.
      + Improved integrated disassembler for generated BPF code at the clause
        and program level (-S in combination with the new -xdisasm=# option).
      + Improved trace data buffer handling based on memory mapped perf event
        ring-buffers.
      + BTF type data support.

  - Development and debugging:
      + Support to run dtrace under valgrind.
      + Configure script based building is supported.
      + Improved support for building and using DTrace on upstream kernels.

DEPENDENCIES

DTrace for Linux depends on libctf (part of newer binutils) -or-
libdtrace-ctf. While libctf is preferred, building against libdtrace-ctf is
fully supported. It can be found at:

    https://github.com/oracle/libdtrace-ctf

DTrace for Linux makes use of BPF library functions that are compiled at 
build time. It depends on BPF support in GCC and binutils to generate the
pre-compiled BPF function library.

DTrace for Linux benefits from 2 optional kernel features that are not commonly
available in Linux kernels:

  - CTF data generation at compile time: this provides important datatype
    information for kernel and kernel module symbols.

  - Module symbol address range data: this adds address range data about any
    built-in modules to allow for consistent ways to refer to probes by module
    and function (or probe) name.

DTrace for Linux can be used for tracing without these patches, albeit with
some limitations.

These additional support features for tracing are available at:

    https://github.com/oracle/dtrace-linux-kernel/tree/v2/6.7

Please consider joining our development list: dtrace at lists.linux.dev
and/or our IRC channel: #linux-dtrace at libera.chat

    Enjoy!
