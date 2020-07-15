Return-Path: <SRS0=Bpf1=A2=vger.kernel.org=linux-trace-users-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_2 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F93AC433E3
	for <linux-trace-users@archiver.kernel.org>; Wed, 15 Jul 2020 18:28:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3AFDE20672
	for <linux-trace-users@archiver.kernel.org>; Wed, 15 Jul 2020 18:28:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726034AbgGOS2w (ORCPT
        <rfc822;linux-trace-users@archiver.kernel.org>);
        Wed, 15 Jul 2020 14:28:52 -0400
Received: from mail.kernel.org ([198.145.29.99]:51606 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725992AbgGOS2v (ORCPT
        <rfc822;linux-trace-users@vger.kernel.org>);
        Wed, 15 Jul 2020 14:28:51 -0400
Received: from oasis.local.home (cpe-66-24-58-225.stny.res.rr.com [66.24.58.225])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E88F72065F;
        Wed, 15 Jul 2020 18:28:50 +0000 (UTC)
Date:   Wed, 15 Jul 2020 14:28:49 -0400
From:   Steven Rostedt <rostedt@goodmis.org>
To:     ahmadkhorrami <ahmadkhorrami@ut.ac.ir>
Cc:     Linux-trace Users <linux-trace-users@vger.kernel.org>,
        lttng-dev@lists.lttng.org,
        Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
        =?UTF-8?B?SsOpcsOpbWll?= Galarneau 
        <jeremie.galarneau@efficios.com>,
        Namhyung Kim <namhyung@kernel.org>
Subject: Re: Capturing User-Level Function Calls/Returns
Message-ID: <20200715142849.0bfe909a@oasis.local.home>
In-Reply-To: <e9c7400ff0075f3beba2863c4432a905@ut.ac.ir>
References: <e9c7400ff0075f3beba2863c4432a905@ut.ac.ir>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-trace-users-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-trace-users.vger.kernel.org>
X-Mailing-List: linux-trace-users@vger.kernel.org

On Wed, 15 Jul 2020 20:37:16 +0430
ahmadkhorrami <ahmadkhorrami@ut.ac.ir> wrote:

> Hi,
> What is the most efficient way to capture occurrence of a function 
> call/return of a binary program in userspace?
> It seems the answer is Uprobes. 1) Am I right?
> But Uprobes use "int" instruction which leads to a switch into kernel 
> mode. 2) Wouldn't it be better to avoid this transition?
> I'm looking forward to your reply and will be happy to read your 
> opinions.
> Regards.


Hi, I believe LTTng has utilities that can help you trace user space
programs.

I think there's also a users ftrace like utility that Namhyung was
working on. But I don't know where in the development that is.

-- Steve
