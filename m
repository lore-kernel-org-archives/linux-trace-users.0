Return-Path: <linux-trace-users-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC353C38145
	for <linux-trace-users@archiver.kernel.org>; Thu,  8 Sep 2022 19:04:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229925AbiIHTE3 (ORCPT
        <rfc822;linux-trace-users@archiver.kernel.org>);
        Thu, 8 Sep 2022 15:04:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60536 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229696AbiIHTE2 (ORCPT
        <rfc822;linux-trace-users@vger.kernel.org>);
        Thu, 8 Sep 2022 15:04:28 -0400
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 59E4C289
        for <linux-trace-users@vger.kernel.org>; Thu,  8 Sep 2022 12:04:22 -0700 (PDT)
Received: by mail-ej1-x62a.google.com with SMTP id z17so12155645eje.0
        for <linux-trace-users@vger.kernel.org>; Thu, 08 Sep 2022 12:04:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=QBc0Y5qW6nAV0Duemr7rZFXwPSX0KO/nwEylmsnIKtY=;
        b=aIElUdIcaXDtQD1cx80ueQc0gvQlI2XFST1D9ljFqbfrnf/kgH+boRvbeXsXacaab5
         xiig0apO/msbW+qRrCb4XJQ7oKJbJbfwK74RAWMP8FXI+1+BX7ZvxvqvD4tuBnUR2b0t
         JNd93N8ZCJL92Yk26WkZ+QB7cD46w4g75rhXPGEaun/ieEi9JXFrmWjbCq57mOG00fNa
         GPptacOD+aL8aLN5YFrhn7c7hR/M4QClL4TvAX3ZOQynqtZmbwgccoUUmsADFW2MGnew
         sCd77cnWZlQIUqT2ZaNRhbJqmEKmQD0a2FpicP94e46l2MoYTofp40HE/2m5wDJUSm40
         aiPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=QBc0Y5qW6nAV0Duemr7rZFXwPSX0KO/nwEylmsnIKtY=;
        b=Hm2+l2kA8wrACuAIXp/QizR009xINcpkkILU8nYADLMjbyH5dLeXSxgaTx8u6JnPFS
         pBTv/tkOaB9wSDzeN7VwUVEVFkicl2MoQQIxA7ZnLB3kKbHTJVj/Fat7EO/Di15c1rYG
         wPKGUX5vpi98T+kAXn+Lf9CmKewbY/Hcq0S1KIN0/UgtUXKH6oZyov9FzNKDbGWEltil
         XqKAhSXGqG/fNRaxg4sGnutcxIMRNObHB0TTxQ+Z1i4F9pmF/nZYIwiz9t3UV4Lv/a+H
         rembGA3Xti9GnmfwLv+5AGiRICw/CFk4nNc6rKF9F5Xf2DdLjoMAZkUfhNZZJVi2G1Of
         cLkw==
X-Gm-Message-State: ACgBeo3H5fzauZNw9MWJfDsN2UCN0ASzQzONuc2yKUd+/Ny51pfnpX28
        vifmanpbGJ23u6oBSgkDKf76IsJfMp0=
X-Google-Smtp-Source: AA6agR5A/UCrXUFCXROQCUYA2NgzVLQHkABvUQjZJXzPpmc8F7L6Cp1oWYosoYwUE9TXruazFHGLxg==
X-Received: by 2002:a17:907:d18:b0:777:a511:28c2 with SMTP id gn24-20020a1709070d1800b00777a51128c2mr2077028ejc.413.1662663860867;
        Thu, 08 Sep 2022 12:04:20 -0700 (PDT)
Received: from [192.168.1.8] (78-154-13-219.ip.btc-net.bg. [78.154.13.219])
        by smtp.gmail.com with ESMTPSA id cn18-20020a0564020cb200b0044e1b4bca41sm9668290edb.79.2022.09.08.12.04.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Sep 2022 12:04:20 -0700 (PDT)
Message-ID: <24b50f34-b1ab-27d5-9c31-89a95d3d9fb5@gmail.com>
Date:   Thu, 8 Sep 2022 22:04:19 +0300
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
 <531dad7b-f88f-4c75-af9f-3e025fba6f8f@gmail.com>
 <134054c70c58468383174c1f62179fc3@huawei.com>
From:   Yordan Karadzhov <y.karadz@gmail.com>
In-Reply-To: <134054c70c58468383174c1f62179fc3@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-trace-users.vger.kernel.org>
X-Mailing-List: linux-trace-users@vger.kernel.org

Hi Matteo,

On 9/7/22 11:08, Matteo Bertolino wrote:
> If that doesn't annoy you too much, may you give me some hints about writing a Kernelshark's plugin?

As I already mentioned, we have a plugin for sched events, so you can 
use this plugin as starting point, despite that your plugin will be by 
far simpler.

Have a look here
https://git.kernel.org/pub/scm/utils/trace-cmd/kernel-shark.git/tree/src/plugins/sched_events.h

and here
https://git.kernel.org/pub/scm/utils/trace-cmd/kernel-shark.git/tree/src/plugins/sched_events.c

and see how you can define a context object for your plugin and how you 
can register a plugin action that will be executed over each entry in 
the data that is event of a given type. Example of such action for 
sched_switch events:
https://git.kernel.org/pub/scm/utils/trace-cmd/kernel-shark.git/tree/src/plugins/sched_events.c#n102

As a first step, try to register a plugin action for the 
'funcgraph_exit' event that will set the 'pid' of the entry to 'idle'

entry->pid = stream->idle_pid

This will be enough to have half of the work done.

You can build your plugin, using the 'BUILD_PLUGIN' macro here:
https://git.kernel.org/pub/scm/utils/trace-cmd/kernel-shark.git/tree/src/plugins/CMakeLists.txt

Let me know when you are ready with this and we will figure out how to 
implement the other features that you want.

cheers,
Yordan
