Return-Path: <linux-trace-users-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 062C6C61DA4
	for <linux-trace-users@archiver.kernel.org>; Thu, 23 Feb 2023 12:12:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234148AbjBWMMf (ORCPT
        <rfc822;linux-trace-users@archiver.kernel.org>);
        Thu, 23 Feb 2023 07:12:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41076 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234231AbjBWMMb (ORCPT
        <rfc822;linux-trace-users@vger.kernel.org>);
        Thu, 23 Feb 2023 07:12:31 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 185952E825
        for <linux-trace-users@vger.kernel.org>; Thu, 23 Feb 2023 04:11:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1677154240;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=Yhtt3B4I7rjPVeapA11UwaLXLVqcWYnVPJgj6T/shmg=;
        b=ABbQAir/EPuZheo3uDTTGD5xPNw5l7y0BI0ptDW/abEQmgOC8JlD8LYu3XrxgIrXKtpWYv
        H+w/dx+z/X5IIf9L8U37KrrAtVOTLgJbzYB84VlbNEddvDnH0OofJKQOoYm9/7C5XlH/aC
        r6wdC6++FqiszGfxM7KJgKHczPqQnWM=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-63-XJClboHHMRyCAOMBUHEB_A-1; Thu, 23 Feb 2023 07:10:39 -0500
X-MC-Unique: XJClboHHMRyCAOMBUHEB_A-1
Received: by mail-wr1-f69.google.com with SMTP id l4-20020a5d6d84000000b002c54aaa28dcso2241499wrs.16
        for <linux-trace-users@vger.kernel.org>; Thu, 23 Feb 2023 04:10:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Yhtt3B4I7rjPVeapA11UwaLXLVqcWYnVPJgj6T/shmg=;
        b=rGdUOpSPQoZb1XQOfdA6ISbcc6/mkOYM1+tdB25fjNXbDMJhuc3pSIk3ZiPulFo5RX
         zsp4tB0JPYJiWZpMuz2g1WhGwxBGW1MQk6AwZf+i9xTk8qlCPxIqwHyaETVgZqJZvMjl
         LpP0Q4tyWIR3iMQd1/Sk919zIjsQr0JFGKXV3K7iDDooiXDfclnhhfbB8c+/0kil9mp9
         OJYR0AvRu3Kf4UZE+hPEUW0JBYMgdgoO3CLzx1KHDjP2Vp/FiS+LbyrAbkcVn9TVeUt/
         J2vdPyGQA69ewqav9TZXTLO6+T0kilxot33kIDvG+Xu/nT8ij/j5gPRcpqxPVZSPHzeK
         U6nw==
X-Gm-Message-State: AO0yUKXXf7ihaT7O8izyziOYlzJkCT51aCh8sVPl3yCc+LlNcD8quXKO
        0+gdSbitsOgo/s5ydwNJyLwZTYDPTIepOw2VLPcXXMCl6yO5PI4r9rSiLpxltR5r954141/kAaH
        QC5NQw4yn67KQn4llzIMJrjSA8w9Ps6XwGpde5DK4t4jUS2cYSLSBeGU=
X-Received: by 2002:adf:f602:0:b0:2c5:9a99:fc94 with SMTP id t2-20020adff602000000b002c59a99fc94mr679267wrp.6.1677154237457;
        Thu, 23 Feb 2023 04:10:37 -0800 (PST)
X-Google-Smtp-Source: AK7set/4yMIwnAVkfLkSmogA+eOdwc9e44BPWpD1BTggN1HqPZ6+81JkzMTgCzLC8xSLRXI2AtZDBNKjSlxmp4uYX7g=
X-Received: by 2002:adf:f602:0:b0:2c5:9a99:fc94 with SMTP id
 t2-20020adff602000000b002c59a99fc94mr679264wrp.6.1677154237191; Thu, 23 Feb
 2023 04:10:37 -0800 (PST)
MIME-Version: 1.0
References: <CAE8KmOxedTiM8GJVp+-HuBW=jkuE=aSKFYrmaj8zHLmQP-1RCg@mail.gmail.com>
 <8ae9144f-6d7c-2b63-4fe7-4f124b5515bf@kernel.org> <CAE8KmOzuCqp5w4FBVd6GjPg_znQhumcsA=PKozZbQWxXPdZYXg@mail.gmail.com>
 <e7db6b57-ca5b-3f9a-b436-a263ff663f20@kernel.org> <CAE8KmOxV8u3v4ALVvqOUO+zvnd99d6iSXw0RiSLondvdX_JJSA@mail.gmail.com>
In-Reply-To: <CAE8KmOxV8u3v4ALVvqOUO+zvnd99d6iSXw0RiSLondvdX_JJSA@mail.gmail.com>
From:   Prasad Pandit <ppandit@redhat.com>
Date:   Thu, 23 Feb 2023 17:42:09 +0530
Message-ID: <CAE8KmOzfd+BSRKrS1pogf05XcjF1x_Z+sjJC5HDU5byKgG1X0g@mail.gmail.com>
Subject: Re: About rtla osnoise and timerlat usage
To:     Daniel Bristot de Oliveira <bristot@kernel.org>
Cc:     linux-trace-users@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-trace-users.vger.kernel.org>
X-Mailing-List: linux-trace-users@vger.kernel.org

Hello Daniel,

On Thu, 23 Feb 2023 at 00:41, Prasad Pandit <ppandit@redhat.com> wrote:
>      # trace-cmd record -p nop -e all -M 0x7FE -m 32000 --poll ~test/rt-tests/oslat --cpu-list 1-10 --duration 1h -w memmove -m 4K -T20
>      ....
>       Maximum:    14 11 13 12 12 13 12 11 12 10 (us)
>       Max-Min:    13 10 12 11 11 12 11 10 11 9 (us)
>       Duration:    3599.986 3599.986 3599.987 3599.987 3599.986 3599.987 3599.986 3599.987 3599.986 3599.986 (sec)
>
> * Running oslat(1) with SCHED_OTHER priority via 'trace-cmd --poll' option, did not show the spike. Nonetheless, trace-cmd(1) logs show  <idle>, ktimers/ and kworker/ threads running on isolated CPUs.
> * Now running rtla-osnoise(1) test with SCHED_OTHER:
>       # rtla osnoise top -c 1-10 -d 6h -s 20 -T 20 -Po:0 -q -t

Please see:
    -> https://0bin.net/paste/ShXHmdvu#D0XY-WxTKCzWTxgQ+lTFbx1nB2TP2w+T0Mp8PBXt9gu

* rtla-osnoise(1) running for 6 hours with SCHED_OTHER and SCHED_FIFO,
both did not report any spike above 20us.
  It's reporting occurrence of IRQs only, all other noise columns are
zero(0). That's a little surprising!?

Thank you.
---
   - Prasad

