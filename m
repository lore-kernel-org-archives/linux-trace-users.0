Return-Path: <linux-trace-users-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8438BC636D6
	for <linux-trace-users@archiver.kernel.org>; Thu, 23 Feb 2023 14:17:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233730AbjBWOR4 (ORCPT
        <rfc822;linux-trace-users@archiver.kernel.org>);
        Thu, 23 Feb 2023 09:17:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53844 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234739AbjBWORi (ORCPT
        <rfc822;linux-trace-users@vger.kernel.org>);
        Thu, 23 Feb 2023 09:17:38 -0500
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DEAA75A387
        for <linux-trace-users@vger.kernel.org>; Thu, 23 Feb 2023 06:17:12 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id 07939CE1FB1
        for <linux-trace-users@vger.kernel.org>; Thu, 23 Feb 2023 14:17:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE949C433D2;
        Thu, 23 Feb 2023 14:17:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1677161828;
        bh=t5t6n87epSCOE9ltmTQ9qUk86NF0YXRl84vwMXFKPkk=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=ZLCXydFMu8Mvk+s3BoxRJ/JnM8OYGbJSUF9HDg9pD/n20iP0WvaEdkm34WlNklvCl
         2MitT26xsPKF3Si3xs7QdhvpfMovC5J2Txs0BSAWmRaIlpDM92GF8cBChZfdjD/ART
         6EST6tJICNSzO9nfDsAI6RzvA72TT8/gSeCaLYI31dh2E28o134eU2jBBplYQuvTME
         /E702gAkw3zc6LiCIlqgOmhblpzOOWsXFHbDmDYljkAeyW+ddfUwU80aoLk3PFnxe4
         imYO2I5GZ7pBjFMscgFaeKDaXXwzMFpkWkOnh9YnBKXmw2ikOpBcO7PsxVqqCXZvW7
         q0t8xwRa72cYA==
Message-ID: <0d75a9a8-ba31-c2d2-e317-0a28d01cd36b@kernel.org>
Date:   Thu, 23 Feb 2023 11:17:03 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: About rtla osnoise and timerlat usage
Content-Language: en-US
To:     Prasad Pandit <ppandit@redhat.com>
Cc:     linux-trace-users@vger.kernel.org
References: <CAE8KmOxedTiM8GJVp+-HuBW=jkuE=aSKFYrmaj8zHLmQP-1RCg@mail.gmail.com>
 <8ae9144f-6d7c-2b63-4fe7-4f124b5515bf@kernel.org>
 <CAE8KmOzuCqp5w4FBVd6GjPg_znQhumcsA=PKozZbQWxXPdZYXg@mail.gmail.com>
 <e7db6b57-ca5b-3f9a-b436-a263ff663f20@kernel.org>
 <CAE8KmOxV8u3v4ALVvqOUO+zvnd99d6iSXw0RiSLondvdX_JJSA@mail.gmail.com>
From:   Daniel Bristot de Oliveira <bristot@kernel.org>
In-Reply-To: <CAE8KmOxV8u3v4ALVvqOUO+zvnd99d6iSXw0RiSLondvdX_JJSA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-trace-users.vger.kernel.org>
X-Mailing-List: linux-trace-users@vger.kernel.org

On 2/22/23 16:11, Prasad Pandit wrote:
> Hello Daniel,
> 
> On Wed, 22 Feb 2023 at 18:45, Daniel Bristot de Oliveira <bristot@kernel.org <mailto:bristot@kernel.org>> wrote:
> 
>     The problem in the oslat case is that trace-cmd is awakened in the isolated CPU.
>     That is probably because trace-cmd once ran and armed a timer there.
> 
>     I recommend you restrict the affinity of trace-cmd to the non-isolated CPUs before
>     starting it and run the experiment again.
> 
> 
> * Yes, I invoked trace-cmd(1) with '-M 0x7FE' cpumask to specify CPUs to trace. That leaves only housekeeping CPUs for the trace-cmd(1) process IIUC.
> ===
> $ for i in `pidof trace-cmd`; do taskset -p -c $i; done
> pid 4835's current affinity list: 0,11
> pid 4834's current affinity list: 0,11
> pid 4833's current affinity list: 0,11
> pid 4832's current affinity list: 0,11
> pid 4831's current affinity list: 0,11
> pid 4830's current affinity list: 0,11
> pid 4829's current affinity list: 0,11
> pid 4828's current affinity list: 0,11
> pid 4827's current affinity list: 0,11
> pid 4826's current affinity list: 0,11
> pid 4825's current affinity list: 0,11
> pid 4824's current affinity list: 0,11
> pid 4823's current affinity list: 0,11
> ===
> 
> * taskset(1) appears to confirm it. Not sure why 'ktimers/6' thread was scheduled on an isolated CPU#6 to sched_wakup trace-cmd process.
> 
> ktimers/6-73 [006] 12793.382812: sched_wakeup: trace-cmd:385311 [120] success=1 CPU:011
> 
>    Maybe because I did not use 'trace-cmd  --poll' option. Running a test with '--poll' now.
>  
> 
>     In a properly isolated CPU, SCHED_OTHER should be enough. I understand that
>     people use FIFO because it gives the impression that the busy loop will
>     receive more CPU time, but this is biased by tools that only measure the
>     single latency occurrence - and not overall latency.
> 
> 
> * I see.
>  
> 
>     See this article: https://research.redhat.com/blog/article/osnoise-for-fine-tuning-operating-system-noise-in-linux-kernel/ <https://research.redhat.com/blog/article/osnoise-for-fine-tuning-operating-system-noise-in-linux-kernel/>
> 
> 
> * Yes, I read this and other 3 articles by you and reading again. :)
>  
> 
>     While running with FIFO reduces the "max single noise" by two us (from 7 to 5 us)
>     in relation to the SCHED_OTHER, the total amount of noise that the tool running with
>     FIFO is larger because the starvation of tasks require further checks from the OS
>     side, generating further noise. So SCHED_OTHER is better for total noise.
> 
> 
> * Doesn't running -rt tasks with higher priority (FIFO:95) than kworker/[120], ktimer/[97] threads help to keep them running on isolated CPUs, than getting sched_switched by kernel threads?

I am not sure if I understood what you mean but...

kworker/[120] <--- this 120 is likely not the same as
ktimer/[97] <---- this 97

The kworker is likely a SCHED_OTHER 0 nice, and ktimer a FIFO:97.

You are placing your load in between them.

That would not be bad if we ran a traditional periodic/sporadic real-time
workload. That is, task that waits for an event, wakes up, runs, and goes
to sleep waiting for the next event.

The problem is that oslat/osnoise run non-stop.

Then a kworker awakened on the CPU will... starve. You will not see it
causing a sched_switch, but if the kworker is pinned to that CPU, it wil
not make progress.

The process waiting for its execution will not make progress either...
And the process of waiting for the process waiting will not make progress
either.. and so on ..

In other words, you are avoiding a context switch (a performance problem), but
creating a potential starvation that can lead to a system crash*.

Some people use FIFO:1 for the busy loop (instead of the 95)... and that is
**less bad** because then you can avoid some types of starvation of
threaded IRQs via PI, as threaded IRQs run as FIFO:50... so the PI breaks
the starvation chain... at the price of causing a sched_switch...

So, by running a busy loop with FIFO:95 (or 1), the user is not avoiding
context_swtich in an isolated CPU, they are postponing them (given proper
isolation). Still, it is better to keep it at a lower FIFO prio to avoid some
further problems.

That is why it is not that safe.

One can bypass that limitation using things like stalld, but in the end, it
is just another way to let the process starve to run. Under a proper setup,
that is the same as just running the busy loop as SCHED_OTHER without the
drawbacks and risks of starvation.

*assuming that you are disabling rt throttling. Otherwise, your system will
have latencies because of it.


>      # trace-cmd record -p nop -e all -M 0x7FE -m 32000 --poll ~test/rt-tests/oslat --cpu-list 1-10 --duration 1h -w memmove -m 4K -T20
>      ....
>       Maximum:    14 11 13 12 12 13 12 11 12 10 (us)
>       Max-Min:    13 10 12 11 11 12 11 10 11 9 (us)
>       Duration:    3599.986 3599.986 3599.987 3599.987 3599.986 3599.987 3599.986 3599.987 3599.986 3599.986 (sec)
> 
> * Running oslat(1) with SCHED_OTHER priority via 'trace-cmd --poll' option, did not show the spike. Nonetheless, trace-cmd(1) logs show  <idle>, ktimers/ and kworker/ threads running on isolated CPUs.
> * Now running rtla-osnoise(1) test with SCHED_OTHER:
>       # rtla osnoise top -c 1-10 -d 6h -s 20 -T 20 -Po:0 -q -t

I will reply to the next email on this... I saw you have results.

> Thank you.
> ---
>   - P J P

