Return-Path: <linux-trace-users-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E61EEC433F5
	for <linux-trace-users@archiver.kernel.org>; Tue, 19 Oct 2021 21:13:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C7FEE6135E
	for <linux-trace-users@archiver.kernel.org>; Tue, 19 Oct 2021 21:13:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229491AbhJSVPt (ORCPT
        <rfc822;linux-trace-users@archiver.kernel.org>);
        Tue, 19 Oct 2021 17:15:49 -0400
Received: from mail.efficios.com ([167.114.26.124]:51752 "EHLO
        mail.efficios.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229625AbhJSVPr (ORCPT
        <rfc822;linux-trace-users@vger.kernel.org>);
        Tue, 19 Oct 2021 17:15:47 -0400
Received: from localhost (localhost [127.0.0.1])
        by mail.efficios.com (Postfix) with ESMTP id 2AF9838E347;
        Tue, 19 Oct 2021 17:13:33 -0400 (EDT)
Received: from mail.efficios.com ([127.0.0.1])
        by localhost (mail03.efficios.com [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id SfGXA8WLw4_v; Tue, 19 Oct 2021 17:13:32 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
        by mail.efficios.com (Postfix) with ESMTP id D48E638DFEF;
        Tue, 19 Oct 2021 17:13:32 -0400 (EDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.efficios.com D48E638DFEF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=efficios.com;
        s=default; t=1634678012;
        bh=BOeUr1soPeE7Q/8Ij9IQQfszQU5rDvjQ7AZr3+mietw=;
        h=Date:From:To:Message-ID:MIME-Version;
        b=fKhyWhvlNksLGdpi09vVyean3jMWBC8lHZt8bHDcQ+lFxYPX8CsStrbMrz7SXYDn9
         GIN2+3d67uUYb12Gbqgg1nr18Mb5oZPLLWniqT9h++EjZ6RfSTWazC86V7QEHyr2Dt
         U6tfjFOFG+fnCU/tkBbmv+5CtytPy1bKXB3qetAzoCsGo0NBPf/wxDmcjOOGgDIuTX
         VAYJ9vRorAajr38x6flgSY6NhUtxYVANz65WjVZT5fQoxdbSo5PWLOaq06nWwrk68S
         ttdClHW+mlga8WUIhOqcflCUpVJbhCwAPlQGGq1IJ6AtnM1hTD8PvcvrwclpO99yaF
         7n3ypK2C/Kd7Q==
X-Virus-Scanned: amavisd-new at efficios.com
Received: from mail.efficios.com ([127.0.0.1])
        by localhost (mail03.efficios.com [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id 01ukrwal30yC; Tue, 19 Oct 2021 17:13:32 -0400 (EDT)
Received: from mail03.efficios.com (mail03.efficios.com [167.114.26.124])
        by mail.efficios.com (Postfix) with ESMTP id CCEEF38DFEE;
        Tue, 19 Oct 2021 17:13:32 -0400 (EDT)
Date:   Tue, 19 Oct 2021 17:13:32 -0400 (EDT)
From:   =?utf-8?B?SsOpcsOpbWll?= Galarneau 
        <jeremie.galarneau@efficios.com>
To:     lttng-dev <lttng-dev@lists.lttng.org>
Cc:     diamon-discuss <diamon-discuss@lists.linuxfoundation.org>,
        linux-trace-users <linux-trace-users@vger.kernel.org>
Message-ID: <636357466.21397.1634678012810.JavaMail.zimbra@efficios.com>
Subject: =?utf-8?Q?[RELEASE]_LTTng-tools_2.13.1_-_Nordicit=C3=A9?=
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [167.114.26.124]
X-Mailer: Zimbra 8.8.15_GA_4156 (ZimbraWebClient - GC95 (Linux)/8.8.15_GA_4156)
Thread-Index: Kc5n48yoKxWau7Qt62hvyg9Mt1QgtQ==
Thread-Topic: LTTng-tools 2.13.1 - =?utf-8?Q?Nordicit=C3=A9?=
Precedence: bulk
List-ID: <linux-trace-users.vger.kernel.org>
X-Mailing-List: linux-trace-users@vger.kernel.org

Hi all,=20

We have just released the first bug-fix release of LTTng-tools 2.13 - Nordi=
cit=C3=A9.=20
This release addresses a number of issues listed below.=20

2021-10-18 lttng-tools 2.13.1 (National Chocolate Cupcake Day)=20
* Fix: ust: app stuck on recv message during UST comm timeout scenario=20
* Fix: ust: UST communication can return -EAGAIN=20
* Fix: ust: segfault on lttng start on filter bytecode copy=20
* Fix: sessiond: previously created channel cannot be enabled=20
* Build fix: Missing message in LTTNG_DEPRECATED invocation=20
* Fix: notification-thread: handling event from a removed tracer event src=
=20
* include: add missing "extern"=20
* include: remove spurious spaces in condition/session-rotation.h=20
* tests: fix header of regression/ust/getcpu-override/run-getcpu-override=
=20
* fix: wrong define used for GCC version check=20
* Fix: userspace-probe: unreported error on string copy error=20
* Fix: userspace-probe: truncating binary path for SDT=20
* Fix: lttng: add-trigger: don't provide a default event rule type=20
* Fix: statements with side-effects in assert statements=20
* Fix: lttng_trace_archive_location_serialize is called on freed memory=20
* Fix: sessiond: ust session is inactive during ust_app_global_update=20
* Fix: common: error query for trigger action protocol error=20
* Fix: common: un-hide two rate policy functions=20
* Fix: include: remove unneeded declaration of lttng_session_descriptor_get=
_session_name=20
* Fix: Tests: race condition in test_ns_contexts_change=20
* Fix: Tests: race condition in test_event_tracker=20
* Fix: man: lttng-rotate: trace file count/size limitation does not apply=
=20
* Fix: runas: less-than-zero comparison of an unsigned value=20
* Fix: runas: supplementary groups are ignored on lttng save=20
* Docs: lttng-event-rule(7): --exclude does not exist, use --exclude-name=
=20
* sessiond: logging typo: {triger, triggger} -> trigger=20
* Fix: lttng: free sessions in cmd_destroy=20
* Fix: lttng: free domains and channels in get_session_stats_str=20

As always, please report any issue you may encounter to bugs.lttng.org=20
or on this mailing list.=20

Project website: https://lttng.org=20

Download link:=20
https://lttng.org/files/lttng-tools/lttng-tools-2.13.1.tar.bz2=20

GPG signature:=20
https://lttng.org/files/lttng-tools/lttng-tools-2.13.1.tar.bz2.asc
