Return-Path: <linux-trace-users-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D6A7C433EF
	for <linux-trace-users@archiver.kernel.org>; Thu, 27 Jan 2022 20:35:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237485AbiA0Ufp (ORCPT
        <rfc822;linux-trace-users@archiver.kernel.org>);
        Thu, 27 Jan 2022 15:35:45 -0500
Received: from mail.efficios.com ([167.114.26.124]:39904 "EHLO
        mail.efficios.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232519AbiA0Ufp (ORCPT
        <rfc822;linux-trace-users@vger.kernel.org>);
        Thu, 27 Jan 2022 15:35:45 -0500
Received: from localhost (localhost [127.0.0.1])
        by mail.efficios.com (Postfix) with ESMTP id 4C86437885E;
        Thu, 27 Jan 2022 15:35:40 -0500 (EST)
Received: from mail.efficios.com ([127.0.0.1])
        by localhost (mail03.efficios.com [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id ZEbCELoJEu9F; Thu, 27 Jan 2022 15:35:39 -0500 (EST)
Received: from localhost (localhost [127.0.0.1])
        by mail.efficios.com (Postfix) with ESMTP id 6FC8D378981;
        Thu, 27 Jan 2022 15:35:39 -0500 (EST)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.efficios.com 6FC8D378981
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=efficios.com;
        s=default; t=1643315739;
        bh=mROe4GyHMvDFFwNlwOKXcvKEkQRbdmPBttn4H4Y9mhw=;
        h=Date:From:To:Message-ID:MIME-Version;
        b=pKNQzLcwuWtq/nmP4urVjgSyuTtj3B05laRlgg/6LY99yIvlX7caC24q+4Vq3J47f
         QFUord5BR089W5cFeKCq65QxhtjFaMvvqOcNRn+krHXwGtbYWBU3Q3KHVPOyjbR4M4
         TRMznrE+2Fbq4qrM4d+pFvBs1guPBh1xXulH80xuiOfYOdGIljBMj41fnwbL4ELB+z
         5yVEgp2InhW35oYXlT8XUPUPhixOp2ZQ5sPgDn3gMfjePYzOUTuIAGJW1jjvGiLAB/
         +RSV9viyxQDLzpzD4RKsLg/7+w4Ttpj0aiEf/rUBxCxbaaUXLLu7sJzGdAWI1qaq4d
         ItP/+AZ8IzcXQ==
X-Virus-Scanned: amavisd-new at efficios.com
Received: from mail.efficios.com ([127.0.0.1])
        by localhost (mail03.efficios.com [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id FLMgEnkUHnMT; Thu, 27 Jan 2022 15:35:39 -0500 (EST)
Received: from Mercury (unknown [107.159.88.171])
        by mail.efficios.com (Postfix) with ESMTPSA id 411A2378980;
        Thu, 27 Jan 2022 15:35:39 -0500 (EST)
Date:   Thu, 27 Jan 2022 15:35:39 -0500
From:   =?iso-8859-1?Q?J=E9r=E9mie?= Galarneau 
        <jeremie.galarneau@efficios.com>
To:     lttng-dev@lists.lttng.org
Cc:     diamon-discuss@lists.linuxfoundation.org,
        linux-trace-users@vger.kernel.org
Subject: [RELEASE] LTTng-tools =?iso-8859-1?B?Mi4x?=
 =?iso-8859-1?Q?3=2E4_-_Nordicit=E9?=
Message-ID: <YfMCG9NUWn+iIXV8@Mercury>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-trace-users.vger.kernel.org>
X-Mailing-List: linux-trace-users@vger.kernel.org

Hi all,

We have just released the third bug-fix release of LTTng-tools 2.13 - Nor=
dicit=E9.
This release addresses a number of issues listed below.

2022-01-26 lttng-tools 2.13.4 (National Peanut Brittle Day)
    * Build fix: hashtable: hashtable.cpp does not exist
    * Fix: _lttng_variant_statedump should expect lttng_ust_ctl_atype_var=
iant_nestable
    * Fix context mismatch across UST version due to legacy array context=
 field
    * Relicence all source and header files included in LGPL code
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

Note that v2.13.3 was tagged nearly simultaneously as this release, but
unannounced since a bad backport caused the generation of the tarball to =
fail.
The change log above combines the changes relevant to both releases.

As always, please report any issue you may encounter to bugs.lttng.org
or on this mailing list.

Project website: https://lttng.org

Download link:
https://lttng.org/files/lttng-tools/lttng-tools-2.13.4.tar.bz2

GPG signature:
https://lttng.org/files/lttng-tools/lttng-tools-2.13.4.tar.bz2.asc
