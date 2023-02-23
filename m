Return-Path: <linux-trace-users-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA63BC61DA4
	for <linux-trace-users@archiver.kernel.org>; Thu, 23 Feb 2023 14:39:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233711AbjBWOjH (ORCPT
        <rfc822;linux-trace-users@archiver.kernel.org>);
        Thu, 23 Feb 2023 09:39:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47326 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233832AbjBWOjG (ORCPT
        <rfc822;linux-trace-users@vger.kernel.org>);
        Thu, 23 Feb 2023 09:39:06 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4BB3934C23
        for <linux-trace-users@vger.kernel.org>; Thu, 23 Feb 2023 06:39:05 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 07569B8190E
        for <linux-trace-users@vger.kernel.org>; Thu, 23 Feb 2023 14:39:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74763C4339B;
        Thu, 23 Feb 2023 14:39:02 +0000 (UTC)
Date:   Thu, 23 Feb 2023 09:39:00 -0500
From:   Steven Rostedt <rostedt@goodmis.org>
To:     Daniel Bristot de Oliveira <bristot@kernel.org>
Cc:     Prasad Pandit <ppandit@redhat.com>,
        linux-trace-users@vger.kernel.org
Subject: Re: About rtla osnoise and timerlat usage
Message-ID: <20230223093900.6a89b7a5@gandalf.local.home>
In-Reply-To: <0d75a9a8-ba31-c2d2-e317-0a28d01cd36b@kernel.org>
References: <CAE8KmOxedTiM8GJVp+-HuBW=jkuE=aSKFYrmaj8zHLmQP-1RCg@mail.gmail.com>
        <8ae9144f-6d7c-2b63-4fe7-4f124b5515bf@kernel.org>
        <CAE8KmOzuCqp5w4FBVd6GjPg_znQhumcsA=PKozZbQWxXPdZYXg@mail.gmail.com>
        <e7db6b57-ca5b-3f9a-b436-a263ff663f20@kernel.org>
        <CAE8KmOxV8u3v4ALVvqOUO+zvnd99d6iSXw0RiSLondvdX_JJSA@mail.gmail.com>
        <0d75a9a8-ba31-c2d2-e317-0a28d01cd36b@kernel.org>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-trace-users.vger.kernel.org>
X-Mailing-List: linux-trace-users@vger.kernel.org

On Thu, 23 Feb 2023 11:17:03 -0300
Daniel Bristot de Oliveira <bristot@kernel.org> wrote:

> I am not sure if I understood what you mean but...
> 
> kworker/[120] <--- this 120 is likely not the same as
> ktimer/[97] <---- this 97
> 
> The kworker is likely a SCHED_OTHER 0 nice, and ktimer a FIFO:97.
> 
> You are placing your load in between them.
> 
> That would not be bad if we ran a traditional periodic/sporadic real-time
> workload. That is, task that waits for an event, wakes up, runs, and goes
> to sleep waiting for the next event.
> 
> The problem is that oslat/osnoise run non-stop.
> 
> Then a kworker awakened on the CPU will... starve. You will not see it
> causing a sched_switch, but if the kworker is pinned to that CPU, it wil
> not make progress.

Note, the kworker and other kernel threads that are pinned to a CPU are
ones that service requests that were triggered on that CPU. It is possible
to run a task at FIFO 99 on an isolated CPU non stop without causing any
issue (you may also need to enable NO_HZ_FULL and make sure RCU has
no-callbacks enabled where the RCU for that isolated CPU gets its work done
on other CPUs).

If your FIFO task calls into the kernel and does something that triggers a
worker, then you may then have an issue. You will need to make sure that
worker gets time to run.

The point I'm making is that it is possible to get something working where
you have a FIFO task running 100%, but you need to set up the system where
it will not cause issues. That requires knowing what system calls that are
done on that CPU that may require workers.

Oh, and there's another issue that can cause problems. Even if you figured
out everything your task does, and make sure that it doesn't trigger any
pinned kworkers, and you are using NO_CB_RCU and NO_HZ_FULL, there's still
an issue that needs to be taken care of. That is, if there was some task
running on that CPU just before your FIFO task runs, it could have
triggered a kworker. And even though it may be done, or even migrated to
another CPU, that kworker will still need to execute. I've seen this cause
days of debugging to why the system crashed.

-- Steve
