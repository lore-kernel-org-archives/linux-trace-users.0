Return-Path: <linux-trace-users-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26695C6FA9C
	for <linux-trace-users@archiver.kernel.org>; Tue,  6 Sep 2022 10:47:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239815AbiIFKr3 (ORCPT
        <rfc822;linux-trace-users@archiver.kernel.org>);
        Tue, 6 Sep 2022 06:47:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57782 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239849AbiIFKqh (ORCPT
        <rfc822;linux-trace-users@vger.kernel.org>);
        Tue, 6 Sep 2022 06:46:37 -0400
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4BE98785AA
        for <linux-trace-users@vger.kernel.org>; Tue,  6 Sep 2022 03:45:33 -0700 (PDT)
Received: by mail-ej1-x632.google.com with SMTP id qh18so22200364ejb.7
        for <linux-trace-users@vger.kernel.org>; Tue, 06 Sep 2022 03:45:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date;
        bh=WOp3D12O35VaNZBjnllwewz0pbWJQoqBah5/LSPqQoQ=;
        b=Q7YYPjOepB/iCjkozvAkf/4U94btFstb9kw+SOcvBvT0KTYroRIZQd+y2Pwk5QUDLS
         MKN/zIT0CGx/XKO9ZDNXBfREiK5WXB89i46856CF966EA2uUnTKTClobp66kEnqW0qaJ
         CRGgwoRTGhPPZrB3xdUMC5Pq7UsS2jPhhPcYipzo9o3tukxFehuGdQDT2h+4B4RrQ+84
         nLaNhPRw9JNbmcP4EpGdCxYAltHjCw0YIKzOQRqdOg/t0Cwt8u67Al2pe0Rywb5kkJfe
         VGWOxNxckhvdW+i+9m13kgrNyqbxWDQiLvznExjbZxETHiq/Nvu7Zd64fcPMgoo9nT1o
         +xlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=WOp3D12O35VaNZBjnllwewz0pbWJQoqBah5/LSPqQoQ=;
        b=G4PftN9ryOJ03fxgkzZHtATwosrN9dtA6i7oxSWGkSr78dsDdaCyDKrU+CjJAvM8F9
         nYVLBqZ4GCNkLZ+pLNBF2+t1LifO8SBvW4M92TqotjyL5zzRiu+R3If7J8ximDJB3Z/W
         ceNGW+IezHr2whSld/eItFNTTEs/KdYJ4dlYutjsfryg8Q2FbN0M41Gkb2W6/5PWHMMk
         7Yqdd6pXkIRN7d800SzUeNpaSWCM6cJEMMNOZaqvamP4eI5KuJANG5i/qvad+YIRBXDV
         nnHuDXr4NLuRXfxh+yoOO1Jr7NO6Ch1EGRGDMO26qvTYNMEXxRRfuQAMvnu+BAIZoxGa
         Uesw==
X-Gm-Message-State: ACgBeo32/oBMEVTTj/HgUVsWbzdcSpN3ImCkFV9zxzUg4Mf43Ew8ad7v
        Fsqm6DG/R4VYJRUubBfwg4VBn+nvVbI=
X-Google-Smtp-Source: AA6agR5Q5g9Q2n0akQU3W/KGoqXQ/mvI0lxdKAuwgIa27xZI+ixK9np19ZPa25KNZll9fSJ+mHS3xA==
X-Received: by 2002:a17:907:7f0b:b0:731:b81a:1912 with SMTP id qf11-20020a1709077f0b00b00731b81a1912mr39122901ejc.8.1662461125411;
        Tue, 06 Sep 2022 03:45:25 -0700 (PDT)
Received: from [192.168.1.8] (78-154-13-219.ip.btc-net.bg. [78.154.13.219])
        by smtp.gmail.com with ESMTPSA id er20-20020a056402449400b0044d6c6a5b5fsm5737552edb.89.2022.09.06.03.45.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Sep 2022 03:45:24 -0700 (PDT)
Message-ID: <9252a7a4-f36c-356a-f069-9b17367ffff1@gmail.com>
Date:   Tue, 6 Sep 2022 13:45:23 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: Kernelshark: funcgraph_exit events don't seem to exit?
To:     Matteo Bertolino <matteo.bertolino@huawei.com>,
        "linux-trace-users@vger.kernel.org" 
        <linux-trace-users@vger.kernel.org>
References: <97aca26a196b4c72aaf2141b5a0c12c9@huawei.com>
Content-Language: en-US
From:   Yordan Karadzhov <y.karadz@gmail.com>
In-Reply-To: <97aca26a196b4c72aaf2141b5a0c12c9@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-trace-users.vger.kernel.org>
X-Mailing-List: linux-trace-users@vger.kernel.org

Hi Matteo,
Thanks for reporting this issue!

I understand what you would like to see being visualized, but 
unfortunately this is different from the implemented generic logic of 
the visualization model that changes the color at the place of the first 
event that belongs to the new task. Note that this generic logic is 
expected to provide adequate visualization for all types of events, 
while the behavior that you would like to see makes sense only for very 
specific events.

However, what you want is actually very easy to achieve. You just have 
to write a kernelshark plugin for funcgraph_exit events. If you are 
interested in contributing such plugin to kernelshark, I can send you 
instructions what has to be done. It will be really trivial work.

cheers,
Yordan


On 9/6/22 12:29, Matteo Bertolino wrote:
> Dear community,
> In order to explain my problem, I need to ask you to have a look to the visual trace in my github (I cannot attach it to the mail nor using an image uploading service): https://github.com/the-red-robin/trace-cmd-experiments/blob/main/README.md
> 
> In the trace, we have one CPU, CPU0. On it:
> - `Task3` runs `foo5()` at time 8.000000 cycles
> - `Task2` takes place running `foo3()` at time 8.010000 cycles.
> - `Task1` takes place running `foo1()` at time 8.060000 cycles.
> For now, everything OK.
> Then, I wish to `exit` the three tasks.
> 
> - `Task1` exits at 8.090000 cycles. Here the trace does not show what I expect, namely `Task1` (in red) shall end at 8.090000 cycles. Instead, there is a red trace until the beginning of the next exit event, `Task2` at 8.130000.
> 
> This doesn't seem an `exit` event. Do you have any suggestions to show what I wish on Kernelshark?
> 
> Best Regards,
> Matteo
