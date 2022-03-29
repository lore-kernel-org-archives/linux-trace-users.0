Return-Path: <linux-trace-users-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C531C433EF
	for <linux-trace-users@archiver.kernel.org>; Tue, 29 Mar 2022 03:40:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231820AbiC2Dll (ORCPT
        <rfc822;linux-trace-users@archiver.kernel.org>);
        Mon, 28 Mar 2022 23:41:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55562 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230284AbiC2Dll (ORCPT
        <rfc822;linux-trace-users@vger.kernel.org>);
        Mon, 28 Mar 2022 23:41:41 -0400
Received: from mail.efficios.com (mail.efficios.com [167.114.26.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 328664A3E7
        for <linux-trace-users@vger.kernel.org>; Mon, 28 Mar 2022 20:39:59 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
        by mail.efficios.com (Postfix) with ESMTP id 970E83FE8CF;
        Mon, 28 Mar 2022 23:39:57 -0400 (EDT)
Received: from mail.efficios.com ([127.0.0.1])
        by localhost (mail03.efficios.com [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id s27XZqfeM8iZ; Mon, 28 Mar 2022 23:39:57 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
        by mail.efficios.com (Postfix) with ESMTP id 3B6973FE1E0;
        Mon, 28 Mar 2022 23:39:57 -0400 (EDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.efficios.com 3B6973FE1E0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=efficios.com;
        s=default; t=1648525197;
        bh=F84MEZ2sOoz51vlBPFS0GVwWEDUDmGMGaPlB35vAalE=;
        h=Date:From:To:Message-ID:MIME-Version;
        b=jFO+7ItiBzU8ra/XyYUFmvSReB2RsSOQ0lnmYcp9fxZzWHSVqNLKi0/S+7ugMKzv/
         g4VrdYNurZOd/+XbTCjUOf9p70bcZ3+X9PaApW4+4XbK3/y7gF3iwIfCP0gS9vHrp2
         FFFnTBed3WAid7Tku7V4PV3mUxys7O3BW/yF9qFaz4t6Nk6IBIZlnxuFmHE1WjYOMK
         4bVYM9sw/5e8L/GZYjjN36ZsAWVS8bnyGewn3ETmEffwJR823veyQcpaY6Iyyh0PH1
         XX/4W0YUKLzFCdFLJ9PLTVlkXW8/naPO72qT8BfRK4WgJlRtdZ2moJagPZOJEt1yin
         Kacpp3G2q+QYw==
X-Virus-Scanned: amavisd-new at efficios.com
Received: from mail.efficios.com ([127.0.0.1])
        by localhost (mail03.efficios.com [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id P1ODItY8KeRm; Mon, 28 Mar 2022 23:39:57 -0400 (EDT)
Received: from carbonara (unknown [107.159.88.171])
        by mail.efficios.com (Postfix) with ESMTPSA id 1CFB33FE1DD;
        Mon, 28 Mar 2022 23:39:57 -0400 (EDT)
Date:   Mon, 28 Mar 2022 23:39:56 -0400
From:   =?iso-8859-1?Q?J=E9r=E9mie?= Galarneau 
        <jeremie.galarneau@efficios.com>
To:     lttng-dev@lists.lttng.org
Cc:     linux-trace-users <linux-trace-users@vger.kernel.org>,
        diamon-discuss <diamon-discuss@lists.linuxfoundation.org>
Subject: [RELEASE] LTTng-tools =?iso-8859-1?B?Mi4x?=
 =?iso-8859-1?Q?3=2E6_-_Nordicit=E9?=
Message-ID: <YkJ/jERUzoilTmf6@carbonara>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-trace-users.vger.kernel.org>
X-Mailing-List: linux-trace-users@vger.kernel.org

Hi all,

We have just released the sixth bug-fix release of LTTng-tools 2.13 - Nor=
dicit=E9.
This release addresses a number of issues listed below.

2022-03-28 lttng-tools 2.13.6 (National Hot Tub Day)
	* Fix: hide symbols erroneously exported in 2.13.5

As always, please report any issue you may encounter to bugs.lttng.org
or on this mailing list.

Project website: https://lttng.org

Download link:
https://lttng.org/files/lttng-tools/lttng-tools-2.13.6.tar.bz2

GPG signature:
https://lttng.org/files/lttng-tools/lttng-tools-2.13.6.tar.bz2.asc
