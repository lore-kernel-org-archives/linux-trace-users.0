Return-Path: <SRS0=L3+l=5K=vger.kernel.org=linux-trace-users-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDC8EC43331
	for <linux-trace-users@archiver.kernel.org>; Wed, 25 Mar 2020 21:46:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id AAAE120737
	for <linux-trace-users@archiver.kernel.org>; Wed, 25 Mar 2020 21:46:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="CLGFlU/O"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727355AbgCYVqh (ORCPT
        <rfc822;linux-trace-users@archiver.kernel.org>);
        Wed, 25 Mar 2020 17:46:37 -0400
Received: from us-smtp-delivery-74.mimecast.com ([216.205.24.74]:45172 "EHLO
        us-smtp-delivery-74.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727357AbgCYVqh (ORCPT
        <rfc822;linux-trace-users@vger.kernel.org>);
        Wed, 25 Mar 2020 17:46:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1585172796;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=/JXgKq5JYgUcnYEVq+E14jnuyH9o94dj1cQ4wrMLyZk=;
        b=CLGFlU/O48zJH+8Mj35I1hkgdzoQBDVRIYC7GSE+qRq30tav+YadjoooGdTYj8iAy8oRoG
        2T8Tm5y7uz/YYYbuQs/5xI2K0/kMIJ6OFcnPPRpN86N64K3yIusMieHrfHQnmzbyqxWsPu
        Jl/ceqgf0a3WcddumGBPnstI2HqrzuM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-423-Z3cZTp6YPZKPTzashHd0Kw-1; Wed, 25 Mar 2020 17:46:30 -0400
X-MC-Unique: Z3cZTp6YPZKPTzashHd0Kw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9ACD78017DF;
        Wed, 25 Mar 2020 21:46:28 +0000 (UTC)
Received: from krava (unknown [10.40.192.119])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id C0DB79B900;
        Wed, 25 Mar 2020 21:46:26 +0000 (UTC)
Date:   Wed, 25 Mar 2020 22:46:24 +0100
From:   Jiri Olsa <jolsa@redhat.com>
To:     ahmadkhorrami <ahmadkhorrami@ut.ac.ir>
Cc:     Steven Rostedt <rostedt@goodmis.org>,
        Arnaldo Carvalho de Melo <acme@redhat.com>,
        Linux-trace Users <linux-trace-users@vger.kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        linux-trace-users-owner@vger.kernel.org,
        Jin Yao <yao.jin@linux.intel.com>
Subject: Re: Wrong Perf Backtraces
Message-ID: <20200325214624.GD1947699@krava>
References: <8645d3626b4714690925328ab00373d6@ut.ac.ir>
 <20200325154643.GA1934048@krava>
 <20200325185831.GB19495@redhat.com>
 <9551c616b045299482fc9e26281c1062@ut.ac.ir>
 <20200325192858.GC19495@redhat.com>
 <4ffb7e2b6e272c20616fbf133a125fdf@ut.ac.ir>
 <20200325203921.GB1947699@krava>
 <20200325210252.GC1947699@krava>
 <20200325170932.34d52269@gandalf.local.home>
 <edcf2ce8838d83b1c2d44204d9ca001f@ut.ac.ir>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <edcf2ce8838d83b1c2d44204d9ca001f@ut.ac.ir>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Sender: linux-trace-users-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-trace-users.vger.kernel.org>
X-Mailing-List: linux-trace-users@vger.kernel.org

On Thu, Mar 26, 2020 at 02:07:39AM +0430, ahmadkhorrami wrote:
> Here is the link for the gmallocn() case:
> https://gofile.io/?c=o95O7N
> The output for the second case is big. I have a small one produced several
> days ago the link of which is as follows:
> https://gofile.io/?c=OIPCjx

looking good, but I still need you t run 'perf archive' on top of your
data and send me the perf.data.tar.bz2 it generates, like:

	[jolsa@krava perf]$ sudo ./perf record
	^C[ perf record: Woken up 1 times to write data ]
	[ perf record: Captured and wrote 1.675 MB perf.data (6248 samples) ]

	[jolsa@krava perf]$ sudo ./perf archive
	Now please run:

	$ tar xvf perf.data.tar.bz2 -C ~/.debug

	wherever you need to run 'perf report' on.

I need that perf.data.tar.bz2 generated from your data

thanks,
jirka

> Regards.
> 
> On 2020-03-26 01:39, Steven Rostedt wrote:
> 
> > On Wed, 25 Mar 2020 22:02:52 +0100
> > Jiri Olsa <jolsa@redhat.com> wrote:
> > 
> > > yea, no luck.. so if you could generate some reasonable small
> > > perf.data that
> > > shows the issue and send it over together with 'perf archive' data
> > > privately
> > > to me and to whoever else ask for it, so we don't polute the list..
> > 
> > Right. And it may be better if you compress it too.
> > 
> > xz perf.data
> > 
> > and attach the perf.data.xz (and only privately send it to Mr. Olsa).
> > 
> > -- Steve
> > 
> > > or if you could put it somewhere on the web/ftp.. that'd be best
> 

