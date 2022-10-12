Return-Path: <linux-trace-users-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1635C433FE
	for <linux-trace-users@archiver.kernel.org>; Wed, 12 Oct 2022 16:37:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229974AbiJLQhI (ORCPT
        <rfc822;linux-trace-users@archiver.kernel.org>);
        Wed, 12 Oct 2022 12:37:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59996 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229557AbiJLQhH (ORCPT
        <rfc822;linux-trace-users@vger.kernel.org>);
        Wed, 12 Oct 2022 12:37:07 -0400
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 090F73E764
        for <linux-trace-users@vger.kernel.org>; Wed, 12 Oct 2022 09:37:05 -0700 (PDT)
Received: by mail-wm1-x329.google.com with SMTP id r8-20020a1c4408000000b003c47d5fd475so1529759wma.3
        for <linux-trace-users@vger.kernel.org>; Wed, 12 Oct 2022 09:37:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nNLSuvY78s4n5AFlXV4u8eO41OVknp8ZRGFLiWyHMEI=;
        b=THnRYgV8pdhupu5W1QIiI+ritnGNr8WdsjnAWACxoADEGMnfn4jOAbwzXmQuE0m9bW
         JwlanBP1R+1BebONSecjG6kN/NKMNLsZ8Tfao4ZBrsID4Qq5rxMX/raLaoZV17HeSTL+
         MutQCG36NDytgZNsDO82S+L5rlNpPA5HWtB4SWeiglUm2dvuVjaiQSZtAPRNS8SD8xLL
         gAxqdgSa5K/R6urCtQVWX9LknCYyTM0aTOCBfBefbeclK+KHFWEKaYP1HFLCjMDQsb1N
         130TfuJvBIpS1mCBawuz6Adjo6B7eRsrzNl1+jmhRjJEdaQ8VEpg+o3KCpJffqU7y8be
         yRlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nNLSuvY78s4n5AFlXV4u8eO41OVknp8ZRGFLiWyHMEI=;
        b=y9KENYdcUuLNhlRL9mXq99KFxtWGNKQd6mXSnUwUlF8LVfvYxjN5PPLKyC/TJ2WQxB
         /FjJKJf970hmPEPjf3+utWqmjS4gnCFQFgC2zJIGVOlKES+eb/69Eaamg+shMsGUP31z
         nd1HwPJlHMvuX5ygMiuOp1OiBAz4aaAZwCYrF+9V7EfVAnaANedbYR/NVpRLO1o6Rooh
         OVJ7UtCNZmK5T+9FG0nl49aP+GVJ/7DpsjchlIOSdfO54MUE9Jll7hA35tu3rxl7G3uC
         S9WWGgM5Coq79fz8S6ThPw8RF6mkRbstEH/nmnDFVP9DMSGZBL4KyU4AjKWfoW2OJ+bY
         4OcA==
X-Gm-Message-State: ACrzQf3IatcE2Y+8I+CU/3r9EromyAS7u08Z7ht+ZUBt2YUDlvij7beY
        KVynRGjQBGyWi8YjQkR1IaI=
X-Google-Smtp-Source: AMsMyM5M+SflbjJlqbOpYcHae25KBfMp3SavhNSfFXo9MmVtrKYYAnT+jWMhTDfozZnu7SM6j8CHlA==
X-Received: by 2002:a05:600c:19cd:b0:3b9:af1f:1b3b with SMTP id u13-20020a05600c19cd00b003b9af1f1b3bmr3391409wmq.37.1665592623434;
        Wed, 12 Oct 2022 09:37:03 -0700 (PDT)
Received: from [192.168.1.8] (78-154-13-219.ip.btc-net.bg. [78.154.13.219])
        by smtp.gmail.com with ESMTPSA id f13-20020adff58d000000b0022c906ffedasm116753wro.70.2022.10.12.09.37.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Oct 2022 09:37:03 -0700 (PDT)
Message-ID: <05bdedc0-4c4b-dbb3-1ad5-8ef743d74d1e@gmail.com>
Date:   Wed, 12 Oct 2022 19:37:01 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: kernelshark: Proper way to install documents when packaging as
 rpm
Content-Language: en-US
To:     Zamir SUN <sztsian@gmail.com>, linux-trace-users@vger.kernel.org
References: <610fc577-cae0-7587-c201-b300c4d7db87@gmail.com>
From:   Yordan Karadzhov <y.karadz@gmail.com>
In-Reply-To: <610fc577-cae0-7587-c201-b300c4d7db87@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-trace-users.vger.kernel.org>
X-Mailing-List: linux-trace-users@vger.kernel.org

Hi Zamir,

We never had a functional installation of the documentation. The 
documentation itself needs significant amount of work, so I would prefer 
to keep it only as an option for those enthusiasts who want to build the 
project from source.

Thanks!
Yordan


On 10/11/22 18:15, Zamir SUN wrote:
> Hi,
> 
> When I am working on packaging kernelshark as RPM, I noticed that 
> kernelshark documents cannot be installed with make
> install. My compiling steps is like the following (with the passing of 
> compiling flags omitted in this email to reduce length)
> 
> cd build
> cmake ..  -DCMAKE_BUILD_TYPE=Package -D_DOXYGEN_DOC=1
> make V=1 all doc
> 
> And installation is by
> 
> cd build
> make V=1 install
> 
> Manually running the expanded commands I see there are actually 
> documents compiled under Documentation dir. But the make install did not 
> copy that. `make list_install_components` shows that
> 
> Available install components are: "kernelshark" "libkshark-devel" 
> "polkit-policy"
> 
> Additionally, simply going into Documentation dir and run make install 
> will just result in error
> 
> No rule to make target '/Documentation/kernelshark.1'
> 
> So I feel this isn't the right way either. So I wonder if I should 
> manually copy all the stuff (or a subset?) from Documentation dir into 
> the package, or is there a preferred installation step that I missed?
> 
> Thanks in advance.
