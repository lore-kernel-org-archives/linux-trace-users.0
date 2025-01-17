Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AFE713CA81;
	Fri, 17 Jan 2025 14:44:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737125085; cv=fail; b=KI/cJshJ42yWLUjwha/1kuVWyxRikFc/EmqrqeZMWBptgPnA7M9DNEjq1FzZo4YeQoVvLw+z3uS1q97c+h746wlk6Y34QxMgZG5dHfJ46bwG/Q4rGN48C/DVgkvTKGR8ymA7NAVz2MqUgsVZbQ2a+zzQpepPmOUZ+SiceaBC9X0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737125085; c=relaxed/simple;
	bh=e+vgDtwoszztHHBozTGaliYOLRq50hlPuqJXDuNGS6A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=a/8HzTD1Yvq6flWtzDMWoip3MI0jdBAy+nAgoSKQgSqFQ5/KRI0bHm/Ww9ekdfSYNUMp9SQ73ou2H05M44NIllyBAHOeU4jJs1Y/yAiJZjoGbvO2yY4H0K+OXUEQZxS5zxNMh0Vq16zPbO9I3ZwFPg2WHHbtDHU381W6eCxkJWk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Ei5vVpsb; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=Sg9TP8fM; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Ei5vVpsb";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="Sg9TP8fM"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50HEfj2x002170;
	Fri, 17 Jan 2025 14:44:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=+T1DoqoLtAZq6nnkR2
	wO7ev+oD+dESw0ZgohqhxJ8TU=; b=Ei5vVpsbBpnbTOKdue48Huj07lkks45sGX
	WBFrEO5ZItyLlUxx+My6jRevYr6xGjFrRlznHJOC9c64I/TV28SwhXQak3/N0KZb
	xvaxeTtAaRuxag95xjod443vWMZWKsNehs2gV0KXH+UM33+H2/lq2vGzqspsBVJP
	xXXlfWlXLnm+hrgYMEx4FhwC2bFXZ9ghMBl5e5ZckreqKf20qKo7Wr5fKc3FX07L
	QXjnNG/0NYbE/lXY7EJamRatQkDnrAWSQJii8VQninwMHtRAa9EYWgbflWl9YoDP
	uRMLpI850IWJhfcVh6dF2d/GYTju03Xf27lCAZldnLTiQRLxokJw==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 446wtpb0wm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 17 Jan 2025 14:44:10 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 50HDbPZI004567;
	Fri, 17 Jan 2025 14:44:08 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2170.outbound.protection.outlook.com [104.47.55.170])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4473e6e22s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 17 Jan 2025 14:44:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i1FUOJzVb3OXfrhLhC6fzppZEf67E8/2CKKvAzAafiVqLnQWxzulmLy2cLRt+09CZBQwHQwN4W86WIbNmqkHM5eqsntdCUcbLaTa0LiWigGCYPVPPcXwanzyhf0TI9/kFWHasqI+hWKqtdOc0EHUdSfdbFzOTp/JbvAcJrBffXAyO0ZGtoOm+3vRhw9BFiMPpn8v3hc24jAXAWJ+QkwbMf+2dhROJURryuGA/etVyOgI9ilP5LJAiu4g4IlTHKGTQBEVzX8gY7gcIVKHcZJ5sthPWQtpYRYN9Muic1dKxtffs188ZcVSLf5P1/qb7N8PuOeKyQKcFfPPfcSV13Jx+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+T1DoqoLtAZq6nnkR2wO7ev+oD+dESw0ZgohqhxJ8TU=;
 b=pH6w7L01InJk7WmI5MgnhIbrQNO8foBayzxReh0xQ+yBUnNBzcGXtqtd9JsOBQv4QAYHBQpRt3wNGW/APnxOgKxNpMQTxgfAowdSMn0phEZa044LhtX4zmvywKcaMliv1Kbn7PcARg+XOrLgnZ3vVKNuO0VngIaso2LHnJQWLSUlll/rKfy4VGnaAaXr8muAXJVah/LXvXoTQ4ccyAQg2i0+amwriddiYrKrlXz2OkxNcJbaEAMIUtWwIS5cGWrdB9/tw0w7GD/Ir2IUv8vI2ewdzAwMskmCXMC0UPQ4GHtgvctfdo4Wm0hjneJ7uxp5Pvqb9Ro/08c3JK9v3sYDew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+T1DoqoLtAZq6nnkR2wO7ev+oD+dESw0ZgohqhxJ8TU=;
 b=Sg9TP8fMDnC7+Kq6xRutgYNM3t6ZVHP/3cuH9soJNhip5AQPYgGufDZU/x8Y0Mfu6C9Gv5EGhhdUBcH7BySibTZdSmNXWif93hlpmxdU1qbP7OONCcWlmqmw0uyXLoLtEX5sKfjyQYe0CO+IhsIZ7NMMkiY0Up2EqADnriMqMoY=
Received: from BYAPR10MB3366.namprd10.prod.outlook.com (2603:10b6:a03:14f::25)
 by IA1PR10MB6784.namprd10.prod.outlook.com (2603:10b6:208:428::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.14; Fri, 17 Jan
 2025 14:44:07 +0000
Received: from BYAPR10MB3366.namprd10.prod.outlook.com
 ([fe80::baf2:dff1:d471:1c9]) by BYAPR10MB3366.namprd10.prod.outlook.com
 ([fe80::baf2:dff1:d471:1c9%4]) with mapi id 15.20.8356.010; Fri, 17 Jan 2025
 14:44:07 +0000
Date: Fri, 17 Jan 2025 14:44:04 +0000
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Alexandre Ferrieux <alexandre.ferrieux@gmail.com>,
        linux-trace-users@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
        linux-mm@kvack.org
Subject: Re: Bug: broken /proc/kcore in 6.13
Message-ID: <4fd7e1a3-f7ff-4b9d-9a53-fb73795b5b3d@lucifer.local>
References: <05ea473e-d7e9-4ca5-ad91-ba8c00618fb4@orange.com>
 <20250117084038.79f40307@gandalf.local.home>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250117084038.79f40307@gandalf.local.home>
X-ClientProxiedBy: LO4P265CA0108.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c3::10) To BYAPR10MB3366.namprd10.prod.outlook.com
 (2603:10b6:a03:14f::25)
Precedence: bulk
X-Mailing-List: linux-trace-users@vger.kernel.org
List-Id: <linux-trace-users.vger.kernel.org>
List-Subscribe: <mailto:linux-trace-users+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-trace-users+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR10MB3366:EE_|IA1PR10MB6784:EE_
X-MS-Office365-Filtering-Correlation-Id: 65c1dfcf-9ce6-4d5d-b469-08dd37056542
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?7dGRotIlfOZBCBn8Gatkq6fezsilsvfyn17WlgF1qE/bsiVffi5vYNpgJY1W?=
 =?us-ascii?Q?DbB7TEJ7wKASbUcpDvCGtQo8XCYy6xhxhyyFOZrhB1Ae+L8IeLUMFx2ZjT6L?=
 =?us-ascii?Q?Qxw8LBAQWtZj51Davunf5mVCrZLyWP+mzhi8bPbL82MP9R2a0RnfD3eOvUtY?=
 =?us-ascii?Q?EycTCYTTlfPQyeSuHBjHJeluXAbJq1eUR/3rRTNQmDmL2Li8vT4EvxZi5ba/?=
 =?us-ascii?Q?gOUOWoiMnUpeo/1I4qjmMDB68mekkzgwvX07Av9bjLzZvRIY8YSpDvMXRXg6?=
 =?us-ascii?Q?Sd92F9wOp+l+TlFgrMsBVHUE0eoT69nINssF8Z1AyxEtDpoiPD1PTZpJUOZU?=
 =?us-ascii?Q?6aB7+X0JfK0dg2dtT8QEr1zA9Yr7xs5ujpRb3mlQsGXny+8ZjqqbJbPMPtO6?=
 =?us-ascii?Q?nI6qZ3kLuAnVNBFErgDaE2NWvaW2e60HSuDsLXmDJ0p3NnpWCWpo9kn0s8/i?=
 =?us-ascii?Q?shS2XzMCeJrUZzcwQbha3hOutpNExcQhglsF2g0I89ClNXQmIqzo2dOxepVz?=
 =?us-ascii?Q?1IOufK5hIbM1QyLFrI6RdEFNmplxVwVFnkO3sfANNyLX5AMN5Q6BttTRmpQr?=
 =?us-ascii?Q?TbeBpGDKywtHnOoBeN6eAe3ko8zZ4hFkoZNRD59wOHkGHiomHDa+ZyoLUrN3?=
 =?us-ascii?Q?jSBiJlC5Y7sdJO1mAodQfri0K2Z5UK8RAJK1rGBwGubS0AC177DfkX6PhFPx?=
 =?us-ascii?Q?pyxNLj4c0SgpoK6JhSN4rXjPckKsUOrpx+YNB4W8s2nehsWswJOzU9NStdke?=
 =?us-ascii?Q?GPy2lRsu8pC5vHdLL86JV9dgQfFccrrbWUTrcY7buVi59syrHoRK0N0l57oM?=
 =?us-ascii?Q?ebCsxF4808VW/o7oU+E23Q0pjZRHJjv1D8+cIx/bwv+9kOFBkqFCWznxT3Rf?=
 =?us-ascii?Q?BJpGwKHdE7MOpWC18j1pgx80N3lLcyLlF728O+3KDAwDYaSXOHY2o4UswDiT?=
 =?us-ascii?Q?w0kApot9YrB/xZ1rER3X2JdloBIuNW80pSMLoy/8Kjv6W+hbYTNOAM8qWmmm?=
 =?us-ascii?Q?bFergo1y+cGzJ6p/la9Ksk/RrDOywmyZ+YGPN1b3S/KUKqAKPQZnT+TVlzxI?=
 =?us-ascii?Q?DHvsmwLy1Fg87ts7gCKBS6N9s4Cr/JdmtOQQgOUo1eae9Sy2XC6XBVBx8PwF?=
 =?us-ascii?Q?GD4+pprpyKsov7EbQb//X8JPNw3Q6AOF/OwzcIVOxY6Jkh2mfvkz/tHyo4T9?=
 =?us-ascii?Q?HQhO9va2CIt4x8UPfNv5ZjfhFpfck+w/m7bKrgCMcEGnPWgVI2A1gem7Oocn?=
 =?us-ascii?Q?5ZO5Pct6l4sLK7Dv0NkrsFav0+HZA/4hsusTZdmHFAsSud3IazDTj1OiaLqe?=
 =?us-ascii?Q?+hyOtcR7s8VXbArQqVB+gEl5TbT7K9BJQdZy4YwbD+j2K1NVMXFdj79unuQx?=
 =?us-ascii?Q?gz0xA8aqx/U5fsj7Uc0NO8uc/PcP?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR10MB3366.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?v7nwwcuYA7xlzY8KmmMDB4yw3IXN8CHfn+4Vo6RZQu3mLlOO5PPbLGUP1EhJ?=
 =?us-ascii?Q?VTivL0s79qFmngl8Jf44aJM0Yj2w1FadlMjJfMf2f4fm8W9iV8gFMWho+dpT?=
 =?us-ascii?Q?JfIm6KTDdeUhgJYDNTZWYPiI919ax5N7qlqim5a1l7Mdva7MWQGutkyc+mDC?=
 =?us-ascii?Q?s6OwlQ2QNjpLOeNceeAU/spo6WtUf2qnL7IfcX+vXcDh2fw6ibfAgAyA2WDW?=
 =?us-ascii?Q?P+F9uJNxAHiy+6NrKljra8TLTk5Dxl5MBiuiyB2lzvKQyxS1zg1vm35ClSDs?=
 =?us-ascii?Q?cIzMfR62/k8c/7q1v1oZseuEOanaqMn4D+JAADWKT/ABDBQZzUq8ZcXNIO3+?=
 =?us-ascii?Q?jimq9Mkcy/uIe3ST3p48PVuQJAfvpKoQ7PUmDFamHqOfQH42sOn/9sxn2d7I?=
 =?us-ascii?Q?SO+BEgtrhiH3AwP9N5oWzqt58Z5jgS8cwSi7ygKNfPv9pZFXM+owOkBxoY6o?=
 =?us-ascii?Q?3CeVUGEDPzPiLtFlulR0VU9b4lETPBJYLlBdyKkuVJUDPhTZHv5T7idUEbYN?=
 =?us-ascii?Q?WEp+vIY7ASQw1m7aiFt8i9O5jo4Ng8xxk5T2InZH/zk3c8NP7tPEsY7guk9J?=
 =?us-ascii?Q?sphaGQSfgF/qqAo8Tg8515sMiNYfSZfUZn0O+Qi10GB99KrW5KpKZuj4tVca?=
 =?us-ascii?Q?/u8eT56t4irGJeE1V8SLK3vufzX/plByWTsI8UxIiFDRR4P6he25RtaQMtSe?=
 =?us-ascii?Q?MDE9WwYssbwiAs6sXAYUQxYjk/lJgXFFY4VMkuQ9oqe+vjli9+9pQa2E1B0Q?=
 =?us-ascii?Q?nzbaamZHYQuwns/4cvsl0dhMg1Crvp/i+b5MdvyOoRYSGnRiEFKkmwJOBADp?=
 =?us-ascii?Q?0XBc/wZimZo9cJcCn6/D0DrugWex9SHDf2wJSa+Y8BpsGy3LdpitoZ04l+S8?=
 =?us-ascii?Q?dbSgUzo527H5yuL9TAO3ZpRQgstbP5pLlCSDwpfClcfTaTsZYFP3p4BqN+8g?=
 =?us-ascii?Q?GJ+iyrExvAbNWYJdBPMtulLhjWTNpsCUUrFXfVqWtVXmglk/zz2HOhKghDL+?=
 =?us-ascii?Q?hUW9rdYNwai/o7WMZLgCF31U5zb/dy7xBeoskR1+BhO2lMp3QwDAcnxEsygt?=
 =?us-ascii?Q?dmsp99atO6pgAoggHcR2P88RpXtKm4ntOJHBQqrp4nFK9pUuREzBAuZ+qrgJ?=
 =?us-ascii?Q?+j+bTvezbQXIk2CG4wf7ERB0JNu4LAmJTc+r/N7pp1MCWpYoddFR2QMXLjT2?=
 =?us-ascii?Q?iTWiOJcLNo8URJONEgLHiVqX6jFzEB7jHpcASnAT7Eny/6g7D9uaGBLBvkGb?=
 =?us-ascii?Q?t4v+uYH7xdH0kuBhSNFVqSucM+C13xB+RzSiN7wpjCfGChtcbkItQtsE6uNw?=
 =?us-ascii?Q?XyL6/uz1HZMPQzuj1PoR34hLkU6AIKYvYzMlZGeb9HaK5bQkt5Lfcv9C2yGY?=
 =?us-ascii?Q?he1c2/HA5slQaVyu4DQx8Rc3chx+N6WjO82WtR7qnNqgJUYhswGJt1Rqazm/?=
 =?us-ascii?Q?t1AFRxt8Y9yNH5XHrmHuOHj4laNtZKFMp1ncGODfih/R2o62w56aQb2oO1vQ?=
 =?us-ascii?Q?UeKMgB5kUFfiRuf/L7FgEv7ezY3juuo61WqNCzzRGDEC4Xv7w5ytsZaw4eji?=
 =?us-ascii?Q?H3/TL+Ikc3RGGGU3bNmUYiWnPnxk/D5hriOJaCtwQ0Dirf5N/JwKTNO+UfBy?=
 =?us-ascii?Q?zw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	AJ+59trEw3JnePll5Lh6zX5npEID/zIhRoK9UrNg6JhftXMlKlqTqNZCKpwgWzXFzsY7JuknWOFSvU3/oBFc8nAo7GS8idHtP7pyUtRUKprxNJS1mCnpmXsx5PjZ3jwv9O04/HQcp3za697aWWWXSMPw3bPAfQO8uL9keW/qpJtihLKkIvxV+lGVad9cRja+0wWpeQYotuCGu3xCgU36wmWaKm+ZOUnGY0K/1LZ3+eBrgptdgH4XV9xsnMokVArWJ1Wjtl8d28THAPNAqohIHcpfetOaEXHp6CfdNWPYNfcisqtjzvskpbnjkWqMJc56VrRLmoIRLTHj4RDbXoACtIEUwgMY8oMc+0S8dAmElbUxaRs5FFs+FYrO6ZhaD71c3EJESNXRm/aYqRlPCYSWd4MncGDI6BTgK010McpA01jmPoEi5OwWw75/1jePVx8eD9/Bs2+FuDWZOEuLrI5blMyS+tp0Z70k/CCh3kWToUMsv9o+rF659+L2e7tOrbr55MhL8yCpNfYFFotWdG8m3HmV6cnBl06ZAi2n/SB6twkJ0MAPCms+N07JrdK8IM1nwjo0sYbDThjfRvi5sMF/SUIYQDzhA9JtYeIYJ103nm8=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 65c1dfcf-9ce6-4d5d-b469-08dd37056542
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3366.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jan 2025 14:44:07.1430
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Py06eXwkcjWXYN0inUNn0hnpOH8rxoO3YFS5r9+PPH7xRkKX2yyNq8819g71/HNUrThSpl0dSbgJQfJ8J500mfMtio2IHlmHW7FZ4TnyPPA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB6784
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-17_06,2025-01-16_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 phishscore=0 adultscore=0
 spamscore=0 mlxlogscore=999 suspectscore=0 bulkscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2411120000
 definitions=main-2501170116
X-Proofpoint-ORIG-GUID: 4Yo58bIqHZU8KDCVTcRQAQ85KtCbJAnO
X-Proofpoint-GUID: 4Yo58bIqHZU8KDCVTcRQAQ85KtCbJAnO

On Fri, Jan 17, 2025 at 08:40:38AM -0500, Steven Rostedt wrote:
>
> [ Cc'ing the proper folks ]
>
> -- Steve

Thanks Steve!

>
>
> On Fri, 17 Jan 2025 11:36:05 +0100
> Alexandre Ferrieux <alexandre.ferrieux@gmail.com> wrote:
>
> > Hi,
> >
> > Somewhere in the 6.13 branch (not bisected yet, sorry), it stopped being
> > possible to disassemble the running kernel from gdb through /proc/kcore.

Thanks for the report! Much appreciated.

I may try to bisect here also unless you're close to finding the commit that
broke this?

> >
> > More precisely:
> >
> >  - look up a function in /proc/kallsyms => 0xADDRESS
> >  - tell gdb to "core /proc/kcore"
> >  - tell gdb to "disass 0xADDRESS,+LENGTH" (no need for a symbol table)
> >
> >  * if the function is within the main kernel text, it is okay
> >  * if the function is within a module's text, an infinite loop happens:
> >
> >
> > Example:
> >
> >  # egrep -w ice_process_skb_fields\|ksys_write /proc/kallsyms
> >  ffffffffaf296c80 T ksys_write
> >  ffffffffc0b67180 t ice_process_skb_fields       [ice]
> >
> >  # gdb -ex "core /proc/kcore" -ex "disass 0xffffffffaf296c80,+256" -ex quit
> >  ...
> >  Dump of assembler code from 0xffffffffaf296c80 to 0xffffffffaf296d80:
> >    ...
> >  End of assembler dump.
> >
> >  # gdb -ex "core /proc/kcore" -ex "disass 0xffffffffc0b67180,+256" -ex quit
> >  ...
> >  Dump of assembler code from 0xffffffffc0b67180 to 0xffffffffc0b67280:
> >  (***NOTHING***)
> >  ^C <= inefficient, need kill -9
> >
> >
> > Ftrace (see below) shows in this case read_kcore_iter() calls vread_iter() in an
> > infinite loop:
> >
> >         while (true) {
> >                 read += vread_iter(iter, src, left);
> >                 if (read == tsz)
> >                         break;
> >
> >                 src += read;
> >                 left -= read;
> >
> >                 if (fault_in_iov_iter_writeable(iter, left)) {
> >                         ret = -EFAULT;
> >                         goto out;
> >                 }
> >         }
> >
> > As it turns out, in the offending situation, vread_iter() keeps returning 0,
> > with "read" staying at its initial value of 0, and "tsz" nonzero. As a
> > consequence, "src" stays stuck in a place where vread_iter() fails.
> >

Yikes, this is my fault. Sorry about that!

There was some discussion at the time about the infinite loop, obviously with
the understanding that vread_iter() should never return 0 in this scenario
(where we had identified the _category_ of kernel memory being accessed), which
is obviously now rendered false.

The fact that it can is (obviously) rather problematic... obviously we need to
patch this, if this were possible in real scenarios in the past we would
probably also want to backport a fix.

In any case I think we need an explicit check here no matter the cause so we can
never loop like this. This was just an oversight at the time given this is a
documented behaviour.

My instinct is to error out if this returns 0, because that would indicate that
the address is not part of the vmalloc area.

But then it seems add_modules_range() is just adding the module range under
category KCORE_VMALLOC despite it not being in the vmalloc range :/ which is
really odd. This was added a long time ago so clearly not what triggered this
but odd.

In any case, let me go have a look at this...

> > A cursory "git blame" shows that this interplay (vread_iter() legitimately
> > returning zero, and read_kcore_iter() *not* testing it) has been there from
> > quite some time. So, while this is arguably fragile, possibly the new situation
> > lies in the actual memory layout that triggers the failing path.
> >
> > Thanks for any insight, as this completely breaks debugging the running kernel
> > in 6.13.

Apologies again. Let's figure this out and get this fixed!

Cheers, Lorenzo

> >
> > -Alex
> >
> >
> > ------------
> > # tracer: nop
> > #
> > # entries-in-buffer/entries-written: 0/0   #P:48
> > #
> > #           TASK-PID     CPU#     TIMESTAMP  FUNCTION
> > #              | |         |         |         |
> >            <...>-3304    [045]    487.295283: kprobe_read_kcore_iter:
> > (read_kcore_iter+0x4/0xae0) pos=0x7fffc0b6b000
> >            <...>-3304    [045]    487.295298: kprobe_vread_iter:
> > (vread_iter+0x4/0x4e0) addr=0xffffffffc0b67000 len=384
> >            <...>-3304    [045]    487.295326: kretprobe_vread_iter:
> > (read_kcore_iter+0x3e6/0xae0 <- vread_iter) arg1=0
> >            <...>-3304    [045]    487.295329: kprobe_vread_iter:
> > (vread_iter+0x4/0x4e0) addr=0xffffffffc0b67000 len=384
> >            <...>-3304    [045]    487.295338: kretprobe_vread_iter:
> > (read_kcore_iter+0x3e6/0xae0 <- vread_iter) arg1=0
> >            <...>-3304    [045]    487.295339: kprobe_vread_iter:
> > (vread_iter+0x4/0x4e0) addr=0xffffffffc0b67000 len=384
> >            <...>-3304    [045]    487.295345: kretprobe_vread_iter:
> > (read_kcore_iter+0x3e6/0xae0 <- vread_iter) arg1=0
> >            <...>-3304    [045]    487.295347: kprobe_vread_iter:
> > (vread_iter+0x4/0x4e0) addr=0xffffffffc0b67000 len=384
> >            <...>-3304    [045]    487.295352: kretprobe_vread_iter:
> > (read_kcore_iter+0x3e6/0xae0 <- vread_iter) arg1=0
> >            <...>-3304    [045]    487.295353: kprobe_vread_iter:
> > (vread_iter+0x4/0x4e0) addr=0xffffffffc0b67000 len=384
> > ...
> >
>
