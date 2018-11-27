Return-Path: <SRS0=hLcL=OG=vger.kernel.org=linux-trace-users-owner@goodmis.org>
Received: from mail-oi1-f194.google.com ([209.85.167.194]:39801 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727741AbeK0Npu (ORCPT
        <rfc822;linux-trace-users@vger.kernel.org>);
        Tue, 27 Nov 2018 08:45:50 -0500
Received: by mail-oi1-f194.google.com with SMTP id i6so6354972oia.6
        for <linux-trace-users@vger.kernel.org>; Mon, 26 Nov 2018 18:49:31 -0800 (PST)
MIME-Version: 1.0
From: Trip Volpe <trip.volpe@gmail.com>
Date: Mon, 26 Nov 2018 18:49:19 -0800
Message-ID: <CANaP9wOV7nWjEwvef1B9dPCJfcvgFNwm1Nzt19_SzNnBEJLVqg@mail.gmail.com>
Subject: Missing exceptions:page_fault_user event?
To: linux-trace-users@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-trace-users-owner@vger.kernel.org
List-ID: <linux-trace-users.vger.kernel.org>

Hey all; I'm trying to use `perf record` to get detailed information
about user page faults, including the addresses at which the faults
occurred. I've done this before with, e.g., `perf record -e
exceptions:page_fault_user -p 12345 sleep 1`.

However, on the system I'm examining now, I just get an "unknown
tracepoint" error. I checked
/sys/kernel/debug/tracing/events/exceptions, and sure enough, that
path does not exist. Does anybody happen to know under what
circumstances these tracepoints could be disabled or omitted? I've
looked through the kconfigs and sysctls for anything that might seem
relevant but have had no luck so far.

I'm running Ubuntu 16.04 with kernel 4.13 on a dual Xeon Gold 6126 system.

# uname -a
Linux test 4.13.0-37-generic #42~16.04.1 SMP Sat May 12 06:21:13 UTC
2018 x86_64 x86_64 x86_64 GNU/Linux

My kernel config is here: https://pastebin.com/raw/A62FDFd6

Any help or pointers would be greatly appreciated!
