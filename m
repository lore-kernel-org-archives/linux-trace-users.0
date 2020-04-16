Return-Path: <SRS0=JkaP=6A=vger.kernel.org=linux-trace-users-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9ECCAC352BE
	for <linux-trace-users@archiver.kernel.org>; Thu, 16 Apr 2020 22:02:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 800FC21973
	for <linux-trace-users@archiver.kernel.org>; Thu, 16 Apr 2020 22:02:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728114AbgDPWCD (ORCPT
        <rfc822;linux-trace-users@archiver.kernel.org>);
        Thu, 16 Apr 2020 18:02:03 -0400
Received: from mail-qk1-f172.google.com ([209.85.222.172]:43496 "EHLO
        mail-qk1-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727998AbgDPWCC (ORCPT
        <rfc822;linux-trace-users@vger.kernel.org>);
        Thu, 16 Apr 2020 18:02:02 -0400
Received: by mail-qk1-f172.google.com with SMTP id 20so329930qkl.10
        for <linux-trace-users@vger.kernel.org>; Thu, 16 Apr 2020 15:02:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:content-transfer-encoding;
        bh=j0GjX+sAJPvcjkR+7YvFDd2RXdhYHs6wY0NiuaIHIKw=;
        b=fmpf8brgcebteU6ny3Yn+WX5IMjZwfHc/+fpxYuMr2iFF4omLR2tqF5OVq+ItlmWnt
         XgUkZkxMGSo9w40TGfT8H1L/99FIYvdKMcIo+iXEpXqIJqNfvukQPGsr2N7VX60Run+C
         jABgtK7WV7BPer5WexV2YDDmLShImjznsRrM4R+nIy5cnYCPcNKmNSeLC/2nicQGhZ0u
         hLbHuYVypRpl+f/SyV2LFCc3ESjg9I00Bf9HG5u8WCbKGCIYuha9mL1XD7kZmtS+pWMr
         KDZo8rUE0E43Ve3mEDWu30lKUjH7j4vFzhqG0caILC+5lt5tft9yS6awmOOgIa/JmhVJ
         eneg==
X-Gm-Message-State: AGi0PubxtTfV90CeMBk5gyBKeLSUa56inn6/zgC5UtACoAragSkZlTte
        qqJWSLk7fZDfzHXLwpeSHjE=
X-Google-Smtp-Source: APiQypIyTb4V8JEwDl6ih+EktVky+q0F3NCnKhsPwJSVJzmiwqBs290SJX2p2SkvFBHS/nDne6SHYw==
X-Received: by 2002:a37:2714:: with SMTP id n20mr157163qkn.291.1587074520497;
        Thu, 16 Apr 2020 15:02:00 -0700 (PDT)
Received: from gmail.com (192-222-251-19.qc.cable.ebox.net. [192.222.251.19])
        by smtp.gmail.com with ESMTPSA id f13sm16341097qti.47.2020.04.16.15.01.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2020 15:01:59 -0700 (PDT)
Date:   Thu, 16 Apr 2020 18:01:57 -0400
From:   =?iso-8859-1?Q?J=E9r=E9mie?= Galarneau 
        <jeremie.galarneau@efficios.com>
To:     lttng-dev@lists.lttng.org
Cc:     diamon-discuss@lists.linuxfoundation.org,
        linux-trace-users@vger.kernel.org
Subject: [RELEASE] LTTng-tools =?iso-8859-1?B?Mi45?=
 =?iso-8859-1?Q?=2E15_-_Joann=E8s?=
Message-ID: <20200416220157.GC61343@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Sender: linux-trace-users-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-trace-users.vger.kernel.org>
X-Mailing-List: linux-trace-users@vger.kernel.org

Hi all,

The fifteenth bug-fix release of LTTng-Tools 2.9 - Joannès has just
been released. This release addresses a number of issues listed below.

2020-04-16 lttng-tools 2.9.15 (National Eggs Benedict Day)
	* doc: Fix bind address example for lttng-relayd

As always, please report any issue you may encounter to bugs.lttng.org
or on this mailing list.

Note that this release marks the end of life of the 2.9.x release
series.

Project website: https://lttng.org

Download link:
https://lttng.org/files/lttng-tools/lttng-tools-2.9.15.tar.bz2

GPG sig:
https://lttng.org/files/lttng-tools/lttng-tools-2.9.15.tar.bz2.asc
