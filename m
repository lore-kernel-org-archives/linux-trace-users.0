Return-Path: <linux-trace-users-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC2FFC433EF
	for <linux-trace-users@archiver.kernel.org>; Wed, 13 Apr 2022 20:44:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231349AbiDMUrG (ORCPT
        <rfc822;linux-trace-users@archiver.kernel.org>);
        Wed, 13 Apr 2022 16:47:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60320 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237650AbiDMUrF (ORCPT
        <rfc822;linux-trace-users@vger.kernel.org>);
        Wed, 13 Apr 2022 16:47:05 -0400
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 39C5A3CA47
        for <linux-trace-users@vger.kernel.org>; Wed, 13 Apr 2022 13:44:43 -0700 (PDT)
Received: by mail-qt1-f181.google.com with SMTP id s6so2274308qta.1
        for <linux-trace-users@vger.kernel.org>; Wed, 13 Apr 2022 13:44:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=qZ8VUEH+umA1mG47WV7GNIgSGaCrUAJLmm1ZK8h2WG4=;
        b=jozIjBj5RdE6TJDleikpUem+9HUQFAqB/Bnp3e06ZMsp6POp+ffPJyM2ESYPIijqmD
         DfAH6ljMPabRV2sFa3LwHqZ3noAxZZ+QYHX1qsL9uo2ASor1aysaxMREZSoH28lCQY0q
         YH22QkumHYudPrJvuFoKIJQzfIFyzEdGN2oWeK2JNXNIKugwlccfKH9Kvl+QX0N1dbFX
         tk3hBYIiyzFEDU9Is6jqYlgRhsfPeL+P68zc2ZXqdGQYFBj8IZhuZhzdT6nFWw2jasRq
         VUFcuidfj7Bx0r8FWq/j/bbRWzik2fTYtqM9uiZOMGrdSQUWjh5rJAR0BN2i7Q5ZRf9B
         cjpQ==
X-Gm-Message-State: AOAM530ACWhTIZIWGo8ej8S0Tbcy3qQPYDDeMOCxP4Y7wlR9LxpniPPw
        ue8uf+tG1A8VvYpSYYggTJ7iQlvXqP4S7A==
X-Google-Smtp-Source: ABdhPJyW7i2n6f3H8VuoRuH+xwzNrRwyy7Rnk4TyZnpjEeGk1w2M7mzpd3VqpF55lAkfSzkZPEYgzw==
X-Received: by 2002:ac8:1487:0:b0:2ef:ca47:89c1 with SMTP id l7-20020ac81487000000b002efca4789c1mr8644717qtj.646.1649882682235;
        Wed, 13 Apr 2022 13:44:42 -0700 (PDT)
Received: from gmail.com (192-222-180-24.qc.cable.ebox.net. [192.222.180.24])
        by smtp.gmail.com with ESMTPSA id l21-20020a05620a211500b0069bf630f3b4sm8562348qkl.125.2022.04.13.13.44.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Apr 2022 13:44:41 -0700 (PDT)
Date:   Wed, 13 Apr 2022 16:44:40 -0400
From:   =?iso-8859-1?Q?J=E9r=E9mie?= Galarneau 
        <jeremie.galarneau@efficios.com>
To:     lttng-dev@lists.lttng.org
Cc:     diamon-discuss <diamon-discuss@lists.linuxfoundation.org>,
        linux-trace-users <linux-trace-users@vger.kernel.org>
Subject: [RELEASE] LTTng-tools 2.12.11 - (Ta) Meilleure
Message-ID: <Ylc2OCHxPC93anyQ@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-trace-users.vger.kernel.org>
X-Mailing-List: linux-trace-users@vger.kernel.org

Hi all,

We have just released the eleventh bug-fix release of LTTng-tools 2.12 - (Ta)
Meilleure. This release addresses a number of issues listed below.

2022-04-13 lttng-tools 2.12.11 (International Day of Pink)
	* Fix: notification: assert on len > 0 for dropped notification message
	* Fix: sessiond: cmd_enable_channel: negative error code used

As always, please report any issue you may encounter to bugs.lttng.org
or on this mailing list.

Project website: https://lttng.org

Download link:
https://lttng.org/files/lttng-tools/lttng-tools-2.12.11.tar.bz2

GPG signature:
https://lttng.org/files/lttng-tools/lttng-tools-2.12.11.tar.bz2.asc
