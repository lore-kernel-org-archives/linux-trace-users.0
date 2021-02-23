Return-Path: <linux-trace-users-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12AA7C433DB
	for <linux-trace-users@archiver.kernel.org>; Tue, 23 Feb 2021 16:42:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BC75464E61
	for <linux-trace-users@archiver.kernel.org>; Tue, 23 Feb 2021 16:42:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233340AbhBWQmL (ORCPT
        <rfc822;linux-trace-users@archiver.kernel.org>);
        Tue, 23 Feb 2021 11:42:11 -0500
Received: from mail-qk1-f180.google.com ([209.85.222.180]:45408 "EHLO
        mail-qk1-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233331AbhBWQmK (ORCPT
        <rfc822;linux-trace-users@vger.kernel.org>);
        Tue, 23 Feb 2021 11:42:10 -0500
Received: by mail-qk1-f180.google.com with SMTP id z128so12230680qkc.12
        for <linux-trace-users@vger.kernel.org>; Tue, 23 Feb 2021 08:41:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=9VG1zpBMCSz829bCPbFEmOxsMCmT/agd2UxnO9sydxc=;
        b=OEeiR7J0enMoUNaWTS6ZrgTUtum1yzm0NKsKwSJyiT3UstRgTEcbSSewGHQ7lbPfEN
         3SdTw2QUHt1OfdI/W6GBIeUiGBV4VK/PK7/vxIJmREZN60nuW2idwzeV4Z8tabP5okxl
         4loCd9+rU9aDQVOIt1YrfiqAHD4Hpda9yKdz7y8b2rtM1VvyzaZZQ2uVg4BjkpOqiTPl
         odlYNbjnmR/Tb/a2eJ/TP2V9YjVLtVTjWyAxdrseKEVopDsFEZx9xHhupXmMlbkYhMww
         aAb8A6mJhVcBuYDN5xD53p3IRlhjWcblvursiCmj0p39t9ZXNmMk9o6czCrH4x4xY+4u
         4eKg==
X-Gm-Message-State: AOAM530/ZUqZY/ymZCfO/QtrdibzCS6K5IAaEtCKYZlmJcwBHlmeGcd4
        oXY5aaaRuQR/gVY03jmlxfw=
X-Google-Smtp-Source: ABdhPJzYSrumcrE8JBf/rQqJe6XZguTgvMr92feeykYwXt+enKmbDMBP+zS8EICp/nSFg2AZ2St3TQ==
X-Received: by 2002:a37:a70c:: with SMTP id q12mr27268562qke.378.1614098488828;
        Tue, 23 Feb 2021 08:41:28 -0800 (PST)
Received: from gmail.com ([107.159.88.171])
        by smtp.gmail.com with ESMTPSA id p25sm14840926qkh.79.2021.02.23.08.41.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Feb 2021 08:41:28 -0800 (PST)
Date:   Tue, 23 Feb 2021 11:41:26 -0500
From:   =?iso-8859-1?Q?J=E9r=E9mie?= Galarneau 
        <jeremie.galarneau@efficios.com>
To:     lttng-dev@lists.lttng.org
Cc:     diamon-discuss@lists.linuxfoundation.org,
        linux-trace-users@vger.kernel.org
Subject: [RELEASE] LTTng-tools 2.11.6 - Lafontaine
Message-ID: <YDUwNj4q7yrcdpF6@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-trace-users.vger.kernel.org>
X-Mailing-List: linux-trace-users@vger.kernel.org

Hi all,

The sixth bug-fix release of LTTng-tools 2.11 - Lafontaine has just
been released. This release addresses a number of issues listed below.

2021-02-22 lttng-tools 2.11.6 (National Margarita Day)
        * Fix: use MT-safe strtok_r in multithreaded context
        * Fix: liblttng-ctl: unreported truncations when copying strings
        * Fix: configure: support Autoconf 2.70
        * Fix: sessiond: metadata not created on app unregistration during start
        * Cleanup: use `modprobe --remove` rather than `rmmod`
        * Tests: Fix: 99% fill ratio for high buffer usage is too high for larger events
        * Fix: common: poll: compat_poll_wait never finishes
        * Build fix: implicit declaration of function 'PERROR' on Solaris
        * Fix: PERROR spam when `tracing` group does not exist
        * Fix: memcpy used on potentially overlapping regions

As always, please report any issue you may encounter to bugs.lttng.org
or on this mailing list.

Project website: https://lttng.org

Download link:
https://lttng.org/files/lttng-tools/lttng-tools-2.11.6.tar.bz2

GPG signature:
https://lttng.org/files/lttng-tools/lttng-tools-2.11.6.tar.bz2.asc
