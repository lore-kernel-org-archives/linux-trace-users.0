Return-Path: <linux-trace-users-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C09D5C35273
	for <linux-trace-users@archiver.kernel.org>; Tue,  5 Apr 2022 20:28:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232508AbiDEUYt (ORCPT
        <rfc822;linux-trace-users@archiver.kernel.org>);
        Tue, 5 Apr 2022 16:24:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48170 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234220AbiDEOpn (ORCPT
        <rfc822;linux-trace-users@vger.kernel.org>);
        Tue, 5 Apr 2022 10:45:43 -0400
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F2B7612D085
        for <linux-trace-users@vger.kernel.org>; Tue,  5 Apr 2022 06:21:20 -0700 (PDT)
Received: by mail-wm1-x32f.google.com with SMTP id k124-20020a1ca182000000b0038c9cf6e2a6so1655527wme.0
        for <linux-trace-users@vger.kernel.org>; Tue, 05 Apr 2022 06:21:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=4NHA+PjfR/jHNzlJKQyRBy3oCNNB8q2QtT7z2WQnLW8=;
        b=LQzV/QqTWZnV7zMJcnxyuHdv8/gJSVzbvgrsZgtsjC8qgiSQ5VCwkZxm6sbaV9WULE
         E9YOiSMufiIipXqqVuErYowFVU1/3OYY8ofgeeh04294HU/J0qea6euVuTqmpQEUzbAB
         JjbzG/To13BnH0Pc8pupkKVgUzW9nc9gDFOAGcb4O1FGMp3o0KJQnzp4EsLwp3wHiftl
         2eJUJYWjOKXepg9X/MsMonzoVd0BTZXOP0Z2lTX6UWjkV9sXNMFiFLuquJaRUJfF5nLS
         UJO1gXy7hgPTPbu4hc7ZHXv442LPrxSkJvglmDzO+xHL5heE6Royl27xsSlFjPQDl0p4
         VFFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=4NHA+PjfR/jHNzlJKQyRBy3oCNNB8q2QtT7z2WQnLW8=;
        b=L+Nr/B7lgo0nQJ5NfPBXVfpYHXRcyvT1QGUjEhG50Vs+wfYFr2StT6hKEzDSmEYhJo
         Ej7eco7+y13v4EzguYcn/Mhkx8Ks8wSmDlXifkeZeiaQXCt3YKK4lsuGbCWGuqEOW+om
         0uh1k9i4vUVBuIQGc9LqRcaNEtMZIWDVKxTsfWZVdCM0JHxioLGhx75nSQr3J8VRpOyT
         A2MDu6C8P9AU8tKPVSwfSIpeNHwB76JF00HPy2oBpuv31V83oxcjlf4OWev3xJJSixyD
         /vYjJMSMpaL61rNxzldHIJRa+TyuRYEjsnMTtnkhPADqrRAFX08ALcBCN7XAtgC9JNuq
         7slw==
X-Gm-Message-State: AOAM530TnFFSMlLCl7xBD+T3F0bEJggRDkUV0DfiaTKIZsqdhWPl+ZH8
        Pgk2C1CQF6FBvykz9NUTitW4xss4F22I8uTiBe7HgyoSAL0=
X-Google-Smtp-Source: ABdhPJyNQocl5njgrySBr0EEAhVYvCgI8feiNYAQM7Bb/epE0m6KD4k6r60OlLImOdMlbeEncjUbx567bUWhhm15V+c=
X-Received: by 2002:a05:600c:1797:b0:38e:70fa:4e4f with SMTP id
 x23-20020a05600c179700b0038e70fa4e4fmr3189050wmo.30.1649164879345; Tue, 05
 Apr 2022 06:21:19 -0700 (PDT)
MIME-Version: 1.0
References: <CAMZm_C=NR8rmYn_1gnhw5Udx4ypMZy1nwcFucc0=wbYYHhTpHg@mail.gmail.com>
In-Reply-To: <CAMZm_C=NR8rmYn_1gnhw5Udx4ypMZy1nwcFucc0=wbYYHhTpHg@mail.gmail.com>
From:   Federico Di Pierro <nierro92@gmail.com>
Date:   Tue, 5 Apr 2022 15:21:08 +0200
Message-ID: <CAMZm_C=M57CF+1UATTqNit7YH5g_YP6Ob4JAV2a_2CCEq1snUw@mail.gmail.com>
Subject: Re: arm64 execve/clone sys_exit tracepoints
To:     linux-trace-users <linux-trace-users@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-trace-users.vger.kernel.org>
X-Mailing-List: linux-trace-users@vger.kernel.org

Hi!

After a private conversation with an Arm engineer,
it seems like there is no real "correct" behavior, i mean there is no
default behavior among different architectures.

In the end, arm64 shows just a different behavior from x86_64. Well,
it seems like x86_64 is doing something
different from other archs here indeed:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/x86/kernel/process_64.c#n669

Given this is not a bug and there is no clear way to improve the situation,
I consider this thread somewhat solved (I only desired to understand
what was happening, and now I got it).

Thanks everyone!
Federico
