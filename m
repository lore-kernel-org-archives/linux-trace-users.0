Return-Path: <linux-trace-users-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D3F9C433ED
	for <linux-trace-users@archiver.kernel.org>; Wed,  5 May 2021 13:47:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 47FE0610FB
	for <linux-trace-users@archiver.kernel.org>; Wed,  5 May 2021 13:47:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231650AbhEENsH (ORCPT
        <rfc822;linux-trace-users@archiver.kernel.org>);
        Wed, 5 May 2021 09:48:07 -0400
Received: from mail.efficios.com ([167.114.26.124]:48738 "EHLO
        mail.efficios.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230159AbhEENsH (ORCPT
        <rfc822;linux-trace-users@vger.kernel.org>);
        Wed, 5 May 2021 09:48:07 -0400
Received: from localhost (localhost [127.0.0.1])
        by mail.efficios.com (Postfix) with ESMTP id B08CC324C32;
        Wed,  5 May 2021 09:47:10 -0400 (EDT)
Received: from mail.efficios.com ([127.0.0.1])
        by localhost (mail03.efficios.com [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id FpEBtyQfEeei; Wed,  5 May 2021 09:47:09 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
        by mail.efficios.com (Postfix) with ESMTP id 9CE9A324D67;
        Wed,  5 May 2021 09:47:09 -0400 (EDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.efficios.com 9CE9A324D67
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=efficios.com;
        s=default; t=1620222429;
        bh=IEkHFdHJuSn4RdYNCVXcsSuylFLRcrJfEnJbo5nEqAY=;
        h=Date:From:To:Message-ID:MIME-Version;
        b=cg7SYvwa1z3uJA2bPGF1QVwES/ml63iYlXH3Nfz9T2xGA9wORgRw+bKD55OPMhzlH
         M+wCjQalVUO9ZmoLtuJolDnWuuJ4eYKlXauXOyqxweYGdJiB9A8pG7DSDxaLMNp649
         6s62lagyO+QEbaxEZwk7KK5QNDmTn30Mqfzc843L6tH9Ys0x/5qAvNPSCkLfPOlFYb
         ybMgFYcS9NtHk5GGLGBQxZLZPgeIdNKplcuctzUSLgxkpr84HtxGcrPcrDMdg+TcKf
         jwBbypo3Jj7zu9yexrj75vCagQcCQs3hy5Pk22JqkTjP+RrKJNRCWBR5FCmrBVyzEt
         aMiHPaMqwNnAA==
X-Virus-Scanned: amavisd-new at efficios.com
Received: from mail.efficios.com ([127.0.0.1])
        by localhost (mail03.efficios.com [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id JYYrVCjSypvy; Wed,  5 May 2021 09:47:09 -0400 (EDT)
Received: from joraj-alpa (unknown [107.159.43.215])
        by mail.efficios.com (Postfix) with ESMTPSA id 71D30324E85;
        Wed,  5 May 2021 09:47:09 -0400 (EDT)
Date:   Wed, 5 May 2021 09:47:08 -0400
From:   Jonathan Rajotte-Julien <jonathan.rajotte-julien@efficios.com>
To:     Lin Wang <wanglinseven@gmail.com>
Cc:     linux-trace-users@vger.kernel.org
Subject: Re: how to continuously capture events
Message-ID: <20210505134708.GC346954@joraj-alpa>
References: <CABPy0FmkQAJXiX=uQatisCCHsZpfpk78DA9GrNFfULTguiY_vQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CABPy0FmkQAJXiX=uQatisCCHsZpfpk78DA9GrNFfULTguiY_vQ@mail.gmail.com>
Precedence: bulk
List-ID: <linux-trace-users.vger.kernel.org>
X-Mailing-List: linux-trace-users@vger.kernel.org

Hi,

> I'm trying to continuously capture certain kernel events, convert them
> to a different format and then write them to a file.

You might also want to have a look at LTTng and LTTng-modules depending on your
final use case. [1][2]

LTTng produce CTF traces [3] that can then be read/converted/manipulated with Babeltrace [4].

[1] https://lttng.org/
[2] https://lttng.org/docs/v2.12/#doc-tracing-the-linux-kernel
[3] https://diamon.org/ctf/
[4] https://babeltrace.org/

Cheers

-- 
Jonathan Rajotte-Julien
EfficiOS
