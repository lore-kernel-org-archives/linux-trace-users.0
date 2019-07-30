Return-Path: <SRS0=Uyyn=V3=vger.kernel.org=linux-trace-users-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3CFEC433FF
	for <linux-trace-users@archiver.kernel.org>; Tue, 30 Jul 2019 14:24:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 871B8205C9
	for <linux-trace-users@archiver.kernel.org>; Tue, 30 Jul 2019 14:24:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729160AbfG3OYR (ORCPT
        <rfc822;linux-trace-users@archiver.kernel.org>);
        Tue, 30 Jul 2019 10:24:17 -0400
Received: from mail-io1-f45.google.com ([209.85.166.45]:38486 "EHLO
        mail-io1-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727425AbfG3OYR (ORCPT
        <rfc822;linux-trace-users@vger.kernel.org>);
        Tue, 30 Jul 2019 10:24:17 -0400
Received: by mail-io1-f45.google.com with SMTP id j6so8664102ioa.5
        for <linux-trace-users@vger.kernel.org>; Tue, 30 Jul 2019 07:24:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=wM9OeH4khsj0EwqOa0IBnxDXU2A4leeCwMxQxngZ0yM=;
        b=Zf0RqpIvVRh8dXkIqLS10XJO2x+piOJ63slmDz+s6sDeUudoCXrrLM36bIAx4NrA1O
         yFhwQ78hpDDyim5oGk7W5Pq5yWCsy9XTlEPejjuqed7AWafHaM1SzU3S2RQSy/56rUxL
         mmDth6w2P+m5BXUvgJyW3cGLozUxTbgPE5q+0qDUhvieb8CdbkX7263QT62LlDkXZ78V
         4zweIbjKcjOkB7yzSkgh5E8yhGEX0IBYnLZO59THUpNadZoSRt72BBnR+3R18nkyb6tc
         rv3nAEMs7VApiBT0P1WBPBJ3dxkEwDidqi5SYGa9s5ZCbXrzZjwvPgjwOa2dyA24HaKD
         FXsw==
X-Gm-Message-State: APjAAAU4iLoi8IjPnZjPFdhym6cZTGdSNnUWuxNeboT2lYcagrxbH5Av
        NXUTxBCZdSkutr390HWMQFQMb97Oxj7bG4hrOJtBltxWP48=
X-Google-Smtp-Source: APXvYqw6SqSdM74mHbAfVgklSKQvXr9ibVSN+hGsTpkkdl1X3MwSeosjppEtf5PjW3Dg+Pev0Z8HCHtodVhC2POPNDA=
X-Received: by 2002:a02:862b:: with SMTP id e40mr35787799jai.7.1564496655921;
 Tue, 30 Jul 2019 07:24:15 -0700 (PDT)
MIME-Version: 1.0
From:   Francis Deslauriers <francis.deslauriers@efficios.com>
Date:   Tue, 30 Jul 2019 10:24:03 -0400
Message-ID: <CADcCL0isA3qu9kSerKH5fCmf4er8a64hZZJQKX24vcfiVR9+gw@mail.gmail.com>
Subject: Tracing Summit 2019 - Schedule Release
To:     linux-trace-users@vger.kernel.org
Cc:     info@tracingsummit.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-trace-users-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-trace-users.vger.kernel.org>
X-Mailing-List: linux-trace-users@vger.kernel.org

Hi all,

We're happy to announce the schedule for the Tracing Summit 2019 is now
available. We are going to have an amazing conference with diverse topics such
as trace analysis, GPU tracing, distributed systems tracing and more.

Checkout the schedule and talk abstracts on the website.[1]

Tracing Summit 2019 will be held in San Diego, California on August 20th, 2019,
Don't forget to register for the summit either when buying your Open Source
Summit ticket or using this link [2]!

See you in August!

The Tracing Summit Organizers
[1] https://tracingsummit.org/wiki/TracingSummit2019
[2] https://www.cvent.com/events/tracing-summit-2019/registration-63351d06945a46d890b8e5a200dbc0fc.aspx?fqp=true
