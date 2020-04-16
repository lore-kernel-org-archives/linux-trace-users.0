Return-Path: <SRS0=JkaP=6A=vger.kernel.org=linux-trace-users-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDE3CC2BA2B
	for <linux-trace-users@archiver.kernel.org>; Thu, 16 Apr 2020 21:59:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AAE5622201
	for <linux-trace-users@archiver.kernel.org>; Thu, 16 Apr 2020 21:59:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727999AbgDPV7F (ORCPT
        <rfc822;linux-trace-users@archiver.kernel.org>);
        Thu, 16 Apr 2020 17:59:05 -0400
Received: from mail-qv1-f48.google.com ([209.85.219.48]:46320 "EHLO
        mail-qv1-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728650AbgDPV7E (ORCPT
        <rfc822;linux-trace-users@vger.kernel.org>);
        Thu, 16 Apr 2020 17:59:04 -0400
Received: by mail-qv1-f48.google.com with SMTP id bu9so2881749qvb.13
        for <linux-trace-users@vger.kernel.org>; Thu, 16 Apr 2020 14:59:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=4r0pX5Zva5WrW4aYqrwc9y4nousLA54vNnzGDA8IkzA=;
        b=YBm9wkGuat2VOrWSjvie5RSQYKzG5+S6WwLVs2r7kWmC7ztYh/J+knFGEJMDbxWw0f
         6BevcSLYeMfIgDJSJUr1DjfoGXX12q6DRjt+AyCzRuSwb0uFkTrI+f9DQAQD7VSEFOj2
         52U3iobQhQKmVwAevwuowL3DKhOG7jYrDqNgvxIsbd1xD9rI+7lKCYk0/+WlGERFLGhl
         W9PKQPd8SnVkPgR3nArkeT6TCTcfSCEDvNKCl9TsClSCwf+PBV7xFaISNpincYM2aLHN
         G0HroW2qfhb81onApRCS+JJ2G4VOVomUNdLtWLKslE1BsmP2uxPjp2Uqp2G+alWzaJa2
         bw8w==
X-Gm-Message-State: AGi0PubZzdTEMiBlid4payJnURBkxtlFz95+QHB+oqPvl1OCibYixncS
        ob1Otc/eA5hrdH3ORAcBYSHEGfqL
X-Google-Smtp-Source: APiQypLnnX3YAqMK5KiV3xNNyAT3gXmupTYDHhz1J76+/AbxYfGDw3lbdXEiVv0llznZpepKlRcpJA==
X-Received: by 2002:a0c:e941:: with SMTP id n1mr12610508qvo.144.1587074342062;
        Thu, 16 Apr 2020 14:59:02 -0700 (PDT)
Received: from gmail.com (192-222-251-19.qc.cable.ebox.net. [192.222.251.19])
        by smtp.gmail.com with ESMTPSA id k43sm17208072qtk.67.2020.04.16.14.59.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2020 14:59:01 -0700 (PDT)
Date:   Thu, 16 Apr 2020 17:58:59 -0400
From:   =?iso-8859-1?Q?J=E9r=E9mie?= Galarneau 
        <jeremie.galarneau@efficios.com>
To:     lttng-dev@lists.lttng.org
Cc:     diamon-discuss@lists.linuxfoundation.org,
        linux-trace-users@vger.kernel.org
Subject: [RELEASE] LTTng-tools 2.11.3 - Lafontaine
Message-ID: <20200416215859.GA61343@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-trace-users-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-trace-users.vger.kernel.org>
X-Mailing-List: linux-trace-users@vger.kernel.org

Hi all,

The third bug-fix release of LTTng-tools 2.11 - Lafontaine has just
been released. This release addresses a number of issues listed below.

2020-04-16 lttng-tools 2.11.3 (National Eggs Benedict Day)
	* Fix: lttng-destroy: missing newline on session destruction message
	* Fix: common: add `void` parameter to log_add_time declaration
	* Fix: lttng-list: don't warn when the kernel domain has no channels
	* Fix: sessiond: occasional badfd error on repeated SIGTERM
	* Fix: lttng: incorrect domain list printed when no domain is provided
	* directory-handle: print `errno` reason on `unlinkat()` error
	* Fix: lttng-ctl: _handle can be NULL
	* Silence `POSIX Yacc` warnings
	* Fix: relayd: use of relay_session ref count before initialization
	* Fix: lttng: uninitialized pointer free'd when no sessiond is present

As always, please report any issue you may encounter to bugs.lttng.org
or on this mailing list.

Project website: https://lttng.org

Download link:
https://lttng.org/files/lttng-tools/lttng-tools-2.11.3.tar.bz2

GPG signature:
https://lttng.org/files/lttng-tools/lttng-tools-2.11.3.tar.bz2.asc
