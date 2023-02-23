Return-Path: <linux-trace-users-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD3A8C636D6
	for <linux-trace-users@archiver.kernel.org>; Thu, 23 Feb 2023 14:54:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234008AbjBWOyH (ORCPT
        <rfc822;linux-trace-users@archiver.kernel.org>);
        Thu, 23 Feb 2023 09:54:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34178 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229502AbjBWOyG (ORCPT
        <rfc822;linux-trace-users@vger.kernel.org>);
        Thu, 23 Feb 2023 09:54:06 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5BFBE457EB
        for <linux-trace-users@vger.kernel.org>; Thu, 23 Feb 2023 06:54:05 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 6E5116170C
        for <linux-trace-users@vger.kernel.org>; Thu, 23 Feb 2023 14:54:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9CC2C433EF;
        Thu, 23 Feb 2023 14:54:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1677164044;
        bh=rAN7myXeqGw+S/M6+ZqqYUy1De2Rnz0IGHfGAipspMc=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=pxAIBXpo54BtVC9ecnKNs/YdmTcJEOuZ4smpDA0P4ODO7eTEtxiFBujMrHoSrPdaV
         DriJv0ZvBimn0xaxbPvmZB6EEErFbo65ZJTKi0J6h4VLnu12l86g0KrQFIIXxrUFV0
         YMWw8fK7+mBsJXzjHMyhDeBmyC8YPGk+w+2HMZpUY97CbYCcH+f/+Oxtg2iOfeLtwY
         G6ZJHtn+BmyDAUUcOvAYfhOceyel305vx7vUCAx4bHqG1MqTVDBFSDAT1nToyHVeN9
         KIXsx8fLrft7BZnwln4dE2gzDPbR00DDvqW99plJWiiGKEeeY882am76hezCutZprx
         tvsXWrE655A0g==
Message-ID: <b224dcc7-9713-0f26-180b-efda6902511e@kernel.org>
Date:   Thu, 23 Feb 2023 11:54:00 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: About rtla osnoise and timerlat usage
Content-Language: en-US
To:     Steven Rostedt <rostedt@goodmis.org>
Cc:     Prasad Pandit <ppandit@redhat.com>,
        linux-trace-users@vger.kernel.org
References: <CAE8KmOxedTiM8GJVp+-HuBW=jkuE=aSKFYrmaj8zHLmQP-1RCg@mail.gmail.com>
 <8ae9144f-6d7c-2b63-4fe7-4f124b5515bf@kernel.org>
 <CAE8KmOzuCqp5w4FBVd6GjPg_znQhumcsA=PKozZbQWxXPdZYXg@mail.gmail.com>
 <e7db6b57-ca5b-3f9a-b436-a263ff663f20@kernel.org>
 <CAE8KmOxV8u3v4ALVvqOUO+zvnd99d6iSXw0RiSLondvdX_JJSA@mail.gmail.com>
 <0d75a9a8-ba31-c2d2-e317-0a28d01cd36b@kernel.org>
 <20230223093900.6a89b7a5@gandalf.local.home>
From:   Daniel Bristot de Oliveira <bristot@kernel.org>
In-Reply-To: <20230223093900.6a89b7a5@gandalf.local.home>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-trace-users.vger.kernel.org>
X-Mailing-List: linux-trace-users@vger.kernel.org

On 2/23/23 11:39, Steven Rostedt wrote:
> On Thu, 23 Feb 2023 11:17:03 -0300
> Daniel Bristot de Oliveira <bristot@kernel.org> wrote:
> 
>> I am not sure if I understood what you mean but...
>>
>> kworker/[120] <--- this 120 is likely not the same as
>> ktimer/[97] <---- this 97
>>
>> The kworker is likely a SCHED_OTHER 0 nice, and ktimer a FIFO:97.
>>
>> You are placing your load in between them.
>>
>> That would not be bad if we ran a traditional periodic/sporadic real-time
>> workload. That is, task that waits for an event, wakes up, runs, and goes
>> to sleep waiting for the next event.
>>
>> The problem is that oslat/osnoise run non-stop.
>>
>> Then a kworker awakened on the CPU will... starve. You will not see it
>> causing a sched_switch, but if the kworker is pinned to that CPU, it wil
>> not make progress.
> 
> Note, the kworker and other kernel threads that are pinned to a CPU are
> ones that service requests that were triggered on that CPU. It is possible
> to run a task at FIFO 99 on an isolated CPU non stop without causing any
> issue (you may also need to enable NO_HZ_FULL and make sure RCU has
> no-callbacks enabled where the RCU for that isolated CPU gets its work done
> on other CPUs).

Yes, but in the perfect isolation case, where no other task is scheduled there, being
FIFO and OTHER or even IDLE is... equivalent as no scheduler is needed :-).

> If your FIFO task calls into the kernel and does something that triggers a
> worker, then you may then have an issue. You will need to make sure that
> worker gets time to run.
> 
> The point I'm making is that it is possible to get something working where
> you have a FIFO task running 100%, but you need to set up the system where
> it will not cause issues. That requires knowing what system calls that are
> done on that CPU that may require workers.
> 
> Oh, and there's another issue that can cause problems. Even if you figured
> out everything your task does, and make sure that it doesn't trigger any
> pinned kworkers, and you are using NO_CB_RCU and NO_HZ_FULL, there's still
> an issue that needs to be taken care of. That is, if there was some task
> running on that CPU just before your FIFO task runs, it could have
> triggered a kworker. And even though it may be done, or even migrated to
> another CPU, that kworker will still need to execute. I've seen this cause
> days of debugging to why the system crashed.

There are also cases where kworkers are dispatched to all CPUs, from a non-isolated CPU,
to do some house-keeping work. E.g., I think that ftrace used to do that to allocate buffers.
Ideally, all these cases should be reworked to avoid dispatching kworkers where they are
not needed. But as kworkers are added to the code as part of the development, and bad
3rd part drivers can also do it... and... who knows?

That is why the safest path is to: assuming that the isolcpus is done at the perfection,
no schedule will happen, and so all the schedulers are equivalent.

in the exceptional case of something happening to that CPU, they are likely sort living
kernel work that is is just easier to let them run, one monitors those cases and try
to fix the code to avoid them.

> -- Steve

