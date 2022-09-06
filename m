Return-Path: <linux-trace-users-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46C64ECAAA1
	for <linux-trace-users@archiver.kernel.org>; Tue,  6 Sep 2022 18:01:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229469AbiIFSBR (ORCPT
        <rfc822;linux-trace-users@archiver.kernel.org>);
        Tue, 6 Sep 2022 14:01:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56180 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229447AbiIFSBQ (ORCPT
        <rfc822;linux-trace-users@vger.kernel.org>);
        Tue, 6 Sep 2022 14:01:16 -0400
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 86291ABF15
        for <linux-trace-users@vger.kernel.org>; Tue,  6 Sep 2022 11:01:13 -0700 (PDT)
Received: by mail-ej1-x629.google.com with SMTP id nc14so25063743ejc.4
        for <linux-trace-users@vger.kernel.org>; Tue, 06 Sep 2022 11:01:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=YUvk5eL8bPVmgH9y/S5HgMB7yynGncdpOGkdVZP9oX4=;
        b=fcOCaAl9WoCAvFatZOOl+i/IuP3BXEgU1RBEsBLXAWg/llxH8QmJ5ClAiVOvgiHTZU
         73TLQElrBulfnBzU0dftAMMCcu1ZSgPW0TGJ7PcY9hm13XrtERvYbYj+AXFAkVuKZvmh
         0xAnzKBASGk+pXN6fZ2doORamAqiOcrl/aYJckRB4u637svaII0xc6byNafNkvhc4xDm
         bvq6YnVd4GmXCPODw3dOe/ToGzLFh2z4TWz04kH4g7ScMmG7BYnfoQz0DY/W8BHUijcx
         MDbvALxZ2cCBLhVDLEIO8GyHBfUEAILs8kbB7319BLt2KcOzGB8lPxISV2i7rc7LYomM
         S0SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=YUvk5eL8bPVmgH9y/S5HgMB7yynGncdpOGkdVZP9oX4=;
        b=gztyctbnj6iezc1Ggxoonc6nErVoZjPZl1aDwWxcmvqC5m2Sjn1Nd/v7OjqIZyBNQa
         6xnsr+KmUAFbzoHSPkaIRL9PyNTKZh8zIf8ZUteEWfxqmcAz0Am5Xfm7OW7rXrsu7NUR
         YzGF6dYNsXTPsy6b2JtDHzzDKYKFjzrJ+2W6LCX3mpRUN1xAmc00REEBJIWDdC1it5T6
         5DhMKUVf0bdsaUaqdZgk0Zdx6tIxmFwtQnHD1eHMIsHnzzUtHjGfq9nGSceucY8HyFwU
         QIjxmCS0q2DuL6T6rAVxkYL5myLWdBA2c3E/oUpuDtWXF5MNXmKsPI1ewLBSgV6WWWVc
         AfFg==
X-Gm-Message-State: ACgBeo0qQo+H3Z3HTWJkKxQ4iq2hWlrnTRwUN6xV9dE1ZSsacgX60rgt
        Mxdm2Wm3z005cRoyq9FeMKnxD4CsEEY=
X-Google-Smtp-Source: AA6agR55b1FdwfBbrsU7Mz3ssMIWRO2cbrEolNEHTuqMIf+HsLtW+hJzkkdPopQ9ccHryJmnQ+5zEQ==
X-Received: by 2002:a17:907:d87:b0:76f:128c:4caa with SMTP id go7-20020a1709070d8700b0076f128c4caamr2680566ejc.720.1662487271417;
        Tue, 06 Sep 2022 11:01:11 -0700 (PDT)
Received: from [192.168.1.8] (78-154-13-219.ip.btc-net.bg. [78.154.13.219])
        by smtp.gmail.com with ESMTPSA id r14-20020aa7c14e000000b0044e7adbe0c5sm4751389edp.87.2022.09.06.11.01.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Sep 2022 11:01:10 -0700 (PDT)
Message-ID: <531dad7b-f88f-4c75-af9f-3e025fba6f8f@gmail.com>
Date:   Tue, 6 Sep 2022 21:01:09 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: Kernelshark: funcgraph_exit events don't seem to exit?
Content-Language: en-US
To:     Matteo Bertolino <matteo.bertolino@huawei.com>,
        "linux-trace-users@vger.kernel.org" 
        <linux-trace-users@vger.kernel.org>
References: <97aca26a196b4c72aaf2141b5a0c12c9@huawei.com>
 <9252a7a4-f36c-356a-f069-9b17367ffff1@gmail.com>
 <f2feee0c5a6b49f3949eba9ded500842@huawei.com>
From:   Yordan Karadzhov <y.karadz@gmail.com>
In-Reply-To: <f2feee0c5a6b49f3949eba9ded500842@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-trace-users.vger.kernel.org>
X-Mailing-List: linux-trace-users@vger.kernel.org

Hi Matteo,

I confirm that the logic that you want can be implemented via plugin. 
However, there is even simpler way to accomplish what you want. When 
recording your trace, enable the 'sched_switch' events. This way in your 
data you will know exactly when the execution switches form one task to 
another (or to idle). The good thing here is that KernelShark already 
has a plugin for 'sched_switch' end you will see a the behavior that you 
expect.

cheers,
Y.


On 9/6/22 14:57, Matteo Bertolino wrote:
> Dear Yordan,
> Thanks for your reply!
> 
> I would like to do a double check to be sure that we're on the same rail.
> Can you please take my screenshot again? Between 8.090000 and 8.130000 the trace doesn't provide any information.
> 
> We don't know whether:
> A) task1 continues after the end of foo1 running something else that is not traced
> Or
> B) The CPU is idle/a non-traced task is running.
> 
> Today, the default behavior of kernelshark is A). Indeed, in my screenshot, the bar indicated by the light-blue arrow is red.
> 
> Instead, I wish to code a plugin with a third option:
> C) when we do not know what happens, just color with gray.
> 
> Do your instructions cover this case?
> If so, I would like to have some hints and I will try to implement it :-)
> 
> Best Regards,
> Matteo
> 
> -----Original Message-----
> From: Yordan Karadzhov [mailto:y.karadz@gmail.com]
> Sent: Tuesday, September 6, 2022 12:45 PM
> To: Matteo Bertolino <matteo.bertolino@huawei.com>; linux-trace-users@vger.kernel.org
> Subject: Re: Kernelshark: funcgraph_exit events don't seem to exit?
> 
> Hi Matteo,
> Thanks for reporting this issue!
> 
> I understand what you would like to see being visualized, but
> unfortunately this is different from the implemented generic logic of
> the visualization model that changes the color at the place of the first
> event that belongs to the new task. Note that this generic logic is
> expected to provide adequate visualization for all types of events,
> while the behavior that you would like to see makes sense only for very
> specific events.
> 
> However, what you want is actually very easy to achieve. You just have
> to write a kernelshark plugin for funcgraph_exit events. If you are
> interested in contributing such plugin to kernelshark, I can send you
> instructions what has to be done. It will be really trivial work.
> 
> cheers,
> Yordan
> 
> 
> On 9/6/22 12:29, Matteo Bertolino wrote:
>> Dear community,
>> In order to explain my problem, I need to ask you to have a look to the visual trace in my github (I cannot attach it to the mail nor using an image uploading service): https://github.com/the-red-robin/trace-cmd-experiments/blob/main/README.md
>>
>> In the trace, we have one CPU, CPU0. On it:
>> - `Task3` runs `foo5()` at time 8.000000 cycles
>> - `Task2` takes place running `foo3()` at time 8.010000 cycles.
>> - `Task1` takes place running `foo1()` at time 8.060000 cycles.
>> For now, everything OK.
>> Then, I wish to `exit` the three tasks.
>>
>> - `Task1` exits at 8.090000 cycles. Here the trace does not show what I expect, namely `Task1` (in red) shall end at 8.090000 cycles. Instead, there is a red trace until the beginning of the next exit event, `Task2` at 8.130000.
>>
>> This doesn't seem an `exit` event. Do you have any suggestions to show what I wish on Kernelshark?
>>
>> Best Regards,
>> Matteo
