Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E799028FFDC
	for <linux-trace-users@vger.kernel.org>; Tue, 22 Apr 2025 15:28:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745335729; cv=fail; b=J6NvJ6DO77fv7HEj4gT0aqXzgjU+udnJ+eJuvKzx8rZ8T2hqJcELh7skJ91GTd6dlQGBmBU0lZ7zoDUffcz4FEksrvYU3loCdusNkepp2ipCmwDgahzjxIYZG//fqZPE4WAayTfC1mwv1Y+agjPm+iRtt1xnNANuAVVkuwNsIj0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745335729; c=relaxed/simple;
	bh=LqEJ1cZUm7xXDVtrJIXoXNbSL4DSR94tNmVEyFYtwLo=;
	h=Date:To:From:Subject:Content-Type:Message-ID:MIME-Version; b=aatLwvzqJUxLPKLBrvZwhqBM1neqe9LAwwwzrKm1xOfQixZ2TKPEsnFnNn0zmVGTllTjEa9+c/XNSg8YLV66VInBuX2GFG6WgX0iO08yyUNEYD09o/+OhoPbyu+j7TRynDcWv5LnELEZ4GQ/TMfdAXdxei59MfjMIueQ+uxN6Sw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=ECqzt2Ft; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=QbbF/jTE; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="ECqzt2Ft";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="QbbF/jTE"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53MCfslo019824
	for <linux-trace-users@vger.kernel.org>; Tue, 22 Apr 2025 15:28:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2023-11-20; bh=fMP8SLxbQvOIBjIOI5fu3Fg/KMl7nEqYwqqn+X3jluc=; b=
	ECqzt2Ft/t/kBp8mdiOAKuWo7EoL3W1QEB9H69aKZR5DQTBBVTUbUirihLmBfAZu
	YjpQ7vjZcQaGapU5vLfdUjr/5UyBdLfl/mlPE65j6gnqOtq+buHksry0nJCKtTTg
	ltkoTdYe0dbs2Br+u1n0zZpwvdoGQDrdiRg3LZVSGtsomuXx3KX4oNHTQzrubSFK
	JFOIsopU4VfJ3MQq0mLVUXvaU27F2qX3fNEUIaZDce6F5CMp7DBYdnx0mRf5uES6
	yHtfCSlCgTGA+UKPo1VtRtM6iwXJIJ58s8j8IzrMMBahhAgjXWTRQt28nB6lZEXE
	5qvvRoFKbs60GyNgbbj6tw==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4644csvuc1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <linux-trace-users@vger.kernel.org>; Tue, 22 Apr 2025 15:28:46 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 53MF9193005958
	for <linux-trace-users@vger.kernel.org>; Tue, 22 Apr 2025 15:28:45 GMT
Received: from ch1pr05cu001.outbound.protection.outlook.com (mail-northcentralusazlp17010003.outbound.protection.outlook.com [40.93.20.3])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 465dejrd15-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <linux-trace-users@vger.kernel.org>; Tue, 22 Apr 2025 15:28:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FzEi7/CnyKlM7ucSRr07+ZoljfjrXpfC3ry6ENWQyF2eRk3Dqlg7DUwdVERf11Vx9kOkiw9ZT0tGMiY0U0dsX0welO6PtXWARFX7jgHMNGWeze7JA26GQgSwz6ovtcYlQMw1f6xLhJh9DLD1Rl77kq3xbhxuskV7L3eWcKxlRGSTAMfpv+xk+p3fBUTrl4gZEDCl80/CX4VxSetzNztpeIA+exAZ5EHnLVwh6hvmOEEIl3sWv5Cw2ze11T0sITPeVbFjpFISIgzvE4P5BQZdJ5ee4IPdapkJ1l2UQF5JNrjtueEJ2KB5s9CGQtP1Xk0OH073UfsjUNe9/RVWs+gNrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fMP8SLxbQvOIBjIOI5fu3Fg/KMl7nEqYwqqn+X3jluc=;
 b=yN+QaJkwSg1zHQPM5n2nD4bo2zBXEPUSqva4aLNpBZrwWnIP1yc+kCAETPSvL900ErZp/hI8jlTH6PxWN0TmSWbsxwkUITHxOQI7QwArvbAliEtc1xxzqv4MKesDYG6LVJBcdRN/YsBuzZZCtJ6r3onWbINV/qj79XPtgHWzr9LqKbvCpdmWjDaliigXLINbXPIsMUEm16wXj7ClprefeiVMDTrO8KD3lx4xbpLAONJ/VHZ5GtEn0DHZvymR+Y0EDf8FdC0URGsLkRFcJykWSqtfw+p/xccSfFzJv+Co6Qjyc8KQ9ShuHIuw83qxKlym3iAVXCDXCJh6xCuutQTx+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fMP8SLxbQvOIBjIOI5fu3Fg/KMl7nEqYwqqn+X3jluc=;
 b=QbbF/jTEL7jW9T6e/PEF95WF6o/nHBcaFu9ABWJALOT9gj4KJk5KIY21ZFDhDY4wcysov3CRQDzSNTuful8GL9/uKblPgbD1V0lqtrcCYXDGmOXxjH1evd0w6OQwSPSOWLw0rKPCrwQiM69jOl0jAYYS1zyYOb+vXrblurRq/as=
Received: from PH8PR10MB6337.namprd10.prod.outlook.com (2603:10b6:510:1cc::10)
 by DS0PR10MB6994.namprd10.prod.outlook.com (2603:10b6:8:151::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.31; Tue, 22 Apr
 2025 15:28:42 +0000
Received: from PH8PR10MB6337.namprd10.prod.outlook.com
 ([fe80::5aad:120e:fe7c:ea88]) by PH8PR10MB6337.namprd10.prod.outlook.com
 ([fe80::5aad:120e:fe7c:ea88%3]) with mapi id 15.20.8655.031; Tue, 22 Apr 2025
 15:28:42 +0000
Date: Tue, 22 Apr 2025 11:28:41 -0400
To: linux-trace-users@vger.kernel.org
From: Kris Van Hees <kris.van.hees@oracle.com>
Subject: [RELEASE] DTrace 2.0.2
Content-Type: text/plain
X-ClientProxiedBy: BLAPR05CA0002.namprd05.prod.outlook.com
 (2603:10b6:208:36e::12) To PH8PR10MB6337.namprd10.prod.outlook.com
 (2603:10b6:510:1cc::10)
Message-ID:
 <PH8PR10MB63373B71A8B64D158F10ED9BC2BB2@PH8PR10MB6337.namprd10.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-trace-users@vger.kernel.org
List-Id: <linux-trace-users.vger.kernel.org>
List-Subscribe: <mailto:linux-trace-users+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-trace-users+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR10MB6337:EE_|DS0PR10MB6994:EE_
X-MS-Office365-Filtering-Correlation-Id: d43dd8c3-eedb-4491-a72a-08dd81b25d4f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?/bKlcPxKjvS1DXg5wMPLeJPIzPtzPr7BxRNZc1BBGU8F8VFs/wi1XKd7x8Fz?=
 =?us-ascii?Q?9SMDYZ5A9HMFh/pYFfziAl/Hv6HZvJewn2GjgqfkelpF7SSlcLX1zEaULxzd?=
 =?us-ascii?Q?h6wfYInECACi8kucOu3ZsNffMpfeYMy6Yy0ssweRbHdPAJ0yTQhuTtWWwGDi?=
 =?us-ascii?Q?Kr/ILH/e0aY3CbknplmCtRgQsJdb1HRorkX4XXa8yxWvy7qaoKOHVelvJby5?=
 =?us-ascii?Q?KhzMgNnl9M2X64rFD1k1iNCSRcSSKgpngEiAEs7SpLQugUTIlyl17szI/0cd?=
 =?us-ascii?Q?zQ87gAarAJLAFmM4BA0RlJBMzHNCIWWnKKJ4okzFBXKabpR4R3nAJkqFL72p?=
 =?us-ascii?Q?dGL8FLEgNxpfq5Ji3NFhfklbLAcZMxM2qSLVlvyseGJctSzuAB5dJ9FF6nRf?=
 =?us-ascii?Q?3nzNGZA6u5Rpyh7mywzhP5NTKE08BZv7NirQI+2oLwFliMLaAI1hhR5WcXIW?=
 =?us-ascii?Q?ZA9/o/dJkuVeDRnaSWN43GSAfn34UdLAAh8xjPRZyCoUGYOx0dym1wY1zIYM?=
 =?us-ascii?Q?NkeDQ0aIZ4jCtoe1kM2Br7wbKslA4ReAAEEa6Ywz38TC3vV0Wwg9WpVNyder?=
 =?us-ascii?Q?yHqJyLbnLw2tWysCNoWoKJMBfKUXsH7WXy/rUh9idY5PTZPoNUVhf+LhFGOT?=
 =?us-ascii?Q?mI2xXe6+o0FFw9Tx6FQi2Tc1ZHwZCL7JPbZGws482SLMqRkgetPAerBZXQbK?=
 =?us-ascii?Q?cLZLgZ3h76tQGJ/p5UoSugxe/Xu2+pqeRThWXydV2V4HbVPIL+JbV1rCZpWb?=
 =?us-ascii?Q?NHhlHyRB3nwLEm/KysneV1gtntcAnjQrK9i53gQKAllHaOxDigd26rK2WzBg?=
 =?us-ascii?Q?b6QDKtLhB6TSIFRZBLB1lRF+43Hm6w3o5HUnAQnVPLC1bCAzVQp0etZ8uKY+?=
 =?us-ascii?Q?qOVds4vs65ynyA96jussa91cYQbUy1Jy4X7S8eu9d6uIk19i9IgKAIRYNDNl?=
 =?us-ascii?Q?kT/T8Adt3iujxQqU5Z+fNNq+76p+5ph73qozpCxAKW0MYBUKSEfTDUO2hApD?=
 =?us-ascii?Q?AK4v+4h0J3IWHDkxDiDX6IWhJ/h20RDNMW4qhz7UbWBSfpM7H7M2+UvltxqJ?=
 =?us-ascii?Q?+WlqYIVdkOqxfq8DBw7HhrRkIBr3E7Gdxn1SZkWOyAlpArd+eED2BIRWtEFc?=
 =?us-ascii?Q?LeyrXyPjSKcCsYn2f3eXENo53RHQw2PUcgJmc1cGMKexX8n3J4QpgKAMZ6mW?=
 =?us-ascii?Q?7OpGUOVXiQBxx4lwjSVbphPog49UyVV1a6AHeKLQ7x1Ftqt9duYIX4Q6qB9W?=
 =?us-ascii?Q?MQsjcrkz5+nKH80Ct1jocVX8qx6It1h/3fn49oI+QOlccODUzOGbct5yE0gI?=
 =?us-ascii?Q?GR7vbhHpm+sY0OUyL7Vy9e0U7kjg7HhooCtpsGgKy+Rumk0DO3JbCzgRD3bc?=
 =?us-ascii?Q?w6EM9PvdSYe8H5hGjwAcD8DE3tnEOZT3Ej+XvTEEP41ynutEpZMSwWOE7FJW?=
 =?us-ascii?Q?UUEegjHkptc=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR10MB6337.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?sIi2qwI3yk9bCNTDwi5n5/PS3SP5qHgqkGAEWJgKQ+deJrdxD10MpufwVTBG?=
 =?us-ascii?Q?bUFUZwoAmTYZdCM+mkMt3TpaPDrgst3Ow/PMli75x9h0gtghX6O0C5vOeXI8?=
 =?us-ascii?Q?8cAVrRqhWLogp0K2DwaT8DjHm16QBAQy41RDTVsGUxycAzMsX9ivtdSRTqK3?=
 =?us-ascii?Q?kKzceDqnhqJAJmOHnDDB8AZd2CWQsNWx7RR/1ezHVoWakycamG8u8PPv79cH?=
 =?us-ascii?Q?mR6+jHCxKL+vJafZhmWG+w0NCILJZVfrqb3+YMkDBimwIxttSCb0AYRbDS/C?=
 =?us-ascii?Q?9NszNYkLBSPfvik370O5LfMH1UU2T0UP82z3fnXvDkRj8EZ/NIHhsdBgYhfz?=
 =?us-ascii?Q?FaHu7udeRydqENjPt7OsbAhGE2I/gBlTk7nRqEXrQsMAnU4FXZYh2ocnrbA1?=
 =?us-ascii?Q?m5W0aIXbvp7rC6tTed2V+EsywPiHAOq4emfL8U4l8nvSLlzLCEYd/DmUuPI5?=
 =?us-ascii?Q?G4JyEA9bjVO9IKVGY1nJZqzHF7iwtHOvvwOuZGL+I/Lwq6S8jl/XOnLBpe6r?=
 =?us-ascii?Q?dYPPxPeOl1GSWqr/haG8SD/Q9DT/6/UES0lxH1eEo6UXYfBSC8u1I++/uNWZ?=
 =?us-ascii?Q?ZAISb4e2a4VnJ/kZoN7YwKC3RFA1lelmmfdOZSXVrEILkzVC7TOxhWXkwMUS?=
 =?us-ascii?Q?ZhsqfCD9f+bRSCAtxJ64eV62uhb5ighUHkhbTjgFnbveBOkccVFU7aNJuWxM?=
 =?us-ascii?Q?hl5GVRtawBFHJ/oEIPKznlcuSay4LwYubElBHSbe48/K4+CA9MT49JWO277A?=
 =?us-ascii?Q?k0C+MnIzNtVwV3wS02EWaEIqORe6BUAKwC76sKgqxkFGn9Ne+NpOpYrMvieP?=
 =?us-ascii?Q?t8yZ5He7wk8uRpKe14YmEI3WnL8Gbrr2CUNIB6ztVGNgnY3cYtToeWmGOGAb?=
 =?us-ascii?Q?AFwdNkt5celEXquO0yfLJFoMdjscbAvxO+m29uKyamyrN2cv2r3WMJkyo1mm?=
 =?us-ascii?Q?1QBgqg8W1oMJhVbdVJ8XDEzMZEPz4RXS8cJaWlx7nyE1A9TvfUFGQHMjN2FT?=
 =?us-ascii?Q?28H1Xp0hidTLArraE/9ZmwPGjJ29u+uVkHHFlv6Ar1zIazWhxPQxQnaE0j/H?=
 =?us-ascii?Q?MuDeQN67jtlxXrM6z/3/vm/0Xb9Fzf8fx+d2+Gspfub5iSU2BbKEZwPA8W1P?=
 =?us-ascii?Q?fHpANgZ5BQo1tq82mztIXNj+NeWYhV+owuSb/lO6K6MOKV08wAhS0hu30bZh?=
 =?us-ascii?Q?L9zAXHTthu/+Z/cf7XcFwmy2x5rZLC8KHAl2bCvjiOoDD4UGs+9s9h01zAUx?=
 =?us-ascii?Q?BSHuMVjF+xkq7lKmxAZFebOcmfpFisATY+wjyi62LMS/QKjxgPS4C1fV3Bn3?=
 =?us-ascii?Q?4/ZqjnUIIclwEihU7wmfKcMDRcR//yifqNc1K+fsJQC8uN0F1A1JdK8/PUOh?=
 =?us-ascii?Q?PiG7+OAPQo+Qjdr5y5B/BzigluRaftAhXZGNNvGmSNcoYQd9tbFwNJPPFOpC?=
 =?us-ascii?Q?UZWwU0Mw0pYFprtEo5Q4s8Bbl31UPQ0NlJMQbKEnSYe6X1F0C8b+8ZG9SxhG?=
 =?us-ascii?Q?7k04aUpMCQ3uAQHTiDJTyzea2NN9Ao1l0n/zhv2bRyskfIUzaRwNdre/9d0g?=
 =?us-ascii?Q?oUrXEFXwxFI5uPykRpU2pDXjbjS2jIgtmQmoTW53hulxVXp65LBfuf13H/8F?=
 =?us-ascii?Q?kA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Nkzscf9L53wKqoHabRPQW3JMgtUqe2SO47sCsd9lQP8Dw81qheMtemAwmjanXv+qH0vWAqHRbJ65saAXgkMrAwa4pdUL65WByaMH8Bw50wWCixhN/wuY7GLOp5jYb3Rmnl/7AzDsSXo4lThrIB5wvahXlNUo2lJvY+a9cSb/NDcGvJtF9tWay/v5NRw82W2Wk4Eg0kktemceHusnzzzHItyfpbIFobOHSqcD0C9Ab3HZyoqU6znVkNQugIwVPYgndCQP6AwkPKbTSdu2h0Q9ecgTIu4FL3zglqdBaH0uNKqzRzjYdgmUr50gpNxcwACnR3D7YM/Sz22zx7W8enFeNTSLHukjc14nE4WKywvcgrw/UbNLw0Kb4bfWJZZkzqctK7Uro15L/8mRQjxDgnTssEYJsS0QgmFBgEQ7iSIhx+TsEjG9PPvEE45uuChm+BBkl35J/FeirN/QoG03eiNVYLeI2z8PNp6wLqJVrKwmgpqlu9brC82UdO1fq2wSG/Jn4sozG2t/RQxBDW2AZ2wzmaUDdO7WtPISKiZmQiqnVRF5CSTmPQFlWM8WfUKectvKOObEnSwwQtYGGyBZpoHTLIxOPFOhmGWERgkxvmoQivg=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d43dd8c3-eedb-4491-a72a-08dd81b25d4f
X-MS-Exchange-CrossTenant-AuthSource: PH8PR10MB6337.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2025 15:28:42.7887
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QWpPwLhqMKZHyGMwO0T1xm1LBL3AbaIbVjoyrO5l6WOG86Jlay/zxBTbuldk91mBD0ab1qWAKxCt739C+mAGvNCPq3xqhqIpINbBEtx3dS0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB6994
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-22_07,2025-04-22_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 malwarescore=0 phishscore=0
 spamscore=0 suspectscore=0 adultscore=0 mlxlogscore=999 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2502280000
 definitions=main-2504220117
X-Proofpoint-ORIG-GUID: -bneZuLelo5d4wpcGbSaFmV2OPUGeCuu
X-Proofpoint-GUID: -bneZuLelo5d4wpcGbSaFmV2OPUGeCuu

We are happy to announce the availability of DTrace for Linux 2.0.2!

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

The most recent release tag is 2.0.2.

FEATURES

  - Providers:
      + cpc: CPU Performacne Counter probes
      + dtrace: BEGIN, END, and ERROR probes
      + fbt: Function Boundary Tracing (FBT) probes
             (Using fentry/fexit probes where available)
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

      + [NEW] fbt: return probes based on fexit report return value
      + [NEW] usdt: probes can now be discovered after tracing started (if
              wildcards are used in probe specifications or with the -Z option)
      + [NEW] usdt: typed arguments are now supported, incl. translated types
              and argument mapping
      + [NEW] rawfbt: Function BOundary Tracing style provider that always
              uses kprobes - it can be used to trace <func>.<suffix> symbols
              that are generated by compiler optimizations

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

      + [NEW] print: enhanced with argument type info

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

      + [NEW] Installation paths for all components are configurable.
      + [NEW] Header files for USDT (sdt.h, etc) have been moved to avoid
              conflicts with projects that supply files with the same name.

DEPENDENCIES

DTrace for Linux depends on libctf (part of newer binutils) -or-
libdtrace-ctf. While libctf is preferred, building against libdtrace-ctf is
still possible. It can be found at:

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

