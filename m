Return-Path: <linux-trace-users-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D161C433F5
	for <linux-trace-users@archiver.kernel.org>; Tue,  8 Mar 2022 10:12:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235094AbiCHKMs (ORCPT
        <rfc822;linux-trace-users@archiver.kernel.org>);
        Tue, 8 Mar 2022 05:12:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44334 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240869AbiCHKMr (ORCPT
        <rfc822;linux-trace-users@vger.kernel.org>);
        Tue, 8 Mar 2022 05:12:47 -0500
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98BAF42EF0
        for <linux-trace-users@vger.kernel.org>; Tue,  8 Mar 2022 02:11:50 -0800 (PST)
Received: by mail-wr1-x435.google.com with SMTP id i8so27609321wrr.8
        for <linux-trace-users@vger.kernel.org>; Tue, 08 Mar 2022 02:11:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to;
        bh=TU/cQ7P0Db2mPqNl5P9K+U5Qs2IocMXhE1ttmS/WqK8=;
        b=icjtxWpPcLQlOgS8hS6xP7c32ZnbGleipEL4flYtpZp8v4u2YCyAHvzfh2BeB1gS3N
         odspsD4ZKzrcuNxp8hVrQRqFrRzaGlX1RqG/IiEB8YVDQ84FSEJgbzLoJbbWaj4aVyPc
         JgS7eVCa6p1PrNwbi6SMRMH/bMgF/D4/kgW1waj30FxgmCqO3CKtDOva2uoNAQLFSE5X
         qO3kM464VU7aWJ5h2aV2wS+4iM/2j4ezQ/juY35rcRwx9SqpGtEy2z0IAsPLcdBuDi/L
         Op6rRTF4IgS4uOK+C3b5dJyOR/bP13JN1AXi9XiTh9J3co0Q/bdGoEnnbXOiHwsJNbYH
         krTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=TU/cQ7P0Db2mPqNl5P9K+U5Qs2IocMXhE1ttmS/WqK8=;
        b=TemnZXEV32Cfa678aIkQYO/Aj3s+L1gxceXvEnzKideqCTfP7unDDajthcfvAeEex3
         SRYQ4lFhDXMOs0E10mCZn3sZUjyGVXIi0t6iAJB6BPIrjjNroaLS8ekC3LN5cCQyIvGF
         fuB1zjaozlbwpQYOaAZYNdmdTZaexRLU52jV+167xBLKBUYYli0VoWSb9dh8TpAIlNN4
         fiiMz1Zf0z33YXZBrE1S6qfWKVumb9vzhba23f/xLoIh/PMJA7/hJGW2VYMHEkz6H7Lj
         XoqDyMZSWYisES/wlCzWGyp11FtbuBEugr5fm/gAa+5DegZDYQCvpp7rZ5rlId6n0yE9
         wLpA==
X-Gm-Message-State: AOAM5320nxwWAx7I7+xXPvjVFp0jwxRqhvT8FMcHziLFpgkuuvowOdED
        s2e/aaPY2dA/WVVe6ysw4SY1kHFU6JoA2vy65LtPDjNEEH0=
X-Google-Smtp-Source: ABdhPJwz5ng8mu0zbWTne11AKuyJWqH41QvxnYZ1I4c4a1g7t5ZAQX0Y6Z298cK/UC3iypvQYb4yh3kHU59oqc37msU=
X-Received: by 2002:a5d:5449:0:b0:1f0:1a0c:963f with SMTP id
 w9-20020a5d5449000000b001f01a0c963fmr11279948wrv.98.1646734308970; Tue, 08
 Mar 2022 02:11:48 -0800 (PST)
MIME-Version: 1.0
From:   Federico Di Pierro <nierro92@gmail.com>
Date:   Tue, 8 Mar 2022 11:11:38 +0100
Message-ID: <CAMZm_C=NR8rmYn_1gnhw5Udx4ypMZy1nwcFucc0=wbYYHhTpHg@mail.gmail.com>
Subject: arm64 execve/clone sys_exit tracepoints
To:     linux-trace-users@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-trace-users.vger.kernel.org>
X-Mailing-List: linux-trace-users@vger.kernel.org

Hi everyone,

While testing Falco on arm64 my team and I encountered some weird
issues; basically, it seems like execve() exit tracepoint is never
called.
Moreover, the clone() exit tracepoint referred to the child process is
also missing.
The issue is present on both the kmod and eBPF probe.

I tested on amznlinux2 with kernel 5.10.96-90.460.amzn2.aarch64, but
other team members tested on other kernel versions too (down to
4.14.X).
I was also able to reproduce the problem using bpftrace tool: hooking
on tracepoint:syscalls:sys_exit_execve; no event is received:

bpftrace -e 'tracepoint:syscalls:sys_exit_execve { printf("execve!\n"); }'

Since sys_enter tracepoints are indeed called, we'd expect the
sys_exit ones to be called too, just like it happens on x86.
The question is: are we missing anything obvious here?

Thank you very much for your time,
Regards
Federico
