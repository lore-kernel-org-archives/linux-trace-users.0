Return-Path: <linux-trace-users-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 572C8C00140
	for <linux-trace-users@archiver.kernel.org>; Mon, 15 Aug 2022 13:30:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229780AbiHON3c (ORCPT
        <rfc822;linux-trace-users@archiver.kernel.org>);
        Mon, 15 Aug 2022 09:29:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41520 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231953AbiHON3D (ORCPT
        <rfc822;linux-trace-users@vger.kernel.org>);
        Mon, 15 Aug 2022 09:29:03 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id DD6FF1F63E
        for <linux-trace-users@vger.kernel.org>; Mon, 15 Aug 2022 06:29:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1660570142;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type;
        bh=dGr8lnnH/YjR2luAnlN8Z0jS65XvVdd2uzEIb4P5AMw=;
        b=TaVgwqjaUz7jgQ6eNWPPNuEMX9b29oca/6is8xXMFoebfVgSKg2ACYiiZTogB7qEm5oSRk
        S49ZVxlg03d1rDtRqDUXpYEww4xu5b8JTlaGN4rCXA9fO0Ppv/N99dwZgggyLfHnJHbMHM
        bBIVnKakEOfToPsizUz5rb7QF3LMS7A=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-659-7L9RW5DXM-CZh-qp6iSd-A-1; Mon, 15 Aug 2022 09:28:59 -0400
X-MC-Unique: 7L9RW5DXM-CZh-qp6iSd-A-1
Received: by mail-qt1-f199.google.com with SMTP id z10-20020a05622a124a00b003445680ff47so3148434qtx.8
        for <linux-trace-users@vger.kernel.org>; Mon, 15 Aug 2022 06:28:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc;
        bh=dGr8lnnH/YjR2luAnlN8Z0jS65XvVdd2uzEIb4P5AMw=;
        b=D5fejk45f4N/jO6Pq0loyJARhdV9trLSwBRAHRvX/4KszOxK39eG2d94HdvtUh0b+f
         TLYCLcIrnUb2SNPeuBCoI7AiUn6viSXY90ggWWujUJSU18YEfo+f7QWIIQ6wdeXbKLa5
         fmMRYTNYY+kFCCdOk4C8VA0TMOrOHHo6S1aInvHei1ixGMKkVCgfjdt8W3gP01vG14kA
         3JjDQTOfIKCihh43IYfcZTqc/Gsx4hDE10YmxNrGJDge+chX7jYXJvswgxdRUkmEXjGf
         QAFWw8/7ivh4uL6PBmkIYyP7WV6rWZXU/cVsi4s4aIbovlBfnvK8dL/zrHo4poTxcWBD
         ajiA==
X-Gm-Message-State: ACgBeo3w7ZWtz5+u1ebag2EZehnlA/qXRSb1ZJwF7my4jhi7uBEXtzzb
        FylM4MXWs+2S356z23lp+JR0l37056peJxWu78Nxl9BplOpTfbDFgvvd4xAOkAw+hqxZhilwB2e
        u9SUhkIamh1WO6QoRcTx4EnNY0IgKOg9ZKqUkaXK5NtJ98w8=
X-Received: by 2002:a05:620a:f13:b0:6b5:b956:c1f1 with SMTP id v19-20020a05620a0f1300b006b5b956c1f1mr11826604qkl.691.1660570139299;
        Mon, 15 Aug 2022 06:28:59 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4fqvXA0jZMHCD2FHj8OR8haoS85Ew6EyMPapJwCGWIyccWciec+jpxankfE0uQM/fj6pdD9OJ2D3k5oz6YKyw=
X-Received: by 2002:a05:620a:f13:b0:6b5:b956:c1f1 with SMTP id
 v19-20020a05620a0f1300b006b5b956c1f1mr11826583qkl.691.1660570139034; Mon, 15
 Aug 2022 06:28:59 -0700 (PDT)
MIME-Version: 1.0
From:   Alexander Aring <aahringo@redhat.com>
Date:   Mon, 15 Aug 2022 09:28:48 -0400
Message-ID: <CAK-6q+hJ4KjhUqNOGT0a046M7t3McbdstJy7xYzUAwHCp4yZRw@mail.gmail.com>
Subject: stream based live time synchronized tracing?
To:     linux-trace-users@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-trace-users.vger.kernel.org>
X-Mailing-List: linux-trace-users@vger.kernel.org

Hi,

I am curious if there is any way of getting time synchronized traces
in a kind of stream based communication like pipes, sockets, etc. and
get high level event representation as ?libtraceevent? provides. I
would like to get all "merged" events from all machines provided by -A
parameters. I think it isn't required to get them in order, but the
timestamp should be synchronized.

I could probably build something like that with libtracecmd to have it
directly implemented in an application, but I am curious if there
exists any interest in having such a feature upstream? E.g. having
additional parameters like '--tsync-interval'.

A use-case would be live capturing of time synchronized events or what
I have in my mind to collect stats and doing kernel runtime
optimizations.

- Alex

