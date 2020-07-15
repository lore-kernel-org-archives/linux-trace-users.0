Return-Path: <SRS0=Bpf1=A2=vger.kernel.org=linux-trace-users-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51FE9C433DF
	for <linux-trace-users@archiver.kernel.org>; Wed, 15 Jul 2020 21:39:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2A125206F5
	for <linux-trace-users@archiver.kernel.org>; Wed, 15 Jul 2020 21:39:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726675AbgGOVjz (ORCPT
        <rfc822;linux-trace-users@archiver.kernel.org>);
        Wed, 15 Jul 2020 17:39:55 -0400
Received: from mail.ut.ac.ir ([80.66.177.10]:46364 "EHLO mail.ut.ac.ir"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726479AbgGOVjz (ORCPT
        <rfc822;linux-trace-users@vger.kernel.org>);
        Wed, 15 Jul 2020 17:39:55 -0400
Received: from localhost (localhost [127.0.0.1])
        by mail.ut.ac.ir (Postfix) with ESMTP id 814E31DAD81;
        Thu, 16 Jul 2020 02:09:53 +0430 (+0430)
Received: from mail.ut.ac.ir ([127.0.0.1])
        by localhost (mail.ut.ac.ir [127.0.0.1]) (amavisd-new, port 10024)
        with LMTP id MxHneGvrB7LC; Thu, 16 Jul 2020 02:09:51 +0430 (+0430)
Received: from mail.ut.ac.ir (mail.ut.ac.ir [194.225.0.10])
        by mail.ut.ac.ir (Postfix) with ESMTP id EEC091DADA4;
        Thu, 16 Jul 2020 02:09:50 +0430 (+0430)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Thu, 16 Jul 2020 02:09:50 +0430
From:   ahmadkhorrami <ahmadkhorrami@ut.ac.ir>
To:     Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc:     linux-trace-users <linux-trace-users@vger.kernel.org>,
        lttng-dev <lttng-dev@lists.lttng.org>,
        Jeremie Galarneau <jeremie.galarneau@efficios.com>,
        Namhyung Kim <namhyung@kernel.org>,
        rostedt <rostedt@goodmis.org>,
        linux-trace-users-owner@vger.kernel.org
Subject: Re: Capturing User-Level Function Calls/Returns
In-Reply-To: <83963025.14828.1594838718290.JavaMail.zimbra@efficios.com>
References: <e9c7400ff0075f3beba2863c4432a905@ut.ac.ir>
 <20200715142849.0bfe909a@oasis.local.home>
 <83963025.14828.1594838718290.JavaMail.zimbra@efficios.com>
Message-ID: <98de6fe15a816d8f06ba3d5df0f10540@ut.ac.ir>
X-Sender: ahmadkhorrami@ut.ac.ir
User-Agent: Roundcube Webmail/1.3.6
Sender: linux-trace-users-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-trace-users.vger.kernel.org>
X-Mailing-List: linux-trace-users@vger.kernel.org

Hi Steven and Mathieu,
Firstly, many thanks! This method seems to be the most efficient method. 
But, IIUC, what you suggest requires source code compilation. I need an 
efficient dynamic method that, given the function address, captures its 
occurrence and stores some information from the execution context. Is 
there anything better than Uprobes perhaps with no trap into the kernel? 
Why do we need traps?
Regards.

On 2020-07-15 23:15, Mathieu Desnoyers wrote:

> ----- On Jul 15, 2020, at 2:28 PM, rostedt rostedt@goodmis.org wrote:
> 
> On Wed, 15 Jul 2020 20:37:16 +0430
> ahmadkhorrami <ahmadkhorrami@ut.ac.ir> wrote:
> 
> Hi,
> What is the most efficient way to capture occurrence of a function
> call/return of a binary program in userspace?
> It seems the answer is Uprobes. 1) Am I right?
> But Uprobes use "int" instruction which leads to a switch into kernel
> mode. 2) Wouldn't it be better to avoid this transition?
> I'm looking forward to your reply and will be happy to read your
> opinions.
> Regards.
> 
> Hi, I believe LTTng has utilities that can help you trace user space
> programs.

Indeed, it is documented here:

https://lttng.org/docs/#doc-liblttng-ust-cyg-profile

If your program is generating function entry/exit at a very
high rate (which goes beyond your available I/O throughput and
lasts longer than the memory you have available for ring buffers),
you will also probably want to use the "blocking-timeout" option
documented at:

https://lttng.org/docs/#doc-enabling-disabling-channels

Thanks,

Mathieu

> I think there's also a users ftrace like utility that Namhyung was
> working on. But I don't know where in the development that is.
> 
> -- Steve
