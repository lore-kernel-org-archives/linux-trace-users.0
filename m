Return-Path: <linux-trace-users-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90C34C761A6
	for <linux-trace-users@archiver.kernel.org>; Tue,  4 Apr 2023 17:58:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235619AbjDDR6i (ORCPT
        <rfc822;linux-trace-users@archiver.kernel.org>);
        Tue, 4 Apr 2023 13:58:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45580 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231620AbjDDR6i (ORCPT
        <rfc822;linux-trace-users@vger.kernel.org>);
        Tue, 4 Apr 2023 13:58:38 -0400
X-Greylist: delayed 2708 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 04 Apr 2023 10:58:31 PDT
Received: from symantec12.comsats.net.pk (symantec12.comsats.net.pk [210.56.25.58])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 51CEAC9
        for <linux-trace-users@vger.kernel.org>; Tue,  4 Apr 2023 10:58:30 -0700 (PDT)
X-AuditID: d238193a-29bff70000004acf-b0-642c54d78acf
Received: from iesco.comsatshosting.com (iesco.comsatshosting.com [210.56.28.11])
        (using TLS with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (Client did not present a certificate)
        by symantec12.comsats.net.pk (Symantec Messaging Gateway) with SMTP id 7D.28.19151.7D45C246; Tue,  4 Apr 2023 21:48:24 +0500 (PKT)
DomainKey-Signature: a=rsa-sha1; c=nofws; q=dns;
        d=iesco.com.pk; s=default;
        h=received:content-type:mime-version:content-transfer-encoding
          :content-description:subject:to:from:date:reply-to;
        b=SEoDktA0dSoX5V+enF4yPa8kAGuDo7XzMNrBzyypDAC3R0Im4oxk2+C5G23RHpxs8
          gp4Qj2/l3leYROxSAD/XvlYnJHRz7r6Y348sW3xCKZBr3yQjPWvTsNoKBO1pm4bbZ
          OE43DN5rqeAPp2e/lhrydE6+aiLCZjejL1EOeSrzU=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=iesco.com.pk; s=default;
        h=reply-to:date:from:to:subject:content-description
          :content-transfer-encoding:mime-version:content-type;
        bh=GMzYzcyTxDsE6wX/XHG6MHqAdAiHrhqbmmLQ/TZ1QnQ=;
        b=HPqCMXOdsKpdmfblLzMKKwk+c17Cts5I4dGWHp0O2GWpHPFUoNmKXBss1SCXvKp9R
          uqTvhCXroWsd9w8DkJWRDE9rZAMkrA3Ilc+WwxkAciEf7tnGMVHjSgxQaBBGg6dS4
          IG+Uiw/gt8KWfCmnMp90XqwW8XIvyUwNciANgZwTs=
Received: from [194.55.224.249] (UnknownHost [194.55.224.249]) by iesco.comsatshosting.com with SMTP;
   Tue, 4 Apr 2023 21:38:33 +0500
Message-ID: <7D.28.19151.7D45C246@symantec12.comsats.net.pk>
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Description: Mail message body
Subject: Re; Interest!
To:     linux-trace-users@vger.kernel.org
From:   "Chen Yun" <sa2_ami@iesco.com.pk>
Date:   Tue, 04 Apr 2023 10:11:56 -0700
Reply-To: cchycnn@gmail.com
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrNLMWRmVeSWpSXmKPExsVyyUKGW/dGiE6KwYOFzBYT3+1ldGD0+LxJ
        LoAxissmJTUnsyy1SN8ugStjyboLLAW7mSva+hexNDA+Zupi5OSQEDCRaH/ziLGLkYtDSGAv
        k8TfQ49ZQBIsAquZJbbNFwBJsAg8ZJZontLEClHVwSgxZXY3M0gVr4CNxN7dF9lAbGYBPYkb
        U6ewQcQFJU7OfMICEdeWWLbwNVA9B5CtJvG1qwQkLCwgJnHtbgc7iC0ioCqx/Gg7K0gJm4C6
        xKxH+iAmC1B4wgxJkAohAWmJSfvb2Ccw8s9CsmsWkl2zkOyahbBrASPLKkbJ4srcRGCYJRsa
        6SXn5xYnlhTr5aWW6BVkb2IEB6Gk1Q7Gx+dTDzEKcDAq8fBGqOmkCLEmlgG1HWKU4GBWEuFV
        7dJKEeJNSaysSi3Kjy8qzUktPsQozcGiJM57VuFZspBAemJJanZqakFqEUyWiYNTqoHRqPvF
        EunrL1U1Fbou/xEqKZy5JH7msv7bPXx7H560lFR693vRmvOeNYUezxQO3Fr1enmzqFinT+kC
        2cMGcjMu7rrUd/x6ws7v5YEvOeOOd+VeOfD6CovWxo1PP/mumd94jS17dUSz8KVvMt9+nftX
        fP3WXNlFFmomk1Iel8TYHvnSfmvltF03biixFGckGmoxFxUnAgC4kYC+PgIAAA==
Precedence: bulk
List-ID: <linux-trace-users.vger.kernel.org>
X-Mailing-List: linux-trace-users@vger.kernel.org

Re; Interest,

I am interested in discussing the Investment proposal as I explained
in my previous mail. May you let me know your interest and the
possibility of a cooperation aimed for mutual interest.

Looking forward to your mail for further discussion.

Regards

------
Chen Yun - Chairman of CREC
China Railway Engineering Corporation - CRECG
China Railway Plaza, No.69 Fuxing Road, Haidian District, Beijing, P.R.
China

