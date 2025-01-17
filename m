Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D21D13AA3E;
	Fri, 17 Jan 2025 18:14:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737137672; cv=fail; b=TtZbiwKKYcq9zQFRWISRm6L/2jtZaAkQWTAtgYbzNEirbErGa0WbITXoVU3lm8o7NUGcA9ym/bZQvO6kTrPIXqSAqqs75Mu+G6Qs8XOSOnHEjUhUUvz6Q0Wb29AhajTxTgg90vj7SV83KVd5j7lNdL6VWjNPbhPBRsU/Q+iETu4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737137672; c=relaxed/simple;
	bh=pbO495l5K5l9W7IBtl7YRly1C/TwkxdwRdHg3cfc8CQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Ftw2xiKP7bkDYxuIEc+kObQ1kyT+zlX78Sk7R9FdltWNBfbj14INBOd5Cy41k9K20dUh5xKGcNCob+H5oi2B4HFEYy45XV9AyyYIfJiI1J6NqfI/5yLw4Wh100P7JuAoT1Jl/gT6fQN/1RejOPjhqPZ6TOFAkw9lb5+suQL4npI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=X+2JsZ5A; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=u9VivtlG; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="X+2JsZ5A";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="u9VivtlG"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50HIBpgu006945;
	Fri, 17 Jan 2025 18:13:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=43k1I6YdEJKHh9SBP6
	xG5W8fXUVvd4B6ZANKpB72yDs=; b=X+2JsZ5AA2dPZ7M4g/tgA/Kjusv8YqXUzq
	wSlIyZ2NWu276TIVcwuBmlxs5f4oDT5lQO2AQ4ObzJOqtMNvsGVhpGPpaEVR/mRk
	7KDW5xMr8Zn7J7qyT4h7xdawtmZCOVQQcu6cYkYqpzkpojFNMA0UYA/no8ckFcLl
	RMdpmJrnOEZnUhbKz1zZQwA5la6bH3z3mOUgY5NAIgV3djZM9M17W4fllklrMCQ5
	TyF9Peyy8phn9CBbNjKpe5sUlos1pogJYDVMPRGx43jN0DtOLB9rc4DKL6q+E0iL
	H+eB+eLWK+fkiqo8qnpHLVSVm4i3dfx9Z5i5EAms6oFyJ5gNIg6Q==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4475mfjjtd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 17 Jan 2025 18:13:54 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 50HHdXpB034819;
	Fri, 17 Jan 2025 18:13:54 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2177.outbound.protection.outlook.com [104.47.59.177])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 443f3cetgb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 17 Jan 2025 18:13:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JF6bKT8j2HG18+uEJoXibg6FG0DqmoVJLo4xq+I18ojsljFaul7778Jmzi6b17VoivICq/IcATHQ2BS8Img++AGVen1qNSVsVUWkLVehUrXvIgX/nIKJJWEaXLg4OYohMeXmLmWo6wdWfLPt+MyYo+Eop5s3V3860Sj1KGyfd9osURxDmmqi9HHdZ4wIysOud9cLEfJdC0ruGJM+PqFaD9ES82nY/HH8D7eMM6lg1G1f9yVgxQCy0RsK3R+Oq5x+bYIg2g4fFPakVJS0Zowgqd/w4iriIL4LO1yDizG8Fg7OiI3H2crFxnsMTi4gAKsB1LnFeFHgQMZcvv/bfpo5gQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=43k1I6YdEJKHh9SBP6xG5W8fXUVvd4B6ZANKpB72yDs=;
 b=SBwJMQmWeQrhLm/MUKZlL4tCKA3cxPkjtA4KXltjwImEJcVoR+VNa0BHsaldMk/tahCOID5nSEiJxNQ3SmfV2gNjUwZET3NpizbcMWKMB3kdtZMB74fNfotByYtOb+BK+cP09IRLgCgBY2sDPT63C7ka8QfNpIvPbAQ3iLfIh5K6fDlhODMIEjs7i8BDVS3r3/0k4Uaer3XPv2yGkfleWLi9KFpKmqlgIcL3FpYCCz2rRJjDE4KJ1/FQRxQ6479wwALCe6Usq6rVTrxaw7p5Ml/B/aIqX8C4bmLGmACDjGThW5CJHSuWTQ2GL4aZ2WqzBUgQ4IAIT0H9Tg6uz9SOhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=43k1I6YdEJKHh9SBP6xG5W8fXUVvd4B6ZANKpB72yDs=;
 b=u9VivtlG0Oz42xFAhOMdGrI4IEFBSHw43c4yryqO7UhnW/9We8A0K6ZnQZ6kEsYruoIr5ALeYq2W0QVperA6co3KNw6OC6kNQJ0DmYAbFGgXLJwEkzZRBZ1cDBH58VIWLYwcU3nWUBx+dTBpci1Se/4KqgfG+iv7HAgsu2LxyWg=
Received: from BYAPR10MB3366.namprd10.prod.outlook.com (2603:10b6:a03:14f::25)
 by SN7PR10MB6500.namprd10.prod.outlook.com (2603:10b6:806:2a7::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.14; Fri, 17 Jan
 2025 18:13:28 +0000
Received: from BYAPR10MB3366.namprd10.prod.outlook.com
 ([fe80::baf2:dff1:d471:1c9]) by BYAPR10MB3366.namprd10.prod.outlook.com
 ([fe80::baf2:dff1:d471:1c9%4]) with mapi id 15.20.8356.010; Fri, 17 Jan 2025
 18:13:28 +0000
Date: Fri, 17 Jan 2025 18:13:25 +0000
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Alexandre Ferrieux <alexandre.ferrieux@gmail.com>
Cc: Steven Rostedt <rostedt@goodmis.org>, linux-trace-users@vger.kernel.org,
        LKML <linux-kernel@vger.kernel.org>, linux-mm@kvack.org,
        Mike Rapoport <rppt@kernel.org>
Subject: Re: Bug: broken /proc/kcore in 6.13
Message-ID: <ecb22f03-ca7f-4212-9f02-cceafb9cfb7f@lucifer.local>
References: <05ea473e-d7e9-4ca5-ad91-ba8c00618fb4@orange.com>
 <20250117084038.79f40307@gandalf.local.home>
 <4fd7e1a3-f7ff-4b9d-9a53-fb73795b5b3d@lucifer.local>
 <789848f7-680c-41a0-8edd-64e8af1f2f4b@orange.com>
 <ef3f7784-7129-436a-a5f7-1630b278b101@orange.com>
 <9f3ba47b-e0ce-4d7a-b60f-e5b8d96b0f2b@lucifer.local>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9f3ba47b-e0ce-4d7a-b60f-e5b8d96b0f2b@lucifer.local>
X-ClientProxiedBy: LO4P123CA0658.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:316::7) To BYAPR10MB3366.namprd10.prod.outlook.com
 (2603:10b6:a03:14f::25)
Precedence: bulk
X-Mailing-List: linux-trace-users@vger.kernel.org
List-Id: <linux-trace-users.vger.kernel.org>
List-Subscribe: <mailto:linux-trace-users+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-trace-users+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR10MB3366:EE_|SN7PR10MB6500:EE_
X-MS-Office365-Filtering-Correlation-Id: d28c1b6e-045a-4a02-ac91-08dd3722a442
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?XdoEjE+klv516O6i4sxSyXlZ2b37srY1HraTm+G2dhX+7X3AGPzvq5SF6PCR?=
 =?us-ascii?Q?j/FI0r4Etj0i68XcTqPCQg6Y9nqaiGXe78yhl35clmHee+wMam9mHBvdsJ5w?=
 =?us-ascii?Q?lOw7g3XHXf7Itszwhwmva83u2mG4ZihmEVN9ln+sqiQ0YQZKRnBoGTnLUMAq?=
 =?us-ascii?Q?Jt+E/zmJMTRmrnjNZs2MPRA49mW0XiydZfEPBakwRGfrywMsg6USuNWvrcUR?=
 =?us-ascii?Q?AWMAPhZhjQnnWtSm04HPeyi7WPe6Vup0voas/fQkD8ihDcbYjvtCoUzk0+c7?=
 =?us-ascii?Q?rGN/rbsGxcPZLzHeduFFwNqT6VCl3QAIYfI4EpQAhZ4gR7BmZHJ4BPXZgH8a?=
 =?us-ascii?Q?XhBAKtXVrqnZFSsowLT61ygLKQRB3BwUCp5VDBhkM5YTH8fEAGtjHrwMbhf9?=
 =?us-ascii?Q?8dbbC3kIjMq8SkTKXqW5BAlbrmokc1lGVzzay2mPi0VHWGKDNS7I5ZiPug1f?=
 =?us-ascii?Q?bDvZOD5FZhgROYgifNZvWsGgVpaSC8o+m+x+KXclxwVMWPJDD6n1MYcMcUp6?=
 =?us-ascii?Q?h82iGZnk2aubm3hJR9D0wF0WhKL5JacPuUDuVMfud3lODPS0vL7qFA43pvSu?=
 =?us-ascii?Q?dl4jAc5tjpupVGftQj8+z4xQuz71v25cYYUDV/UgC7o2D0lW9n9RQh9uvm7B?=
 =?us-ascii?Q?4t7W7ORt1xFbs/iG6lN9dlBuhu8gQtvDqQ21iYG9UNl5k79EuG/1zat2Ema5?=
 =?us-ascii?Q?t908Tt0EDteRr7esWgEG74Fj4mfSPqNBDA97m/76htCPyFEzVqjk6jp8PDZP?=
 =?us-ascii?Q?53UWgz1mSIg2V97ZW7WlPvwTEjAcP57QI7HtdftduKn9bEfUKJcjdsYCn6ad?=
 =?us-ascii?Q?LQBFzDmmoBiFDSLgBBgYqG1mimUL8BsCN7t8krZka/OsZwXz4VDCjoxQZth4?=
 =?us-ascii?Q?1uv3yYB8QQx5sDU5UTwyvLzlrlAJMkFBEpD1XNalTKrQRXUbN9rLxdesPcWI?=
 =?us-ascii?Q?HJ7gp+Ec3eFcEiPKDDIJD+5oCUHS43V5glJn6LLW9c6+lN+3v2vGmOHnf2J8?=
 =?us-ascii?Q?MSTjcUgV11cLWSOxvpPj0NrHYytDzsIpKMRmRndWDC/tu52S/F7DLdVfG76v?=
 =?us-ascii?Q?rgaA7x3d73HFeeJ2fS0i57dpCSdZlG9ECJkwUdxatzg7Mt5FXFiTBxtNBKHY?=
 =?us-ascii?Q?LP3G5WGvkkl3xnPhqAciEx9cbtnxgmrBKa/5eesuUEHPjDFpzZQdHCxejp2b?=
 =?us-ascii?Q?rc2W86GlHBMcYzXw974KMIPjD0kWkXxZMp31RCfiipnURYwFHDH/IfMVT9i7?=
 =?us-ascii?Q?fyUm+5A/hqSzVY1QJ7kZ2ecHckzjFEmTLmuxR3C+zK4u+qQuLt3y/zp3s7Fp?=
 =?us-ascii?Q?QHN+2Gpg3UCHG+lti7BfDeps5K1GbGuXYnpMkNg37pQzlg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR10MB3366.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ulzmTfBpMyMeHlhGy3fX2sX90nyKbTM07IByoZJDKUhB/UjQFTO0bOvpvS9Y?=
 =?us-ascii?Q?r2E229cXOv3ruUq2yEOyF4y5QjvQrWOyt/Gwfgt7A85Qyxoaj36VQ/ObEhhY?=
 =?us-ascii?Q?ard6Tkk2NhUlSWb55DQ7wln/vVPTYvfMFvYIGeSzWVcccJN0sQU6yM1Y5meL?=
 =?us-ascii?Q?bKhHxZCeo+hX2FvFl3eziVb4+B/ok9wUECFK69/mkYEJ8J/C3l/gKCtPY1EE?=
 =?us-ascii?Q?cdLKNV04phq9WXTgzKF7SrQcp4WdIy+jGcJI1oEpDxZoqe0jCyl+EsvRnFR0?=
 =?us-ascii?Q?tjK5tvdxKC9zAS//mjR0Ri9af+6r2luNJyxXwtuFiCi/vVTtZITLqsoyx+6b?=
 =?us-ascii?Q?xROLsCqScfigwSkDMFqE3QXOQyM25+aBiDasrmoyYaCg/eIGOJ9kvBNX1PvG?=
 =?us-ascii?Q?7/Lq3raXCJgK6awnqGtCfaMzSuEoWLvtq9EpGKyLgsCXxyjOc8fqz9x6Jqpn?=
 =?us-ascii?Q?WJ6akWheoXBw8ppl/7DgFB7PkHmE+nTvQtJfIyfVOejEKaerm+h6H1BU3fzV?=
 =?us-ascii?Q?XuGnLET0nDfb3KHVZ9aC9eZq2ciXBVGBl+WGhmR+stHfuaEutdWzOccqem2X?=
 =?us-ascii?Q?c1ER/fQHXtOr5cvx30g6pNPwziHtlgBBLchK0SlG8Znv8APA4Pe9hX6IOytq?=
 =?us-ascii?Q?ZPQQsK1I6PC48GtBVnVhVUVL3Vfz8SMJt98F9r5VDTqhIEeC4GaClqwKkLsn?=
 =?us-ascii?Q?gOCFwmzrJhqCbEfP7yweR4HRkGxag93WCuCzjgj6uUVlAkbTw334ntJuNro6?=
 =?us-ascii?Q?XSORvVefnZ9jJ+/bf8bDtHkO2tjZs4y+aeHwlXzutRJj/fKIZx8OXjle10k6?=
 =?us-ascii?Q?iX9uxxK3DORwL11UshmqHKKX8tJisFcKDnV9n2gPM8eWIZRo6Fl62hg0Qckf?=
 =?us-ascii?Q?85WIbOvQLULNfi/yJUlpPpVsF3C7UYPtir0YY0A/MtwxbJpz9VUJVkXXN3lg?=
 =?us-ascii?Q?R0OIx/EIOGxuifrlY0NERgIUgxJTAIiCPeg0vQROLFcwzr4jsUPcxx1KUiyB?=
 =?us-ascii?Q?GonlrWhsJupb+uxCHz4RRqs78KjOkjZe56b1vwqRHpiy6VCYC4TuCmVDG/Qp?=
 =?us-ascii?Q?OuveRCE0fIC06z5y1Lvz+UE5UIkbd5PgBxeSU5sFZOQUbX4sdzVgGh7u+Iog?=
 =?us-ascii?Q?gp9/R1F8c4B5xH85BGypFA1xQJIm4O1i+5fMCFHpqMTd+ba+t99Yrvkk+xr3?=
 =?us-ascii?Q?BUvuS8+mth/qNN9NtTIiN/2BfPZpnpbcyclhZ1Y/Usz9E0sXIDUK641xCOJK?=
 =?us-ascii?Q?YFjpxzNKN7AgBubPhNrg8JxlENBqDt7tMHJ+Q6OWa+iuT+0gDf5wwb2zBQf9?=
 =?us-ascii?Q?LInMqr3axtofXGWKjrTQyKkR9kwe0WBDadwfDaFo9TaFROBdclzKCvFBHLl5?=
 =?us-ascii?Q?ImFHDKG+WxNspSP4PTyTC+HMMXSg3c95+0mDbVomrOMcUgL4PjnRQOmJHon4?=
 =?us-ascii?Q?T1PwW2w8u2HbdUNb7HYSjrgjRHKGYvyTvGDR13E+q7eNihFI36W+2hsNHLg9?=
 =?us-ascii?Q?QWQ03sIRL+Vge438uUgqUw4Q7p8xQaOHoDA4no/i2CF9m6tsDgkMNOoW8wiB?=
 =?us-ascii?Q?c5hYBlnjTP+BlKzraJCKqUJaVSO8K4m6j2IzRrtUB492UtNUzm50dh9f4au5?=
 =?us-ascii?Q?Qg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	nkOr7ewa4vtV4PeoIa+jy2ODT6Q9XHuQ3OqvOY1nKwvNlXHlQKkguiweIEj2Mib32dloH0dgK/gsAdPoJ11PI05DMQBTONlqhLHGw8AADD+dQnUW1S72RL9teIn8d9voTexGOxILw6VpZRoM2wZ7dldqoVJcK/LQOPIlDJm+gVoG7X+8KVBs5t9jhUFuxHCOVPR+DQZjm0WJ7GlNvU/F5UY1X1c/aTmW15pqON/rDQRDJ0ch4PqcjUIP7OCbcDaYk1i2TOxj08QDidFwZmaRRqOZMU0KHrJLdoTBFpgS2kfmZdlGUYCsCLAnylt8HVSsfFBJfSJVb6a9MQ8jFo5WC75OuXeKN6I3JX4AbVsQo370fHaPx+/bX8SO/7eZlhXywuHhAX1mgTdkdMzqnutu4sMd/3PrIzuwZz40zbMmLMg9pzajuaUzUPQpSaVQucgeTCKWC1m/AfyrGiTFPdVLjr9d9zBux9T9AJ1e0vaK0LmqU5DnAno6LKsEEdnBN8JI941sToUlq9xui3Lke9wsGqWcTYpfBfiEgLlANBQtarifURMTw2Q4niGFCwNZbzJymJ7RexPUCIxbs9v07uJcj7doyISXglWIoaL6VfQb+6s=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d28c1b6e-045a-4a02-ac91-08dd3722a442
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3366.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jan 2025 18:13:28.4736
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hV38Mx6/kZEHTmoAZc2v9MPZjFo+f/Gh3vkPNajFeOkJXXakeWVkZvlX2vdH9bT9u6QqQIzVw0UWIKV8wSHWn+6G/baaO4JK8mPbQJa6lqA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR10MB6500
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-17_06,2025-01-16_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 bulkscore=0 adultscore=0
 suspectscore=0 phishscore=0 malwarescore=0 mlxlogscore=999 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2411120000
 definitions=main-2501170143
X-Proofpoint-GUID: 6_Y6-4vFa3v6zajuMnUufyzYI7Omipde
X-Proofpoint-ORIG-GUID: 6_Y6-4vFa3v6zajuMnUufyzYI7Omipde

+cc Mike

OK so nothing to worry about here - the feature that causes this problem
has been completely disabled. This may not be in Linus's tree yet but will
be for 6.13 release [0].

I think the vread_iter() check for 0 can wait for 6.14, as once the area of
memory is identified this should never happen, but we do want to pick up on
it, with a WARN_ON_ONCE() to catch stuff like this right away.

Thanks so much for the repro, though I observed the 'core /proc/kcore'
command freezing up before any 'disass' in my qemu setup, interestingly!

[0]:https://lore.kernel.org/all/20250113112934.GA8385@noisy.programming.kicks-ass.net/

On Fri, Jan 17, 2025 at 04:31:54PM +0000, Lorenzo Stoakes wrote:
> On Fri, Jan 17, 2025 at 04:28:32PM +0100, Alexandre Ferrieux wrote:
> >
> >
> > On 17/01/2025 16:19, Alexandre Ferrieux wrote:
> > > On 17/01/2025 15:44, Lorenzo Stoakes wrote:
> > >>> Alexandre Ferrieux <alexandre.ferrieux@gmail.com> wrote:
> > >>>
> > >>>> Hi,
> > >>>>
> > >>>> Somewhere in the 6.13 branch (not bisected yet, sorry), it stopped being
> > >>>> possible to disassemble the running kernel from gdb through /proc/kcore.
> > >> Thanks for the report! Much appreciated.
> > >>
> > >> I may try to bisect here also unless you're close to finding the commit that
> > >> broke this?
> > >
> > > I'm currently homing in on copy_page_to_iter_nofault(), will report shortly :)
> >
> > Hmm, actually, that baby ain't cooperative:
> >
> >   [Fri Jan 17 15:23:05 2025] trace_kprobe: Could not probe notrace function
> >   copy_page_to_iter_nofault
> >
> > ... if I cannot insert kprobes to sniff around, I'm a bit stuck :}
> > So I think you'll reach the goal faster than me !
> >
> > PS: For your bisection: the last working kernel I know of is Debian's 6.12 final:
> >
> >   ii  linux-image-6.12.9-amd64         6.12.9-1                         amd64
> >     Linux 6.12 for 64-bit PCs (signed)
> >
> >
>
> Cheers much appreciated, have been able to repro and am bisecting now! Will
> update with results when done.

OK I bisected this to commit 5185e7f9f3bd ("x86/module: enable ROX caches for
module text on 64 bit").

It seems that vmalloc logic is used to handle module memory too in
vread_iter(), and somehow the execmem stuff is breaking this.

So this would explain why this worked previously, and it was in fact ok to
assume vread_iter() should never return 0 (though I believe we should now
definitely check this and error out if so).

I have tracked it down to (forgive me Alexandre, I realise I'm duplicating
some of your analysis, I'm just doing things from the kernel side here :>)

read_kcore_iter()
-> vread_iter()
-> aligned_vread_iter() (returns 0, indicating error on copy)
  -> gets page via vmalloc_to_page()
-> copy_page_to_iter_nofault()
-> copy_to_user_iter_nofault()
-> copy_to_user_nofault()
-> __copy_to_user_inatomic()
-> raw_copy_to_user()
-> copy_user_generic() [page fault]

In discussion with Mike, he pointed me at execmem_cache_populate() marking
the region as not being direct-map valid via execmem_set_direct_map_valid().

However it seems the problem is that the above logic results in the
following calls:

copy_page_to_iter_nofault() -> kmap_local_page() -> page_to_virt()

Which _assume_ the mapping is in the direct map afaict. It's not, so we get
a page fault, which is fixed up and results in the 0 result and the whole
problem.

So I think this code would have to be modified to be aware of such
non-direct map memory for this to work.

In any case it's moot as this feature is now disabled. But hopefully the
analysis helps Mike in the next spin of his ROX series!
