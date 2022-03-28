Return-Path: <linux-trace-users-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE8A4C433FE
	for <linux-trace-users@archiver.kernel.org>; Mon, 28 Mar 2022 21:01:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229671AbiC1VDH (ORCPT
        <rfc822;linux-trace-users@archiver.kernel.org>);
        Mon, 28 Mar 2022 17:03:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48426 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234674AbiC1VDA (ORCPT
        <rfc822;linux-trace-users@vger.kernel.org>);
        Mon, 28 Mar 2022 17:03:00 -0400
Received: from mail.efficios.com (mail.efficios.com [167.114.26.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 25B8D70CD6
        for <linux-trace-users@vger.kernel.org>; Mon, 28 Mar 2022 14:01:18 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
        by mail.efficios.com (Postfix) with ESMTP id 7D5F83FC1CF;
        Mon, 28 Mar 2022 17:01:17 -0400 (EDT)
Received: from mail.efficios.com ([127.0.0.1])
        by localhost (mail03.efficios.com [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id LbaEtfqidB-T; Mon, 28 Mar 2022 17:01:16 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
        by mail.efficios.com (Postfix) with ESMTP id C0B9E3FC1CE;
        Mon, 28 Mar 2022 17:01:16 -0400 (EDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.efficios.com C0B9E3FC1CE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=efficios.com;
        s=default; t=1648501276;
        bh=Ila+vQ2OG4f/wha4hIM+kFx4meSP/QrxGDIyu5JtsAk=;
        h=Date:From:To:Message-ID:MIME-Version;
        b=mwqogF6qCY7mGz6wEwWS27e/gjhyyXB/Is1KGm7KpjK+wxHCwl9iS3qtZLtV3pwi9
         otkPv5FCqWK3SIRV3yJOrrBUaJEmWOtC4vyrx/k5/ERZd/23n4Cy7PL/m2+Htqp9DY
         bVRzKkYxULkWoGELO8rZb9gbTcBn3eQwH8lw+P1eLUt0+4wiANmQ021iPsPM0O4fQN
         ZODgnS3WimLZjb20rAfIe575CSPBriEMYPtFCVDExRh6YEa3BUHE1yGHRAu/Hs9UT+
         Wm7qx9cYFHhAmja+uz9YB/MWmMt6HDgEv7mHj0qfnKy0mVNMQGiNsr5G8jdWi8iv06
         TqFS1MphJGohQ==
X-Virus-Scanned: amavisd-new at efficios.com
Received: from mail.efficios.com ([127.0.0.1])
        by localhost (mail03.efficios.com [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id Z712gemk5JzE; Mon, 28 Mar 2022 17:01:16 -0400 (EDT)
Received: from carbonara (192-222-180-24.qc.cable.ebox.net [192.222.180.24])
        by mail.efficios.com (Postfix) with ESMTPSA id 91FF73FC288;
        Mon, 28 Mar 2022 17:01:16 -0400 (EDT)
Date:   Mon, 28 Mar 2022 17:01:16 -0400
From:   =?iso-8859-1?Q?J=E9r=E9mie?= Galarneau 
        <jeremie.galarneau@efficios.com>
To:     lttng-dev@lists.lttng.org
Cc:     diamon-discuss <diamon-discuss@lists.linuxfoundation.org>,
        linux-trace-users <linux-trace-users@vger.kernel.org>
Subject: [RELEASE] LTTng-tools 2.12.10 - (Ta) Meilleure
Message-ID: <YkIiHKpC1VqCb0Ru@carbonara>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-trace-users.vger.kernel.org>
X-Mailing-List: linux-trace-users@vger.kernel.org

Hi all,

We have just released the tenth bug-fix release of LTTng-tools 2.12 - (Ta)
Meilleure. This release addresses a number of issues listed below.

2022-03-28 lttng-tools 2.12.10 (National Hot Tub Day)
	* Fix: Remove liblttng-ctl.so dependency on liburcu-cds.so and liburcu-common.so

As always, please report any issue you may encounter to bugs.lttng.org
or on this mailing list.

Project website: https://lttng.org

Download link:
https://lttng.org/files/lttng-tools/lttng-tools-2.12.10.tar.bz2

GPG signature:
https://lttng.org/files/lttng-tools/lttng-tools-2.12.10.tar.bz2.asc
