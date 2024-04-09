Received: from CAN01-YT3-obe.outbound.protection.outlook.com (mail-yt3can01on2137.outbound.protection.outlook.com [40.107.115.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E6CB156239
	for <linux-trace-users@vger.kernel.org>; Tue,  9 Apr 2024 17:27:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.115.137
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712683631; cv=fail; b=MB5p/F8oSbk8pucgbpeqtJIRF+qlArBqErjUw63y3Ixiaj5SoEOEX0u0ehJbL/ETYqutvSa5npWgSMIQMib8FfpK+ki4JUb964MJdwzYWDy8/RH5eUv/MWW5UwETSFlobdE7WLMaedbA/P6qVO7/CE0QH/4HU4vHkOOA40B+060=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712683631; c=relaxed/simple;
	bh=e+aBW65XZELlhAoVc/RiMunU7sTa00JK1KjSW9cdADE=;
	h=Date:From:To:Cc:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=JZ5yTFDTJPd3NfOsq2D3G96odS9pslAEI+GWbCxyZg1E/RZUjNzG8hLs890731HD+UxotALjipyvP7dXPzhvWlVavvRaLHN3WC6K+bKSaOUZHCU7MbrXwd4GVvGoHHm/4zhXeeOIqFvGONE89euvr1YrrqOoevD8BS2a0mKBOsk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=efficios.com; spf=pass smtp.mailfrom=efficios.com; dkim=fail (2048-bit key) header.d=efficios.com header.i=@efficios.com header.b=bzlE/HTs reason="signature verification failed"; arc=fail smtp.client-ip=40.107.115.137
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=efficios.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=efficios.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=efficios.com header.i=@efficios.com header.b="bzlE/HTs"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E0qEKUqg+DeF72Swz4mpzoKQyydUGZbsGmnZlKz2meCvn5PWUOBale1/IisFINT8EoKtCiui0aKBQZAY64rCxi4+45zSepMfDNgz4pd48rDZo1CcQKxh+UoEEbROCCjNtvdGXXIdPOs+kZEErqTkuSir8C33Lq4GB3zzzRtIPso9QcuPTZgZDUiZu+eWjQsaVKrDRWH3La4w7lu0fhA7Y3I0Iwrm9b+RoVT9FfyOOOK0QH22WgBKdvHJ5Pwy0G/w84mCoqOnysXUfQj496bLrNK3oam03pocWb+Izek0TbGJKS53TeKNHvLD1OGrsMm6mjYlJNWpBz6NI2KaCwFLtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GKezckPMDZIapW6SQjFGGO5D4Whg2xB4lyanaRJvZNY=;
 b=cmAIJ0wxinhTJgzBpLlUfdLAxOVz/fCiIT5R0/qlA/JPDoDZsyZW4Sa22YscFbc7urq+Eh8i43W7FuHeXK/dWZovRvNxu6Uo+6WgwiZdW/TbPhdR3u5Lep/AhwSRn8p80Uj4s95jxr9MkRpmWWaCgIerzto+NMLji0EE1ymJoW6ozPo6IJGj1EZ6CvmIxyNXPYzeYTF8qygP98TBM6BSC6u3kIHU/PUBzbBZRR6f9ZLxlIJL6SUDbOJLfUCw7Ljfycpq4pzxkQX6Kwf/mDDWrVQKZ4/5swwpjxB22xronOrvzDSdodzQGBxqPuC9tnkHf9pRGAIQhyYZfTGUEMohuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=efficios.com; dmarc=pass action=none header.from=efficios.com;
 dkim=pass header.d=efficios.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=efficios.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GKezckPMDZIapW6SQjFGGO5D4Whg2xB4lyanaRJvZNY=;
 b=bzlE/HTsLLPbFHN64W6L3JmQDoDDECcqBci1SLDoFgOCgS3taIK03NU79e8BmfWWbCoABTzuAyeFk+XBeheR7vUwSlVglj1hxYjxjCSkymOJID5ZnzbjUaibmODTnHi7t1XTOOHvaxhpsrjT0FxJLBL3wSeYj2tg+TSUQTSjoHNSF2oozgikUrlsTtk1ckUdT5Y+tWoWDI0CKXthjvzHr6r+vM1UOfPUgWWB7oTenY4Ep5SWdSeQtJo4UDjfeGc3n9DejmgSaQOr2nlyTM6A6eP3Om5d0cUNW99c7kjHReVNQDEqFkBqBIq54rTNyMn1ExauFPA8aWu3lr5eWQVvsw==
Received: from YT4PR01MB10709.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:104::10) by YT2PR01MB10291.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:af::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.26; Tue, 9 Apr
 2024 17:27:04 +0000
Received: from YT4PR01MB10709.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::54b7:87a1:7ece:6ad3]) by YT4PR01MB10709.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::54b7:87a1:7ece:6ad3%3]) with mapi id 15.20.7452.019; Tue, 9 Apr 2024
 17:27:04 +0000
Date: Tue, 9 Apr 2024 13:27:02 -0400
From: =?iso-8859-1?Q?J=E9r=E9mie?= Galarneau <jeremie.galarneau@efficios.com>
To: lttng-dev@lists.lttng.org
Cc: diamon-discuss@lists.linuxfoundation.org,
	linux-trace-users@vger.kernel.org
Subject: [RELEASE] LTTng-tools =?iso-8859-1?B?Mi4x?=
 =?iso-8859-1?Q?3=2E13_-_Nordicit=E9?=
Message-ID: <ZhV6Zm4b_8mFS9qA@efficios.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQBPR0101CA0179.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:f::22) To YT4PR01MB10709.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:104::10)
Precedence: bulk
X-Mailing-List: linux-trace-users@vger.kernel.org
List-Id: <linux-trace-users.vger.kernel.org>
List-Subscribe: <mailto:linux-trace-users+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-trace-users+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: YT4PR01MB10709:EE_|YT2PR01MB10291:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	WJbwhMTPkqX0D7LazeMC2D0LNd5RcJ12VoC2Oi0z/bosLssTG6PiFUEl1cE3l68I8YAcHCQQh81VxgrlGjbwKj4akTa3LYhSvN87IJNHni+k/SURxP4XHH2JmQaVXUFFwoutgVquEfHICxhfDt8wqCZsNLk6K151fuddC3uNR1iAcVQOW8tdNmyO2TVwGZLB9hOu84zxPkltdsEZwrDp4Qk+fW0rZKHHaMddPDOdbYPX1k8l+qQMndRoCkRuyc/GrdRIaqoWPw3ZdA3GfwPzwYiVmkj4U5C4L8ZA24y32t3AEu1dbIKS3OMh3G1FvHuRbfJPiKLHFRTdqE0wRsYsEn5/reg4xQI1cJ3Hp/enC4R+WQBmvuK1pgeTL+L9PCW0SR8KtWytnsCu6eottSL/v/AX7f/kkcLFma+IC2Ogtv162tfWoztyXDMn4HYolAF7RZFVWZfAU/KZL0u1kCDBHoDKin6FlybjA9llBKNl1GDTQr295wARvE/EvmgxYfrC8p3uUcBSj/TVVd5Tg1VI4vz0+H4DmycAH8RkFVcTeTOlfCcFVIsOaWYd7PxVMVGqfpUaKyNAWB4OmPWqGNB9kXTMvEuA9UHUa13PASrKvWw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:YT4PR01MB10709.CANPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(366007)(376005)(1800799015);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?u7Fk9N3EIErHbpUr/4iv6viVDpjn0U+cyiXf+7IdYvEjIAhrT7UaDO1uef?=
 =?iso-8859-1?Q?fKC4jhhCDkXpCC5u37ZKKs/XSTfDwYw2amgG3D0k9s83yVUd99qu2tbnC/?=
 =?iso-8859-1?Q?6ZBUiYy+ABA8M8zQKNBk54A57xbEFD590G2XwDRJW9jlzAOszuzb1NOJcD?=
 =?iso-8859-1?Q?KKnaQCg/wqrrna0PpNAqKi6ty92ouB4CuQNp67huCNwSFveeL9kXHSja6+?=
 =?iso-8859-1?Q?KR3gOTBCGDZzwrse5v44aP7oRP4h9cfCFFdSpRBPMXImYDIH5PK1a1s/C8?=
 =?iso-8859-1?Q?EIv2Nsj++bkvXkAm3YF+TtcWUhRyw3H86CSnXKcAi1uM55bwvac4B7uTOE?=
 =?iso-8859-1?Q?cG0jgFXsRKPRBMeTNPbtHN/2zGLezSeAfJ5p1lov5K2ki2g3hy6Plv1N2V?=
 =?iso-8859-1?Q?ltGGL9A5G3ukAWlG4Q1nAPhZ4KXHigD6JwwYFKU/vUjJ5as1UqjsIn88yN?=
 =?iso-8859-1?Q?wbV4qdIhyYDps+z2MJmCqnGaF+qIADluqANJVfEhHAsHjel4FpiHb8XaCJ?=
 =?iso-8859-1?Q?qDlSmh3yJbKyqcHl/WoeIzrf2EvBCvENaPTmrbCym7T41BCMlBsP3qGUPi?=
 =?iso-8859-1?Q?4Gg4YZmBduh5zYpdESzfbC7qJLawvwRMoBcoerd+aS8OuoWi3PUh0UTo1F?=
 =?iso-8859-1?Q?JcXl/QCXheh1pL750lkM8Pj2LzjceWk/tlc7f/Tk4OTcPlyDEyXeXyB5Ka?=
 =?iso-8859-1?Q?pBALGcqT11dx5gBSgKTRsOH/fA75pE2CPzTMOZVZBvjJzw/mbIrzsEBUAy?=
 =?iso-8859-1?Q?0wcvGJlkqcsHrdzjq3iZ1FF96MqOYWe4qQc02mg1dNU6rOaseP0m7d/Z7V?=
 =?iso-8859-1?Q?D5S8neuRKFJu1e/pPux1PpjfIE7/lo2vymCmzl+8rlF0NO86nFggeDwrsw?=
 =?iso-8859-1?Q?bJXe3ton2Jj3FIXvLxoulZVT26fHmmn1Ip/G4QieI8VncyEawWPPjJfpq2?=
 =?iso-8859-1?Q?vU2UJ2VGE72CuWKZEWe6CN5HIZMdhhrnF5EI+d6wcS5xcJ6tG6RV2wBeu/?=
 =?iso-8859-1?Q?TK0vpwwyXCXE/+cbCQo3yEFLqBWELgRP11WC8mzfWH6YAbAv+D6NfnibGu?=
 =?iso-8859-1?Q?UftbTfR1EAtwcohrbPcg/0RbceNKyDDioQ91RBih1/mI5/MrM05ghh81nS?=
 =?iso-8859-1?Q?VVa874ImVMddLZNhLn0LYRb+DthhrUo3jkHfnUrORl5PA4RNY17O//e0ig?=
 =?iso-8859-1?Q?Hft4FeOPSiimdZk3x4gjOjpMLMPR2XhQbi3QNzviVvUYuWy4GEjGGFF2d4?=
 =?iso-8859-1?Q?c0m+5+6nJjk3HLAQ6RhlyH9ne+UEBhR3yLX2j1MCgCp7jsPo8pj4yTBTWL?=
 =?iso-8859-1?Q?bpcpJAfsR5tijdW7n3P/T/yNGQWuWbewX4t3hO7+m+2WZ7BRFnOxeDCZvn?=
 =?iso-8859-1?Q?lqRg5ZIZ0du7XSeJ18aCHh3udIQjkYObRHdFO1kYVwy8oA7fVcWfNN4w0J?=
 =?iso-8859-1?Q?UPy6iPSn7j1xspDUnEUf8fgq2wKN9t5M8o/4eJseqULy6uapjoRHRbM0ZJ?=
 =?iso-8859-1?Q?0rE43e9Uuzz25vpbwwSYMWMV5X2l+SfCYnIZuLoxxK2x+f+UZeS9gYzd3n?=
 =?iso-8859-1?Q?ZqzIa3z3QgggNg879mh484IKi6HkJsOQ6j0scC/1nBoOA7+zICIbXI9X2T?=
 =?iso-8859-1?Q?xgd7R6HJORGY+gKh8QwqMCJKIz/YAdQ9MW?=
X-OriginatorOrg: efficios.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 54e47c4d-562f-49e2-389e-08dc58ba45f4
X-MS-Exchange-CrossTenant-AuthSource: YT4PR01MB10709.CANPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2024 17:27:04.2073
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4f278736-4ab6-415c-957e-1f55336bd31e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GKHm8kg/qJHzsjR3nYvNvUktzewg15NlVgrGDOv8BFiq2EJb0QczanYqQd9KXllxpSvJqEPSZ/LpwDl1XsKl9g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: YT2PR01MB10291

Hi all,

We have just released the thirteenth bug-fix release of LTTng-tools 2.13 -
Nordicité. This release addresses a number of issues listed below.

2024-04-05 lttng-tools 2.13.13 (National Deep Dish Pizza Day)
	* Fix: consumerd: leak of tracing buffers on relayd connectivity issue
	* Fix: consumerd: wrong timer mentioned in error logging
	* Fix: consumerd: type confusion in lttng_consumer_send_error

As always, please report any issue you may encounter to bugs.lttng.org
or on this mailing list.

Project website: https://lttng.org

Download link:
https://lttng.org/files/lttng-tools/lttng-tools-2.13.13.tar.bz2

GPG signature:
https://lttng.org/files/lttng-tools/lttng-tools-2.13.13.tar.bz2.asc
