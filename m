Return-Path: <linux-trace-users-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 831A6C61DA4
	for <linux-trace-users@archiver.kernel.org>; Wed, 22 Feb 2023 19:13:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230402AbjBVTNQ (ORCPT
        <rfc822;linux-trace-users@archiver.kernel.org>);
        Wed, 22 Feb 2023 14:13:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46560 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229561AbjBVTNP (ORCPT
        <rfc822;linux-trace-users@vger.kernel.org>);
        Wed, 22 Feb 2023 14:13:15 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B8F283866F
        for <linux-trace-users@vger.kernel.org>; Wed, 22 Feb 2023 11:12:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1677093148;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=/NUtoNJdcg5nbD/dg/eXb5WDR5isIFT1N2J2M6OfKTA=;
        b=KH5UvQLM+jSdkQ831qAa9JnBnFlj9KGGwOYWLiaOIHfwxYYf562SgV2Ih56bFvmfkLeBGr
        nhcQyRKGM99o5ntDaHVex5R9B2XBbiX2OTvWYa59V0AvQ0dVp9s2Uwhq/jE2m03+RmoMTK
        qD3CqxMGk/PZ70Rf4xxsneHtOSF5CiU=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-638-HvKFisIgPeGfZS6F4L53Kw-1; Wed, 22 Feb 2023 14:12:26 -0500
X-MC-Unique: HvKFisIgPeGfZS6F4L53Kw-1
Received: by mail-wr1-f71.google.com with SMTP id d14-20020adfa34e000000b002bfc062eaa8so2011459wrb.20
        for <linux-trace-users@vger.kernel.org>; Wed, 22 Feb 2023 11:12:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/NUtoNJdcg5nbD/dg/eXb5WDR5isIFT1N2J2M6OfKTA=;
        b=0NCIofSvR0ubswLJGJC8eBGjBKFO8+dNGD1wnSpTaZrOT6nhzByOM3hULyUSljkqlV
         zjy0nrqicsZPYdSoggaR/DhsZSoCK4OJUbHsDbQ01ckPEjtT5v2wndYtSU62zHOSURQa
         i0WvsQxzWXQWqxUEAbP6gn4uOV7fUmwQKZP0M4+eE2s8Ga3zfy2XC/qDPSjDbbqKuhAE
         /c20UKCeHy7mrSIGD9av7kQBT06svdg66MyEf7hNKF8CP94Ec+mgV770dFqJtKkqJb9M
         ti5BHalfi6/haGPggRQpIPvCH2qxxDUI1gV87sXKYDRLcyTIwe/93pE9QVeNNf6IA2FG
         uCPQ==
X-Gm-Message-State: AO0yUKWcR5GhsjeZtuHc193Wiv2lVLIrdXKIrqRdym4WeTxK8Nh+phwD
        CPlASwfGvc8/QSGCHysdPZP5jTyN+QbAFsdQViYnerLftuglZ4G8TrHkV1gOACgp3Vg6ttErLQo
        QCfNaD4NCZAq6jejM2kXrpwwwiJB/jXD3fHsvYsNv44qv6VWW77pN
X-Received: by 2002:a05:600c:1914:b0:3dc:5565:9250 with SMTP id j20-20020a05600c191400b003dc55659250mr437878wmq.127.1677093145295;
        Wed, 22 Feb 2023 11:12:25 -0800 (PST)
X-Google-Smtp-Source: AK7set8yNskhwhny+mnb3bm6kKYtKpySRdmUdaR21RRrXyLnWqAja24TYufBHF7IgFX5YhWQxghm3rsskSu6YUZ3H4g=
X-Received: by 2002:a05:600c:1914:b0:3dc:5565:9250 with SMTP id
 j20-20020a05600c191400b003dc55659250mr437875wmq.127.1677093145084; Wed, 22
 Feb 2023 11:12:25 -0800 (PST)
MIME-Version: 1.0
References: <CAE8KmOxedTiM8GJVp+-HuBW=jkuE=aSKFYrmaj8zHLmQP-1RCg@mail.gmail.com>
 <8ae9144f-6d7c-2b63-4fe7-4f124b5515bf@kernel.org> <CAE8KmOzuCqp5w4FBVd6GjPg_znQhumcsA=PKozZbQWxXPdZYXg@mail.gmail.com>
 <38c56e37-2805-0b93-57f6-a176e4eb98f6@kernel.org>
In-Reply-To: <38c56e37-2805-0b93-57f6-a176e4eb98f6@kernel.org>
From:   Prasad Pandit <ppandit@redhat.com>
Date:   Thu, 23 Feb 2023 00:43:56 +0530
Message-ID: <CAE8KmOwULR795naEj=ygHgO3pufMG3EqBmj_dbdFwFyAQ_KQRg@mail.gmail.com>
Subject: Re: About rtla osnoise and timerlat usage
To:     Daniel Bristot de Oliveira <bristot@kernel.org>
Cc:     linux-trace-users@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-trace-users.vger.kernel.org>
X-Mailing-List: linux-trace-users@vger.kernel.org

On Wed, 22 Feb 2023 at 23:36, Daniel Bristot de Oliveira
<bristot@kernel.org> wrote:
> > * Idle tune?
> idle tuning is configuring the system to avoid deep idle states.
> An easy way to do it is either setting idle=poll or enabling the "--dma-latency 0" in timerlat.
>
> But this is only a "problem" for timerlat/cyclictest, not for oslat/osnoise as they measure
> the noise as they run - so they CPU does not go idle.

* I see, got it. Thank you.
---
  - P J P

