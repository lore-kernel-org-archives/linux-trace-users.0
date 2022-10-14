Return-Path: <linux-trace-users-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A613C4332F
	for <linux-trace-users@archiver.kernel.org>; Fri, 14 Oct 2022 11:32:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229674AbiJNLcP (ORCPT
        <rfc822;linux-trace-users@archiver.kernel.org>);
        Fri, 14 Oct 2022 07:32:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42776 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229866AbiJNLcP (ORCPT
        <rfc822;linux-trace-users@vger.kernel.org>);
        Fri, 14 Oct 2022 07:32:15 -0400
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 26216E8C4A
        for <linux-trace-users@vger.kernel.org>; Fri, 14 Oct 2022 04:32:14 -0700 (PDT)
Received: by mail-pj1-x1032.google.com with SMTP id 70so4664046pjo.4
        for <linux-trace-users@vger.kernel.org>; Fri, 14 Oct 2022 04:32:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9YDhzPwJp+hqzhLF11/1teM57oo1UpLYT/W4o21GtUQ=;
        b=Ay+eoJXKm6fQYpqjA0SABmYm9CGyhTsQdl1lF0W+a2FbgmKzNjOYwMf2Hcs3wGKku1
         cAbMs/YzwYb3V5m/KKWpBBWr1Ujao0YkLiJGcrTJdjja+HsaPJM26T6ksx7XNYy1TSx5
         EobEcmNvF80xKLpNlRPXF2bVLz8pRivg/KetBBUQjoFIDkuurw/cReiV/APclgJtVBRl
         bxmiqBh4+rip1AqycfH/7uir6tQjTro08mGHbKVhTmrFrlFr1VWU2LcvILxwdWuz229O
         2+v0zk/9vZ684xxcgO0akMSTYaI9kiX4oXZrMXgiUBeUe44CXxiJv+JNPxsRHHVx+YK9
         a/aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9YDhzPwJp+hqzhLF11/1teM57oo1UpLYT/W4o21GtUQ=;
        b=n/pcmhlX3GnHmT+PuAbO8BJocipyg8XrfGKZWPIztx+ZOT4mBpH0+N3+S7+GTLUIvB
         VcdVh7r0reamHMIo6UWIxm4HoIn7JzPPOnVhxPC5bqRnoyKZNFeSiuNxFITGptIrFKZw
         cdmBfGtNY7I3pgHD34LdGO8shpQk1ET2wMXtmQGXnFKNTGWy/Z/g73XeoYt83DETAt7X
         5k2GySZ/rrw4zVVXaNcxPaUXRGsbS/NvT5S/dZH1Tq2n99zLDHe3yRYt/T7Hj0iHIwBN
         rhDwaKD95469wiVJEmjyDI5toEvekwHBb5MoktScyqiMoY6klcoMYOukCPzQQQldNk+w
         scIw==
X-Gm-Message-State: ACrzQf2PGoA+3I8Rf6Xj/Otwfde0VMatQri3FkOCWFXy92Yj+v6pldr5
        KNvce2nhNsPFyqx5UzEpVEPV+3qFy2Y=
X-Google-Smtp-Source: AMsMyM7504ukEaNxKLE+IKTkQ2Q36cKcj06H6hKanGA7ew70EmmjqKErb8KcV2B/LD7cqcE7VcOSaw==
X-Received: by 2002:a17:902:c405:b0:181:83e4:490e with SMTP id k5-20020a170902c40500b0018183e4490emr4604273plk.4.1665747133541;
        Fri, 14 Oct 2022 04:32:13 -0700 (PDT)
Received: from ?IPV6:2409:8a00:78a5:1511:da5e:d3ff:fe96:c724? ([2409:8a00:78a5:1511:da5e:d3ff:fe96:c724])
        by smtp.gmail.com with ESMTPSA id ij19-20020a170902ab5300b0017f7628cbddsm1508532plb.30.2022.10.14.04.32.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Oct 2022 04:32:12 -0700 (PDT)
Message-ID: <8eedbd7e-61a7-5bc2-a361-39ac676a5ef9@gmail.com>
Date:   Fri, 14 Oct 2022 19:32:06 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: kernelshark: Proper way to install documents when packaging as
 rpm
To:     Yordan Karadzhov <y.karadz@gmail.com>,
        linux-trace-users@vger.kernel.org
References: <610fc577-cae0-7587-c201-b300c4d7db87@gmail.com>
 <05bdedc0-4c4b-dbb3-1ad5-8ef743d74d1e@gmail.com>
Content-Language: en-US
From:   Zamir SUN <sztsian@gmail.com>
In-Reply-To: <05bdedc0-4c4b-dbb3-1ad5-8ef743d74d1e@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-trace-users.vger.kernel.org>
X-Mailing-List: linux-trace-users@vger.kernel.org

Hi Yordan,

Thanks for the info. This also makes sense. As a packager I can still 
decide and chose the files that is useful and manually wrap it into the RPM.

Thanks.

On 10/13/22 00:37, Yordan Karadzhov wrote:
> Hi Zamir,
> 
> We never had a functional installation of the documentation. The 
> documentation itself needs significant amount of work, so I would prefer 
> to keep it only as an option for those enthusiasts who want to build the 
> project from source.
> 
> Thanks!
> Yordan
> 
> 
> On 10/11/22 18:15, Zamir SUN wrote:
>> Hi,
>>
>> When I am working on packaging kernelshark as RPM, I noticed that 
>> kernelshark documents cannot be installed with make
>> install. My compiling steps is like the following (with the passing of 
>> compiling flags omitted in this email to reduce length)
>>
>> cd build
>> cmake ..  -DCMAKE_BUILD_TYPE=Package -D_DOXYGEN_DOC=1
>> make V=1 all doc
>>
>> And installation is by
>>
>> cd build
>> make V=1 install
>>
>> Manually running the expanded commands I see there are actually 
>> documents compiled under Documentation dir. But the make install did 
>> not copy that. `make list_install_components` shows that
>>
>> Available install components are: "kernelshark" "libkshark-devel" 
>> "polkit-policy"
>>
>> Additionally, simply going into Documentation dir and run make install 
>> will just result in error
>>
>> No rule to make target '/Documentation/kernelshark.1'
>>
>> So I feel this isn't the right way either. So I wonder if I should 
>> manually copy all the stuff (or a subset?) from Documentation dir into 
>> the package, or is there a preferred installation step that I missed?
>>
>> Thanks in advance.

-- 
Zamir SUN
Fedora user
GPG : 1D86 6D4A 49CE 4BBD 72CF FCF5 D856 6E11 F2A0 525E
