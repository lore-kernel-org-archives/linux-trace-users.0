Return-Path: <linux-trace-users+bounces-1-linux-trace-users=archiver.kernel.org@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5258EC05024
	for <linux-trace-users@archiver.kernel.org>; Wed, 20 Sep 2023 20:58:15 +0000 (UTC)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2157E1C20B06
	for <linux-trace-users@archiver.kernel.org>; Wed, 20 Sep 2023 20:58:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B49A31A58E;
	Wed, 20 Sep 2023 20:58:07 +0000 (UTC)
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1462041ABD
	for <linux-trace-users@vger.kernel.org>; Wed, 20 Sep 2023 20:58:06 +0000 (UTC)
Received: from mail-ua1-x92a.google.com (mail-ua1-x92a.google.com [IPv6:2607:f8b0:4864:20::92a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F10D2B9
	for <linux-trace-users@vger.kernel.org>; Wed, 20 Sep 2023 13:58:04 -0700 (PDT)
Received: by mail-ua1-x92a.google.com with SMTP id a1e0cc1a2514c-7a8c41bd59aso103357241.3
        for <linux-trace-users@vger.kernel.org>; Wed, 20 Sep 2023 13:58:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1695243484; x=1695848284; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=i6XY8wIMD7LjGNpegRcCUKrZA0w1gq5GxQRY7mj2AIc=;
        b=QPmVK81PVEimFgfdJqI8H3ySPujchnU5Yq11OMwF+kKLfA5hlYHDLJfL6kTVUGq1sP
         A2srml2SbmcLA4Yyup/LQRFbfW6Z4fXYfyk29m8Syle/F4WMAtCbts+1gpxEx9DDqzx3
         4qKSRHtusrfETFYDIpuMz5rtglgdJ2sXsrvx4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695243484; x=1695848284;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=i6XY8wIMD7LjGNpegRcCUKrZA0w1gq5GxQRY7mj2AIc=;
        b=rf7BWMgcxGDFUV5fqXm5OO1wFgpMur0C3Yxwe6B9GGHk1aUW8ebh/uvDf8SWCrT1I5
         tofFvzWW/mG0NbhPpjo3vs+iKkk1EPH1pEfp0kM7JU401BrXFZNlBpJLFdC5hGSqP/hL
         WwINJQmrXYmXyNT3eGEo3hIRh9CZsK7toSBhpn9oF4LVnF5ZAi65C+7tIh83OnPpJoJp
         jrGtkwhsXL+O14hRIuJcSyke3RVv9+jcZpl+/z/4dXhluc5pGtLyTfmj/Zk7almG8+2K
         +8Fywdd+KLrqUdLL+bRE16X/r+T6v24mCX9rMxe9Iv1Q6GfI62TpsJSUGrfa2Ac4GsmA
         6QqQ==
X-Gm-Message-State: AOJu0YxXbzmbcvYO7xSLyvVguMEwj2Iw8dtNcnzp9SyxJYkwtE0WHXnL
	8Ch1GTFkLwgSlUcVp9WrJ+bibE7Sxfsp7GnHNyI=
X-Google-Smtp-Source: AGHT+IF4BKIHvs4JP5411acloPV1TnkYzh2Xvv7RvhZgFRQbSP9QWhzuaCEtHe12WsD13bhK5DhFUw==
X-Received: by 2002:a05:6102:2743:b0:443:6deb:2b4 with SMTP id p3-20020a056102274300b004436deb02b4mr3862833vsu.2.1695243483831;
        Wed, 20 Sep 2023 13:58:03 -0700 (PDT)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-30-209-226-106-110.dsl.bell.ca. [209.226.106.110])
        by smtp.gmail.com with ESMTPSA id h16-20020a0cf210000000b0064f4258184csm2599qvk.53.2023.09.20.13.58.03
        for <linux-trace-users@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Sep 2023 13:58:03 -0700 (PDT)
Date: Wed, 20 Sep 2023 16:58:01 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: linux-trace-users@vger.kernel.org
Subject: This list is being migrated to new infrastructure
Message-ID: <20230920-attain-batboy-e7323a@meerkat>
Precedence: bulk
X-Mailing-List: linux-trace-users@vger.kernel.org
List-Id: <linux-trace-users.vger.kernel.org>
List-Subscribe: <mailto:linux-trace-users+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-trace-users+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hello, all:

This list is being migrated to the new vger infrastructure. This should be a
fully transparent process and you don't need to change anything about how you
participate with the list or how you receive mail.

There will be a brief 20-minute delay with archives on lore.kernel.org. I will
follow up once the archive migration has been completed.

Best regards,
Konstantin

