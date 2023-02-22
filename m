Return-Path: <linux-trace-users-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C548C636D6
	for <linux-trace-users@archiver.kernel.org>; Wed, 22 Feb 2023 13:15:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231174AbjBVNPn (ORCPT
        <rfc822;linux-trace-users@archiver.kernel.org>);
        Wed, 22 Feb 2023 08:15:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36984 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230246AbjBVNPm (ORCPT
        <rfc822;linux-trace-users@vger.kernel.org>);
        Wed, 22 Feb 2023 08:15:42 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 86B5638EA7
        for <linux-trace-users@vger.kernel.org>; Wed, 22 Feb 2023 05:15:41 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 296E9B81217
        for <linux-trace-users@vger.kernel.org>; Wed, 22 Feb 2023 13:15:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E95F3C433EF;
        Wed, 22 Feb 2023 13:15:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1677071738;
        bh=NlX4WVvUA5MeFPjImaNxM0IiiiZOKTTfPnZ5WkXYo/g=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=FkFE6YNU3D6IAF3sdtZ/VcTuwyOUsadKFhz8A01ZPPy6LuQdk4XeM552toKL7SPYv
         q2pRVf9s2i70ZoWqKi7LHC+Z69wHgeyuwr3pNO/KaY5r9qO74ARvPTX/4Lo67IwxNs
         IAPt6gJ4zvEv6uWj3MIOoWVcoRnLKXtdjLoubmxIsBdqbtGd0RL04Z8xpDOeIGKqDB
         3c44EcqeMAYB04KD1JKC2SNAVd1jKWFuSURO0N1VfFEK1Ljy6NvYgiLaf7PGblzphN
         Z7HFPMHDpCriVtoy8VzMnVVjU00/N3f4JArLW9VWtTxcZMZI0FfFBl/UNtKI7O5qcj
         pI3Z6c5ReOn9A==
Message-ID: <e7db6b57-ca5b-3f9a-b436-a263ff663f20@kernel.org>
Date:   Wed, 22 Feb 2023 10:15:34 -0300
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
From:   Daniel Bristot de Oliveira <bristot@kernel.org>
In-Reply-To: <CAE8KmOzuCqp5w4FBVd6GjPg_znQhumcsA=PKozZbQWxXPdZYXg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-trace-users.vger.kernel.org>
X-Mailing-List: linux-trace-users@vger.kernel.org

On 2/22/23 09:39, Prasad Pandit wrote:
> Hello Daniel,
> 
> Thank you so much for your reply, I appreciate it.
> 
> On Wed, 22 Feb 2023 at 17:30, Daniel Bristot de Oliveira <bristot@kernel.org <mailto:bristot@kernel.org>> wrote:
> 
>     This is the timerlat's timer, so it is expected. What this trace is pointing is to
>     a possible exit from idle latency... so idle tune is required for this system
>     and *this metric*... but
> 
> 
> * Idle tune?
>  
> 
>     Yes, that is expected on timerlat in an isolated CPU. But not with osnoise/oslat kind of tool,
>     as they keep running, while timerlat/cyclictest go to sleep.
> 
> 
> * I see, okay.
> 
>     Let me know how rtla osnoise results are, so I can help more. 
> 
> 
> * Yes, I've been running oslat(1) and rtla-osnoise(1) too.
>    Please see:
>     oslat(1) log -> https://0bin.net/paste/T0PDXHz5#AnNEzkTRxQVT1gvAqKM43jW+yhqilbNbFqHIHHpy4MY <https://0bin.net/paste/T0PDXHz5#AnNEzkTRxQVT1gvAqKM43jW+yhqilbNbFqHIHHpy4MY>
>     rtla-osnoise-top(1) log -> https://0bin.net/paste/8qwjebnZ#22sfTYTv68JAAMHZJhnCBTP-uvP7Mxj8ipAVbuQVsiy <https://0bin.net/paste/8qwjebnZ#22sfTYTv68JAAMHZJhnCBTP-uvP7Mxj8ipAVbuQVsiy>


The problem in the oslat case is that trace-cmd is awakened in the isolated CPU.

That is probably because trace-cmd once ran and armed a timer there.

I recommend you restrict the affinity of trace-cmd to the non-isolated CPUs before
starting it and run the experiment again.

However, a busy loop in FIFO:95 is not a good setup. That is because you have to
raise the priority of other things like the ktimer because of this. Like in your
example, ktimer as FIFO:97... it is hard to justify this as a sane setup.

In a properly isolated CPU, SCHED_OTHER should be enough. I understand that
people use FIFO because it gives the impression that the busy loop will
receive more CPU time, but this is biased by tools that only measure the
single latency occurrence - and not overall latency.

See this article: https://research.redhat.com/blog/article/osnoise-for-fine-tuning-operating-system-noise-in-linux-kernel/

While running with FIFO reduces the "max single noise" by two us (from 7 to 5 us)
in relation to the SCHED_OTHER, the total amount of noise that the tool running with
FIFO is larger because the starvation of tasks require further checks from the OS
side, generating further noise. So SCHED_OTHER is better for total noise.

In properly isolated systems, the solution is to try to avoid things on the CPUs,
not to starve them. If the system has a job that is pinned to a CPU that cannot
be avoided, just let it run. Keeping the system in the starving condition is
keeping the system in a faulty state, and the work to take the system out of
this situation (like using throttling or stalld) will only cause more noise.

-- Daniel
