Received: from YQZPR01CU011.outbound.protection.outlook.com (mail-canadaeastazon11020003.outbound.protection.outlook.com [52.101.191.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83AF3130A54
	for <linux-trace-users@vger.kernel.org>; Thu, 28 Mar 2024 19:48:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.191.3
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711655325; cv=fail; b=jwlXqpgcIHpovHViIMmrJ88z2jU5ynYgMoOBvq/CCxuC+5QBfeidVIGFx6v7jBJG7zYh3zYe5GhVwuuf6wxxZkPSCKgXtWnKDGvsCSL8ziw09iTwhZ20afw3lJ5CcOvU/9q8nV70Kvepz63zzLFPtUnetTpTQs+y5HpodDXiAU4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711655325; c=relaxed/simple;
	bh=eBY2SIlF3asYLSNXlbcJLCBkx/ono5ZvKTOw355Q5AQ=;
	h=Date:From:To:Cc:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=i/DV35nI5jFhW3J4kYRdXP7XMWEUByLGeSooPOOZi8Z1rGGSD1a0Fcu9n/tC6M7Ynk+8j5bVPbMEzf8LVHOMojnr07A7a/0mheRTA2/G802KgCF9N030Kh6dDN8dRDWX2B2LVJk/QvZfWK6C1tCOGcE9AkPul4fsdamHYWjy/QE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=efficios.com; spf=pass smtp.mailfrom=efficios.com; dkim=pass (2048-bit key) header.d=efficios.com header.i=@efficios.com header.b=M2/c5KeT; arc=fail smtp.client-ip=52.101.191.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=efficios.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=efficios.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=efficios.com header.i=@efficios.com header.b="M2/c5KeT"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GDXYDF8fdf+mt1BNqGLjVE+A0a0iY80SzaUW7MkSK71qw5MY293jjD0k/imzQlDZHTGdZHJqUh3PGOj0wfvK4ZJUqPkoy0K1DZEBb3iW3sFOKy5ao/upl8DWxyOWOUjxaSNFrwDxk0EFQwaXhk2X/MkuK6GqpeU7TXd8LpDC4n+ZkpC9WjrCeoLDELJI96mGdcHcDc7HmBBg/jOrV5R0gX6FCANZo0S6nM2nFgNpQSYwry3rDYL+tsZW63E8vd2I1OkvIC1/D0xbDkpvQBc61eaz7nlgDL4l6Vi6aJOS7zX+vF3r0PMTNnFfJnOE14i+oqHY9UWNZ7gVImHcgwxJQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7myJDkLfvT7oKblLOWRCUECB28sk7IiGjY7OQIQTbkQ=;
 b=UyaC3Y9ep5iw8dAPPzFjGBz0s0J47fMv6BX3KS2uVz3WReh8bcrydJiLbO/SDmd8SXFNvmUe0AiX+1MUdlrbAd/HUGXqBCal3slCtEtR+Ps9jhlGJHLDrT00DsZx8kwdETXwjzzC1oKVhmoKQl/gYOiRAZsdUSZ41PaIkbcLYh2Rp/aewzpfSB24siNJDKouoEd9oHWWKhQY8nobaS6hKyf4JFFWUBsNAakCbOHjpvrjobuu26fobOM2z8/bsdef8Mn7CWkNRpj1GV9ZFT40SADk5aLxZCLvSZZYsk1kNABwMAReQWSFgyj2WBWsAMD3FpydTcCMYsUu82uG3Mtc+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=efficios.com; dmarc=pass action=none header.from=efficios.com;
 dkim=pass header.d=efficios.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=efficios.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7myJDkLfvT7oKblLOWRCUECB28sk7IiGjY7OQIQTbkQ=;
 b=M2/c5KeTPNg+dB2O5ElYkjOfSw7WPloJxtCvpT3dZyJsr3NjkL9UB53vdnwHzfkbVXLVv0PX2Si4HdApSvErZ8RP8OrgdpEE9hc0T4xGAp4cj3bEUPAiOHvcO3j9H1L2H9AQCrs1WsrxDi3iHO2f3JmDso5sfjchZx3/i81ZxT0h4WAUQNS9/4jjorq+wiaWsCG7LslatYbDNxV95W/WpFdh+TYvjLlNCAfxDD2JP5k9XO+l6cmUlgIF048cLh/mN3nw6ZcEetrGdBm5EGQt4wzfTPFXdhVdY7REnTfJTGox6XHsFEYa2RvOb0gf0ZyFRZ0gFHSo+KlnsZRCT1ZKZg==
Received: from YT4PR01MB10709.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:104::10) by YT2PR01MB4144.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:30::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.33; Thu, 28 Mar
 2024 19:48:38 +0000
Received: from YT4PR01MB10709.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::54b7:87a1:7ece:6ad3]) by YT4PR01MB10709.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::54b7:87a1:7ece:6ad3%3]) with mapi id 15.20.7409.031; Thu, 28 Mar 2024
 19:48:38 +0000
Date: Thu, 28 Mar 2024 15:48:37 -0400
From: =?iso-8859-1?Q?J=E9r=E9mie?= Galarneau <jeremie.galarneau@efficios.com>
To: lttng-dev@lists.lttng.org
Cc: diamon-discuss@lists.linuxfoundation.org,
	linux-trace-users@vger.kernel.org
Subject: [RELEASE] Babeltrace 2.0.6 - Amqui
Message-ID: <ZgXJlRnySWf3l-JN@efficios.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQBPR0101CA0117.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:5::20) To YT4PR01MB10709.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:104::10)
Precedence: bulk
X-Mailing-List: linux-trace-users@vger.kernel.org
List-Id: <linux-trace-users.vger.kernel.org>
List-Subscribe: <mailto:linux-trace-users+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-trace-users+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: YT4PR01MB10709:EE_|YT2PR01MB4144:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	48+ANdfFLxpSeC5d1KcmEhb8FYXMN5A0wliiKc3FnAcqxDTnTcwoX7Pk2LxsZxuOfPwjshF+OwgkGGmpCVnnAPcgT6bZ3WmG37iIFvi2U5aMJP5bfqmUWltnIdOHteXGx9UN+excraV0mY38yDtULTNYZJPkGXlKyjbjvlxQIlMjO3jPFyJiPjJ62JgN8oUAKeYVyb67mb3csRXtpAxMQf8Z6T3ftdwOeQXnFtsVbYzGCcv6RcrV6VdgeKEYur3jrKMHlcCaNRdcFGdJ2zhS3w+RjUgwr11ESvItMgATzPleiWYzMxcp7ZC6JAdBNOEFYR4jlTza5Z6tlnCAutvEfFqUFmdhp6MjXq8lKbEQhkw6qU9FtFt2vjFghun/yLNIwDiAWeB9XURtxUvgw4l8gcLDlkxIaaCH1cD10aPWI1SGD0DLJ4XeeJgIHXiO5xmUC4l8aMdWyl+8xVVGkfmrTh01wpPcjwHsRCVsPDYR+NzZXjY6mR6PjeUNyTV8fewga91y0MllETxfGis8GlOtx27O+T3kUeWsvVtQdf2/cKoFC2Z9ipV2EBjLAKgB2K4uMhRaZffHLOFZDBjSgoWYXzAgdybLKtcdoqArGbh7xlkEWrF9Whz4SmQ3rz+GaiaF
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:YT4PR01MB10709.CANPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(376005)(366007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aTRqMm5IWUt1VXAxeCtTMjBGeVc2S3VRd3BHQ210TVZxUGp3UEFILy80UmVl?=
 =?utf-8?B?UjJVaktKdzZvRDRibmFmVkJLYUhTRkhUeC9UbkhlSTNKK2FZOHBGUHErY0or?=
 =?utf-8?B?M3prRDJ2RGF2YjMyQjJoUzJmWWd2bURDZE4xMWVkdWY4bENmS2RzdUNmdzhn?=
 =?utf-8?B?ZmdLV0dzcytSVmtFOU0xWUpiUWtNeUJpcnBZZmJROUNUSHNYaW4xSEZDOG5n?=
 =?utf-8?B?d1VHdnA0SEFWRXlKV0w5ZFIyRmhqcFVKMmdNN0NEbFZDcFNmNFdCcHNDaEc5?=
 =?utf-8?B?bUZjejloempUVndYT2hMUHphV1VYcENIY0dBUktiVHNqNXM0eTJ2VCtXWDJq?=
 =?utf-8?B?UGJWd0FIQ3ZiZDVSQXdiTkt1OGdwN1NiSDBRYTVPNlY0c3N1U0c4djR1S0tx?=
 =?utf-8?B?VmJTNi9qMFlJTzJRalI1NFFpcjFPRFVNRGJLNkxlMTk3Yk8vaVNGcEpkUFpW?=
 =?utf-8?B?OElpeGRGWEFKMGhaQ2RBK2o2S010RXFta2M1cFRvaHJ4VnlXUkFzSGZ0MjhI?=
 =?utf-8?B?T2NzdnV1L3BxSzhPODRPTlhyOGdtT3M4RlhLT2NZTm9uUTA5ZGhFS2phQ0dL?=
 =?utf-8?B?a3duWVp4Y3JZcElZVENmRkI4eDRkdjRZL1FCSkNoc01aYnFDMFpNR09GY0dD?=
 =?utf-8?B?Y2pvVU5yRWR3akdvT1B5cW5wSGVUakxubldYLzNHWGJDZW1zcm1xRnhVRFNT?=
 =?utf-8?B?QXM0Qm0yYjNPY3Y2cGNoZlNYekp5RU5uMHRGaGhRcnVkNW1RUExqZVU4T0hm?=
 =?utf-8?B?ZDlWd1VGbGFsakl0MFJWaGczYjUrNHh0eGwvWFVuaEk2STBnVGdDZ1B0RmU1?=
 =?utf-8?B?bjZqUFpCT2h1SGNHSUh0Sjh0VWtiWVNpWWNJb3NnRzNOTXp1QzhnNGFnUlg2?=
 =?utf-8?B?bGJtVUlPU1lUajFFUWpqZmlacy9VazVsTlhCS0J2RVhjc1RNN21ndCtrUm9G?=
 =?utf-8?B?TkpsYi9XL0xuM0pVWko2dEJFUkF0Z1pkY3J5YjNqZzFuUjZhVTRleUZ2V2M1?=
 =?utf-8?B?bmdDN3lNelZ2VE9UOUlWWk9EN3NsSkh2eEl0VjNodHNhZVlqZ3kwR2NBS2tx?=
 =?utf-8?B?NTJBVWhuSTJmQmdTMWtsL3phZlUybnAzTGVCOHpBaHJKb3FPczVRMjB3UlVw?=
 =?utf-8?B?cTVrTkRYK0dJcmdITkNHOU5XcmlLS0RZb0hzM1lIVzA0K3V1Z1BhSFN5Qno2?=
 =?utf-8?B?M3N5ZUtlTGd2aE8vV3BHL09hNy9KSkl4Vk1RUXZwdFFrUHgyTXhraVJCaHZJ?=
 =?utf-8?B?aWxqcjBBMmVpWUdEaWM0U3VDZTZhYzBzbm5Sc0w1UmE2SWlTa0d3Z3ZNam5C?=
 =?utf-8?B?bzVYSFpUeDA2K3JxYjBTQVBsQkY1Z292YUFtZkYzNWNSNHFPZ3d6cFBXTmhy?=
 =?utf-8?B?bnFWdkI5WnBqNDViWHlReUFrc1FOYU0xTks4YWxJK1lNOFJaR1hSWThabmc5?=
 =?utf-8?B?NGZNNnF3UlRZclNDVjJockIyZ3djODhCVURsWUY5b1QrZkJGOFhXNHhPTmFK?=
 =?utf-8?B?ejFRS2NqakErNll5ZHdhcHpNVFprVDRvVVgxRUlhbFhXVUV1RXhFMEFsamxw?=
 =?utf-8?B?cDgza0pwNVRNVWNla1R4MjZIS2dkSjRCN25tTVFKUXhaM1JPcWRpNmFINVJk?=
 =?utf-8?B?ZEFnVTYwM2t2QjZHRFduRDZHbG1ZZkZtell1N0ZOMk1tcUU4YTZSckVDUnY3?=
 =?utf-8?B?WVlDbTY3ajJsdFpPeEEyLzZvZkp0TVdObjBXeFFlNWxwcFFibUZvSisxMVZa?=
 =?utf-8?B?YWJwTHZCR1IwY011QTRIY2RxSzVxaHRwRjBRamluNUdNb1M5bXZIYk5zaEd3?=
 =?utf-8?B?eHJBVW1hdk1jY2dpd2JZdndCUGFXbG1OVVBSaVJDSW4yUjRHMjlXeko1V2VD?=
 =?utf-8?B?TThLUmhBeHVpZGtpTEhoZUdMRUpSNy9haTJMYzJkc2tRdXhRWWhXTll1SWhX?=
 =?utf-8?B?QVdYSWlTbWYvR2ZuaTU3dGswRXlvLzhqYm9rTHg0RFl3akoyNS9SM09ybTlU?=
 =?utf-8?B?b0tyRklnaEFIOGlxT1NrUG4vZ1JvdXFxVE4rQklrZVJJaU1tTTNwQXF4Y1dK?=
 =?utf-8?B?VnhaZ2JtWU9NM2E5VHZ1bHhSTnF4YmZrOW54QTMydVN0bGcrSFJnRzQvWHRv?=
 =?utf-8?Q?gbraxG3ueeQdVKlVwT0LRcWyW?=
X-OriginatorOrg: efficios.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3359b2c2-e248-4842-e737-08dc4f600ffb
X-MS-Exchange-CrossTenant-AuthSource: YT4PR01MB10709.CANPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2024 19:48:38.4434
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4f278736-4ab6-415c-957e-1f55336bd31e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7otd0fx+bkzY18HgeV/xPpAsE18BZD4Ddi9tbUl2KGEAmWlKe70c9qhNiPlxnKbrPZ+caB87ySgN35aia6b8Pg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: YT2PR01MB4144

Hi everyone!

Today marks the release of Babeltrace 2.0.6, coinciding with "Respect Your Cat
Day" – a nod to our feline friends and perhaps a call to enjoy a moment of
relaxation after updating to this latest version.

What's new since Babeltrace 2.0.5?
==================================

This release brings an assortment of fixes and improvements across the board.

Highlights include numerous fixes to ensure the compatibility of the Python
bindings with newer Python versions, enhancements for handling inactive streams
in the LTTng live source, and various documentation and test suite refinements.

Below is the full list of changes in this update:

2024-03-28 Babeltrace 2.0.6 (Respect Your Cat Day)
    * bt2: disable some warnings for `native_bt.c`
    * bt2: compile `native_bt.c` with `-Wno-undef`
    * Fix: src.ctf.lttng-live: expect NEW_STREAM/METADATA for inactive streams
    * Fix: `babeltrace2 convert`: don't consider the `--plugin-path` opt.
    * include/babeltrace2/plugin/plugin-dev.h: "define" -> "definition
    * Fix: doc: escape double quote in bt_p alias
    * Fix: bt2: pass _TraceClassConst to destruction listeners
    * fix: 'load_module()' deprecated in Python 3.12
    * tests: retry os.rename on PermissionError failure in lttng_live_server.py
    * doc: fix uptream -> upstream typos
    * fix: test_message_iterator.py hangs on Python 3.12
    * plugin-dev: mark symbols meant to be public with __attribute__((visibility("default")))
    * Silence -Wunused-but-set-variable error with clang
    * Fix: Windows DLL path lookup with Python >= 3.8
    * doc/man: make default values of boolean init. params. clearer
    * RFC: docs: fix: Match stated automake requirement
    * fix: make flake8 6.x happy
    * fix: running black on python 3.11
    * bt_query_executor_create_with_method_data(): fix docs note
    * Fix: ctf-writer: null dereference in bt_ctf_trace_common_add_stream_class
    * Update working version to Babeltrace v2.0.6

We've worked hard to address issues and enhance the Babeltrace project, and we
appreciate the community's feedback and contributions. As always, we look
forward to hearing about your experiences with this release and how we can
continue to improve Babeltrace!

As we celebrate the release of Babeltrace 2.0.6, let's also take a moment to
appreciate our feline companions, who often keep us company during those long
debugging sessions.

Happy coding, and give your cat (or pet of choice) some extra respect today!

Important links
===============
Babeltrace 2.0.6 tarball:
    https://www.efficios.com/files/babeltrace/babeltrace2-2.0.6.tar.bz2

Babeltrace website:
    https://babeltrace.org

Mailing list (for support and development):
    `lttng-dev at lists.lttng.org`

IRC channel:
    `#lttng` on `irc.oftc.net`

Git repository:
    https://bugs.lttng.org/projects/babeltrace

GitHub project:
    https://github.com/efficios/babeltrace

Continuous integration:
    https://ci.lttng.org/view/Babeltrace/

Code review:
    https://review.lttng.org/q/project:babeltrace
