Return-Path: <linux-trace-users-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D80E3C636D6
	for <linux-trace-users@archiver.kernel.org>; Wed, 22 Feb 2023 12:00:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229653AbjBVMAH (ORCPT
        <rfc822;linux-trace-users@archiver.kernel.org>);
        Wed, 22 Feb 2023 07:00:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48012 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229612AbjBVMAG (ORCPT
        <rfc822;linux-trace-users@vger.kernel.org>);
        Wed, 22 Feb 2023 07:00:06 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 17E982A6C0
        for <linux-trace-users@vger.kernel.org>; Wed, 22 Feb 2023 04:00:04 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id AD46BB81334
        for <linux-trace-users@vger.kernel.org>; Wed, 22 Feb 2023 12:00:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44F1CC433D2;
        Wed, 22 Feb 2023 12:00:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1677067201;
        bh=8Lrgc+YNCXSik6XMJUTE3IEWMfqbfAOS/L3uYxvwbDM=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=LB5LxdMD7vQyZBHUX8CkoeCP1hasv2RJoMoeZIkeKofTCUwHaPP7SISfr2Qr4ov4B
         dMg1C5Z8g2hh5NxoxAgUGMQphuyCWwymUS8pQTCwkNKeF0sur/Yx6Ow/Uwyd9R8N5a
         UDja5UH7NYdKkseDtxGBPnmbG9ofSpVj3GRdBfWCgoiufcfS8oV/7nnItHZsDDncz/
         R98URfHTysRuttUF9v0lTwmkobEBFpAUG7oM2Ry1kSqobt+k8a1OwLx3Z++Nrb/dbp
         Y2Gn5yEY4viP/VL3QvX21YWq1dizzVer7px+eZAzuEJVDXHk9y5axsU0E/M85UVl6B
         Yv4g23bmMoiJw==
Message-ID: <8ae9144f-6d7c-2b63-4fe7-4f124b5515bf@kernel.org>
Date:   Wed, 22 Feb 2023 08:59:57 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: About rtla osnoise and timerlat usage
To:     Prasad Pandit <ppandit@redhat.com>
Cc:     linux-trace-users@vger.kernel.org
References: <CAE8KmOxedTiM8GJVp+-HuBW=jkuE=aSKFYrmaj8zHLmQP-1RCg@mail.gmail.com>
Content-Language: en-US
From:   Daniel Bristot de Oliveira <bristot@kernel.org>
In-Reply-To: <CAE8KmOxedTiM8GJVp+-HuBW=jkuE=aSKFYrmaj8zHLmQP-1RCg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-trace-users.vger.kernel.org>
X-Mailing-List: linux-trace-users@vger.kernel.org

Hi Prasad

On 2/22/23 05:35, Prasad Pandit wrote:
> Hello Daniel,
> 
> * I'm debugging a kernel-rt latency spike of about ~55us. Both trace-cmd + oslat(1) and rtla-timerlat-top(1) hint at a TIMER interrupt possibly causing the spike.
> 
>     # tail -n 30 timerlat_trace.txt
>           timerlat/3-925543 [003] ....... 26505.527002: #396   context thread timer_latency     18805 ns
>               <idle>-0     [004] d..h1.. 26505.527046: #396   context    irq timer_latency      8995 ns
>               <idle>-0     [004] dN.h2.. 26505.527052: irq_noise: local_timer:236 start 26505.527045606 duration 6544 ns
>               <idle>-0     [004] d...3.. 26505.527055: thread_noise: swapper/4:0 start 26505.527046097 duration 2430 ns
>           timerlat/4-925544 [004] ....... 26505.527056: #396   context thread timer_latency     18716 ns
>               <idle>-0     [005] d..h1.. 26505.527095: #396   context    irq timer_latency      9199 ns
>               <idle>-0     [005] dN.h2.. 26505.527102: irq_noise: local_timer:236 start 26505.527094732 duration 6586 ns
>               <idle>-0     [005] d...3.. 26505.527104: thread_noise: swapper/5:0 start 26505.527095248 duration 2325 ns
>           timerlat/5-925545 [005] ....... 26505.527105: #396   context thread timer_latency     18735 ns
>               <idle>-0     [006] d..h1.. 26505.527144: #396   context    irq timer_latency      8246 ns
>               <idle>-0     [006] dN.h2.. 26505.527150: irq_noise: local_timer:236 start 26505.527142853 duration 6699 ns
>               <idle>-0     [006] d...3.. 26505.527152: thread_noise: swapper/6:0 start 26505.527143344 duration 2399 ns
>           timerlat/6-925546 [006] ....... 26505.527153: #396   context thread timer_latency     18021 ns
>               <idle>-0     [007] d..h1.. 26505.527195: #396   context    irq timer_latency     10236 ns
>               <idle>-0     [007] dN.h2.. 26505.527201: irq_noise: local_timer:236 start 26505.527194172 duration 6808 ns
>               <idle>-0     [007] d...3.. 26505.527204: thread_noise: swapper/7:0 start 26505.527194702 duration 2401 ns
>           timerlat/7-925547 [007] ....... 26505.527205: #396   context thread timer_latency     20115 ns
>           timerlat/7-925547 [007] ....1.. 26505.527205: <stack trace>
>      => timerlat_irq
>      => __hrtimer_run_queues
>      => hrtimer_interrupt
>      => smp_apic_timer_interrupt
>      => apic_timer_interrupt
>      => native_safe_halt
>      => default_idle
>      => default_idle_call
>      => do_idle
>      => cpu_startup_entry
>      => start_secondary
>      => secondary_startup_64_no_verify

This is the timerlat's timer, so it is expected. What this trace is pointing is to
a possible exit from idle latency... so idle tune is required for this system
and *this metric*... but

> 
> * rtla-timerlat-top with threshold (-T) of 20us promptly terminates with the above trace. But with a threshold(-T) of 30us it completes the full duration(-d) run. To confirm:
> 
>     - 20us threshold is used with oslat(1) tool;  Is it the right threshold value for rtla-timerlat as well?

timerlat does not measure the same thing that oslat measures. oslat is similar to rtla osnoise,
so you need to run rtla osnoise, not rtla timerlat.

>     - From the trace it looks like an isolated CPU is going into an idle loop and from there leads to the timer interrupt.

Yes, that is expected on timerlat in an isolated CPU. But not with osnoise/oslat kind of tool,
as they keep running, while timerlat/cyclictest go to sleep.

Let me know how rtla osnoise results are, so I can help more.

-- Daniel
>     - Not sure why an isolated CPU is going into idle state and firing TIMER interrupt. Does the trace look reasonable or is something amiss?
> 
> * I'd appreciate it if you could share any inputs/suggestions for further clues/debugging/checks.
> 
> Thank you.
> ---
>    - P J P

