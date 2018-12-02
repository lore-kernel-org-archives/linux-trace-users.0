Return-Path: <SRS0=KYjb=OL=vger.kernel.org=linux-trace-users-owner@goodmis.org>
Received: from mail.kernel.org ([198.145.29.99]:55724 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725779AbeLBWPq (ORCPT
        <rfc822;linux-trace-users@vger.kernel.org>);
        Sun, 2 Dec 2018 17:15:46 -0500
Date: Sun, 2 Dec 2018 17:15:40 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: Trip Volpe <trip.volpe@gmail.com>
Cc: linux-trace-users@vger.kernel.org
Subject: Re: Missing exceptions:page_fault_user event?
Message-ID: <20181202171540.6df6c2e1@vmware.local.home>
In-Reply-To: <CANaP9wNqYQ4GUxg52cJNJTYhjj0eU4E19rcfyzH7PLU57Ks4OA@mail.gmail.com>
References: <CANaP9wOV7nWjEwvef1B9dPCJfcvgFNwm1Nzt19_SzNnBEJLVqg@mail.gmail.com>
        <20181126223004.3e5e5c42@vmware.local.home>
        <CANaP9wNqYQ4GUxg52cJNJTYhjj0eU4E19rcfyzH7PLU57Ks4OA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-trace-users-owner@vger.kernel.org
List-ID: <linux-trace-users.vger.kernel.org>

On Sun, 2 Dec 2018 13:33:34 -0800
Trip Volpe <trip.volpe@gmail.com> wrote:

> These tracepoints are still removed as of the latest Ubuntu 4.13 HWE
> kernel. I tried putting them back, and sure enough cratering ensued,
> so it looks like my best bet is to try moving forward to a newer
> kernel. Thanks for the help, Steve!

Thanks for the update.

-- Steve
