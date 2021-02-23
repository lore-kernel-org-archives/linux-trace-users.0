Return-Path: <linux-trace-users-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E31A0C433DB
	for <linux-trace-users@archiver.kernel.org>; Tue, 23 Feb 2021 16:38:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 91CC764E60
	for <linux-trace-users@archiver.kernel.org>; Tue, 23 Feb 2021 16:38:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233609AbhBWQii (ORCPT
        <rfc822;linux-trace-users@archiver.kernel.org>);
        Tue, 23 Feb 2021 11:38:38 -0500
Received: from mail-qk1-f173.google.com ([209.85.222.173]:44344 "EHLO
        mail-qk1-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233594AbhBWQic (ORCPT
        <rfc822;linux-trace-users@vger.kernel.org>);
        Tue, 23 Feb 2021 11:38:32 -0500
Received: by mail-qk1-f173.google.com with SMTP id 204so11791847qke.11
        for <linux-trace-users@vger.kernel.org>; Tue, 23 Feb 2021 08:38:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=UX/X/vH/Rv/KiVqanLd+P6xK64cOj5zDqL0/qwd1fvg=;
        b=kdpGAA1dweuoRIxpZrB99TIizmG6LESac+gyX8J5wa+pM5Go+qA0HEsTKhb1IzzbrK
         C3OaYVrcwlFgkwI2ZwBo9dZ7JiQAE5xrDkFq/FE8U+PEfLSvHlSg9KRWACb3eR91UHgz
         EgpyJLc9SVnJrLlKHj30Y4FWU1x6k4g/OCvjKCxNiUeJuvuIsDpxiA8nDxg4M8QmHgl1
         ezQqyFsOppg02ydopwkqI0ggFeTIbtU7msI4Av1x3lN07Yg+UTqZpHC3UoTT79Zz4phi
         GgyGsSM3skvR9lJ22LmKmDpNjGoyHLnCA1rr+TQdu9lSozSREqKMQeWMDfdvVbs2n2BP
         xYoQ==
X-Gm-Message-State: AOAM532XxUWzrGoZxDp5FKGCXxBbQ2e6QRiqAryGG3jTYllYI5UlSoGv
        IlT7mqkhEaZL3IXuAvZ2yd5QehNHMPBTuw==
X-Google-Smtp-Source: ABdhPJwg3liWOqNnENbHGUcZKllujr+qmCLfcFdaF7jTIG+Ul02TDaAYQKklFAGhfhvomtpMTZZ0kA==
X-Received: by 2002:a37:7245:: with SMTP id n66mr27585113qkc.374.1614098270535;
        Tue, 23 Feb 2021 08:37:50 -0800 (PST)
Received: from gmail.com ([107.159.88.171])
        by smtp.gmail.com with ESMTPSA id d1sm12878649qtq.94.2021.02.23.08.37.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Feb 2021 08:37:50 -0800 (PST)
Date:   Tue, 23 Feb 2021 11:37:48 -0500
From:   =?iso-8859-1?Q?J=E9r=E9mie?= Galarneau 
        <jeremie.galarneau@efficios.com>
To:     lttng-dev@lists.lttng.org
Cc:     diamon-discuss@lists.linuxfoundation.org,
        linux-trace-users@vger.kernel.org
Subject: [RELEASE] LTTng 2.12.3 - (Ta) Meilleure
Message-ID: <YDUvXIaalnJkYYId@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-trace-users.vger.kernel.org>
X-Mailing-List: linux-trace-users@vger.kernel.org

Hi all,

The third bug-fix release of LTTng-tools 2.12 - (Ta) Meilleure has just been
released. This release addresses a number of issues listed below.

2021-02-22 lttng-tools 2.12.3 (National Margarita Day)
        * Fix: ust-consumer: metadata thread not woken-up after version change
        * Clean-up: ust-consumer: simplify metadata cache unlock on error path
        * Fix: sessiond: timer: unitiliazed sigevent fields
        * Fix: sessiond: ust-registry: dereference of NULL pointer on allocation failure
        * Fix: ust-consumer: metadata cache lock not taken when sampling max offset
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
https://lttng.org/files/lttng-tools/lttng-tools-2.12.3.tar.bz2

GPG signature:
https://lttng.org/files/lttng-tools/lttng-tools-2.12.3.tar.bz2.asc
