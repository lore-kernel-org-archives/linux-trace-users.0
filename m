Received: from YT5PR01CU002.outbound.protection.outlook.com (mail-canadacentralazon11021104.outbound.protection.outlook.com [40.107.192.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F9721EE02F
	for <linux-trace-users@vger.kernel.org>; Mon, 14 Apr 2025 18:50:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.192.104
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744656643; cv=fail; b=tSpcyHiehiefPHWU2XbZ99vXqAbBI0K2bnWLb0YopP7FCAWIMffc1uqmHD+D/n1FCtrXTEIWz+Qx3u6nz26JokEgyDF7KdfYC6anpeF5z0SvROLNjanWfN8L7GVTCfErEeLNhpdPhcxgBWXSvnuQ8kwYeBaPh1uB62L63/PdOpQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744656643; c=relaxed/simple;
	bh=r12XkI4s4CMMCrGysvahCzCA5VUPfQVwve8vnDXvB88=;
	h=Date:From:To:Cc:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=t6Jvl3lHMKbkz91lonoADBc5gxK2i5JJOJ5zRJHaCMi/JtqTVNyCAvrzpnX/AGpOSESp8UuD8JUMuRtS5HwWXd3yLpL6p+wXQN3HdcmQBWFz/d8y1cyJL9+vpMocNDMRohnoGuzDR1s0dDLU4yLSDXHwgWHLexxFEDBpHjaOSdI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=efficios.com; spf=pass smtp.mailfrom=efficios.com; dkim=fail (2048-bit key) header.d=efficios.com header.i=@efficios.com header.b=GIgT0C1M reason="signature verification failed"; arc=fail smtp.client-ip=40.107.192.104
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=efficios.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=efficios.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=efficios.com header.i=@efficios.com header.b="GIgT0C1M"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p3XTh95e6NHyH5A9eKpePRYMpsCAYggI8dw9cbA4jXPdNJl/BTdFTiHGs4oQnr+AbdutSXPL3XFKHBT9/CwhaCVjfbX3pNGN6+Ih9iBeJCeRmOAJTtwNLHUwOdwymc/QeXEZCpeL0Yr7YMMw5EM9tEb8K4aySLVkWKvu6cmPVd1OUlfXFV9Lko8x29eBESmpUVL+HwjWPouYZqhWDXqu806t1OQMw8EvtFYds+jldSjJlXufwWjuLXscYSnpjU0x691QUPsKZMvTl7XJa0ntZtFDrbLWpWFeabUhH2MkRCYBLNJtBVsR+UIQEZtqUkOjEgjPEhRGiraKW+lZcpT1gA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BJxlsWuOqbg3wawDe6xV+qnyXLFTquguKaLP/CJmS6M=;
 b=zViqFitM1PnwlPl/bsz4a0MP3x0oKgLtiVbn/ZHn5yBLIgFfoEDY7QVvMyOYtgZ5LOZafIhbTiczY4n8l5EtY0Xc1rxWMxEk3RJLxISMlcict8cB09vl4QrNjUtMau7q+x0Mres3Uv1Q5apM71trF6rRsWQtQDPClxoFMDE8s9YGgmtR4NzZXtgLaMY23Yq9Gwj18wou3TPAhVZ2XAqe7zjO4BoMEMB0EnzQdstTvnAVUiuQjZyzxH2jlKghh76R/137kglne+0Wj6XQzWkNTHf6yHm9xGrld2JMEDr1NkF/aD5AR4Q0GOrcAurL/d9l8KNNhAQkeJnWpCObM0gjnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=efficios.com; dmarc=pass action=none header.from=efficios.com;
 dkim=pass header.d=efficios.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=efficios.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BJxlsWuOqbg3wawDe6xV+qnyXLFTquguKaLP/CJmS6M=;
 b=GIgT0C1MDkczfLn25kuUbKOlivi8CKtk3aAfL4E49t1/COgsl2Td3BW3tqoJIL6XIHUxLNoXPuFNsLr4vctWI/9I0U/cQV8EN6VLpLE/V+2DeLjS0k0wpibH38BgWP3qskL4HS+7TnVxfs6OWPbrrUE3DCUgE9K/kCe3b7bt4otXW9M/4tuVxxiGFBZFWmhaGAtCi3dKB6C5WwzkLNXok+iN8Dr8JE+LIyuo2TqA1vHp40s+qxIJwbvQ+9wXlL5xQbKdjfnwyV/9bnldnvhlpbBuHg4r64Gu2WxM+JqK7TCeC85ufnx2GFcjgzxAKpf58ct+5FNPvIfK3tlbxzazaA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=efficios.com;
Received: from YT2PR01MB10714.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:f2::19)
 by YT5PR01MB10871.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:12f::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.34; Mon, 14 Apr
 2025 18:50:34 +0000
Received: from YT2PR01MB10714.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::e91e:67ef:3478:44e7]) by YT2PR01MB10714.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::e91e:67ef:3478:44e7%4]) with mapi id 15.20.8632.030; Mon, 14 Apr 2025
 18:50:33 +0000
Date: Mon, 14 Apr 2025 14:50:32 -0400
From: =?iso-8859-1?Q?J=E9r=E9mie?= Galarneau <jeremie.galarneau@efficios.com>
To: lttng-dev@lists.lttng.org
Cc: diamon-discuss@lists.linuxfoundation.org,
	linux-trace-users@vger.kernel.org
Subject: [RELEASE] LTTng-tools =?iso-8859-1?B?Mi4x?=
 =?iso-8859-1?Q?3=2E15_-_Nordicit=E9?=
Message-ID: <Z_1Y-Arx-nSh5wDY@efficios.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQZPR01CA0176.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:8b::25) To YT2PR01MB10714.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:f2::19)
Precedence: bulk
X-Mailing-List: linux-trace-users@vger.kernel.org
List-Id: <linux-trace-users.vger.kernel.org>
List-Subscribe: <mailto:linux-trace-users+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-trace-users+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: YT2PR01MB10714:EE_|YT5PR01MB10871:EE_
X-MS-Office365-Filtering-Correlation-Id: 99f0243c-6896-4980-6c90-08dd7b853cb3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?MwovdY4gI2yXk+15NL9SYDc/AxAACRq0sR9LDTRMPKwW7s+fpQ7haqIh94?=
 =?iso-8859-1?Q?kekBhD0YqzItskAbUQMM0tfS0bl+o9JqaKNkrKQ8szP6XwkDl3Qpxr5Jva?=
 =?iso-8859-1?Q?sGq3TdEbNigDXrFcl22wk+KSAMPzz+4eW5WIbnODDmiBK8gQOeOrLOjJ6k?=
 =?iso-8859-1?Q?bkx3f/Hz4JAtRSHmtqYzpQyyjJJSsaKqlorHhqlN6UzrpTANdpEpTzpte7?=
 =?iso-8859-1?Q?XTX9Bdp8zO2l1YsbWMcJ3zsCO8595CeCE9dCx8htN07kwDoUKFJ5QZLkLu?=
 =?iso-8859-1?Q?qI3cC87sVX944MSeJe8bLW6kjAqzEnq07anuexD6ynWeI995/WmQ4u5BeS?=
 =?iso-8859-1?Q?FpYKfxGNdf0el/XvC+BhsFoIiFVb8G20r8Q4f82D+51IMvTV9Rri5782iJ?=
 =?iso-8859-1?Q?NAfRll1w24kfa8n4+MfQ/l+4DF9iTQlLmBDZ8xQpaBibMVK2mlk6ceQ6i7?=
 =?iso-8859-1?Q?3V6qHe1sksiiNvJ7e0tLsuWnYKL/13p9AmsvuDO5tSLyJYuv85oIYvzTMu?=
 =?iso-8859-1?Q?hH7hHsxo/GM/E5iBRJUNHJ2hS0VacN4QhT70XImcMo4wXbHaCAlYMCtku7?=
 =?iso-8859-1?Q?WnUNMxpH2FJYzfQ+2jGGaqI7qEGc7GQIf3EURsJBnc6AdRoKlVzvR7NkJd?=
 =?iso-8859-1?Q?ij86LM4XqDvIbA762tYNe1XjtOXBQRbH7JhLnX8JyZG9ZzBvguxLzsW9FX?=
 =?iso-8859-1?Q?JtcCjwwVXvk6/Xeymj+UCvrqFQtR4Kte86Gtywdldb28zXlryNqz6e9OXR?=
 =?iso-8859-1?Q?WcEq1pkWJLYqCESd5uRd0OPqY/vamQvX2cJY+X3+YJThHrz5yrIWyhs/1/?=
 =?iso-8859-1?Q?M6x1Zzv1R1DSzeVb5t4AnQVfzje8niaIU/UzkjQUmJjrjYs6deQTnuje8B?=
 =?iso-8859-1?Q?GpOQkyp79FBMqzCbZ4q1XVWV9p6PHqvFVjteRhoTmHhuqEpE5+a+/yc3vs?=
 =?iso-8859-1?Q?1obywAzK+HM9osc8GHELNM9GxI/3biiFiCI+6jPejNMQO7goz6Zu264pih?=
 =?iso-8859-1?Q?nWC0aip7WWmPfKXUjZlZWn5dx68/g9Nln/J0ZiP6UNHfejU1BVVgmJrLXC?=
 =?iso-8859-1?Q?i4ccpuVOcTP6X7/T0ew/1nzCEYOIVBzWRt0b+b0b1XAL5byL8x8RHXUIYY?=
 =?iso-8859-1?Q?Wv2Zopo+XHc2mAMWjQ7Wz8ADleF6V07xI4q8kvzJg6cTrb7rwqeRABo9FA?=
 =?iso-8859-1?Q?MzCZZweKXqp4Clk6tJ+uanG6ZSSI3IdUht4V1cIzFd8Dd4HXDpRFtoYn6s?=
 =?iso-8859-1?Q?5mCLLTbdvB3YPiDmkUbnnckpfwgDCCm5xFNkgCWAYH7nb2mO6Vqf+KDgZ+?=
 =?iso-8859-1?Q?Et2VfQEyWTDPfeWsMg8Dujm2kDwieaiNw1SB9t1GvSaAbD10IwIvkEGWlR?=
 =?iso-8859-1?Q?UiAzaA6NKSxYymjYwlgaVzWk7Muv6onwV1dxX5NGDKJmaiOVC3lXs=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:YT2PR01MB10714.CANPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?gbuAr3Mx4I04jjq+F9Yvm/fcWZhchF7jCnED75c7Jifwgb9iCECGlEjX2/?=
 =?iso-8859-1?Q?lCU38OPv6hT7NYdblAWj9Tct47sn3+K6IqbzmyFqsRqfHj9EjgM4PK4uo1?=
 =?iso-8859-1?Q?LlgpAR8W6iBNaaQdxB0T6773kS8TWJ1ubJcf1vIpi8558wbdQii/MZdTWG?=
 =?iso-8859-1?Q?DZPUxaV5B9Iun1ge+E/tW58wF8wM3Vh/zHcFYFIOcmc3gTkVEr5BNXtQnd?=
 =?iso-8859-1?Q?tSDW4+Mnm4wkr/BKrzL8entFj8lP0kiosoIFeJpY06tVK4UuTd0wNCnW4F?=
 =?iso-8859-1?Q?P9pHMg4kxrpHQRoknS6FzPPlxv1XzoRWXmv/v2k3bpC0FUFLgCj9U5PyUX?=
 =?iso-8859-1?Q?kQEBO7XY2l1O3iax7rVZeVqWPq0c6aA9oc+wSndDUSzkXSMB+8CnHYPQwA?=
 =?iso-8859-1?Q?b6EHIpJCB1/CgVDhdbyBNe2cKZZQjF3uUO4T5j78Wpd7QGKkth9AaU1p+F?=
 =?iso-8859-1?Q?kc/vTAb68/kSxmcp6BTlil2Uv1HRAUV6AS4UxWN0GHxLDyEtzpp6CRha0Q?=
 =?iso-8859-1?Q?Cp3umiaDeJ+WAqD/59GagQ90hQd/LkJpUhkHEN5sEdOGnPap2mYxCxfy1G?=
 =?iso-8859-1?Q?Dv8H+A+aaHVjRzFXAAu4DjYKnq33tIPYCsjzlZK1VSSihTgpHFL5H5jaFz?=
 =?iso-8859-1?Q?Wq+b+uUJYznq+o+q9/1arX3d5t16+w+01DzYzMpAoqHVp28H9W7f3i3lXo?=
 =?iso-8859-1?Q?JbbSfJr8j6UUicnEIuWmLhOY3poZHhwM7Y5J/zCTk9ndA+YBeRv6H5j45C?=
 =?iso-8859-1?Q?CdBD6SmGksrclDfCGVm7GZKbE1JK2d/PBUkrvkDR3pNyVmpDfkz6/8DJto?=
 =?iso-8859-1?Q?8BgD+EoG+2S9++yDlu9+T2k3wqMSJIz00UhnNcJV2CDqEAzgsgqLXchGYG?=
 =?iso-8859-1?Q?zoL8o/gmHWQvA/PGeW5oUDimF4jbeVfBMjVs0iT3YyWqttlucu3ZWnmD9N?=
 =?iso-8859-1?Q?/cCwpMFrjzOhN81oD2rGjnI3VydtmSkk4ODDVU/H1DUDJsafysdIXMtUMu?=
 =?iso-8859-1?Q?SknYWaNNqyAZSNhlKdsHeLW842Q+e8KagovtnY7qFKbT3qUvzg/DAraHJY?=
 =?iso-8859-1?Q?gv+lDHfS6UPJeJMPhqEckS3Gc4328sWkqHn4UJKxihDG7iVBnLZ11APcZx?=
 =?iso-8859-1?Q?wRmNdoq2W459qwFNykpl2ePmZ+l8NG0PuOdO5iDkvublMGd8lsum6n82mK?=
 =?iso-8859-1?Q?myVbm0PBy4fkQKVT1XK4qeZoKq6vhaN1eJVOqr6R9k+c5fFQxYzZXT0zfw?=
 =?iso-8859-1?Q?2qy8WSt4dTdPHMwg1fkLDZBquaFue+pYvZ5sQhkI9EtAVKYULLtJR6DGIi?=
 =?iso-8859-1?Q?Glw5h5awEXY06T/acpHpNPRTT8+RBMYLP7VsnM4ggPHuUODUHieUP3wiLr?=
 =?iso-8859-1?Q?K5rW4xInvuiACL7AzQOOO6T9A9hqb67jd2tbkadc7XaKxtM/xWMQedLIcR?=
 =?iso-8859-1?Q?8L2okCXV56eAmmBXm02bHBONZ8niXOPmky+qWs4xKBwOPjKUdDaBzCZlz8?=
 =?iso-8859-1?Q?3UzA/mExIyA5b9FImkyBKr9kd/Ufa+PXtbqo0T7TM0cKS0PWMf7pVkkths?=
 =?iso-8859-1?Q?1+RXYdf+mEWfCPuEWseN4qsbakl/nIPaxUjAnHJ0NLh5qQzY5is6QcmyV7?=
 =?iso-8859-1?Q?87qxWSnlHateG8efGX548HaAAeD+6QzNEh?=
X-OriginatorOrg: efficios.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 99f0243c-6896-4980-6c90-08dd7b853cb3
X-MS-Exchange-CrossTenant-AuthSource: YT2PR01MB10714.CANPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2025 18:50:33.7675
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4f278736-4ab6-415c-957e-1f55336bd31e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Sv9xa40GsL+aNHEjkZRYkREgVFs1ur4Y9Y4n1mLHPxqH+SsCCdZJg5GV/kQP3gYkpG9L6CpmHkXjS8cDzTfZYQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: YT5PR01MB10871

Hi all,

We have just released the fifteenth bug-fix release of LTTng-tools 2.13 -
Nordicité. This release addresses a number of issues listed below.

2025-04-11 lttng-tools 2.13.15 (National Poutine Day)
	* Fix: build with urcu 0.15 on 32bit archs with 64bit time_t
	* Tests: Make notifier discard count test more robust
	* Fix: Update lttng-modules load list
	* Fix: sessiond: notification-thread: add to pollset fails silently
	* Fix: path: handle truncation in utils_partial_realpath()
	* Fix: path: handle truncation in utils_partial_realpath()
	* Fix: sessiond: assertion on inconsistent filter bytecode and expression
	* Fix: uprobe event-rule: logging mentions pattern instead of name
	* Fix: relayd: leaked socket for live connections
	* Fix: unload all kernel modules on sessiond exit
	* lttng: Warn on session start when client-visible shm path is too small
	* lttng-ctl/lttng: Move enable-channel memory check to client
	* lttng-ctl: Use max possible CPUs for per-CPU memory estimation
	* common: Add helper to get max possible CPU count
	* lttng-ctl: Mark random seed helpers as hidden
	* lttng-ctl: Mark notification-internal symbols as hidden
	* Fix: sessiond: size-based kernel rotation doesn't trigger
	* Fix: Close per-process event notifier error accounting fds on registration

As always, please report any issue you may encounter to bugs.lttng.org
or on this mailing list.

Project website: https://lttng.org

Download link:
https://lttng.org/files/lttng-tools/lttng-tools-2.13.15.tar.bz2

GPG signature:
https://lttng.org/files/lttng-tools/lttng-tools-2.13.15.tar.bz2.asc
