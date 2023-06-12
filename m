Return-Path: <linux-trace-users-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63CEAC7EE2E
	for <linux-trace-users@archiver.kernel.org>; Mon, 12 Jun 2023 09:41:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231418AbjFLJlB (ORCPT
        <rfc822;linux-trace-users@archiver.kernel.org>);
        Mon, 12 Jun 2023 05:41:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55094 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232521AbjFLJj0 (ORCPT
        <rfc822;linux-trace-users@vger.kernel.org>);
        Mon, 12 Jun 2023 05:39:26 -0400
Received: from mail-qk1-x732.google.com (mail-qk1-x732.google.com [IPv6:2607:f8b0:4864:20::732])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A2C36E91
        for <linux-trace-users@vger.kernel.org>; Mon, 12 Jun 2023 02:29:33 -0700 (PDT)
Received: by mail-qk1-x732.google.com with SMTP id af79cd13be357-75d518f6f74so306532485a.1
        for <linux-trace-users@vger.kernel.org>; Mon, 12 Jun 2023 02:29:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1686562172; x=1689154172;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=jECHAX8ux55gFq6BY4PEtl0VMGQd+dMkVRbTGjE1MnE=;
        b=4eKUdYUgQKtVm5fk1MHolAgWyIhLfVARBjCb8CQPwMFVc0WTLAwQhm/Leddjv8O8at
         M5MZRsb4uqXDLLXarhDIP4oaxLQ5fxnRFo00PEy8kAofXnkc1wa5zW6XvM9CuADYNccr
         BvqVnYwKalY1csqWXfxbUgPkgV1CWgvZZTKiX+ol+n8coE7LspKVBftiXfVQh9lWQ52G
         WuYpuWAZ/V63osIMs5gTnCiw/hvUcz+hDSexn4M4dH23b09/i3X2utgqyjLE4yN/2CN4
         zqvMakvpekCr+I4eXFlmXfAv0BzR1msyD4Ld2d02wxU/x+dthM4AspisfLYdqWEeqT55
         XJgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686562172; x=1689154172;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jECHAX8ux55gFq6BY4PEtl0VMGQd+dMkVRbTGjE1MnE=;
        b=DOjxqSL49GtvjZahZ6jxWov4ekFrElKy20TccPAWgTraqKzsCtaNSLYzLVaeREjlJG
         l+GppGSQFKTidDooNYIsWj1YErzrI0RB5h5ZOIpi9ouKpcxG4qhHMNHFgAhPpqbYp69n
         NcZICeb8NW5JYNTZ2WAPNKK5wBRP+ZQN2CU8Z6nHhsMHXymVFZQ3V5ZA+7Hzyljt1IN7
         aT76MM9jvm0YSeoUIC8WdWd0PA6u/Owm1SdVZpCTaok0ND4/HYeCtHAbb6Xf2/kcINRB
         x4MjBf28XDr4r7QUpZKVOW+DPY2RX+QlyQx1uyv4Qn6Roml8+NuL0A/v+XrOBkele3yD
         +oZw==
X-Gm-Message-State: AC+VfDxFMI8T23rQKKdFTY6k0ZZQYzyk84RAnTf5H5j4UzLxY6qeXOlG
        vPxrb+subZITEpML9obe83YSW3o5wJ+m34vVi9ApMeavK8f48xipQQE=
X-Google-Smtp-Source: ACHHUZ6Q/55R741or1JZQbS5vwIorXc4SI1F58L54ziVSAOkdUtPF5anwQT8oFoDhzijTJ3fKcvKAphCb93Ga6K3/CM=
X-Received: by 2002:a05:6214:2488:b0:616:58f1:2844 with SMTP id
 gi8-20020a056214248800b0061658f12844mr9161739qvb.45.1686562172217; Mon, 12
 Jun 2023 02:29:32 -0700 (PDT)
MIME-Version: 1.0
From:   Keiichi Watanabe <keiichiw@google.com>
Date:   Mon, 12 Jun 2023 18:29:21 +0900
Message-ID: <CANb2CJFG_evfZxHN8j_bEJeCEQB-BZoF7ox9t9Sv7=c8VykPrQ@mail.gmail.com>
Subject: libtracecmd-rs: Rust wrapper for libtracecmd - now released!
To:     linux-trace-users@vger.kernel.org,
        linux-trace-devel@vger.kernel.org
Cc:     Takaya Saeki <takayas@google.com>,
        Steven Rostedt <rostedt@google.com>,
        Masami Hiramatsu <mhiramat@google.com>,
        Federico Pareschi <morg@google.com>,
        Hidenori Kobayashi <hidenorik@google.com>,
        Junichi Uekawa <uekawa@google.com>,
        Stevie Alvarez <steviea@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-trace-users.vger.kernel.org>
X-Mailing-List: linux-trace-users@vger.kernel.org

Hi trace-cmd users,

I'm excited to announce the release of a Rust wrapper for libtracecmd.
This library allows you to write a program in Rust that iterates and
aggregates trace.dat files produced by 'trace-cmd record'.
* Repository: https://github.com/google/libtracecmd-rs
* Documentation: https://docs.rs/libtracecmd/latest/libtracecmd/

I believe using this Rust library has several advantages over writing
programs in C using libtracecmd directly:
* Less boilerplate: You can use Rust's standard libraries and
third-party libraries easily.
* Safer code: Rust's type system and lifetimes prevents misuse of the library.

Currently, our Rust wrapper doesn't support all of the features of
libtracecmd. We welcome your contributions.
To report bugs or submit patches, please use GitHub issues and pull requests.

I hope you find this library useful!

Best,
Keiichi
