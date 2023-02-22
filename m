Return-Path: <linux-trace-users-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D159C636D6
	for <linux-trace-users@archiver.kernel.org>; Wed, 22 Feb 2023 18:06:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232348AbjBVSGl (ORCPT
        <rfc822;linux-trace-users@archiver.kernel.org>);
        Wed, 22 Feb 2023 13:06:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46166 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232356AbjBVSGi (ORCPT
        <rfc822;linux-trace-users@vger.kernel.org>);
        Wed, 22 Feb 2023 13:06:38 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 76C4C41B56
        for <linux-trace-users@vger.kernel.org>; Wed, 22 Feb 2023 10:06:35 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 19CE1B811EC
        for <linux-trace-users@vger.kernel.org>; Wed, 22 Feb 2023 18:06:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D348AC433EF;
        Wed, 22 Feb 2023 18:06:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1677089192;
        bh=NneJ94Y3qrva9WMEfB+ceVwe9eTBrW4xkQPNf+7x1tU=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=LtxkcGhQuIYNXxq4Uc9fCRvmpnkcREP/FVlC01COVnl6YIYfIE93/VSU+X4kYksI5
         SAHDzVItDFrlSRInbpIdvU+n5q84iwh8MTIKZcYdlBBbDeT+LzQFVdwleK7SM9Tayb
         Fp/l77Gd69UOLYC6ksJDim1mhQGfPXFZCWz4YSm4hVjG90pEIrUVANS52FwAk59TcD
         +cMdLJf0wUOlqo/VPTFvfgWcS4H28DI+Ik1bMHiBpUyR7krj0fwrvjBqlfnFFVN7rm
         BV2cSeWMW+PTyiqp04GsJEiomA334/kL69yy1YB3HOdbxldn9hVVzuPR0aKPv0pnlp
         Si4ZIv3uX2npw==
Message-ID: <38c56e37-2805-0b93-57f6-a176e4eb98f6@kernel.org>
Date:   Wed, 22 Feb 2023 15:06:29 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: About rtla osnoise and timerlat usage
To:     Prasad Pandit <ppandit@redhat.com>
Cc:     linux-trace-users@vger.kernel.org
References: <CAE8KmOxedTiM8GJVp+-HuBW=jkuE=aSKFYrmaj8zHLmQP-1RCg@mail.gmail.com>
 <8ae9144f-6d7c-2b63-4fe7-4f124b5515bf@kernel.org>
 <CAE8KmOzuCqp5w4FBVd6GjPg_znQhumcsA=PKozZbQWxXPdZYXg@mail.gmail.com>
Content-Language: en-US
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

ops, I did not reply to this: idle tuning is configuring the system to avoid deep idle states.

An easy way to do it is either setting idle=poll or enabling the "--dma-latency 0" in timerlat.

But this is only a "problem" for timerlat/cyclictest, not for oslat/osnoise as they measure
the noise as they run - so they CPU does not go idle.

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
> 
> Thank you.
> ---
>   - P J P

