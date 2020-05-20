Return-Path: <SRS0=7OpS=7C=vger.kernel.org=linux-trace-users-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6826C433E0
	for <linux-trace-users@archiver.kernel.org>; Wed, 20 May 2020 02:29:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8D1112075F
	for <linux-trace-users@archiver.kernel.org>; Wed, 20 May 2020 02:29:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726938AbgETC3O (ORCPT
        <rfc822;linux-trace-users@archiver.kernel.org>);
        Tue, 19 May 2020 22:29:14 -0400
Received: from mail-qt1-f176.google.com ([209.85.160.176]:39033 "EHLO
        mail-qt1-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726178AbgETC3O (ORCPT
        <rfc822;linux-trace-users@vger.kernel.org>);
        Tue, 19 May 2020 22:29:14 -0400
Received: by mail-qt1-f176.google.com with SMTP id l1so1444615qtp.6
        for <linux-trace-users@vger.kernel.org>; Tue, 19 May 2020 19:29:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=rPUKGfmXkYsGP4DREqFUpS/kXUrJ3TLAO3e53uG8L+E=;
        b=VfrhR+oSZfm1RTwxBNETggqizVmSP19OwHdvbwIpRYdOcn3/gYOJVGnrXe80CZj0wF
         eJqYz39NmiOuZLoHi8Q/4Z3vhcu0LSgQiIeVwwyqMOGYY6cpsHxKrmdVA3PGzXNlEjCk
         AXX1JsZdk1p2u4ulAYRCoZh4tDeHruNp4KO58lXqiZP9pzZlb0LYJyOUs6Dd2JW6lRj0
         7TPL7CXMj4D4eENNp3izfQExMLM+ol5Kvq6Rn3uQCCfrerL3e/hNoNIpNI3NlK9UNDGJ
         u8Cu8A37sfEELbrmEMn7KNQcdCJeZKnKmUBrW+ng0jNdXNyLk5DwMPe6KpvCyQ0rwZjO
         4hWg==
X-Gm-Message-State: AOAM530n3wITe5i5qQHm3E2a98NUbbPm73DSXIfu8SJLruMK98UiyNHS
        lT/47xs5z/nhDIXchTxIyKXClB+U
X-Google-Smtp-Source: ABdhPJwGVFuGCjqo3bXXAzPFkGODF/nBIKCgRl0Lmx1oahPxlZPDhLYJE8yxS8cqOqxiqVejgMX+bA==
X-Received: by 2002:ac8:1604:: with SMTP id p4mr3054745qtj.260.1589941753501;
        Tue, 19 May 2020 19:29:13 -0700 (PDT)
Received: from gmail.com (192-222-251-19.qc.cable.ebox.net. [192.222.251.19])
        by smtp.gmail.com with ESMTPSA id c25sm1109041qkm.119.2020.05.19.19.29.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2020 19:29:12 -0700 (PDT)
Date:   Tue, 19 May 2020 22:29:10 -0400
From:   =?iso-8859-1?Q?J=E9r=E9mie?= Galarneau 
        <jeremie.galarneau@efficios.com>
To:     lttng-dev@lists.lttng.org
Cc:     diamon-discuss@lists.linuxfoundation.org,
        linux-trace-users@vger.kernel.org
Subject: [RELEASE] LTTng-tools 2.11.4 - Lafontaine
Message-ID: <20200520022910.GA117998@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-trace-users-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-trace-users.vger.kernel.org>
X-Mailing-List: linux-trace-users@vger.kernel.org

Hi all,

The fourth bug-fix release of LTTng-tools 2.11 - Lafontaine has just
been released. This release addresses a number of issues listed below.

2020-05-19 lttng-tools 2.11.4 (Dinosaur Day)
	* Fix: common: abort on rotation after time manipulation
	* Fix: tests: `-Wstringop-overflow` warning
	* Fix: load: incomplete error handling for load_session_from_file

As always, please report any issue you may encounter to bugs.lttng.org
or on this mailing list.

Project website: https://lttng.org

Download link:
https://lttng.org/files/lttng-tools/lttng-tools-2.11.4.tar.bz2

GPG signature:
https://lttng.org/files/lttng-tools/lttng-tools-2.11.4.tar.bz2.asc
