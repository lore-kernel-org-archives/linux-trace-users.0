Return-Path: <linux-trace-users-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AF3CC25B08
	for <linux-trace-users@archiver.kernel.org>; Sat, 20 Aug 2022 09:21:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245610AbiHTJVW (ORCPT
        <rfc822;linux-trace-users@archiver.kernel.org>);
        Sat, 20 Aug 2022 05:21:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42214 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244085AbiHTJVV (ORCPT
        <rfc822;linux-trace-users@vger.kernel.org>);
        Sat, 20 Aug 2022 05:21:21 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C92C9B69C7
        for <linux-trace-users@vger.kernel.org>; Sat, 20 Aug 2022 02:21:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1660987279;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=RJhUICJH6FacSXTDCxEf7kZpPdw/UJ30I9DkKp+RhRE=;
        b=PYEe8LQQdgZ7ZFWLJ3oeXhDiryA9aH8oX7lCCDtEjR5704l8rKVhrc0T+/3wzriBH5B1zB
        rV171l//v1S30mpA+XjbhTLEEFlBBjZhCoJkl5wat+DcziB4W+wIF+J+Jjs85djCSSQ1aU
        3cJ334sT5NTJwAuo/jOX+/WZW/sA2X4=
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com
 [209.85.167.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-154-aaj-S_xTPp-ul4BgVFkfWA-1; Sat, 20 Aug 2022 05:21:18 -0400
X-MC-Unique: aaj-S_xTPp-ul4BgVFkfWA-1
Received: by mail-oi1-f200.google.com with SMTP id ay32-20020a056808302000b002f96abff093so1206786oib.23
        for <linux-trace-users@vger.kernel.org>; Sat, 20 Aug 2022 02:21:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=RJhUICJH6FacSXTDCxEf7kZpPdw/UJ30I9DkKp+RhRE=;
        b=dctWH2DoW3dmtnp0w7xLgjlP1ZXp3C8MXRY+CCj+wsxDcbB0ldlk5S1XsQ+tNha02g
         tmvsd/ilxHSm8YcTjDJO9wNF8cwAj22X6r0OPEGXoVuQGtypbsVHB2zAJsHSI2Z98csE
         3TDu58ecD5FOm6WgNVBsB26LkbsfWlu8pkn5YliEtiFtxhYhTi6jmPVWgfrOVP18MMgV
         rPNLWKiSI/MtaXqWHsYIx5pdLivsH9NPKwXisuXT/vtREQtC9fU4JgP6tJi3Hg9tvu/1
         EG3IBb4yNMJcNJ94rjzoaC3txgpxPHSxDErJfwmirOcZvdhBhxvdMmx3Ib590vJju2NA
         6ewA==
X-Gm-Message-State: ACgBeo2u0ZUouSp1SK2VGgdeJbHq/MB3IP+JTsyFKqInPIgJFihkJpOk
        +pAFwFreHbsHC365ZatRp0TZYuY6igONVD/UBUGkPpQROTVbHkNOdVr4LHi1kQoovUooUayfdyT
        967WIGcm2LU8lY8TlbUSq2lEI+zagU202sVVMTo7eBjRd8N4=
X-Received: by 2002:a05:6808:f0c:b0:344:bb8d:a99f with SMTP id m12-20020a0568080f0c00b00344bb8da99fmr5008148oiw.151.1660987277945;
        Sat, 20 Aug 2022 02:21:17 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5bPE/mIczKvSVxaV+64RQl3rDEMl7ReEDO+4CT6/P16Jj9sSooAHtFpikkE4VyVBVGTLxV7o4Lfb6gYdSys9U=
X-Received: by 2002:a05:6808:f0c:b0:344:bb8d:a99f with SMTP id
 m12-20020a0568080f0c00b00344bb8da99fmr5008145oiw.151.1660987277762; Sat, 20
 Aug 2022 02:21:17 -0700 (PDT)
MIME-Version: 1.0
References: <CAE8KmOwGONSzSDczNdadyMSvn84qBbqS0wKUMbctnPgio0Uxgg@mail.gmail.com>
 <20220819135047.45243742@gandalf.local.home>
In-Reply-To: <20220819135047.45243742@gandalf.local.home>
From:   Prasad Pandit <ppandit@redhat.com>
Date:   Sat, 20 Aug 2022 14:51:02 +0530
Message-ID: <CAE8KmOyUyRCCN035ScjbcsD9ftOvsn_Z++piiThyVgy7cwL4kw@mail.gmail.com>
Subject: Re: About tracing clues
To:     Steven Rostedt <rostedt@goodmis.org>
Cc:     Daniel Bristot de Oliveira <bristot@kernel.org>,
        linux-trace-users@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-trace-users.vger.kernel.org>
X-Mailing-List: linux-trace-users@vger.kernel.org

Hello Steven,

On Fri, 19 Aug 2022 at 23:29, Steven Rostedt <rostedt@goodmis.org> wrote:
> Hmm you need to turn off line wraps when pasting in output like this.
> Because the line wraps make it very difficult to follow.

* True, I should've done that; I'll remember to do it.

> To get the vsocket CID id, you can run the agent:
>
>   # trace-cmd agent
> listening on @3:823
>
> The @3 is the CID (823 is the port).
>
> Hit Ctrl-C on to kill the agent.
>
> Then on the host, run:
>
>  # trace-cmd agent -P 3
>
> Where 3 is the CID of the guest you want to connect the host (the same
> number from the 'trace-cmd agent'. That is, if it was @4:823, then use
> '-P 4'). The host agent above should also have a:
>
>  listening on @2:823
>
> or something. You'll need the host's CID too.
>
> Then on the guest, run:
>
> [ You do not need -p nop if you have -e used ]
>
>   # trace-cmd record --poll -M 1E -e all --proxy 2 --name host -e kvm -e sched -e irq /home/test/rt-tests/oslat --cpu-list 1-4 --rtprio 1 --duration 12h -T 30 oslat V 2.30
>
> And then when it ends, you'll have two files. One that is trace.dat and one
> that is trace-host.dat. If everything worked well, the two would also be in
> sync with each other. Doing:
>
>   # trace-cmd report -i trace-host.dat -i trace.dat
>
> Will show the host events happening with the guest events. If the host
> caused the latency, you will definitely see it.
>
> If you have the latest kernelshark, you can run:
>
>   kernelshark trace-host.dat -a trace.dat
>
> And then select "Plots" -> "KVM Combo Plots" and in the popup, select the
> box for "all".
>
> Then you'll see plots for each virtual CPU and the host thread that represents it.

* I see, thank you so much for these interesting details. I'll try
these steps and get back to you soon.


Thank you.
---
  - P J P

