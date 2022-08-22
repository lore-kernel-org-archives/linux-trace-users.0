Return-Path: <linux-trace-users-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 508F6C28D13
	for <linux-trace-users@archiver.kernel.org>; Mon, 22 Aug 2022 20:44:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231945AbiHVUoC (ORCPT
        <rfc822;linux-trace-users@archiver.kernel.org>);
        Mon, 22 Aug 2022 16:44:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41152 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232115AbiHVUn5 (ORCPT
        <rfc822;linux-trace-users@vger.kernel.org>);
        Mon, 22 Aug 2022 16:43:57 -0400
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E10B411154
        for <linux-trace-users@vger.kernel.org>; Mon, 22 Aug 2022 13:43:55 -0700 (PDT)
Received: by mail-qk1-f180.google.com with SMTP id w18so8842659qki.8
        for <linux-trace-users@vger.kernel.org>; Mon, 22 Aug 2022 13:43:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc;
        bh=/E1MCv6jIqywlx2T+QjL9+2bBheMW77ZNvh3S9siNKs=;
        b=NGyqqHA1dWlOTBz2TQN5NCxyQVJCoqZ285Pkz3sWeiTo7Gm7nD59wQd9rbptC0Y8Vp
         4OqgxjkcEHF4OUyiELdZWi9CqfJS3VHaAtzm+kXuT4DPm2JQeKJ/a1RMLQB6z+66oTvL
         DyfFlbGoaTi9aY0LdoUoXI7XueUgsXpfkUg/4gphBwTTnoZpA2Z6TV+zHly2cGXLDoM6
         Pk5XJUJSE5h6YMXAFyIVptr4J8Z6UDtvRQhhNiWeIbxvoIrfEJTLvWp9E3tTrsGViegU
         tD/dMIrfAc2WCenJ1JrXjAMgmyyph02fllsXjEkJ6svNBOKipaQa5AbDv+vEy14zUAB8
         Gfjw==
X-Gm-Message-State: ACgBeo3A663nB/Bs9GNu4bZ0aJC72OB49G7TvwEftOEVCQtkKuFLWAbg
        effK44/mI38gzjDO1UKG4rY=
X-Google-Smtp-Source: AA6agR5+DFS1u1r2z0Rvahm5u+84GpI9Eg0j8+79rllj8Vgze5UDX4pQw+7BWIVmLWV2+4WVb2TmSQ==
X-Received: by 2002:a37:895:0:b0:6ba:fa6f:e50b with SMTP id 143-20020a370895000000b006bafa6fe50bmr13893239qki.419.1661201034876;
        Mon, 22 Aug 2022 13:43:54 -0700 (PDT)
Received: from gmail.com (192-222-180-24.qc.cable.ebox.net. [192.222.180.24])
        by smtp.gmail.com with ESMTPSA id k8-20020ac80748000000b0031ee918e9f9sm9028741qth.39.2022.08.22.13.43.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Aug 2022 13:43:54 -0700 (PDT)
Date:   Mon, 22 Aug 2022 16:43:52 -0400
From:   =?iso-8859-1?Q?J=E9r=E9mie?= Galarneau 
        <jeremie.galarneau@efficios.com>
To:     lttng-dev@lists.lttng.org
Cc:     linux-trace-users <linux-trace-users@vger.kernel.org>,
        diamon-discuss <diamon-discuss@lists.linuxfoundation.org>
Subject: [RELEASE] LTTng-tools =?iso-8859-1?B?Mi4x?=
 =?iso-8859-1?Q?3=2E8_-_Nordicit=E9?=
Message-ID: <YwPqiLG+9vhg0Hdg@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-trace-users.vger.kernel.org>
X-Mailing-List: linux-trace-users@vger.kernel.org

Hi all,

We have just released the eighth bug-fix release of LTTng-tools 2.13 -
Nordicité. This release addresses a number of issues listed below.

2022-08-22 lttng-tools 2.13.8 (National Bao Day)
    * Fix: waiter: futex wait: handle spurious futex wakeups
    * Fix: futex wait: handle spurious futex wakeups
    * Fix: utils: unhandled close return value
    * Fix: agent port file is o+w when launching as root
    * Fix: tests: don't assume sequential cpuids
    * Fix: sessiond: handle empty scheduled rotations
    * Fix: sessiond: report client list allocation failure as a fatal error
    * Fix: ust-consumerd: set `hangup_flush_done` in a locked context
    * Fix: sessiond: size-based rotations never trigger
    * Fix: lttng-snapshot: use after free of max size argument
    * Fix: lttng: snapshot: add-output: leak of max size parameter
    * Tests: fix: lttng-create: leaked command parameter
    * Fix: sessiond: rotation trigger leak
    * Tests: fix: schedule api: leak of rotation schedule list
    * Fix: lttng: enable-rotation: leak of command parameter
    * Fix: lttng: track: leaked command parameter
    * Fix: lttng: add-trigger: leak of parser context on capture
    * Tests: fix: leak of trigger in trigger listing tests
    * Fix: action error query: leak of action path
    * Fix: lttng: enable-channel: leak of popt arguments
    * Tests: clean-up: rate policy: remove stale comment
    * Tests: fix: leak of rate policy in rate policy unit tests
    * Tests: fix: leak of payload in serdes test of log level rule
    * Tests: fix: leak of some attributes of ltt_ust_session
    * Fix: liblttng-ctl: leak of payload on field listing
    * Fix: liblttng-ctl: non-packed structure used for tracker serialization
    * Fix: test: lttng kernel modules still loaded after running test_clock_override

As always, please report any issue you may encounter to bugs.lttng.org
or on this mailing list.

Project website: https://lttng.org

Download link:
https://lttng.org/files/lttng-tools/lttng-tools-2.13.8.tar.bz2

GPG signature:
https://lttng.org/files/lttng-tools/lttng-tools-2.13.8.tar.bz2.asc
