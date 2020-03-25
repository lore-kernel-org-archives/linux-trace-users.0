Return-Path: <SRS0=L3+l=5K=vger.kernel.org=linux-trace-users-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2711C2D0E5
	for <linux-trace-users@archiver.kernel.org>; Wed, 25 Mar 2020 18:58:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 871852074D
	for <linux-trace-users@archiver.kernel.org>; Wed, 25 Mar 2020 18:58:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Ucb5Lig/"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727508AbgCYS6p (ORCPT
        <rfc822;linux-trace-users@archiver.kernel.org>);
        Wed, 25 Mar 2020 14:58:45 -0400
Received: from us-smtp-delivery-74.mimecast.com ([216.205.24.74]:23518 "EHLO
        us-smtp-delivery-74.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727469AbgCYS6p (ORCPT
        <rfc822;linux-trace-users@vger.kernel.org>);
        Wed, 25 Mar 2020 14:58:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1585162724;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=pDcT6VSv+IL1mA1lmw4NhWaIKdKw35orV/B/8HEa97g=;
        b=Ucb5Lig/F65LK+ixoGAi3YNv34rQ83DRpiSXH8s9KWl7bpVPT9WXMbAA2LwmhU/vs3Qlf2
        zlOkkUAy5jrjG4+jtP+ObgB6WonFMmw8BuKPy8YHM6Lrrk9Jh436YnFlZMZYf0ya4ERl4D
        o0XoNRYWLO7yg/ejWb7c3v4RldJnAzI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-421-n1qDlKrFNpGzlWyQ0AGB8A-1; Wed, 25 Mar 2020 14:58:38 -0400
X-MC-Unique: n1qDlKrFNpGzlWyQ0AGB8A-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 675F3107ACCD;
        Wed, 25 Mar 2020 18:58:36 +0000 (UTC)
Received: from sandy.ghostprotocols.net (unknown [10.3.128.8])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id C3EC194B55;
        Wed, 25 Mar 2020 18:58:35 +0000 (UTC)
Received: by sandy.ghostprotocols.net (Postfix, from userid 1000)
        id 8FC1C168; Wed, 25 Mar 2020 15:58:31 -0300 (BRT)
Date:   Wed, 25 Mar 2020 15:58:31 -0300
From:   Arnaldo Carvalho de Melo <acme@redhat.com>
To:     Jiri Olsa <jolsa@redhat.com>
Cc:     ahmadkhorrami <ahmadkhorrami@ut.ac.ir>,
        Steven Rostedt <rostedt@goodmis.org>,
        Linux-trace Users <linux-trace-users@vger.kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        linux-trace-users-owner@vger.kernel.org,
        Jin Yao <yao.jin@linux.intel.com>
Subject: Re: Wrong Perf Backtraces
Message-ID: <20200325185831.GB19495@redhat.com>
References: <157597d74ff17f781d9de7e7e3defd13@ut.ac.ir>
 <bd85fc28dfb5dcf7fc10507c3c86a56d@ut.ac.ir>
 <20200322203421.715b32d8@oasis.local.home>
 <21b3df4080709f193d62b159887e2a83@ut.ac.ir>
 <20200323084942.GA1534489@krava>
 <ee43289d91fcae1c9ef5cc2429dc916b@ut.ac.ir>
 <8645d3626b4714690925328ab00373d6@ut.ac.ir>
 <20200325154643.GA1934048@krava>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200325154643.GA1934048@krava>
X-Url:  http://acmel.wordpress.com
User-Agent: Mutt/1.5.20 (2009-12-10)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Sender: linux-trace-users-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-trace-users.vger.kernel.org>
X-Mailing-List: linux-trace-users@vger.kernel.org

Em Wed, Mar 25, 2020 at 04:46:43PM +0100, Jiri Olsa escreveu:
> On Wed, Mar 25, 2020 at 07:48:39PM +0430, ahmadkhorrami wrote:
> > Hi,
> > 
> > Could you give me some hints about where the actual problem takes place? Is
> > the problem with "Perf" or the hardware part (i.e., "Hardware Performance
> > Counters")? Can I revise the problem by simply modifying the code? How much
> > work is needed?
> 
> heya,
> might be some callchain processing bug, but I can't reproduce it on my setup..
> would you have/make some simple example that would reproduce the issue?
> 
> Another option is that you'd send perf.data together with 'perf archive' data.
> 
> Also.. we support 2 dwarf unwinders (libunwind/libdw).. not sure which one you
> have compiled in, but would be helpful to see if the other shows the same.

perf -vv

+

ldd `which perf`

Output will help us find out which unwinder is being used, as well as
the version of perf being used.

- Arnaldo

