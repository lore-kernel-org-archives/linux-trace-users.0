Return-Path: <SRS0=L3+l=5K=vger.kernel.org=linux-trace-users-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A5A0C54FCF
	for <linux-trace-users@archiver.kernel.org>; Wed, 25 Mar 2020 15:46:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 55D9B20719
	for <linux-trace-users@archiver.kernel.org>; Wed, 25 Mar 2020 15:46:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="R6jPb2cv"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727439AbgCYPq7 (ORCPT
        <rfc822;linux-trace-users@archiver.kernel.org>);
        Wed, 25 Mar 2020 11:46:59 -0400
Received: from us-smtp-delivery-74.mimecast.com ([63.128.21.74]:31259 "EHLO
        us-smtp-delivery-74.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727386AbgCYPq6 (ORCPT
        <rfc822;linux-trace-users@vger.kernel.org>);
        Wed, 25 Mar 2020 11:46:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1585151217;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=CZoCeCR/178nZgI2bBDeh/UCGP/u3fKQ9QrzPEUid2Y=;
        b=R6jPb2cvnIS1JrNekaCXAK6ppF+Pjxs/Jp1izKCocjPOX58yErsIOaJY4mfAlcAcqECbBi
        a2SqgiaidUluqdbpqNp3w0YNDIyp23tRtmI49X+HV96DltmhE1D2nP95oib8g/CDb4shlM
        HOc4+voEtajqOoyDGWttrZcihatarcY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-116-WIkVZV5bN1W1hi8bjNk9hg-1; Wed, 25 Mar 2020 11:46:49 -0400
X-MC-Unique: WIkVZV5bN1W1hi8bjNk9hg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 560A88017CC;
        Wed, 25 Mar 2020 15:46:48 +0000 (UTC)
Received: from krava (unknown [10.40.192.119])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id 8EB9096F81;
        Wed, 25 Mar 2020 15:46:45 +0000 (UTC)
Date:   Wed, 25 Mar 2020 16:46:43 +0100
From:   Jiri Olsa <jolsa@redhat.com>
To:     ahmadkhorrami <ahmadkhorrami@ut.ac.ir>
Cc:     Steven Rostedt <rostedt@goodmis.org>,
        Linux-trace Users <linux-trace-users@vger.kernel.org>,
        Arnaldo Carvalho de Melo <acme@redhat.com>,
        Peter Zijlstra <peterz@infradead.org>,
        linux-trace-users-owner@vger.kernel.org,
        Jin Yao <yao.jin@linux.intel.com>
Subject: Re: Wrong Perf Backtraces
Message-ID: <20200325154643.GA1934048@krava>
References: <157597d74ff17f781d9de7e7e3defd13@ut.ac.ir>
 <bd85fc28dfb5dcf7fc10507c3c86a56d@ut.ac.ir>
 <20200322203421.715b32d8@oasis.local.home>
 <21b3df4080709f193d62b159887e2a83@ut.ac.ir>
 <20200323084942.GA1534489@krava>
 <ee43289d91fcae1c9ef5cc2429dc916b@ut.ac.ir>
 <8645d3626b4714690925328ab00373d6@ut.ac.ir>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8645d3626b4714690925328ab00373d6@ut.ac.ir>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Sender: linux-trace-users-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-trace-users.vger.kernel.org>
X-Mailing-List: linux-trace-users@vger.kernel.org

On Wed, Mar 25, 2020 at 07:48:39PM +0430, ahmadkhorrami wrote:
> Hi,
> 
> Could you give me some hints about where the actual problem takes place? Is
> the problem with "Perf" or the hardware part (i.e., "Hardware Performance
> Counters")? Can I revise the problem by simply modifying the code? How much
> work is needed?

heya,
might be some callchain processing bug, but I can't reproduce it on my setup..
would you have/make some simple example that would reproduce the issue?

Another option is that you'd send perf.data together with 'perf archive' data.

Also.. we support 2 dwarf unwinders (libunwind/libdw).. not sure which one you
have compiled in, but would be helpful to see if the other shows the same.

jirka

