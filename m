Return-Path: <linux-trace-users-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63464C433F5
	for <linux-trace-users@archiver.kernel.org>; Tue, 11 Oct 2022 15:26:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229977AbiJKP0I (ORCPT
        <rfc822;linux-trace-users@archiver.kernel.org>);
        Tue, 11 Oct 2022 11:26:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57190 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230020AbiJKPZm (ORCPT
        <rfc822;linux-trace-users@vger.kernel.org>);
        Tue, 11 Oct 2022 11:25:42 -0400
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com [IPv6:2607:f8b0:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7233AA9261
        for <linux-trace-users@vger.kernel.org>; Tue, 11 Oct 2022 08:16:47 -0700 (PDT)
Received: by mail-pg1-x533.google.com with SMTP id l6so3518192pgu.7
        for <linux-trace-users@vger.kernel.org>; Tue, 11 Oct 2022 08:16:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:subject:from:content-language:to
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=46rn7EzkC1wQWoGHyd1cXwnxC2cltOMzHe58r6FfJyg=;
        b=bVXDL/dr5izihU6su/hpxrWUjHwMPMaXOSkU0bQZ+tI2u+tLCRhkUiLwot+xJm7L37
         fuKHUL3MajPRc2+WQHq5NdDRoQmLxzOpvRIisPsE85Z0LepmZZW5inNbi9yQ3da2X7Df
         s9t3tzp5FbhY1iys2DlRaBbR/TmFXMFE0JZ0i2UNF9gRaJhJH+xYfTcoukRWgkjCmzQf
         AVB4Q/1sYlp+N2QKkIcMNooOzgKp7mG1aybT1AK7WbCxNp5gCxqIQR2KL9BtAyp/4XjT
         0yt69xZc9IHbVKJKFkrmGmvA1KSS7ZMRXmFcB+4EGdX0/snWfT0hia0/nBCEBdcexQQZ
         aaUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:subject:from:content-language:to
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=46rn7EzkC1wQWoGHyd1cXwnxC2cltOMzHe58r6FfJyg=;
        b=b74szf04/id2c72pq9j7pEvKw31IEoKPhSzDlY1HWTj9V9efVBOVhhSixzCli22oep
         rsIEk+8moJwIiwuPmXPoZJPM4RSzDhfkRoLRBAWY/93c6OdRVrcmzuJuJM8Udfz3Xffr
         D4Ai/QAYgwQoF0qhOez/PWOAWEJVLHZVkiDqqA1tUM22hrJ0DfV5jUXaWfAwbE4h8CkY
         +ZUZhv/KFRm6fKh+/Ks1MxCIAqfLqtLfdMMB4ZLjOyNg+DO8VKZrROiYUqC82SQeVs44
         HlGOQOEAm7oWFCT3QyKzhUMm8uEsM/Bv7x8ioZxM2YHLKEFfV65uGLgpL7M7T9AnOZlL
         v0HA==
X-Gm-Message-State: ACrzQf02SqG/7Tgyn2xBEJMO3choabLPt+IizTxTRVsnh6IcI6iicSrT
        WCxhAn0AMzMSM1OPoYFRfJ+gJtD0akMjwQ==
X-Google-Smtp-Source: AMsMyM4gs2JrA+tLx8GhajOefbUYnCEWH0mcZ3wV9mZqbcR5Sc4/3WsWB/8Rni2Y0aoD/EilkqzoAA==
X-Received: by 2002:a05:6a00:ac6:b0:530:3197:48b6 with SMTP id c6-20020a056a000ac600b00530319748b6mr26030283pfl.80.1665501338917;
        Tue, 11 Oct 2022 08:15:38 -0700 (PDT)
Received: from ?IPV6:2409:8a00:78a5:1511:da5e:d3ff:fe96:c724? ([2409:8a00:78a5:1511:da5e:d3ff:fe96:c724])
        by smtp.gmail.com with ESMTPSA id t4-20020a170902e84400b0016d1b70872asm8817325plg.134.2022.10.11.08.15.36
        for <linux-trace-users@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Oct 2022 08:15:37 -0700 (PDT)
Message-ID: <610fc577-cae0-7587-c201-b300c4d7db87@gmail.com>
Date:   Tue, 11 Oct 2022 23:15:31 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
To:     linux-trace-users@vger.kernel.org
Content-Language: en-US
From:   Zamir SUN <sztsian@gmail.com>
Subject: kernelshark: Proper way to install documents when packaging as rpm
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-trace-users.vger.kernel.org>
X-Mailing-List: linux-trace-users@vger.kernel.org

Hi,

When I am working on packaging kernelshark as RPM, I noticed that 
kernelshark documents cannot be installed with make
install. My compiling steps is like the following (with the passing of 
compiling flags omitted in this email to reduce length)

cd build
cmake ..  -DCMAKE_BUILD_TYPE=Package -D_DOXYGEN_DOC=1
make V=1 all doc

And installation is by

cd build
make V=1 install

Manually running the expanded commands I see there are actually 
documents compiled under Documentation dir. But the make install did not 
copy that. `make list_install_components` shows that

Available install components are: "kernelshark" "libkshark-devel" 
"polkit-policy"

Additionally, simply going into Documentation dir and run make install 
will just result in error

No rule to make target '/Documentation/kernelshark.1'

So I feel this isn't the right way either. So I wonder if I should 
manually copy all the stuff (or a subset?) from Documentation dir into 
the package, or is there a preferred installation step that I missed?

Thanks in advance.
-- 
Zamir SUN
Fedora user
GPG : 1D86 6D4A 49CE 4BBD 72CF FCF5 D856 6E11 F2A0 525E
