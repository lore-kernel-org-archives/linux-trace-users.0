Return-Path: <SRS0=hLcL=OG=vger.kernel.org=linux-trace-users-owner@goodmis.org>
Received: from mail.kernel.org ([198.145.29.99]:40218 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728303AbeK0O0c (ORCPT
        <rfc822;linux-trace-users@vger.kernel.org>);
        Tue, 27 Nov 2018 09:26:32 -0500
Date: Mon, 26 Nov 2018 22:30:04 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: Trip Volpe <trip.volpe@gmail.com>
Cc: linux-trace-users@vger.kernel.org
Subject: Re: Missing exceptions:page_fault_user event?
Message-ID: <20181126223004.3e5e5c42@vmware.local.home>
In-Reply-To: <CANaP9wOV7nWjEwvef1B9dPCJfcvgFNwm1Nzt19_SzNnBEJLVqg@mail.gmail.com>
References: <CANaP9wOV7nWjEwvef1B9dPCJfcvgFNwm1Nzt19_SzNnBEJLVqg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-trace-users-owner@vger.kernel.org
List-ID: <linux-trace-users.vger.kernel.org>

On Mon, 26 Nov 2018 18:49:19 -0800
Trip Volpe <trip.volpe@gmail.com> wrote:

> Hey all; I'm trying to use `perf record` to get detailed information
> about user page faults, including the addresses at which the faults
> occurred. I've done this before with, e.g., `perf record -e
> exceptions:page_fault_user -p 12345 sleep 1`.
> 
> However, on the system I'm examining now, I just get an "unknown
> tracepoint" error. I checked
> /sys/kernel/debug/tracing/events/exceptions, and sure enough, that

I'm guessing that debugfs is mounted. What other event systems are
there?

 # ls /sys/kernel/debug/tracing/event

What does the above produce?

-- Steve


> path does not exist. Does anybody happen to know under what
> circumstances these tracepoints could be disabled or omitted? I've
> looked through the kconfigs and sysctls for anything that might seem
> relevant but have had no luck so far.
> 
> I'm running Ubuntu 16.04 with kernel 4.13 on a dual Xeon Gold 6126 system.
> 
> # uname -a
> Linux test 4.13.0-37-generic #42~16.04.1 SMP Sat May 12 06:21:13 UTC
> 2018 x86_64 x86_64 x86_64 GNU/Linux
> 
> My kernel config is here: https://pastebin.com/raw/A62FDFd6
> 
> Any help or pointers would be greatly appreciated!
