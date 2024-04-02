Received: from CAN01-YQB-obe.outbound.protection.outlook.com (mail-yqbcan01on2091.outbound.protection.outlook.com [40.107.116.91])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E7BA8495
	for <linux-trace-users@vger.kernel.org>; Tue,  2 Apr 2024 18:37:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.116.91
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712083079; cv=fail; b=BB0QhZwWUm82n0A06XULqTEgiiICtz2ReuvjZfGf/8a2eOxqNCZa6wzjSPi/0GvxU0IgJSPyCaqt9PnMtim2ZP5jMGWG8TCH865PiJD2tO7v/69yYoolGWaaOV0NHPASfqGC4fhU2ASan5mZQgc0egFS6/fRtwy265dNmOFP4jg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712083079; c=relaxed/simple;
	bh=j45S+CDAm9WMvO220clLWUVrlNdNF6Zbq4mFBw/B42I=;
	h=Date:From:To:Cc:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=iYthb+nhl6y8wTuAGVAIDDeyDdz4dUUiGMlhVaZ3AEOth2q4I5SJMSA0SenBrdoxIe/gymX1Y/hb7MhraL0jxrQYpQPy1SKhzd6tTnzqfwozAsUD56kRUJn0rgbSIoz7R24YrWRruov30wc+XtOSWTK8S3Wqqh/+6nN679noH48=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=efficios.com; spf=pass smtp.mailfrom=efficios.com; dkim=fail (2048-bit key) header.d=efficios.com header.i=@efficios.com header.b=BhsPILN+ reason="signature verification failed"; arc=fail smtp.client-ip=40.107.116.91
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=efficios.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=efficios.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=efficios.com header.i=@efficios.com header.b="BhsPILN+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cwHTtxC/2armFrNRw5rXoMPWzvVqv7+0aWvNDUCCuIDyFXBCI/6KUl0OUpDGzGoL/9cvjOMhMoGM9K89xx4PzrIvELVmXjA5jCa8QTL9EmwDupDYmZ03UmrH6GqqcD8Qyp1eie5kzyH0g8r/Xf29snz36zirs7HDMJZTF1kO30W+f/jKcLU84NThFjYQAhkNRoBKLsImTGCHo9KjE72uwcKTEbD6oD1LHS9WI/LUYlAC1e9CdoIKvwqOkMAbGzKUuO9wowrBfECtA8onhTCWT0TZqykhvFH2z+tTCB629zLyzoJOh0zTUZRn0ncc/9mJligZSnGFp2/OHE3UGwd8lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SFri25uQiQQIdwzjE0V4toX8juDbr8b4ks4niY/Lm74=;
 b=ihLS8D8rH1Vyr/HH/vyClNG9N5Qch738Io2IXh+JLzTF21OZg/DH9ftLLDYaUMNltVNiLJm0qJUA+ETBIdwvektBN3JLlZX672YIOpU0tCqxrDkMXyIFNES+cGYjFgs4jlJHALDbIFTSNyGYj0pnCOJQ7lcZNjML0DovfmMiTRAFQhb9i89qFmxz+EM4Rco5vN1FH4MwqEgwhTb7WpbnW1yq5f3sS49cndwXN5NFdxlQtNnXwiIXSU8jZfKg+sYg0J8kjm+kLwIqXjf1XfvKZ0GZaDIhAjViQRuGDfHeDfWqspB++h3liTO/EIIVQGMs9mk+H5MAwLj5SfVQYY0+OQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=efficios.com; dmarc=pass action=none header.from=efficios.com;
 dkim=pass header.d=efficios.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=efficios.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SFri25uQiQQIdwzjE0V4toX8juDbr8b4ks4niY/Lm74=;
 b=BhsPILN+qwbDGQjczpZlRWmDr7jEhpxSaImnrufFcUrIu+KE2iH7st3DKeX+rGZgUSvuj3N7Gu7d1bN4SctApCXEmPb8yfQUWz+w6gbotY+OD1lsW7kmiIz561e9g6gkedjs2C/e+9ok4HDKhG4u4aDppgge0ZtivsQmNTF6UVrSxgjWjM4gps6K0rYx8vQCiLawV/vesOPDWWE5qtbdum1bCF7DRRFsGJndFJobfv9iUp/VguyHOGHHwNwWZkpQoN32CsYKn48IZysicy8QLpbYHMsVQMR3T5V46ZjMFfW4I1ZF3Da/ffH6KDD48YZN6cjQ8hOke+Goz7XXEjZgnQ==
Received: from YT4PR01MB10709.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:104::10) by YQBPR0101MB9694.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:81::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.26; Tue, 2 Apr
 2024 18:37:51 +0000
Received: from YT4PR01MB10709.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::54b7:87a1:7ece:6ad3]) by YT4PR01MB10709.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::54b7:87a1:7ece:6ad3%3]) with mapi id 15.20.7452.019; Tue, 2 Apr 2024
 18:37:51 +0000
Date: Tue, 2 Apr 2024 14:37:48 -0400
From: =?iso-8859-1?Q?J=E9r=E9mie?= Galarneau <jeremie.galarneau@efficios.com>
To: lttng-dev@lists.lttng.org
Cc: diamon-discuss@lists.linuxfoundation.org,
	linux-trace-users@vger.kernel.org
Subject: [RELEASE] LTTng-tools =?iso-8859-1?B?Mi4x?=
 =?iso-8859-1?Q?3=2E12_-_Nordicit=E9?=
Message-ID: <ZgxQfOwkgLXG9oMN@efficios.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BL1PR13CA0413.namprd13.prod.outlook.com
 (2603:10b6:208:2c2::28) To YT4PR01MB10709.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:104::10)
Precedence: bulk
X-Mailing-List: linux-trace-users@vger.kernel.org
List-Id: <linux-trace-users.vger.kernel.org>
List-Subscribe: <mailto:linux-trace-users+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-trace-users+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: YT4PR01MB10709:EE_|YQBPR0101MB9694:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	f8HSc/oSS9EMfUMDNnZTFNvZZjjAC4CJD/COTRu4UobVzHkDaqxZs425n5ziGF3RBQ5NW7pzYLEoZGU+epLNT3QFt4fuMpoyzbW6IybJjOEYAUyQHm5X35LggBh+5CjsEcb3TotKQJ8F20CMUG4h7Vd1jNoZjLPtHH3EubDAwTbHG0Bdtw2j7F71XPdOS8TIU6Dg2VQAy8pObE8Qr20bpZ2C2LEGc+1sABKQVYNftGu7vvHHIevdHaVtT8dn2wPxnQrICVDCSz59DTQe7XoxnOHJ82e6nebUq238qtuVvqJRbuPXLK+JGGr2SDhk7KSdULsFaLbfwDI6QDTATSWgokBlE53IELG6zPSGLthXp1pr7T6fGeFCaDIJlOvySCG16qIvjNC4zXkPfG1Hhh/oWi4MClKJi7NWkeiUe72LSIZ/UM9t78Flx9+rlVArt51pd17aq8iu0Gl4D35PMrpgarV61Mvt7Dc2GQofjgKZAqkRDEiI70UrRN6biGkcUY6hCk9cMPAOCLnqSrrCGo2CEWUYRpzjwSwE2uxHvQM7/UgwVIkJtFAPprPFn2m1zec+vdqFZ2sddyTrj+/W95SIpkDm1O0JAlv/a8VlgWxcXaQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:YT4PR01MB10709.CANPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(366007)(1800799015)(376005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?uCDgaJ2K90ffdIVFPEL3bIkWDje0T/zaR66Y3UPQgH1LDV6M102KONXwlw?=
 =?iso-8859-1?Q?uHqq0R8pzvQJHqFFnprUe8V51V510XPmwyGXNFYbkp6Js3Q2yavrJI2Nvh?=
 =?iso-8859-1?Q?1jfUS6eyvF7TTCalVm/SMn5Hwyx9Ny+12IeN+zc09NpBNrRYLNnv3EhB74?=
 =?iso-8859-1?Q?O2xjn0mfRBbrTxB+i4OTre1UKyBKybESJeJpb0GOVSaxmJQ/bbMJT+hbEl?=
 =?iso-8859-1?Q?ImKc/l+EbyeKBobzzgN+R78LnFuPpBJDyYP4LzrLcwqt0xk3qDOWY/n5LD?=
 =?iso-8859-1?Q?Q8QvJqoxIbjmrFgpKXXrUMgi5c6kYdsIYNUI+5P3y6xrYv+9dstXOtiemx?=
 =?iso-8859-1?Q?ivzhPjfMfuW5R4T5/2Nl5UOGD27INMym13NWnzgXfalGck0NDilAc9Iyqg?=
 =?iso-8859-1?Q?Urq+HmgaCyaUFQy3NjQ3nUOIS82UuBWTcnp+sYRRUDXQlfKjhOkEQMJovg?=
 =?iso-8859-1?Q?I9IXZ+/lRXO9t+Gkm9VtQXw9uMdCs2EjyM/Qx1HQKu/3FRTdszvSbcMppF?=
 =?iso-8859-1?Q?FNy5+ehuqMrwDP2aiziOHTM18emPbPW9pBtQrJofg1yzQew+qkLkXNs9cR?=
 =?iso-8859-1?Q?Ko0OrfXD3XaVL2z6eU6FcVu8q85zqe5vGDzROO4FyB+NRN+F6v7rD8wL7R?=
 =?iso-8859-1?Q?C+k7++IZvMpH1IiI27feW8FiES/VhWrK2A9LYTqPyPuUk96zwzQ1OkJyBe?=
 =?iso-8859-1?Q?zuSY1U9IkzjVa2VHOwx/T45ReTjAd7/LhWmXwWeT/g+2IZcKtX1n33TSFY?=
 =?iso-8859-1?Q?wkMa4X1C7AeVRXuywRc0dvMbRWfHrm/Jv7+EW8oT4C42yn3LwlUOm+fjAl?=
 =?iso-8859-1?Q?0zYiCcaH/TSF5ZTydnhE8M/zdyl2LmZT5RVlNIx6yIzWTW7NToSYw6+UDm?=
 =?iso-8859-1?Q?E5ZuOAM5DuD7LMvVfSytteFT6jqtD5dTOGPK047O6AO9ZGMXq+tV3n2kv8?=
 =?iso-8859-1?Q?BgDDc0x5K4hPBRsNaCK/XlMgX+muPIDzA2eZYVORU31/w7fP0PoeaL5PU+?=
 =?iso-8859-1?Q?lfDG3evFAx8invXXx1yh7UJ51ADmwNPB7rSWtuDPwJyIbrQ0ujtQ8d+K9/?=
 =?iso-8859-1?Q?USXumM8cttLDxJlbzGhAhnH3YD2gDzg2U4yOmCLFyEp4Y2Zm4w821zSH1w?=
 =?iso-8859-1?Q?gBqiH2v2rSt/rNmA5RZ2QTkZKlyo0GlGAxtFSUwDUtP9jmlyQAF7BlZxFJ?=
 =?iso-8859-1?Q?hqaVbtzvV4i4KyD7Tt3VC8zv1qJksgb7QhBhOoSK6OzPkzh6z+A6+1YanV?=
 =?iso-8859-1?Q?Yzzbs2w2ahVFLePfgdPLrNbwdHvpGM5krRNuk8znHTcWG1YvwjvkSnDZ/b?=
 =?iso-8859-1?Q?lVwqSrxo0Lkm7tGSWwMbrQNuB7HxWALzZP6zVVsPVNLKCxj64c6dxbahFy?=
 =?iso-8859-1?Q?Cu5QS4Nv0IrtwPfdCi0msgVXR37ZulSTnS1XJxSzhUJfq57ULNAoA/gXCt?=
 =?iso-8859-1?Q?e7Z3oACA6XMi/xCQAXRnPeLTMBzOUl7Upe1oWC3cfWzSLbjXYiTWQ5rIu+?=
 =?iso-8859-1?Q?qLtFZWvr1wyW8yascer198nVSV8vpf1qYPyKCNagXLqc9PxiE4AEL/pHO/?=
 =?iso-8859-1?Q?6cBnZljPv/1AJ0FtVqeeZaAySyrM6C9r67O3PR+EAVqrgsnWQgAn8jHh/Z?=
 =?iso-8859-1?Q?Aks5IgFh1qjByEmgXmYhC9S4uY+7cmP2s7?=
X-OriginatorOrg: efficios.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a0891def-2519-43f1-5859-08dc53440050
X-MS-Exchange-CrossTenant-AuthSource: YT4PR01MB10709.CANPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2024 18:37:50.9371
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4f278736-4ab6-415c-957e-1f55336bd31e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2NiPQwXe3OBy/s68rGLy/iG88/E6+XCJIVGWa30AoMmwHxTB8oj4HsYJNKPTupePSiGpSx9dgdfDlSLI4Zw2hA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: YQBPR0101MB9694

Hi all,

We have released the twelfth bug-fix release of LTTng-tools 2.13 - Nordicité.
This release addresses a number of issues listed below.

2024-03-28 lttng-tools 2.13.12 (Respect Your Cat Day)
	* Fix: baddr-statedump: use $(LIBTOOL) --mode=execute
	* Fix: relayd: live client not notified of inactive streams
	* Fix: relayd: live: dispose of zombie viewer metadata stream
	* tests: Fix typo in tests/regression/kernel/test_ns_contexts
	* Fix: sessiond: freeze on channel creation on restart
	* common: move utils_create_lock_file to its own file
	* tests: tools/clear/test_ust wait for specific test app pid
	* Fix: sessiond: crash when sending data_pending to an active session
	* Tests: fix: list_triggers_cli: kallsyms contains prefixed symbols
	* License: common: error_query: fix typo in SPDX specifier

As always, please report any issue you may encounter to bugs.lttng.org
or on this mailing list.

Project website: https://lttng.org

Download link:
https://lttng.org/files/lttng-tools/lttng-tools-2.13.12.tar.bz2

GPG signature:
https://lttng.org/files/lttng-tools/lttng-tools-2.13.12.tar.bz2.asc
