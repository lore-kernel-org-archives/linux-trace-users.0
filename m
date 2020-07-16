Return-Path: <SRS0=CYr2=A3=vger.kernel.org=linux-trace-users-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 549E6C433DF
	for <linux-trace-users@archiver.kernel.org>; Thu, 16 Jul 2020 16:07:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2CAA22074B
	for <linux-trace-users@archiver.kernel.org>; Thu, 16 Jul 2020 16:07:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728374AbgGPQHQ (ORCPT
        <rfc822;linux-trace-users@archiver.kernel.org>);
        Thu, 16 Jul 2020 12:07:16 -0400
Received: from mail.ut.ac.ir ([80.66.177.10]:41772 "EHLO mail.ut.ac.ir"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728707AbgGPQHQ (ORCPT
        <rfc822;linux-trace-users@vger.kernel.org>);
        Thu, 16 Jul 2020 12:07:16 -0400
Received: from localhost (localhost [127.0.0.1])
        by mail.ut.ac.ir (Postfix) with ESMTP id A07871DAF3E;
        Thu, 16 Jul 2020 20:37:14 +0430 (+0430)
Received: from mail.ut.ac.ir ([127.0.0.1])
        by localhost (mail.ut.ac.ir [127.0.0.1]) (amavisd-new, port 10024)
        with LMTP id Pafo_kF1Sg0J; Thu, 16 Jul 2020 20:37:13 +0430 (+0430)
Received: from mail.ut.ac.ir (mail.ut.ac.ir [194.225.0.10])
        by mail.ut.ac.ir (Postfix) with ESMTP id 737211DAF1D;
        Thu, 16 Jul 2020 20:37:13 +0430 (+0430)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Thu, 16 Jul 2020 20:37:13 +0430
From:   ahmadkhorrami <ahmadkhorrami@ut.ac.ir>
To:     Namhyung Kim <namhyung@kernel.org>
Cc:     Steven Rostedt <rostedt@goodmis.org>,
        Linux-trace Users <linux-trace-users@vger.kernel.org>,
        lttng-dev@lists.lttng.org,
        Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
        =?UTF-8?Q?J=C3=A9r=C3=A9mi?= =?UTF-8?Q?e_Galarneau?= 
        <jeremie.galarneau@efficios.com>,
        linux-trace-users-owner@vger.kernel.org
Subject: Re: Capturing User-Level Function Calls/Returns
In-Reply-To: <CAM9d7chE3WQm2e4EA4i09Q1hOaGt2hrPHoF2d0tjqhciPceB9g@mail.gmail.com>
References: <e9c7400ff0075f3beba2863c4432a905@ut.ac.ir>
 <20200715142849.0bfe909a@oasis.local.home>
 <CAM9d7chE3WQm2e4EA4i09Q1hOaGt2hrPHoF2d0tjqhciPceB9g@mail.gmail.com>
Message-ID: <42d8f4d107d2117fb246b8ff1890e301@ut.ac.ir>
X-Sender: ahmadkhorrami@ut.ac.ir
User-Agent: Roundcube Webmail/1.3.6
Sender: linux-trace-users-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-trace-users.vger.kernel.org>
X-Mailing-List: linux-trace-users@vger.kernel.org

Hi Namhyung,
This seems really interesting and is what I am looking for. Can it 
capture all function entries/exits? I mean does it fully handle variable 
instruction sizes in dynamic mode?
In any case, thanks! and I hope that it becomes stable as soon as 
possible, so that everyone can use it.
Regards.

On 2020-07-16 05:34, Namhyung Kim wrote:

> Hi all,
> 
> On Thu, Jul 16, 2020 at 3:28 AM Steven Rostedt <rostedt@goodmis.org> 
> wrote:
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
> 
> I think there's also a users ftrace like utility that Namhyung was
> working on. But I don't know where in the development that is.

It's in https://github.com/namhyung/uftrace

Basically it also requires recompilation to add mcount calls for each 
function.
But it now also supports dynamic tracing without any recompilation.. :)
It's still experimental and has some limitation, but the idea is to copy
first 5 bytes (on x86_64) somewhere and replace it to a call 
instruction.

Thanks
Namhyung
