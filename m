Return-Path: <linux-trace-users-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76494C7EE2F
	for <linux-trace-users@archiver.kernel.org>; Fri,  3 Mar 2023 19:38:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231550AbjCCTio (ORCPT
        <rfc822;linux-trace-users@archiver.kernel.org>);
        Fri, 3 Mar 2023 14:38:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39854 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231574AbjCCTim (ORCPT
        <rfc822;linux-trace-users@vger.kernel.org>);
        Fri, 3 Mar 2023 14:38:42 -0500
Received: from smtpout.efficios.com (unknown [IPv6:2607:5300:203:b2ee::31e5])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F5B4125B0;
        Fri,  3 Mar 2023 11:38:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=efficios.com;
        s=smtpout1; t=1677872311;
        bh=auaPICY5iQiAHx0og0cfA6MDG5WK6y6ybPCJoKwR69U=;
        h=Date:To:From:Subject:From;
        b=xe61lHtUtij/KOCQ6m5FQ5PEVv4zztd/eyiJzEomxpK037+MUc/JIgfTyKQ1ltGNU
         hVTUAe4jttKCUT+EulXuNzr33C0X3x02wUFroB91rAsVKAe0x/aQBPWfgQgad6S7lK
         dmwfZFHROdxaPpXbY6IciAc/LURso2vI9icfbM+CLiDjUd0U+Eqw3jmJ9ci1QTDS8y
         iYhBk/cF9R+LWd/qfwZ0C+IW6Z+QuaPxoTqhNzOaGCCeo50AGYZRY/WbUieLZvLqDq
         0kategCcxuMJA1hPYM6iMXsh1ZQ3pcJnOwUINluGE4Au9NEzQHY2rCglTIkHsw7+rY
         CSrihxpoNxIPA==
Received: from [172.16.0.91] (192-222-180-24.qc.cable.ebox.net [192.222.180.24])
        by smtpout.efficios.com (Postfix) with ESMTPSA id 4PSyvC1wLgzp78;
        Fri,  3 Mar 2023 14:38:31 -0500 (EST)
Message-ID: <65d25dd8-7e4d-7f33-67de-1e4276a10d88@efficios.com>
Date:   Fri, 3 Mar 2023 14:38:36 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Content-Language: en-US
To:     lttng-dev@lists.lttng.org,
        diamon-discuss@lists.linuxfoundation.org,
        linux-trace-users@vger.kernel.org, linux-kernel@vger.kernel.org
From:   Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Subject: [RELEASE] LTTng-modules 2.12.13 and 2.13.9 (Linux kernel tracer)
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-trace-users.vger.kernel.org>
X-Mailing-List: linux-trace-users@vger.kernel.org

This is a release announcement for the two currently maintained stable 
branches of the LTTng-modules project.

* New in these releases

LTTng-modules v2.13.9 contains a fix required to build against Linux v6.2.

Both v2.12.13 and v2.13.9 contain a set of build fixes to follow 
evolution of the jbd2 tracepoint instrumentation within the Linux kernel 
5.4 and 5.10 stable branches.

* Changelog

2023-03-03 (Canadian Bacon Day) LTTng modules 2.13.9
         * fix: jbd2: use the correct print format (v5.4.229)
         * fix: jbd2 upper bound for v5.10.163
         * fix: jbd2: use the correct print format (v5.10.163)
         * fix: btrfs: move accessor helpers into accessors.h (v6.2)

2023-03-03 (Canadian Bacon Day) 2.12.13
         * fix: jbd2: use the correct print format (v5.4.229)
         * fix: jbd2 upper bound for v5.10.163
         * fix: jbd2: use the correct print format (v5.10.163)

Project website: https://lttng.org
Documentation: https://lttng.org/docs
Download link: https://lttng.org/download

-- 
Mathieu Desnoyers
EfficiOS Inc.
https://www.efficios.com
