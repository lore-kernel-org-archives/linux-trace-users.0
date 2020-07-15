Return-Path: <SRS0=Bpf1=A2=vger.kernel.org=linux-trace-users-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_2 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F353C433E1
	for <linux-trace-users@archiver.kernel.org>; Wed, 15 Jul 2020 21:49:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 43D5D206F4
	for <linux-trace-users@archiver.kernel.org>; Wed, 15 Jul 2020 21:49:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726736AbgGOVtB (ORCPT
        <rfc822;linux-trace-users@archiver.kernel.org>);
        Wed, 15 Jul 2020 17:49:01 -0400
Received: from mail.kernel.org ([198.145.29.99]:56398 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726675AbgGOVtB (ORCPT
        <rfc822;linux-trace-users@vger.kernel.org>);
        Wed, 15 Jul 2020 17:49:01 -0400
Received: from oasis.local.home (cpe-66-24-58-225.stny.res.rr.com [66.24.58.225])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C57122065D;
        Wed, 15 Jul 2020 21:49:00 +0000 (UTC)
Date:   Wed, 15 Jul 2020 17:48:58 -0400
From:   Steven Rostedt <rostedt@goodmis.org>
To:     ahmadkhorrami <ahmadkhorrami@ut.ac.ir>
Cc:     Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
        linux-trace-users <linux-trace-users@vger.kernel.org>,
        lttng-dev <lttng-dev@lists.lttng.org>,
        Jeremie Galarneau <jeremie.galarneau@efficios.com>,
        Namhyung Kim <namhyung@kernel.org>,
        linux-trace-users-owner@vger.kernel.org
Subject: Re: Capturing User-Level Function Calls/Returns
Message-ID: <20200715174858.4698803c@oasis.local.home>
In-Reply-To: <98de6fe15a816d8f06ba3d5df0f10540@ut.ac.ir>
References: <e9c7400ff0075f3beba2863c4432a905@ut.ac.ir>
        <20200715142849.0bfe909a@oasis.local.home>
        <83963025.14828.1594838718290.JavaMail.zimbra@efficios.com>
        <98de6fe15a816d8f06ba3d5df0f10540@ut.ac.ir>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-trace-users-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-trace-users.vger.kernel.org>
X-Mailing-List: linux-trace-users@vger.kernel.org

On Thu, 16 Jul 2020 02:09:50 +0430
ahmadkhorrami <ahmadkhorrami@ut.ac.ir> wrote:

> Hi Steven and Mathieu,
> Firstly, many thanks! This method seems to be the most efficient method. 
> But, IIUC, what you suggest requires source code compilation. I need an 
> efficient dynamic method that, given the function address, captures its 
> occurrence and stores some information from the execution context. Is 
> there anything better than Uprobes perhaps with no trap into the kernel? 
> Why do we need traps?
> Regards.

Without recompiling, how would that be implemented?

You would need to insert a jump on top of code, and still be able to
preserve that code. What a trap does, is to insert a int3, that will
trap into the kernel, it would then emulate the code that the int3 was
on, and also call some code that can trace the current state.

To do it in user land, you would need to find way to replace the code
at the location you want to trace, with a jump to the tracing
infrastructure, that will also be able to emulate the code that the
jump was inserted on top of. As on x86, that jump will need to be 5
bytes long (covering 5 bytes of text to emulate), where as a int3 is a
single byte.

Thus, you either recompile and insert nops where you want to place your
jumps, or you trap using int3 that can do the work from within the
kernel.

-- Steve
