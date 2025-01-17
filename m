Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA87519D89D;
	Fri, 17 Jan 2025 16:32:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737131531; cv=fail; b=Eyp7dlBFeV1eY8tb/Q9459YlZNxxlwReOIve8etuUR33j9LIeP+Wgvvyar3Xu2fsW216AjjNNzU5qclzUwpDidgxPlLTuVpeLK43k6aHEqx8zuRlzkv3gA1FFpmerVhQIubRnqUrHHhQ1kI3o05TaJUMblu20YLkvJ7xLtw+aqw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737131531; c=relaxed/simple;
	bh=p4TIQWfRVnwsd5traGj7AtkF82/mh4Sb37Uqg15TcL0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=uZC+edFL0vfiUKJLVMOK5+RODXaNZUAO+Y+oijLJ9YX+yVbesVAKGza1uvEOzEx+wx7EX6rm33x+yJjTnsmZ3JA0+RUKsyHTset7W9rM0XqxFZ56vCt0GmI9qx4sL70kwR4M73w4i4aVzX30unIdHxOw1ZNT0syFjPR+bU/QCVU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=E+Ez8ofY; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=OtoET54V; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="E+Ez8ofY";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="OtoET54V"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50HEfiBB026176;
	Fri, 17 Jan 2025 16:32:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=Kw3HGzSKEr5zj3aWTf
	N8kZu5hQY4syl0yx1Y3shhYFw=; b=E+Ez8ofYe/CcnsPoCMny3Vn4xbGL+LQOhI
	4Sf04S142ElgohuIZdqeJae5FzlevFOpfnNqLiXIiexrijd0t21HLPTQSEMt4p0/
	5ZmqnsIG/ppphAfmVBqoFnNXeP0hZtGtNhCDR0PrCsRPiaDuQJWKu7qy1JE8kgEK
	KAV/GrOHNNMuQZJzST3ihfJI7b0bjHNe0rC0dDIYLLYWPQ4WAhxWdw6wGGXHrobV
	TiLanJs86f0l5mvKbI1FBD89T4qC+8gjhz2KltM9r8TSNo++IcuJnu0XtwZmkf+2
	zE8jA5YVIUeS63W5Ll0oIjP/RBtjxUBT4cZc3LvQT17gvKNop8MA==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 447830hxcy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 17 Jan 2025 16:32:02 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 50HG6440020421;
	Fri, 17 Jan 2025 16:32:01 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2169.outbound.protection.outlook.com [104.47.57.169])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 443f3jqrf4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 17 Jan 2025 16:32:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EF/Tff5oJAp5LetRpgoXzUVt5KSfkWZyH4Nx2NXuOb9w8wSV6z7J980nObFV9cD05A/53GfsjjrhNjbblHQaIcV0xluVSJOo1q9OC7j8LfKPI5wk5Xv8z7zwqTkw1h5S0kNwzhq5iWM4FyxIzgZ3oc7sAjwMpke32ixfRzSzVgPFKBx12Yr+t1i+NpoJVcjIYzhYuNX+jYK+n8lQcx8ZYtOUqJ76Qu0SFYHDJHB7cEDBqRmbjbCNa/NVgGIW8R8Tt3Ai3FpOcflI83uTszp9fAe5tR3Hu5/muPn6/+9HTgnVQ2KZHgQqlFJVCyJBK1pMMafaCSs+CoH/Z1An30UUbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Kw3HGzSKEr5zj3aWTfN8kZu5hQY4syl0yx1Y3shhYFw=;
 b=j4TIkWl1BYPRpRW5OVwF3RBPQ4YarZmF0BJtLTAwwRxcNBQNAcExXCrj8ojSrpkQWTr7YVx91udZzfPsgzqGHNHsNtVD7Jg5QtOAhbQeeASzeBdkh0F2jYuXh7kjGmL9Re3ZWRdK3TtiPMVPxY4AS+FViRQ3yqIXz7C4LYpK4DKHAHou98V1eeEOqkilxsPzpra3WIbTGiRt8R68GB74aUV4rZKunbRedQD8ccqu26no7vuk65QkG1G32NgQYuueW4GbZ7KdW4ZfTBi5EZI+HA+ViwCqvJDv5+jlW1fJJpU9G/HHfPuiDjmXt0SuAck+cXN2Ac0b+iiV+VN1ATH3UA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Kw3HGzSKEr5zj3aWTfN8kZu5hQY4syl0yx1Y3shhYFw=;
 b=OtoET54VgKeMO3CzHdv7Olb55n/JTULuy+jaJ4U5DWCihle9eMPL2c5rCYrtzPH8VFUNL4Y1zUJSmDy1d1BjN1gHiethbsPlSWwvsomrrptclRzekbWl3iaFAEKwrHcfbFbpq/kqIRQqssgYBiAs/daVxkTa1WL+FvepwiBr+Cw=
Received: from BYAPR10MB3366.namprd10.prod.outlook.com (2603:10b6:a03:14f::25)
 by DS0PR10MB8078.namprd10.prod.outlook.com (2603:10b6:8:1fd::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.16; Fri, 17 Jan
 2025 16:31:59 +0000
Received: from BYAPR10MB3366.namprd10.prod.outlook.com
 ([fe80::baf2:dff1:d471:1c9]) by BYAPR10MB3366.namprd10.prod.outlook.com
 ([fe80::baf2:dff1:d471:1c9%4]) with mapi id 15.20.8356.010; Fri, 17 Jan 2025
 16:31:59 +0000
Date: Fri, 17 Jan 2025 16:31:54 +0000
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Alexandre Ferrieux <alexandre.ferrieux@gmail.com>
Cc: Steven Rostedt <rostedt@goodmis.org>, linux-trace-users@vger.kernel.org,
        LKML <linux-kernel@vger.kernel.org>, linux-mm@kvack.org
Subject: Re: Bug: broken /proc/kcore in 6.13
Message-ID: <9f3ba47b-e0ce-4d7a-b60f-e5b8d96b0f2b@lucifer.local>
References: <05ea473e-d7e9-4ca5-ad91-ba8c00618fb4@orange.com>
 <20250117084038.79f40307@gandalf.local.home>
 <4fd7e1a3-f7ff-4b9d-9a53-fb73795b5b3d@lucifer.local>
 <789848f7-680c-41a0-8edd-64e8af1f2f4b@orange.com>
 <ef3f7784-7129-436a-a5f7-1630b278b101@orange.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ef3f7784-7129-436a-a5f7-1630b278b101@orange.com>
X-ClientProxiedBy: DB8PR04CA0020.eurprd04.prod.outlook.com
 (2603:10a6:10:110::30) To BYAPR10MB3366.namprd10.prod.outlook.com
 (2603:10b6:a03:14f::25)
Precedence: bulk
X-Mailing-List: linux-trace-users@vger.kernel.org
List-Id: <linux-trace-users.vger.kernel.org>
List-Subscribe: <mailto:linux-trace-users+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-trace-users+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR10MB3366:EE_|DS0PR10MB8078:EE_
X-MS-Office365-Filtering-Correlation-Id: e760c228-a0e7-4909-395c-08dd37147743
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?y4FCMfwxouDS8jf9TlXed3QFw8cFt3ClRjJC9B+BqMCDkEXqXlsKVU10+ex2?=
 =?us-ascii?Q?jrOEOIriGTXeSFssqMIX1LPzLAPAEUEI8bWrzrw6PTSNarfiRqKx8mJCunoe?=
 =?us-ascii?Q?JW+2HtphgDzm5CAoZu98gmwb0yx/jtX4TlqBzVRbrM5LqUEIzrwyOvPnHb7B?=
 =?us-ascii?Q?ln4n1rSne3j7yu16TwrpPddA69GBWIJONrcyJeUt6voZQTWJqIxB3fZ7PN48?=
 =?us-ascii?Q?nAsJ0aFdqZyUV5ogt+iqN+55UJBYECRTKUKQvNjBFej1XsACpaCP7FrjDRsL?=
 =?us-ascii?Q?b2PVEoOrouHXeSKx/fzaGEO2hJ9gLigC3rALNZIu/nOhV9sIiw/BNDCMlPxw?=
 =?us-ascii?Q?/Uofgp6dlyNMFWGmTo8GuCoNZuTWg2aO10Z0yW+Hi4/9ME7KcsUB8NybKnj3?=
 =?us-ascii?Q?eSK0kRluWwmGAG0PK1kMyh4FhQkS0F+M/RrpbHxQNUJILvKEFmgn7xJ0K4BK?=
 =?us-ascii?Q?fOo66xpxbxivinZ5ZyIp0Z3IVl43ZbNNWHkzsGBz+AjKL/7tROard9ctEoHw?=
 =?us-ascii?Q?MeO2MOtdrxjBE+8nU2IA1uRq1ZdNT865yDYyqD3hWsI5G2BMbD0rrBBmg1P/?=
 =?us-ascii?Q?L0qlrwLvVXQtEdTT7yhg32CIt4sF+O6x0hUV3+UFGOJnk6TIshF+litE2Qvt?=
 =?us-ascii?Q?uxmewKuufKmQhNWbldKt2hglgJcYdx8ICHgPIQEqv8t8i7dg39NwRiu06dGp?=
 =?us-ascii?Q?nVJcCg8y+wEIpqUG836F08yx2aPMfwdp9cdqYC9JUi+mg/5BYpozfbJk6+8j?=
 =?us-ascii?Q?PQEtBDKbopd6bMl9JoOGUCwKxZ0uLp9k8UmXncH1ZzfY2/P7kUC3PrGttheQ?=
 =?us-ascii?Q?lyfvP/sVN+FXhdhjg3mny0xtMrVMzPljd9jb+kAvqSePwntxz4aWLxFa93bm?=
 =?us-ascii?Q?qePaBk5Auvno5j0LJ1MY2KpbPGPr1pfQqbYatO9mYVi7tZbFyNCP7/pFNsj5?=
 =?us-ascii?Q?IHEvmALmV2XpGf/0E+bF9e/jKkfCa3/JQ/RW/Gkq0gjsFL7Jz7ObAmlVJvLY?=
 =?us-ascii?Q?xX9SBKaqop9h6z4BHZCPDHZ87T9AC4TyE/UjO7GXkv5kBAGba3aPwBktcmsY?=
 =?us-ascii?Q?9QbvABTvo1v/XTqSMQEupAHdmVEy2l1RGfdHUzeZX+wLy8NVihNZpKMzkd9H?=
 =?us-ascii?Q?Zjtu1Uf5nk09dNyunEuy5h0zabhYNguJju0XtR/1LaS9NT5hfyGFjJS+XDxv?=
 =?us-ascii?Q?zw0lQwkMri9FqONjukm9IutVJZ/MgrN78CYmsALvP4NBVPkbA33rtBymLCTD?=
 =?us-ascii?Q?RHox6d7R1WHog3A58NxBAkAab4k8Yiqicp/EN8Ef2C0BWtMqaI5q9+FRjuGP?=
 =?us-ascii?Q?EDragTbWhOewJvLJAd8GMFSLFJqHP6MhUD+Lm3/bHW78lkWhK8Z9FG9r2XOU?=
 =?us-ascii?Q?ZoWjHn2YKiM0sNNZP9Y0Ha4w8SFX?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR10MB3366.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?uODxmDxkWFVw18ncPWRnYx+/ediUwPTSaVWElp/WCVrkt+zpwzSwKZ34TuEG?=
 =?us-ascii?Q?zeVxHdUNHslEQS/Po5c2ItHQzi8wqDvId8I3p9SJB34ijx4YYXJQuG8yrwGI?=
 =?us-ascii?Q?9jxl5ADn8OK4UkMPOYSThpXK5+YhaI+Cq3lpmLljzDi4VjBQRyyKwKdNQD0p?=
 =?us-ascii?Q?Z16KJuUbfxq6cSq/VkChkP2vGiXcfrNrs2T4Mx0iDja45tzdQH/tVvTp7b83?=
 =?us-ascii?Q?pj/HpkjtNKaVhJuKK9irYq67u7fM+S+pUaiZZvCT7VbftQ0Dgtnq/vc86C43?=
 =?us-ascii?Q?ee1TPZFHYgbz+OVMNbJoGb/kPrGf6KF53G24Rfva/xAhaTp4/Jw4dudGlld/?=
 =?us-ascii?Q?h3whpOeLRzI4QYrPYDoFPhWLFQCLxk3P0DbncLXvo9Kcd9DRwDeJTTImqI++?=
 =?us-ascii?Q?1+lO+OHsU/5LXEZGaKFtZUFKeWkoLqJ/bY1ZnMILPnSptGHhcTvPhd2rh/ZG?=
 =?us-ascii?Q?WnaAwPym/SOH+8nrxdXfqp2AObsa6pWmn7eKeDD6BpeiDmAgkyoWxyEdHsZs?=
 =?us-ascii?Q?r7qbJjhUsvHVTBeNzyeuo5X599v3atICHxi3X8Pu8mvgBshVdOkUq/PzuT7A?=
 =?us-ascii?Q?cZUYVDR/XC+LtohDNjmx6EM3b7SJcdhbC7k5M7eOckmRlB8axWZoCG0vpv3h?=
 =?us-ascii?Q?Cgp0wunakgQ0VLaMMm4fGn70PMHB12ZGbIss4eDbknPcLbA3LErP3hS0kSf7?=
 =?us-ascii?Q?At7u7eLDYVe9JaIpq1RaRWzDU7/kI2dPxWjMsj+a1Y9Yaf8biUs3m50+B4Fb?=
 =?us-ascii?Q?XpD/038uTYYLvxopKAIz0hQevSflzNiOXxOvUvCGDPaF/MuypmXc3HhHBmJ+?=
 =?us-ascii?Q?GRziqcFyGqcr8IEgLT+H0GW+Twp5sZEKF5sfi9Rm9U3ueuWzGK/FtEy3MwVU?=
 =?us-ascii?Q?+2Gr/cf8jvrq02/iVtB2vmAjjGiZIuZhXfp/+SFtCH9W96qIDaPckMGTzOVO?=
 =?us-ascii?Q?6kK7GAJfd0p9JwpnM/IYSbuhfWWjwCFG5g7oRDNTfBThEd2KSi4VJHG0BX0S?=
 =?us-ascii?Q?9bjM6804kiJqhbpWDtS0cX9/4mO+nlFgXt5fnyOTiMlFtny/HlCZY3V8a0oH?=
 =?us-ascii?Q?QlQSeRzciaLiiQk9Zats4JGqhgdqx4cmVhml9QU9ttV+v2qne/KiE6yrBeVv?=
 =?us-ascii?Q?4MWei9Yv3qSUUmmQIrfY155iJrCsuLJ4amFj+13+lpcU6Ia4J+1CGJtEkcud?=
 =?us-ascii?Q?/vLe7jqSt0SLvmOPL3GSOylPo/7W6/3K9B+2ClysgwvdU1yb4cmugczloOZy?=
 =?us-ascii?Q?BGXva6YU/xnz8Ys349LwO7gg4jqjBsRO+18fWDlZOvVBv0vwCd0vL9bbmzda?=
 =?us-ascii?Q?K6h5UpzSBEmgyDl2hIkDYwHIEdtZdL2YbCWeXZBRQmwyMGSqU3zIPL81aW3T?=
 =?us-ascii?Q?xxzWpKKG1iufrE0ehsHNZui+HiIyBvXPK2af62AIKZrg20LFXMhXu21TxL9h?=
 =?us-ascii?Q?+sACvicPZ6ueHi5rNxzwcZogk0BV0D5PHB0VawZ4j+Ds8flEhX6VqgaH+Jbu?=
 =?us-ascii?Q?gV9+Vorstx+rOAC+PjLZX/V+C++PbP2aKmh67WgR6La3zMddK9eD/FXx1+UX?=
 =?us-ascii?Q?XLR6LiXc95Oc5IZ9qYiVVFklV5K0sDgjLIUWi5cmEyjtXs6Jo8XQBiHHBWzq?=
 =?us-ascii?Q?4g=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	zwZoGmVX1QDoTgzXf1kGikrGQn8QboCa0u5ZoW3oaEjnctM/9kYlEsVjKaf50YCuFgKJVXAcyWuuWPP+D7N40jeCXzCmHdnyr+rU5KSCSIB4nWa3hqg/cDKu76WEIn6J9PSB4JhtSvGPKgCtoonuMwAZErcoAmdMKi6Qm12KKrIc0gbry1gOB9nOsjpEVVfnra7YwF7jK1Jw0Jxxr44tKVUAIV81YhdDpEZOeNQwNyrGFdsM0QEyRbYmB1pXYEdKvCuVnHC/95x14t1BDPGjun/VSTE+RKOQUo/OfP4veuMoUkGQrLE4yb/XWt1pW1V/d2EBWwy7+/wdLB1ljyhsQEvuZKehICsVwMJYDLssaBHk5YNymdpZV42BJPoUDQDrrAZvx1RUGs9dPnanlcUtdD/+1vD7myAC+ERXguZeNZvssYVay4YZ8TTuV1QrzAde8NTW5bUmXhRwZTX8OiHTiK+ss3Cst5elcevXxj9cQPSGKLfNm6umdMqVk/ZQDMfNvLFK6+lVSMwPV0rkLiobYxqvhOHCWYGfev4Cuj8ElucX7LB2vRkFWL0/fjeXfYOIRgXzPcLNADR0idi2Vjcss2lKVSrlr9SdqcCpQWNfpYc=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e760c228-a0e7-4909-395c-08dd37147743
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3366.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jan 2025 16:31:59.7880
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b2+EcETHkamGmChNwHYCtXBderbjCaZQ95i9hGmejhnQRtz7X/CbpJCkrfwIKIYcS24sSezcGhMfxdJYKqpwoizsixul3XGp3fugxNVOCa8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB8078
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-17_06,2025-01-16_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 adultscore=0 spamscore=0
 suspectscore=0 phishscore=0 malwarescore=0 mlxscore=0 mlxlogscore=903
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2411120000
 definitions=main-2501170130
X-Proofpoint-GUID: XAmKGFJg2icgJX1ey9ESdEcWXSWH9RqR
X-Proofpoint-ORIG-GUID: XAmKGFJg2icgJX1ey9ESdEcWXSWH9RqR

On Fri, Jan 17, 2025 at 04:28:32PM +0100, Alexandre Ferrieux wrote:
>
>
> On 17/01/2025 16:19, Alexandre Ferrieux wrote:
> > On 17/01/2025 15:44, Lorenzo Stoakes wrote:
> >>> Alexandre Ferrieux <alexandre.ferrieux@gmail.com> wrote:
> >>>
> >>>> Hi,
> >>>>
> >>>> Somewhere in the 6.13 branch (not bisected yet, sorry), it stopped being
> >>>> possible to disassemble the running kernel from gdb through /proc/kcore.
> >> Thanks for the report! Much appreciated.
> >>
> >> I may try to bisect here also unless you're close to finding the commit that
> >> broke this?
> >
> > I'm currently homing in on copy_page_to_iter_nofault(), will report shortly :)
>
> Hmm, actually, that baby ain't cooperative:
>
>   [Fri Jan 17 15:23:05 2025] trace_kprobe: Could not probe notrace function
>   copy_page_to_iter_nofault
>
> ... if I cannot insert kprobes to sniff around, I'm a bit stuck :}
> So I think you'll reach the goal faster than me !
>
> PS: For your bisection: the last working kernel I know of is Debian's 6.12 final:
>
>   ii  linux-image-6.12.9-amd64         6.12.9-1                         amd64
>     Linux 6.12 for 64-bit PCs (signed)
>
>

Cheers much appreciated, have been able to repro and am bisecting now! Will
update with results when done.
