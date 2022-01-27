Return-Path: <linux-trace-users-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00BEAC433F5
	for <linux-trace-users@archiver.kernel.org>; Thu, 27 Jan 2022 20:37:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235660AbiA0Uh3 (ORCPT
        <rfc822;linux-trace-users@archiver.kernel.org>);
        Thu, 27 Jan 2022 15:37:29 -0500
Received: from mail.efficios.com ([167.114.26.124]:40760 "EHLO
        mail.efficios.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232519AbiA0Uh3 (ORCPT
        <rfc822;linux-trace-users@vger.kernel.org>);
        Thu, 27 Jan 2022 15:37:29 -0500
Received: from localhost (localhost [127.0.0.1])
        by mail.efficios.com (Postfix) with ESMTP id DF84D3782F3;
        Thu, 27 Jan 2022 15:37:28 -0500 (EST)
Received: from mail.efficios.com ([127.0.0.1])
        by localhost (mail03.efficios.com [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id PTavphWkYKx1; Thu, 27 Jan 2022 15:37:28 -0500 (EST)
Received: from localhost (localhost [127.0.0.1])
        by mail.efficios.com (Postfix) with ESMTP id 5F5813787B2;
        Thu, 27 Jan 2022 15:37:28 -0500 (EST)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.efficios.com 5F5813787B2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=efficios.com;
        s=default; t=1643315848;
        bh=z7HN9bZ4OXSffusMwr4iygsXkvvLsv+N8vADDAIyRrM=;
        h=Date:From:To:Message-ID:MIME-Version;
        b=dXhV8vT8aiQrs4mUrdMcBybwCFXoEuC8iuwJFMQWuycGjQi3kXErfCU0SdsvuaUPr
         H67WoZ2cW0WqfzPGpCXZtAThDJKCyCyfng77hqiB8akv9FmZB/stdInluFJWC1iGoe
         sC8peumXT3a1YZRB9NB8UnTJKE0jvB7xrA0FXAZBUw6B3jMhDLKWJsEpc8joOEdj1Q
         Z90R5iBizO3N5BDulnX0VxgcPezOEETwTJ8trznQkzABZeRApqywfeQq++29nPd7ym
         9BfAwrc8Ha1C9ALCbv7MnQMVpT2HNknBBU/bfB5BWEw+xdNDkQPn6Bm4UsrqfT58lk
         S0/5P4Dwj+zKQ==
X-Virus-Scanned: amavisd-new at efficios.com
Received: from mail.efficios.com ([127.0.0.1])
        by localhost (mail03.efficios.com [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id RNPLVCDXop1S; Thu, 27 Jan 2022 15:37:28 -0500 (EST)
Received: from Mercury (unknown [107.159.88.171])
        by mail.efficios.com (Postfix) with ESMTPSA id 3B88A37889C;
        Thu, 27 Jan 2022 15:37:28 -0500 (EST)
Date:   Thu, 27 Jan 2022 15:37:28 -0500
From:   =?iso-8859-1?Q?J=E9r=E9mie?= Galarneau 
        <jeremie.galarneau@efficios.com>
To:     lttng-dev@lists.lttng.org
Cc:     diamon-discuss@lists.linuxfoundation.org,
        linux-trace-users@vger.kernel.org
Subject: [RELEASE] LTTng-tools 2.12.8 - (Ta) Meilleure
Message-ID: <YfMCiCbVI/t2zBkX@Mercury>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-trace-users.vger.kernel.org>
X-Mailing-List: linux-trace-users@vger.kernel.org

Hi all,

We have just released the eighth bug-fix release of LTTng-tools 2.12=E2=80=
=94(Ta)
Meilleure. This release addresses a number of issues listed below.

2022-01-26 lttng-tools 2.12.8 (National Peanut Brittle Day)
    * Relicence all source and header files included in LGPL code
    * Fix: sessiond: use of null session when session is not found
    * Move utils_expand_path and utils_expand_path_keep_symlink to libpat=
h.la
    * Link lttng executable on libcommon-lgpl.a
    * Introduce libcommon-lgpl for liblttng-ctl
    * Rename libcommon.so to libcommon-gpl.so
    * Copyright ownership transfer
    * Copyright ownership transfer
    * Fix: relayd: erroneous rundir permission logging message
    * Fix: sessiond: rotation thread: fatal error when not finding a sess=
ion
    * Fix: relayd: rotation failure for multi-domain session
    * Fix: lttng-ctl: lttng_list_sessions: initialize out_sessions to NUL=
L when returning 0
    * Fix: lttng: initialize variable in run_command_string
    * Fix: consumer-stream: live viewers observe timestamps going backwar=
ds
    * Fix: relayd: ressource leaks on viewer_stream_create error
    * Fix: relayd: live: erroneous message timestamp observed from live v=
iewer
    * Fix: relayd: failure to open chunk files concurrently with session =
clear
    * Fix: relayd: live: metadata stream reference count < 0 assert

As always, please report any issue you may encounter to bugs.lttng.org
or on this mailing list.

Project website: https://lttng.org

Download link:
https://lttng.org/files/lttng-tools/lttng-tools-2.12.8.tar.bz2

GPG signature:
https://lttng.org/files/lttng-tools/lttng-tools-2.12.8.tar.bz2.asc
