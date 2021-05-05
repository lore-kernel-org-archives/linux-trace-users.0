Return-Path: <linux-trace-users-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9655C433B4
	for <linux-trace-users@archiver.kernel.org>; Wed,  5 May 2021 12:21:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id ACE4E613BA
	for <linux-trace-users@archiver.kernel.org>; Wed,  5 May 2021 12:21:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232760AbhEEMWr (ORCPT
        <rfc822;linux-trace-users@archiver.kernel.org>);
        Wed, 5 May 2021 08:22:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37514 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232729AbhEEMWo (ORCPT
        <rfc822;linux-trace-users@vger.kernel.org>);
        Wed, 5 May 2021 08:22:44 -0400
Received: from mail-qk1-x730.google.com (mail-qk1-x730.google.com [IPv6:2607:f8b0:4864:20::730])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C064C06138C
        for <linux-trace-users@vger.kernel.org>; Wed,  5 May 2021 05:21:47 -0700 (PDT)
Received: by mail-qk1-x730.google.com with SMTP id a22so660826qkl.10
        for <linux-trace-users@vger.kernel.org>; Wed, 05 May 2021 05:21:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=ONGvxjlffuUUtympqG8RZgs8dFzZHaRk640Qlu8mvyw=;
        b=GYj2BIEb6gxEfI1ghOTzJd44Lp6ols9CvXZNH4VluB8h6MAqyaZnyp7thZfeiUVB3N
         9vW4qqGHs3KvqmymF7Ycl7ZNXz6QRORC15nHbaiFawydTBbttFxHMmV3YU72BdrbNKFy
         FpK9aEXcmIbssUL74BOzEBnDMSuwva25neuRg/yJQes+KAkO3dZuICbHj63pVut9qyT8
         39lhTZF/Ja7T94i/FXuuAJz1pZLyu/E+l4Z41Be9WRNs7Q2lJUJbLudzGdV3l5cZlKDC
         1Zlq0l3kGChsR0eqmSAUMg9V6ia2vR5/dUn8yXqb8squDLp2/yndZl3FvpRoRNH7NiCz
         uWvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=ONGvxjlffuUUtympqG8RZgs8dFzZHaRk640Qlu8mvyw=;
        b=FxH/rW556AA+vabFMMBFkXkxJFCb4/6DS2L6aebq+5CwcepPrulcTfEBr4blK3YCiq
         3W5VE2sSxbKk+oZ4JqAu8hN7bb/4dxXhs4AUuqsQVfPVLJhgW6ck0/uw7Og79B2Ztmo6
         KEarVmpUdcku7EKgLrjAMtOLRjWnK4ROGfRd6VhKr2KC/2Y9VI3gNqWWegBpSworf16Y
         I64MtYTWMI89UN+2MNcslqf+GRPQ+mlNO/wcTrOQFn0WZllnEY4XffXJlqNZSs1cfwMu
         YhEAV1CdYTAiYHdnyRzNoBCgeelpxo7Fdu290VjPk1soixTYCwSWAZS263RyP5kKcK8x
         4GCQ==
X-Gm-Message-State: AOAM530dWXJvW1ov4LD9Hfo/3GMcD/dvtTz9S6LG4AKflb3l1BWYNG1B
        w+auWuXtonD73uqxzNJEJ3J5PY2/7JHfW4PZXs8hWjZtRZBg3w==
X-Google-Smtp-Source: ABdhPJzE7r9P94Bm5wyrx1+zN0xYkUevjikSd2rKkLMsEgfK0REpjGNywv8NDsnATnda5AU6FObR7OkGEZhQ9MgVn8g=
X-Received: by 2002:a05:620a:3c3:: with SMTP id r3mr28854061qkm.35.1620217306530;
 Wed, 05 May 2021 05:21:46 -0700 (PDT)
MIME-Version: 1.0
From:   Lin Wang <wanglinseven@gmail.com>
Date:   Wed, 5 May 2021 08:21:35 -0400
Message-ID: <CABPy0FmkQAJXiX=uQatisCCHsZpfpk78DA9GrNFfULTguiY_vQ@mail.gmail.com>
Subject: how to continuously capture events
To:     linux-trace-users@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-trace-users.vger.kernel.org>
X-Mailing-List: linux-trace-users@vger.kernel.org

Hi all,

I'm new to ftrace and linux programming in general. Forgive me for
asking dumb questions.

I'm trying to continuously capture certain kernel events, convert them
to a different format and then write them to a file.

I understand that trace_pipe should be used for streaming. But I'm not
sure how to read the content of trace_pipe at event boundary (I
currently just read it to a temp buffer which would sometimes cut the
last event in half). I discovered libtraceevent and libtracefs that I
think are meant to help with this kind of tasks, so I'm reading the
source code of trace-cmd to find examples. But so far the progress has
been slow.

Could anyone point me to the right direction, or advise me with a
general outline of what I should do to achieve my task?

Thanks,
Lin
