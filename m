Return-Path: <linux-trace-users-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C094CC32792
	for <linux-trace-users@archiver.kernel.org>; Mon, 22 Aug 2022 20:46:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230383AbiHVUqa (ORCPT
        <rfc822;linux-trace-users@archiver.kernel.org>);
        Mon, 22 Aug 2022 16:46:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42974 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232252AbiHVUqa (ORCPT
        <rfc822;linux-trace-users@vger.kernel.org>);
        Mon, 22 Aug 2022 16:46:30 -0400
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 09AAA558E8
        for <linux-trace-users@vger.kernel.org>; Mon, 22 Aug 2022 13:46:29 -0700 (PDT)
Received: by mail-qk1-f178.google.com with SMTP id f4so8848744qkl.7
        for <linux-trace-users@vger.kernel.org>; Mon, 22 Aug 2022 13:46:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc;
        bh=YqRGoWKRja1SQkOgrrKfisoM2LDriMkSLJA55cdQ3N4=;
        b=40rQqMNM4yvRY4WkyOC/0u09VlGuRAI8ZC4wIk2NsUrOiWqNV8h5RJkCWBn4Otg0Y5
         OZALKsmZnmInJRRT4AdRl5tX5GHhEbAslObW26hvwLqMk55pAQO7BWkfMPFLbS4/nwCn
         3IQfKb07WJf6LS1h/9jnBr/jwuWdcEMknTyIH63VCzSPX6sN/OsxxPbHmzNp3cXO4Zxw
         HaIlKce3qXTBVxUZ/c4K88AashdwN60wM+pXEIDXSspZ35m8OkP/Dvx/hN6BqqqWP+8w
         T/4khgoaph7KXvW07hTp6wqaIJmSUMa1pMuMYJVLPbjkaoDy4WTpPqngW4PCgZaimQZ5
         Rn1w==
X-Gm-Message-State: ACgBeo3cxNAFU3GOW9VnNMQbi7DNLCyiuNeagl229YP4VlQ6TlGa0TIW
        DBYU8GtH1hr0G5M4cOWif8OrH/01o88=
X-Google-Smtp-Source: AA6agR4JpkSSTKKiP/Aw0mgHulZSwVAVuWTjxQ4tErmZ86QEu+BmPg2u1RBFZYoT/DEhqY7n13DSlg==
X-Received: by 2002:a05:620a:56d:b0:6bb:af44:3d6b with SMTP id p13-20020a05620a056d00b006bbaf443d6bmr13931531qkp.517.1661201187932;
        Mon, 22 Aug 2022 13:46:27 -0700 (PDT)
Received: from gmail.com (192-222-180-24.qc.cable.ebox.net. [192.222.180.24])
        by smtp.gmail.com with ESMTPSA id bi32-20020a05620a31a000b006bc192d277csm3614843qkb.10.2022.08.22.13.46.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Aug 2022 13:46:27 -0700 (PDT)
Date:   Mon, 22 Aug 2022 16:46:26 -0400
From:   =?iso-8859-1?Q?J=E9r=E9mie?= Galarneau 
        <jeremie.galarneau@efficios.com>
To:     lttng-dev@lists.lttng.org
Cc:     diamon-discuss <diamon-discuss@lists.linuxfoundation.org>,
        linux-trace-users <linux-trace-users@vger.kernel.org>
Subject: [RELEASE] LTTng-tools 2.12.12 - (Ta) Meilleure
Message-ID: <YwPrIh/pVjwcqrqU@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-trace-users.vger.kernel.org>
X-Mailing-List: linux-trace-users@vger.kernel.org

Hi all,

We have just released the twelfth bug-fix release of LTTng-tools 2.12 - (Ta)
Meilleure. This release addresses a number of issues listed below.

2022-08-22 lttng-tools 2.12.12 (National Bao Day)
    * Fix: waiter: futex wait: handle spurious futex wakeups
    * Fix: futex wait: handle spurious futex wakeups
    * Fix: utils: unhandled close return value
    * Fix: agent port file is o+w when launching as root
    * Fix: tests: don't assume sequential cpuids
    * Fix: ust-consumerd: set `hangup_flush_done` in a locked context
    * Revert "Fix: sessiond: rotation trigger leak"
    * Fix: lttng-snapshot: use after free of max size argument
    * Fix: lttng: snapshot: add-output: leak of max size parameter
    * Tests: fix: lttng-create: leaked command parameter
    * Fix: sessiond: rotation trigger leak
    * Tests: fix: schedule api: leak of rotation schedule list
    * Fix: lttng: enable-rotation: leak of command parameter
    * Fix: lttng: track: leaked command parameter
    * Fix: lttng: enable-channel: leak of popt arguments
    * Tests: fix: leak of some attributes of ltt_ust_session
    * Fix: liblttng-ctl: non-packed structure used for tracker serialization
    * Fix: test: lttng kernel modules still loaded after running test_clock_override

As always, please report any issue you may encounter to bugs.lttng.org
or on this mailing list.

Project website: https://lttng.org

Download link:
https://lttng.org/files/lttng-tools/lttng-tools-2.12.12.tar.bz2

GPG signature:
https://lttng.org/files/lttng-tools/lttng-tools-2.12.12.tar.bz2.asc
