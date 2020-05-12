Return-Path: <SRS0=tk11=62=vger.kernel.org=linux-trace-users-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B83DCA90AF
	for <linux-trace-users@archiver.kernel.org>; Tue, 12 May 2020 18:15:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id ED975206B8
	for <linux-trace-users@archiver.kernel.org>; Tue, 12 May 2020 18:15:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725987AbgELSPR (ORCPT
        <rfc822;linux-trace-users@archiver.kernel.org>);
        Tue, 12 May 2020 14:15:17 -0400
Received: from mail-qk1-f194.google.com ([209.85.222.194]:43892 "EHLO
        mail-qk1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725950AbgELSPR (ORCPT
        <rfc822;linux-trace-users@vger.kernel.org>);
        Tue, 12 May 2020 14:15:17 -0400
Received: by mail-qk1-f194.google.com with SMTP id i14so13507392qka.10
        for <linux-trace-users@vger.kernel.org>; Tue, 12 May 2020 11:15:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=5LGuK+bDXsGsveL3BOz/arMXgpX9Hfbj/cLfmTS34uE=;
        b=Z9jDHBbg+0tq7eezWc3IygnxUyKwI0/xXofELICNr7miHxsc9qbx7/16PyOk8NZeqO
         ITqbeEI64qklpz+uyKRisM9OtlD567Eg4yNj3ZH+c+IR1fnbtDKaHlgnKMwQ5joPf45O
         ptLXHI0OKgzWETrmsJYfoW7os6lDnek8HFQUF9wNxO7Tuw6dpFfwADeRaRu1LKXtH3qH
         uvleAnlMc5+jEsTWOVdxYb5uFt+LXhgOR6Q/kX7pPDaxXlVbGlUIFGbuM4h1Rd2fJ191
         pLMOUEi/gk+TDPRplhuM/41ic8D57wLjcA3A/inUolL4O6r6RUnPVAEnXfzo9OUcvhfa
         +24A==
X-Gm-Message-State: AGi0PubCkL25LTfk/0xFUF0eJIBHx3libQOPzOAM488xoxM7AoDmNdyo
        6DuZSTulyD9zW5aORRxdf1W7CPly
X-Google-Smtp-Source: APiQypJF0FnEfbeUhKLMUDro/SLpgsRKjyVdzf1d1euEaw+J1LSUmlFElLAvtgo70HTQ4ADtfbTD2w==
X-Received: by 2002:a05:620a:2091:: with SMTP id e17mr21837210qka.70.1589307316406;
        Tue, 12 May 2020 11:15:16 -0700 (PDT)
Received: from gmail.com (192-222-251-19.qc.cable.ebox.net. [192.222.251.19])
        by smtp.gmail.com with ESMTPSA id i5sm6796911qtp.66.2020.05.12.11.15.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2020 11:15:15 -0700 (PDT)
Date:   Tue, 12 May 2020 14:15:13 -0400
From:   =?iso-8859-1?Q?J=E9r=E9mie?= Galarneau 
        <jeremie.galarneau@efficios.com>
To:     lttng-dev@lists.lttng.org
Cc:     diamon-discuss@lists.linuxfoundation.org,
        linux-trace-users@vger.kernel.org
Subject: [RELEASE] LTTng 2.12.1 - (Ta) Meilleure
Message-ID: <20200512181513.GA243139@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-trace-users-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-trace-users.vger.kernel.org>
X-Mailing-List: linux-trace-users@vger.kernel.org

Hi all,

The first bug-fix release of LTTng-tools 2.12 - (Ta) Meilleure has
just been released. This release addresses a number of issues listed
below.

2020-05-12 lttng-tools 2.12.1 (International Nurses' Day)
	* API: missing includes in lttng.h
	* API: missing clear and clear-handle includes in lttng.h
	* API: sort lttng.h includes
	* Fix: API: missing end brace for C++ linkage specification.
	* Fix: tests: `-Wstringop-overflow` warning
	* Fix: load: incomplete error handling for load_session_from_file

As always, please report any issue you may encounter to bugs.lttng.org
or on this mailing list.

Project website: https://lttng.org

Download link:
https://lttng.org/files/lttng-tools/lttng-tools-2.12.1.tar.bz2

GPG signature:
https://lttng.org/files/lttng-tools/lttng-tools-2.12.1.tar.bz2.asc
