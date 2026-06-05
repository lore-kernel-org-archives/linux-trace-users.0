Received: from YT3PR01CU008.outbound.protection.outlook.com (mail-canadacentralazon11020143.outbound.protection.outlook.com [52.101.189.143])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F73D425CEB
	for <linux-trace-users@vger.kernel.org>; Fri,  5 Jun 2026 19:33:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.189.143
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780688039; cv=fail; b=NC7F5VbD0hnj3bqbs/JMmjSgZqs4L4ohw7FZPVIXJWbFKoXgMWdDo/2WuIajVybPRG5NK54HApyGGc6MBtjNaDwqJJIPs/dB0Nys6167cQIF2hCXtfkVsvddIkf+XKi3TafVL58ESRuHwqd1HxVbMX0SDQa/GAIu7vM7+7p2KSM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780688039; c=relaxed/simple;
	bh=ALFaMr1R0/TT69pOnSE4sMiI0toY489R9P/aqtG/cOM=;
	h=Date:From:To:Cc:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=JjXs7nKL8CeKTLgjNuZeJurbDjtvhvskGQ3P1dM99aGIYsJ/ezN8yc4wZpwMS4WoRgrjTjQjHIXc/Pm0sX1YM5uAT6gyOMaKuIeKtYr8w/waio6FgUX4cBfMqtdJcgrKUzyuhhq96u9GLIg+Fkb2IDqqUZiT18GRZGlxLtfy7wg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=efficios.com; spf=pass smtp.mailfrom=efficios.com; dkim=pass (2048-bit key) header.d=efficios.com header.i=@efficios.com header.b=I1y15+1z; arc=fail smtp.client-ip=52.101.189.143
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=efficios.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=efficios.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=efficios.com header.i=@efficios.com header.b="I1y15+1z"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Kgi/JUsXv2GibsTV0NYE0g0N6yFXFNHFxU/BSmv5ApfgTQCJds8qDfiiAhK77CZHkBViVPLyHbViYevfH0HpGl6BDTUP/iLDsr3/BR1r7uDLVKGVTPiaX039uGXFmsoTXxXonAFw32JZ4KsC8CJo9AA0xpVpWb+N+WVYhdwZl8PAFn9G7b1gpbYV81zJm5Tg1qeQPvOnbgUXZiPr2JQ+8vLbSPoibR4EA5Ayl30qDsIUt/GD0Wj7pRbBCL7uhh/zkjF1VAgngoqZ9Hn9tEefI1E55WeWFmcqR7jvHqiurtQm2Eh/TAWSVIb35rNH5bmAri++Hu+875B1CnkscE2lLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nD6QyDA5sVhxuwAtk1QNEXMaYKw/K++lubkzWNFHaTM=;
 b=jrZufro0Z0S5VVQYzhAmREn25sBYHg+uaTK5Q3+PzD59ZgKymiP00vWzwMCntMI/MEpsarWhZ7hR1VDrXLxYZ//DyZ4yrAQuidQBZbWG8+IUCZ74KcVxokX14jhJmvNbr7ihXLa1CkQNmL7jPO1BQS0XHgosWvdPMgJ/GcgPDmDdTuvSnB6l5S/mYo27lW0tzIT0S/2NtLI3G72jvVK6u8eRmRizcSlFwbVO+w/1KOnrMHUkwKacukq3I2nKS4nB7mc0BJ6ePbRp2TWOOAF/rwetMZSgFKrwvmp9EFFRKo/JL5t0wZIZ9LFX+IzQG6EITbkgXX2dFpMb3FWjoGgVHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=efficios.com; dmarc=pass action=none header.from=efficios.com;
 dkim=pass header.d=efficios.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=efficios.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nD6QyDA5sVhxuwAtk1QNEXMaYKw/K++lubkzWNFHaTM=;
 b=I1y15+1zcpWSGTO0HyxVVJDQjaoSkn77eanlDtaRWB4xvd1oA1W+xbvAgG91qgIkpDKcVcn9dxw6JDISy3CU8yPGJ0tTX/pvIl9xu2FIvrz+JOd+oU5sTAOi2PIFrljChPIabCYc5PnIEKZ/oRMv2NblZF8ZchKeLzLlxyDKnQCC+a7g2ZMpsN1Dym/pAc1ePD/2Y8NEgboBEhHZdcMjKTxUMszPBS4H0o+N19f/xnyOZ3zNhBsD62QaWHKEOK9zDfd1KvdA/aKsLA1ajhzC7MtniIbwoNjx4yB43jc6FCX3KWHJCONWdUE68NC34ud63S9BFA14/dchhZnUBSGHYA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=efficios.com;
Received: from YT4PR01MB12074.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:167::9)
 by YT2PR01MB5856.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:58::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.5; Fri, 5 Jun 2026
 19:33:55 +0000
Received: from YT4PR01MB12074.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::b0e8:8334:afbf:9bc]) by YT4PR01MB12074.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::b0e8:8334:afbf:9bc%3]) with mapi id 15.21.0113.004; Fri, 5 Jun 2026
 19:33:55 +0000
Date: Fri, 5 Jun 2026 15:33:54 -0400
From: =?iso-8859-1?Q?J=E9r=E9mie?= Galarneau <jeremie.galarneau@efficios.com>
To: lttng-dev@lists.lttng.org
Cc: linux-trace-users@vger.kernel.org,
	diamon-discuss@lists.linuxfoundation.org
Subject: [RELEASE] LTTng-tools 2.14.2 - Orbitales
Message-ID: <aiMkot_alZCgDpSC@efficios.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-ClientProxiedBy: YT4PR01CA0212.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:ad::10) To YT4PR01MB12074.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:167::9)
Precedence: bulk
X-Mailing-List: linux-trace-users@vger.kernel.org
List-Id: <linux-trace-users.vger.kernel.org>
List-Subscribe: <mailto:linux-trace-users+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-trace-users+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: YT4PR01MB12074:EE_|YT2PR01MB5856:EE_
X-MS-Office365-Filtering-Correlation-Id: 4071fd69-2062-45d0-8a7d-08dec3396178
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|3023799007|56012099006|6133799003|18002099003;
X-Microsoft-Antispam-Message-Info:
	miq4JjV+2MtVUcQfp/r946qp/iaQ7e1wxtzxNwy4br9qjciDVqzO2GF+tTy739xXoy6OlJyE3ZtyNagScIkllRMXxRfMk0XhbEKQVkHq7hqddLDfEOs0jARw43isHO1i4fuM/4M3MveD7OIiRZqwBC2YOdmsLhXt3wgWjr05DGpnhyYCkIcaPnnwixs95PS3iMLluwSvFXu5+m9F4GfJryexzPTV1UNrygKkyV4KbnFtreSBkriBepyMY/Hgv+mJwhJ4q3+PNDOfvpuc/K6NaTrBqjD6o4Auq3qg14UhNhI+PbgPkyuOAei8f5cBKe7B496fKFVZgM3V/H9mYBJZazbPAuwkyvq+OUbHBCShaGuQUtG1AQeUEMi3AjYrnhbHFq9SMhWGsvr/X7G0u3VONk+byqC0RaCkwjU0TFcnJT+z7NGZnq3zDRSfBDU8coBED0BJ9xiBTBiqa1NawzTL5yYUIL5RymQmsoyqlO1dIsTxS6B8aUNkOv7plsh1NZboi2T0HC8a3HJXtXJG5ERnYwuHOv0jJbee/XhycOeEOEl0siUfTQrrLPwySKVEhzE6e/1ysC94RLqsQnBQVygbH+CVwqCWXR+lDUD23N0zfiBYGfiDIK9gsBaJUj4V7/YT
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:YT4PR01MB12074.CANPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(3023799007)(56012099006)(6133799003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?PU8Rj37rRAG6UOksK28DL9S3ieq7ryWSca43Pth/j01zPwysuHQmHXfkbN6P?=
 =?us-ascii?Q?NW7fcbQrayB/YSxOX3ITIUeJKZJJdpKEFVZqW5OAfr2mcM+22vAxhGG2AyEh?=
 =?us-ascii?Q?sXKAiH6cOm0ZEBEWaZHlxhZx4FfZXn8h4kRx4sMG3wvWE901Y9EPMSmzomNa?=
 =?us-ascii?Q?YYw823UFrs+p5EHvS/VImVUpWQV2TrJ2QN3U1T9RcFTn8Wja1eEmTCI9FZcL?=
 =?us-ascii?Q?G6i/agvt54rt5ufmZJ4bKIsix104c4Kla/shl6hJNC6XoSkb9+DxZaJvcS9d?=
 =?us-ascii?Q?T4xn7zHEQjAZzFHREOZIVOnqGeJ1QnjE9+NQ960ttKgmBDZeLCxP7HrpT56p?=
 =?us-ascii?Q?KBlF55/k9VOnQ7u/cBNDw4r/XOmxQBHFGyixnRjd/6LOfM+rvi83GQgvCtj3?=
 =?us-ascii?Q?iWNeR1HsdQ9A97MBBxOmy7qwJO8b0yvAC9Y/O1EDWHgV+/UR0cAlz0vuWx30?=
 =?us-ascii?Q?9F5nih3cFxpSq5Qswh3/qRwSWClS4+QEVc7ivaq8Q/K2t14KIZqYqhFJG6ur?=
 =?us-ascii?Q?Pucrq6bBJAnWe4J4tg/fUG5ofxaaTowD56ZfvrQHMJFgWPtBqvZCfkDCGd0o?=
 =?us-ascii?Q?0qbeOpkJ4B77eFFfymGWZVyZJhwGQR/E4WLAuJIEMseLRCNiIvlg2XVr7rYT?=
 =?us-ascii?Q?mjForcGW4mL6is5rfqch7Kiw6aBIzZw0CSZePHrUfLCYkWPDLV/vtb6KJU0v?=
 =?us-ascii?Q?3hVCVib5llqBqPZEArr6MxByvFQXLZSca41RDY2ddAygtBJX/y69UXP+DNBk?=
 =?us-ascii?Q?I9mC+I7fJw2fvfKL5gM/xdgavwFO5f/qKDA5kZvZUxnqD3xiHa9ffwj1p05V?=
 =?us-ascii?Q?3iMUYmKVxi/6+/QvBTIeKtp36N/zYevC/YciogPG2P2e19pSRzkCGyhyMgEY?=
 =?us-ascii?Q?hgxLPg9wyY9n1Pvw71tbFk5LwvkWBMDOTmIEQ+zT+v6qg8ZYPIXFJXnzJ+Hg?=
 =?us-ascii?Q?t5sMfONSTie2jPlp3lhp5H8sEqB1VB5WFt47EaPJWeqN5ZEmxsRorLhWjoiD?=
 =?us-ascii?Q?NjWAtTrxe7TFB+GOFe/Y5KQ8K8OMGEVYRHlEqKec/2Ev5dBt456S7jfiLJQt?=
 =?us-ascii?Q?s8LGc86komSY+pxreM1hM/Pq+qSA0e0CZhh/0pQDpKLO6zIa8TWviyO6LA8b?=
 =?us-ascii?Q?SDfX2qRsUmkkVZdtFz+QqSWKa825e83FEDcR7/p6NL7e8IV+PP6jU75Ahxxl?=
 =?us-ascii?Q?wYbnOngnT6XxO+4k1BEozEHdavIiNnT/zcbp+06b7/QlCHSyt0dPNviFJI/I?=
 =?us-ascii?Q?0neGkcrYWsa+6qO+fcocrTxIrRLFKzZrYWV1WFYZ9WuMc/TIGX5Halg/Scv9?=
 =?us-ascii?Q?tKH8cWShJPmi9LU6fRLEBu9qxjenbPQKXIPDRbOSS74YhKR3V2P3vnrtsV48?=
 =?us-ascii?Q?0VoM45c6xqZSoKiCOk1UTh/GQpnmxFWJx5p0R7m1crr5iv4Yq33M4Zc0B1uB?=
 =?us-ascii?Q?gFGyc7PYhYJGXWkTMyJz8jPLcgUuetf9GuUCJvAvRG0OZl6WJ4XKa4HhZWI2?=
 =?us-ascii?Q?COtvpyTYNpZHfp3XhNjJovUd5UA8nMGBCO5ma/AU6dlJlEmxx+CjYyNr3jBs?=
 =?us-ascii?Q?Ekh0kj/3sZqTnYD7Ra/a4T+hIOkBsiDTE6agX1qbrNaBSKm8ox+y66UcbwYP?=
 =?us-ascii?Q?ruMr4MWk+9rnQtoJUI4/2XGGvreg793hUJtVI3+baELXmF8Sinrrzm9cT+a6?=
 =?us-ascii?Q?KSJ74CeU4iurnEhcfH9BhXOrmNeKmyXaRqJv8NlIla4zm2CXo9BCqmoWdX7A?=
 =?us-ascii?Q?StJtSt+8CA=3D=3D?=
X-OriginatorOrg: efficios.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4071fd69-2062-45d0-8a7d-08dec3396178
X-MS-Exchange-CrossTenant-AuthSource: YT4PR01MB12074.CANPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2026 19:33:54.9719
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4f278736-4ab6-415c-957e-1f55336bd31e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mdjl2HoVrtcQaawpSLyOEjXG46JXaQjteBFzcTIZ2U0ggs/drXHskrwxdI14GOz71SisXs6Iy7NLhv+h3NR+Aw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: YT2PR01MB5856

Hi all,

We have just released the second bug-fix release of LTTng-tools 2.14 -
Orbitales. This release addresses a number of issues listed below.

2026-06-05 lttng-tools 2.14.2 (National Fish and Chip Day)
        * sessiond: Relax CTF 1.8 TSDL identifier validation
        * tests: Exclude `.tmp_new_chunk` from rotation trace size calculation
        * Fix: consumerd: silence -Wstringop-truncation warnings
        * Fix: tests: use portable format specifier for int64_t in tap
        * Fix: Include 32-bit kernel trace expect file in dist
        * build: Fix api-doc help string indentation
        * build: Fix enable-werror help string indentation
        * Fix: sessiond: abort when loading an agent session configuration
        * Fix: relayd: wrong session id used in trace chunk existence check
        * Fix: lttng: truncated session name when it contains spaces
        * Fix: common: remove ambiguous operator[] from c_string_view
        * common: Split CPU mask parsing from reading
        * Fix: parsing CPU mask with no separators
        * Fix: common: Improve cpu mask error checking
        * common: Escape newlines when printing CPU mask
        * sessiond: Fix: Deadlock when handling notification overflow
        * tests: add test_condition to the unit test list
        * tests: add notification/test_rotation to the regression test list
        * tests: Fix rotation notification test when tmpdir contains symlink
        * Fix: tests: race in rotation notification test
        * Fix: tests: undefined CHANNEL_NAME in rotation notification test
        * Fix: relayd: live viewer reads wrong chunk after per-PID clear
        * Fix: consumerd: pause testpoint not re-evaluated after poll()
        * Fix: tests: consumer pause testpoint FIFO EOF mishandled as error
        * Fix: tests: serial runner produces empty log files for hanging tests
        * Fix: common: uri_compare compares uninitialized union tail
        * doc: lttng-view(1): remove non-existent '--session' option
        * lttng: handle popt parsing errors
        * fix: '-Wsuggest-override' only valid for C++ warnings
        * Fix: handle failures to find pid cmdline
        * Fix: common: lockfile fd leaks into consumerd via fork+exec
        * Fix: sessiond: default kernel probe list missing 9p and dma-fence
        * tests: fix: lttng-sessiond abort when using libkmod
        * Fix: common: lttng client abort when serializing rotate-session action
        * Fix: common: stop-session action serialized as start-session in MI
        * Fix: common: MI XSD names start/stop-session actions without "_session"
        * Fix: common: MI XSD rejects add-context per-context success element
        * Fix: common: MI XSD names snapshot record action "record-output"
        * Fix: common: enable-event MI emits duplicate exclusions element

As always, please report any issue you may encounter to bugs.lttng.org
or on this mailing list.

Project website: https://lttng.org

Download link:
https://lttng.org/files/lttng-tools/lttng-tools-2.14.2.tar.bz2

GPG signature:
https://lttng.org/files/lttng-tools/lttng-tools-2.14.2.tar.bz2.asc
