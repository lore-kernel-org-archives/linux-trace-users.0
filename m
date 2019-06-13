Return-Path: <SRS0=XDsJ=UM=vger.kernel.org=linux-trace-users-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26B06C31E45
	for <linux-trace-users@archiver.kernel.org>; Thu, 13 Jun 2019 17:43:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E86B62175B
	for <linux-trace-users@archiver.kernel.org>; Thu, 13 Jun 2019 17:43:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VyMPK/Cj"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726519AbfFMRne (ORCPT
        <rfc822;linux-trace-users@archiver.kernel.org>);
        Thu, 13 Jun 2019 13:43:34 -0400
Received: from mail-pf1-f170.google.com ([209.85.210.170]:43957 "EHLO
        mail-pf1-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727259AbfFMRne (ORCPT
        <rfc822;linux-trace-users@vger.kernel.org>);
        Thu, 13 Jun 2019 13:43:34 -0400
Received: by mail-pf1-f170.google.com with SMTP id i189so12271621pfg.10
        for <linux-trace-users@vger.kernel.org>; Thu, 13 Jun 2019 10:43:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=/beWrNvzOBW+JB38b+XQH4E9+YeRyWDP+VtJM0cMds4=;
        b=VyMPK/CjCnNH2/LLdlwe4e7g7k4ZH38HPveaUoCTN1g2r+bDmVmVzICqxpT5YnowzM
         shfKZ4MBMAyX2dXHgZBPgUOQZd3NkSlOyQ7JjDEohw5L6yioodl8ZmqAabFD5vktm/Oi
         UZa7u3mSkmjBw/0a/ZLCpPBX0BMuMpm4bimpUaVOajTWxJi/EHrlLD42pH/BSN5/Rtao
         nT2RJI7Sp+QCMlEtL4Yhv0dJKAHBlJTc2VqpaPg4FOsWgZ5ZdNXO5n7QCfSgIdGwwCgr
         gNHuE+bcT6PDickwSeQLRkJE+KH9S41x0rq2DX26xzd8BK+1qzOQV+O31cvpOTb0ltAn
         s/iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=/beWrNvzOBW+JB38b+XQH4E9+YeRyWDP+VtJM0cMds4=;
        b=Dj0pKq5XAbf/yrH4I81U5cFS1k66QwZeSnGBvz4fxgZILWlVC62+LgvDilynVnMRxk
         iRVG3RFDuoL8tZxB2JAm2XDnRQnsp25AYT9uz85S6bsT7o0amQAvk4jwTaOKE3GkqCE2
         BeAD5oUJyb0TSEqCzmM1tCBPZFHfQnZmORM6ySQPJwKl4sMHBzIemB24mTGolG0ga6d/
         cRY2686JpG9x+9571xcpMCCg1T7BxrIkZBbRelfRQzhJDa2soeXiU2TXXSkylF3nL/Mo
         NrX6rp9sifPDK9DZhl9YrQ5Y2RVa0Xu5z9dsexX8oHVrJB/Ur6YIMpu6CGmSjSDxC3X+
         Vo0Q==
X-Gm-Message-State: APjAAAVFb039qNqRpnGCMpk6qXSVg3PPviac3YcHm3UF92AJem9GM9Gx
        wOaIXssVyLgRC3kHwZs1Nu3Sn1Q4q0//UULvHIdAtWpe
X-Google-Smtp-Source: APXvYqzqCXXbuHTO67Cq6XFbwEUTzj3+dc1NGqSH9aMtFQrAjpyLmtiS24Qz43v2VFTZLZT2bClF8C2G4NhrEXND+FI=
X-Received: by 2002:a65:62cc:: with SMTP id m12mr31595875pgv.237.1560447813417;
 Thu, 13 Jun 2019 10:43:33 -0700 (PDT)
MIME-Version: 1.0
From:   Cong Wang <xiyou.wangcong@gmail.com>
Date:   Thu, 13 Jun 2019 10:43:22 -0700
Message-ID: <CAM_iQpU9SQPoZnwfdmOECftDPt99HLe4NX-b_JaCk1oRLYZB_g@mail.gmail.com>
Subject: Trace event filtering
To:     linux-trace-users@vger.kernel.org
Cc:     Steven Rostedt <rostedt@goodmis.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-trace-users-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-trace-users.vger.kernel.org>
X-Mailing-List: linux-trace-users@vger.kernel.org

Hi, all

I have a simple question about filters in libtraceevent. It looks like
libtraceevent parses and matches filters in user-space, but kernel
already implements filtering in kernel-space which is better because
it should prevent events from generating, if not matched. So why
doesn't libtraceevent use kernel filters?

I am trying to filter out non-error block_rq_complete events, clearly
I don't want to see rasdaemon woken up every time for error==0 case,
which is literally all the time.

BTW, the user-space filters have slightly different syntax with
kernel-space filters, at least the regex matching looks slightly
different to me.

Am I miss anything here?

Thanks!
