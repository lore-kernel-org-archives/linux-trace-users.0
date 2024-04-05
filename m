Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58B3D16D328
	for <linux-trace-users@vger.kernel.org>; Fri,  5 Apr 2024 19:30:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712345426; cv=fail; b=Bw46vPnF/5A4XngUmlxAW671weOmbVZh8XsybBiifh1LezK70SnWfY5hH3bEzl+/Pist63slG5xqD4rIPjFpMJjBIR2CNfCnmrUFiObwiV0zjLCeqldBWM0JAdB2lf2pmBGGq0CGFzkOob1LPV1HV6Zr1LB9L56aGwmszA7AM20=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712345426; c=relaxed/simple;
	bh=zSpmAecCdc2cFbhRKGHfKvvtiwsVdXMiW0QD4zbm/J8=;
	h=Date:From:To:Subject:Message-ID:Content-Type:Content-Disposition:
	 MIME-Version; b=C9sCBHedYBU0r+NV8y+qqu3rp+CZ7RwVFbThnGWwnu4dy1g/6PbbeDlaz5/bUSFif+vzvpy1tJzhnLpChfbf6D1wjJ4Bpcxyi757F9GPwDW5MOvSBdvsBgLWUw99bzaTVbfCGLPlw2k7dm7ZuVmIVdMR1LKIrNNPP1V8ZH+zcRw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=IJ5D+q18; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=ucsxjbaD; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="IJ5D+q18";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="ucsxjbaD"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 435F3ksl013290
	for <linux-trace-users@vger.kernel.org>; Fri, 5 Apr 2024 19:30:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to :
 subject : message-id : content-type : mime-version; s=corp-2023-11-20;
 bh=gCHyivaY33DW23nGAVzCaS8qXJhca44fGhsfGeN2F3I=;
 b=IJ5D+q18bbjsac5mvIx//lxPp7gjfjH1NH0nh+Ygy+sBl9juRcray806aiqXV3p234oF
 Rh1urFuyfwesJZxy47IKXPcDcKpdTS8uPlspME2EaZzcxK1qiXFkvTGH/pzDZqp/+cka
 29uR5qlg/uYIWLRQpaaCH1EeWbeNi1HqhFZrho5H8sIymJcl+kF+s2TJIDoskb+3JYNp
 f8EQ3l+MIO5dv7GQqk5YU9eiOzC5/68nYnLU4yAuK5yOXHJpQChCDvFd8/Hn142IcCD9
 bVXoQtyY5D/mMw76e6UxQeYiJ7C4MoJ4RDAP+DSrtNh5QUiDW1fwt7MMdYbiP1q06G/2 xg== 
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3x9euy472y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <linux-trace-users@vger.kernel.org>; Fri, 05 Apr 2024 19:30:23 +0000
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 435HNZpD030484
	for <linux-trace-users@vger.kernel.org>; Fri, 5 Apr 2024 19:30:21 GMT
Received: from nam04-dm6-obe.outbound.protection.outlook.com (mail-dm6nam04lp2040.outbound.protection.outlook.com [104.47.73.40])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3x9emygq1e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <linux-trace-users@vger.kernel.org>; Fri, 05 Apr 2024 19:30:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oesvGGCMw3F4IlqD3Omg2KQzq/U8ZkxDqtCuX2hcprkYZLwNPxR1sfXpoRiMlsAn1WLq2m1wxkpKNZzV7qiZTd2Y/Cr4L8aaCuHiu+5th0pcYZc9nCNEjzXNDQ1+E24EjyL6sOO5RgG1uHmfrmrylfa9eo2OuTBZkIx1V/uupeZZSw4QkSXkvRkUKNRTbhn+B6extx559zHP0yJdbSgJI9wMQRJI7PN69n5BPPra3/fobLCE/j/5r8GvKTkFER1k2Qlmw4S6LmoWAJQdJyKHSWpujcLQjJk2KJ8QbxXeio43ANq208+7GTVxbkWCZ7HjbuMgaH28VDRn5J/9KBqyqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gCHyivaY33DW23nGAVzCaS8qXJhca44fGhsfGeN2F3I=;
 b=RPAvAkYM5KoJd7V6Fdl6/Mj4daZQhNnCIlOBfD7J8FCsKZQPszrql8qyfw1AxfqEy7qHaghd4G2/iKhJRT8LiFsaCYIUp26jX5tT4682AEW87SVrkEzfIRJs8qP3DaVFUE0Yl6epmIKp3eWxQBG9QDGK2pjlbGyhvreuLU8aOP+FfZtKXDWBi4zFj5VUo7zVClTaxsM2BS42NgWktcZHGcMGRbjUXIWHImlPUfp2Fk74uppf6Y65JNPhXAjqH93/1e26CEvVgFWYOUAnPL6TZOqECKtdXpdXrGdmvv3hO0q7g5Wbnf/zlszSpHkfK938R4SklziOQjaRiCYz1zmz7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gCHyivaY33DW23nGAVzCaS8qXJhca44fGhsfGeN2F3I=;
 b=ucsxjbaDVd/uNann8P2ksGptHsit2ESJx4WokXw9v0rmxMpZYuSbNd54UESxXFNXJ3nbRwI51+xDOuFqfbXwZJf+FjL7YEVwhFt0u1vtUcKGh2XXZSOMqz7biEjqg4XIPWb9eLXvV6TO16JdfavIh3USXcI3rVKjdp6MEUDIKu0=
Received: from SN7PR10MB6287.namprd10.prod.outlook.com (2603:10b6:806:26d::14)
 by DS7PR10MB5088.namprd10.prod.outlook.com (2603:10b6:5:3a2::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46; Fri, 5 Apr
 2024 19:30:19 +0000
Received: from SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::6c60:5db4:7058:1440]) by SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::6c60:5db4:7058:1440%6]) with mapi id 15.20.7409.042; Fri, 5 Apr 2024
 19:30:19 +0000
Date: Fri, 5 Apr 2024 15:30:16 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: linux-trace-users@vger.kernel.org
Subject: [RELEASE] DTrace 2.0.0-1.14
Message-ID: <ZhBRSM2j0v7cOLn/@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-ClientProxiedBy: BYAPR07CA0026.namprd07.prod.outlook.com
 (2603:10b6:a02:bc::39) To SN7PR10MB6287.namprd10.prod.outlook.com
 (2603:10b6:806:26d::14)
Precedence: bulk
X-Mailing-List: linux-trace-users@vger.kernel.org
List-Id: <linux-trace-users.vger.kernel.org>
List-Subscribe: <mailto:linux-trace-users+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-trace-users+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR10MB6287:EE_|DS7PR10MB5088:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	1hVuFBaJ9ONSbYmq1qpth9VbFzbd6EcBCT9CkKqZ8AWqO5OZS81m2SXeZl6v2hhZnW+SMBTvfUDtm2+K90KQz2WZBb2hHuDNbHdtwsMmbJrCI82FU7RYfGNedxfYU7NC7MRkZmJxxu6KGchpkdCJEBYxinosrlV1vhHh0G1oIoDLdSmOUPQSsH49isnGDNBIPvlM8y1bmNYYsv8s1eU5TFkX7pINM8wvbMZ3Q5SYEI8xcweemPBWGssTGf6NacgI0FKVchp2tz01Pz32WN2aGqqy8kr5Jococp6edfObI/LPAWSv1hQ0sxgZxKMSTdld8A7mf3bTXtZ3m/SBC2rHOkvkP17iEW+l0/AaKFVENoY3T4KNX2o59mcwuJrFZ7LsIUxvnh8JN4B2tdkuF014Qr7DqAa7C2FSpYZ9klvQ+wnCJpVrXUd7ebQoY5FKeSVdvMLOvNh+Fu7yItKkW2mAzSkcswv1b29sUS3iP2IbzYf1syZoz6Xd8llVk7PMWgMOYCzFOHD0ezIcddb9wQmkWcPd1Lgkxri6WWhnKebvYEf2oYGP+rikn/5uU1yjzjMKha3dDoRgfJV8nLe44AH0LXfYgGTUKKjIJnx4KjxbwNqU0/lgzNxpQID6VRNOBQSRzTV2QuUf6O7PPgr5K7DoqG5pJtmP8juk5eOiVSCkl4k=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR10MB6287.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(376005)(1800799015);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?zS8Aw6WCBvV7MFIW0j/QOjlt42RE2MOGcioclb1q/E2V/yOIufwC0mSvWgrI?=
 =?us-ascii?Q?ihV0XKOP0pl76xPPbw9uiD/tAvUN1Y/JZ53HSBVs+oPza6cDPq/YklUwa5do?=
 =?us-ascii?Q?YmTdDMG9E5SEuI0TRr6V70RJkJTmSmeM98IAc0tnVxcLnXStx1rR+9AkHej0?=
 =?us-ascii?Q?e93ZUpDrkfV2xgGkfXDx2TbLco2GinW8kaAq87RQAh5gvF6IiB+WRiVFKT9Z?=
 =?us-ascii?Q?WHcnJfOKSkkRlhE4s0//I6DIKoWdn2g7KvDi4xzE6kNDYCfnSxmC8sXaVNmr?=
 =?us-ascii?Q?AtBZSxoTh5HIsyDBNyDhGobVWLMXdpSeGEMrkrZihB9zT+/oEm/VFuboL75O?=
 =?us-ascii?Q?JZVgvkO4D3nivHnkAEduthof+fswASFeyVAkW7o7fudjOXDOSIZHRmwRP0yW?=
 =?us-ascii?Q?vSX8f+x/OG02bVFmtFDV+g/pZvCF+uhaBbQSCPDFAVtxxQyca15OW8LYlJjY?=
 =?us-ascii?Q?JZgmxfpDZIlgswDs+TWLQJ9Fh0ZC5SHLn/B1NB4trSoVYVtdHQF3G3w1+Syd?=
 =?us-ascii?Q?Wr20R5ERaVdHypvVJ/iJ9AYVL6XA2GURBkDFybJ9tLmifvrEZCN3L7Wl2LIk?=
 =?us-ascii?Q?4r+zYbJ+6yevgfaGHnfq8S11EqMz7v6SSktognHBvxhS2QC7KOQIirXg1//E?=
 =?us-ascii?Q?DVZDyx2r3Q/JdcS1YGA8aXa976PaMcxYiRA6r1fakqdzpqfPBDEERAXvir88?=
 =?us-ascii?Q?i438n5BUqszsrpXBnxnpUF0euL+kkqV7yK2nWygRT6nmGyMclGAIrncl0V7i?=
 =?us-ascii?Q?HhsZDEsAqbKn6nhQ/5e15gt99kxOkgv+WnCH9bwe+7Er5owgknc5bAF8yCF9?=
 =?us-ascii?Q?VKc+krYgqE9TnHDseH96l7JkJEs6Q7rEwsos/dPqe7TGJ0tr+W2tsyB5h8+m?=
 =?us-ascii?Q?PSjPIwn3yVKiTj23JCgPJs7O1Pn3Aoi0Vjakudut/xdYPYZ4wgPO4fb7I2uf?=
 =?us-ascii?Q?pavjLIgFhLpIbY10vhA/oIlXlRXgZh0pJRyqClMOAdEIncYRjF83dyiT6m8G?=
 =?us-ascii?Q?a98V1T+kzf8cJOW+86/rgNPQ8zKvBM/nphWhAaChJz9xP2SNTX9UcqXBFH+x?=
 =?us-ascii?Q?m8BA1lADkpHEGp9widv9SiO0+Wn9Ud3vhHJ7ERvUr+Jw/OuErNGtXVrdxVpC?=
 =?us-ascii?Q?yZRFxiNd48rHHTqaRbTMp/dTZJFXCxKPwoJO+cyfLdo2fBuc4riu5x2TXGob?=
 =?us-ascii?Q?OOHPiSfNDghB5rqI6oV0607fDxPzH/Zu5cU7MfX6UWALD/uPeEsG9psPALFC?=
 =?us-ascii?Q?Wenefo7mKpiAR/DgGfDYNtVXIStcdcLNz9j7JMwWrelPri4K59bObT2VVoNA?=
 =?us-ascii?Q?s/Ouhj3KEQSM4nkENPNDQX+CzHZDntUMbpkfbVS0ILbn/fHbXiU9+SOgNRaZ?=
 =?us-ascii?Q?uo2f7+kLs4RLH+NavfFCl+QDbpPv9m9RmAjw2UbESC10PgMtpkcfz+Qby5VQ?=
 =?us-ascii?Q?MFp5buW/2xhMgY23GhmPrMd+wWAPain8xxXGip9epQyDmltrhYYd+JKYtyAg?=
 =?us-ascii?Q?1wlNL8xs7aV5B0ofPZdRVRU1QQ9L3x6WOLuSY60wumgIfug1R2HR2bpCPYwg?=
 =?us-ascii?Q?bT8lOxrjYT10j0a7N55YUYjaCpuKNPXrThUmY5iJckFmrm5QaSiWgug4hNE1?=
 =?us-ascii?Q?Jg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	r2PowwvglIkulz7lRGvbwsFQ113nk3mWWVNr9tjK01sAa9JzVnAXEH6iVeCrOcpvCNs9oGXMYjtwLMIxzj3kOQoAs3ZvofQE8frPUh8fgxRiX7ZY/RdGRIBGobMOdTrWOMq4eyrKqHKQhHE91e7LRKG2teawiz6EibISzyfAV025j+5I7pFpeQOg885mZbnGJD07Cj26KVaotzRQfeXRZJDa9TniUryzzDDng8Z20zi80BIQllBdsASw0nJ3XcIJMTKm/uwwKAdQf4SRPJkwMWTF0haBzEJ3ulWk7i6UCc2a/kS2VV/4uDqjhmYxgnFWjfPz/6r9qMUTqECaATUluDU7eSMhV46fgNtCuaGaOJXhqWI4jbYOn3QBJ7CcJfisB2GNbpgSVr+HSxgLeF754zU5qK8l1HfQd/kVjWnf2CLAWgUm4sxLOTwGYmg47dlAWBzib40cD6yPjYxciES23wnwIV76yYYutxsvsXgFtVniuBvxpUaGTFVo2Bz9RSIWoMEaVywfXqjenqoRC1/yHPzfAOKvPmcX6neV845GUMlWPVADFUw7cqjw1B6fD5KHYepi3NZy/lpVqYWjHY8IdkUWU2r/BBJ3FKlmanLY4Z4=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e84f1385-74ff-4606-ba41-08dc55a6d42d
X-MS-Exchange-CrossTenant-AuthSource: SN7PR10MB6287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Apr 2024 19:30:19.3991
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gpjX5fc6viWWjK6iCsvV728W6QcWyKkZUYbbkUmZkeStzNAhLnsPM4GcUYA5v3fwzuqyHR401X06kDwcqBosaT5nEejLCmc15U2yrG61HE4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB5088
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-05_21,2024-04-05_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 mlxlogscore=999
 suspectscore=0 mlxscore=0 adultscore=0 spamscore=0 phishscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2404010000 definitions=main-2404050138
X-Proofpoint-ORIG-GUID: UZMgKmIGCO4aDTlVNR36ECw4-RCiubJk
X-Proofpoint-GUID: UZMgKmIGCO4aDTlVNR36ECw4-RCiubJk

We are happy to announce the availability of the latest development version
of DTrace for Linux (2.0.0-1.14).

This new version is based on BPF and other Linux kernel tracing features and
is implemented entirely as a userspace application.  It can be used for tracing
on any Linux kernel that provides BPF based tracing and BTF type data, although
(as mentioned below) improved functionality depends on two (optional) kernel
patches.

The functionality is close to being feature-complete in comparison with the
kernel moduule based version of DTrace for Linux (version 1.2.1-1). Development
continues in an incremental fashion to make the full feature set of DTrace
available using existing kernel features.

WHERE TO FIND IT?

The new version of DTrace for Linux is available at:

    https://github.com/oracle/dtrace-utils/tree/2.0-branch-dev

The main development branch for DTrace for Linux is at:

    https://github.com/oracle/dtrace-utils/tree/devel

The most recent release tag is 2.0.0-1.14.

FEATURES

  - Providers:
      + cpc: CPU Performacne Counter probes
      + dtrace: BEGIN, END, and ERROR probes
      + fbt: Function Boundary Tracing (FBT) probes
      + lockstat: Locking realted probes
      + pid: Userspace function boundary tracing
      + proc: Process lifecycle related probes
      + profile: Timer-based profile-* and tick-* probes
      + rawtp: SDT-style probes for kernel tracepoints with access to raw
               (untranslated) tracepoint arguments
      + sched: CPU scheduling probes [partial implementation]
      + sdt: Statically Defined Tracing (SDT) probes for kernel tracepoints
      + sycall: System call entry and exit probes
      + usdt: Userspace Statically Defined Tracing (USDT) probes

      + [NEW] pid: offset-based instruction probes

  - Aggregations:
      + Regular and indexed aggregations
      + Aggregation functions: avg, count, llquantize, lquantize, max, min,
                               quantize, stddev, and sum.
      + Aggregation actions: clear, normalize, normalize, printa

      + [NEW] Support for using stack() and ustack() as aggregation keys

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

      + [MEW] Elements in associative arrays of any type can now be deleted by
              assigning a literal 0.

  - Actions:
      + exit, freopen, ftruncate, mod, printa, printf, raise, setopt, stack,
        sym, system, trace, tracemem, uaddr, umod, ustack, usym

      + [NEW] print: output type-annotated structured data

  - Subroutines:
      + alloca, basename, bcopy, copyin, copyinstr, copyinto, copyout,
        copyoutstr, dirname, getmajor, getminor, htonl, htonll, htons, index,
        inet_ntoa, lltostr, mutex_owned, mutex_owner, mutex_type_adaptive,
        mutex_type_spin, ntohl, ntohll, ntohs, progenyof, rand, rindex,
        rw_iswriter, rw_read_held, rw_write_held, strchr, strjoin, strlen,
        strrchr, strstr, strtok, substr

      + [NEW] cleanpath()
      + [NEW] d_path(): dummy implementation to ensure translators compile
      + [NEW] link_ntop()

  - Runtime features:
      + Reporting of drop-counters for trace data that could not be recorded
        for the principal buffer, aggregation buffers, and speculation buffers.

      + [NEW] -xcpu: probe on a specific CPU only
      + [NEW] -xlockmem: set the locked memory limit to unlimited by default
      + [NEW] USDT data is persistent across dtprobed restarts.

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

      + [NEW] BTF type data support.

  - Development and debugging:
      + Support to run dtrace under valgrind.

      + [NEW] Configure script based building is supported.

DEPENDENCIES

DTrace for Linux depends on libctf (part of newer binutils) -or-
libdtrace-ctf. While libctf is preferred, building against libdtrace-ctf is
fully supported. It can be found at:

    https://github.com/oracle/libdtrace-ctf

DTrace for Linux makes use of BPF library functions that are compiled at 
build time. It depends on BPF support in GCC and binutils to generate the
pre-compiled BPF function library.

DTrace for Linux makes use of 2 optional kernel features that are not commonly
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

Please consider joining our development list: dtrace-devel at oss.oracle.com
and/or our IRC channel: #linux-dtrace at libera.chat

    Enjoy!


