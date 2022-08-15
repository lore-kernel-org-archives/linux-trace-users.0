Return-Path: <linux-trace-users-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39887C00140
	for <linux-trace-users@archiver.kernel.org>; Mon, 15 Aug 2022 15:03:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232344AbiHOPDC (ORCPT
        <rfc822;linux-trace-users@archiver.kernel.org>);
        Mon, 15 Aug 2022 11:03:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44158 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232438AbiHOPC7 (ORCPT
        <rfc822;linux-trace-users@vger.kernel.org>);
        Mon, 15 Aug 2022 11:02:59 -0400
Received: from mail.efficios.com (mail.efficios.com [167.114.26.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A98CD25285
        for <linux-trace-users@vger.kernel.org>; Mon, 15 Aug 2022 08:02:57 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
        by mail.efficios.com (Postfix) with ESMTP id 464FA325B67;
        Mon, 15 Aug 2022 11:02:56 -0400 (EDT)
Received: from mail.efficios.com ([127.0.0.1])
        by localhost (mail03.efficios.com [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id xpG_F8Mlhlsg; Mon, 15 Aug 2022 11:02:55 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
        by mail.efficios.com (Postfix) with ESMTP id C5845325B66;
        Mon, 15 Aug 2022 11:02:55 -0400 (EDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.efficios.com C5845325B66
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=efficios.com;
        s=default; t=1660575775;
        bh=3iLZ2v16xM+T3ZJ4e73BcK51wiFIV3htCy6QbOX/AGk=;
        h=Date:From:To:Message-ID:MIME-Version;
        b=P2yxtFZt7T2ObRNeCLA2MAALlIgUyxUh4yY2fuM1P3F0YMYorWoMFMxGXrh84rkQY
         5G+Gg74JBtR4j1U/tqe0o+zls9C1NXuMH57G4I1MjZ44MuTfVGNMboJGp8lGo91lKT
         RI7iXFV/SvIh6kT6qlLzGy+hZa+ii8Bpj1cIhC2ZNCwKCqLoWDzKeUlXtZxsYxmk96
         mJgav0+4PZV4j9ni+7zIQvXX4QD2x0+mBpBuZCtw6h85VqgFRRZ8Ya1++aYpxsXnJ2
         5eEAV+aWOiOG6vb/N43w6CUZ+Hox+31dmbKVHkG9XIvLhIJ1qJon9HbHAwap/CKCbH
         A4mKv5Z4f/xoQ==
X-Virus-Scanned: amavisd-new at efficios.com
Received: from mail.efficios.com ([127.0.0.1])
        by localhost (mail03.efficios.com [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id NC0uH84XFycr; Mon, 15 Aug 2022 11:02:55 -0400 (EDT)
Received: from mail03.efficios.com (mail03.efficios.com [167.114.26.124])
        by mail.efficios.com (Postfix) with ESMTP id BA7A3325DA2;
        Mon, 15 Aug 2022 11:02:55 -0400 (EDT)
Date:   Mon, 15 Aug 2022 11:02:55 -0400 (EDT)
From:   Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
To:     Alexander Aring <aahringo@redhat.com>
Cc:     linux-trace-users <linux-trace-users@vger.kernel.org>
Message-ID: <897351806.4484.1660575775681.JavaMail.zimbra@efficios.com>
In-Reply-To: <CAK-6q+hJ4KjhUqNOGT0a046M7t3McbdstJy7xYzUAwHCp4yZRw@mail.gmail.com>
References: <CAK-6q+hJ4KjhUqNOGT0a046M7t3McbdstJy7xYzUAwHCp4yZRw@mail.gmail.com>
Subject: Re: stream based live time synchronized tracing?
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Originating-IP: [167.114.26.124]
X-Mailer: Zimbra 8.8.15_GA_4372 (ZimbraWebClient - FF103 (Linux)/8.8.15_GA_4372)
Thread-Topic: stream based live time synchronized tracing?
Thread-Index: 5zM/XiyqsCImCOh6qvtrsGXHuk+b4A==
Precedence: bulk
List-ID: <linux-trace-users.vger.kernel.org>
X-Mailing-List: linux-trace-users@vger.kernel.org

----- On Aug 15, 2022, at 9:28 AM, Alexander Aring aahringo@redhat.com wrote:

> Hi,
> 
> I am curious if there is any way of getting time synchronized traces
> in a kind of stream based communication like pipes, sockets, etc. and
> get high level event representation as ?libtraceevent? provides. I
> would like to get all "merged" events from all machines provided by -A
> parameters. I think it isn't required to get them in order, but the
> timestamp should be synchronized.
> 
> I could probably build something like that with libtracecmd to have it
> directly implemented in an application, but I am curious if there
> exists any interest in having such a feature upstream? E.g. having
> additional parameters like '--tsync-interval'.
> 
> A use-case would be live capturing of time synchronized events or what
> I have in my mind to collect stats and doing kernel runtime
> optimizations.

You may want to have a look at babeltrace2 [1]. It allows merging multiple
traces together as they are read. Using the "lttng-live" source, you can read
traces as they are produced.

Thanks,

Mathieu

[1] https://babeltrace.org


-- 
Mathieu Desnoyers
EfficiOS Inc.
http://www.efficios.com
