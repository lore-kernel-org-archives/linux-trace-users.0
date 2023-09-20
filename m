Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 147EF41A98
	for <linux-trace-users@vger.kernel.org>; Wed, 20 Sep 2023 21:06:48 +0000 (UTC)
Received: from mail-qv1-xf36.google.com (mail-qv1-xf36.google.com [IPv6:2607:f8b0:4864:20::f36])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 212CFBB
	for <linux-trace-users@vger.kernel.org>; Wed, 20 Sep 2023 14:06:47 -0700 (PDT)
Received: by mail-qv1-xf36.google.com with SMTP id 6a1803df08f44-656307a52e8so1312926d6.1
        for <linux-trace-users@vger.kernel.org>; Wed, 20 Sep 2023 14:06:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1695244006; x=1695848806; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nhh/PmrssBgtQOJ9oTmXJl68S5sfA7NIJBY3X9g0oMU=;
        b=HYfzYbL4r3tiB/WlgAP8HCssvKGxJ7KttvuK2lvdsoEeAg6xArwVag47AmCbSUWc8H
         ncFQIi1P2MblXBSpnK1KVLm4YkZ7t8BXOph6jT2iR3Jow6pNZcwmkramhR6aMeCGVj7Z
         TELA1ru0yY7n7xhDSLQyCRvjeG8s2fwDb2OMQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695244006; x=1695848806;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nhh/PmrssBgtQOJ9oTmXJl68S5sfA7NIJBY3X9g0oMU=;
        b=FFxyC3ridYq3r1fgY8rztjzaQDqTgQART59j6fdkIBxrfoqwCDtZY2q3Hatj7Ul5NM
         cgw70Ez4lIQzTXkt8t1/kRn/h7jY85eqVNx9qeq+V3ZnMU5gU+tO2Mzp4lj51ZCPQrpz
         CFMgMeqnxM3P0yTuGcO2U5XCai0hl5nQ06DpXdmKe1EIYC8pet5Nk4hIgu7O10w688b6
         kV4MpWQ5fMeQ3A4JGw4Gs3mWYUYwxDBnzponQz1sWd+graVKbjSdVFfZ6O87ZJdVmS++
         WUlea1Eab4SDGplZplY9i7novcHDvSqptssKoXNjMHC5Q8rOFBEK9appp+PVUSWD1awI
         teuA==
X-Gm-Message-State: AOJu0YzzPKMwZS3az18VtU3u6d94fCyefIwqBmBTKLv8IbGnhFGs3kCa
	zSE/BvzT0+WyCkKlpEDS41cj9+TJB1tcti83HVM=
X-Google-Smtp-Source: AGHT+IH1/GEMIpKMbgirPwSBIiHvAm+A6F7yNhbj4w7qlLV4O4AL3hd/ja0uN29zOquaCcneFb1C2w==
X-Received: by 2002:a0c:f083:0:b0:656:4107:c458 with SMTP id g3-20020a0cf083000000b006564107c458mr3794811qvk.6.1695244006078;
        Wed, 20 Sep 2023 14:06:46 -0700 (PDT)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-30-209-226-106-110.dsl.bell.ca. [209.226.106.110])
        by smtp.gmail.com with ESMTPSA id x20-20020a0ce0d4000000b0064f732aa463sm2735qvk.105.2023.09.20.14.06.45
        for <linux-trace-users@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Sep 2023 14:06:45 -0700 (PDT)
Date: Wed, 20 Sep 2023 17:06:44 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: linux-trace-users@vger.kernel.org
Subject: Re: This list is being migrated to new infrastructure
Message-ID: <20230920-pauper-jugular-587366@meerkat>
References: <20230920-attain-batboy-e7323a@meerkat>
Precedence: bulk
X-Mailing-List: linux-trace-users@vger.kernel.org
List-Id: <linux-trace-users.vger.kernel.org>
List-Subscribe: <mailto:linux-trace-users+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-trace-users+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230920-attain-batboy-e7323a@meerkat>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On Wed, Sep 20, 2023 at 04:58:01PM -0400, Konstantin Ryabitsev wrote:
> Hello, all:
> 
> This list is being migrated to the new vger infrastructure. This should be a
> fully transparent process and you don't need to change anything about how you
> participate with the list or how you receive mail.
> 
> There will be a brief 20-minute delay with archives on lore.kernel.org. I will
> follow up once the archive migration has been completed.

This work is now completed. I will monitor the performance to make
sure that the new infrastructure is still successfully coping with the
email traffic.

If you notice any problems, please report them to helpdesk at kernel.org.

-K
