Return-Path: <linux-trace-users-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55F6EC61DA4
	for <linux-trace-users@archiver.kernel.org>; Thu, 23 Feb 2023 14:38:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234344AbjBWOiU (ORCPT
        <rfc822;linux-trace-users@archiver.kernel.org>);
        Thu, 23 Feb 2023 09:38:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46620 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234824AbjBWOiT (ORCPT
        <rfc822;linux-trace-users@vger.kernel.org>);
        Thu, 23 Feb 2023 09:38:19 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 877973756E
        for <linux-trace-users@vger.kernel.org>; Thu, 23 Feb 2023 06:38:16 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 6F74161721
        for <linux-trace-users@vger.kernel.org>; Thu, 23 Feb 2023 14:38:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99E28C4339B;
        Thu, 23 Feb 2023 14:38:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1677163095;
        bh=Il5cjRyZhP18Kl7YzTow8Y4DtM1TavqH9/R2keClECY=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=iYTOfDSPYhIrnYskp0jSFs8uN6i0X+WahaU+X2Beia1FILupOn2o6gKKjwTMocRJ2
         2//gc336+Qwp9qkFDDvBHu2TNusTnWzE2isC1o0x0bRUWE3f7BucoHP7d9zoLFvZYq
         8zfUh2VyCdKUYsZZMCEREjEAUOns+KZMhYC6IaOLqjTkUWYXVoshVp2Ilr1Z4r+gvk
         XlwrZHWly5Gh/4ya0mrAgWM7S1a/Qu9n/vEBU5JdpjARtG1AHyTrmrk9h7IP5sVspV
         QwLPdrXZJdxV0q0XccFh4XelZNOL+56dywvtqsyTyiKYVRN4NJJAjc1QYQvOlaIQc4
         KifhtgSz+eB1g==
Message-ID: <05d03252-8190-4612-090c-b2a65c2523e3@kernel.org>
Date:   Thu, 23 Feb 2023 11:38:11 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: About rtla osnoise and timerlat usage
To:     Prasad Pandit <ppandit@redhat.com>
Cc:     linux-trace-users@vger.kernel.org
References: <CAE8KmOxedTiM8GJVp+-HuBW=jkuE=aSKFYrmaj8zHLmQP-1RCg@mail.gmail.com>
 <8ae9144f-6d7c-2b63-4fe7-4f124b5515bf@kernel.org>
 <CAE8KmOzuCqp5w4FBVd6GjPg_znQhumcsA=PKozZbQWxXPdZYXg@mail.gmail.com>
 <e7db6b57-ca5b-3f9a-b436-a263ff663f20@kernel.org>
 <CAE8KmOxV8u3v4ALVvqOUO+zvnd99d6iSXw0RiSLondvdX_JJSA@mail.gmail.com>
 <CAE8KmOzfd+BSRKrS1pogf05XcjF1x_Z+sjJC5HDU5byKgG1X0g@mail.gmail.com>
Content-Language: en-US
From:   Daniel Bristot de Oliveira <bristot@kernel.org>
In-Reply-To: <CAE8KmOzfd+BSRKrS1pogf05XcjF1x_Z+sjJC5HDU5byKgG1X0g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-trace-users.vger.kernel.org>
X-Mailing-List: linux-trace-users@vger.kernel.org

On 2/23/23 09:12, Prasad Pandit wrote:
> Hello Daniel,
> 
> On Thu, 23 Feb 2023 at 00:41, Prasad Pandit <ppandit@redhat.com> wrote:
>>      # trace-cmd record -p nop -e all -M 0x7FE -m 32000 --poll ~test/rt-tests/oslat --cpu-list 1-10 --duration 1h -w memmove -m 4K -T20
>>      ....
>>       Maximum:    14 11 13 12 12 13 12 11 12 10 (us)
>>       Max-Min:    13 10 12 11 11 12 11 10 11 9 (us)
>>       Duration:    3599.986 3599.986 3599.987 3599.987 3599.986 3599.987 3599.986 3599.987 3599.986 3599.986 (sec)
>>
>> * Running oslat(1) with SCHED_OTHER priority via 'trace-cmd --poll' option, did not show the spike. Nonetheless, trace-cmd(1) logs show  <idle>, ktimers/ and kworker/ threads running on isolated CPUs.
>> * Now running rtla-osnoise(1) test with SCHED_OTHER:
>>       # rtla osnoise top -c 1-10 -d 6h -s 20 -T 20 -Po:0 -q -t
> 
> Please see:
>     -> https://0bin.net/paste/ShXHmdvu#D0XY-WxTKCzWTxgQ+lTFbx1nB2TP2w+T0Mp8PBXt9gu
> 
> * rtla-osnoise(1) running for 6 hours with SCHED_OTHER and SCHED_FIFO,
> both did not report any spike above 20us.

Good!

>   It's reporting occurrence of IRQs only, all other noise columns are
> zero(0). That's a little surprising!?

Regarding the IRQs only: That is a good sign! your isolation is good!

Regarding the numbers: -T 20 is saying to the tracer to account as noise only
noise >= 20 us. As you did not hit a single case as your -s20 did not stop the trace,
that is expected.

But I think that what you want is -T 1. That is, consider a noise anything that is > than 1 us.

This will show you the noise added by those IRQs.

Anyways, the isolation is good enough to have good numbers with SCHED_OTHER... without
risks of starvation.

> Thank you.
> ---
>    - Prasad
> 

