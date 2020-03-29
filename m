Return-Path: <SRS0=qAvV=5O=vger.kernel.org=linux-trace-users-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 414B6C43331
	for <linux-trace-users@archiver.kernel.org>; Sun, 29 Mar 2020 12:08:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0B43D20733
	for <linux-trace-users@archiver.kernel.org>; Sun, 29 Mar 2020 12:08:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="X50FXJ5H"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728057AbgC2MI2 (ORCPT
        <rfc822;linux-trace-users@archiver.kernel.org>);
        Sun, 29 Mar 2020 08:08:28 -0400
Received: from us-smtp-delivery-74.mimecast.com ([216.205.24.74]:41604 "EHLO
        us-smtp-delivery-74.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727938AbgC2MI2 (ORCPT
        <rfc822;linux-trace-users@vger.kernel.org>);
        Sun, 29 Mar 2020 08:08:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1585483707;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=Yym9AdTQdSXoVNyWUX/J/fHDmr09zJRRB1NWFLOAxm0=;
        b=X50FXJ5HUovzwyAP1OLULm9hWjeA8cHRMM7wNX3lq96PQZVuS4Ij+mRvbvKSTnxccHH82S
        qZmJ7FVRs10y/OfvVifdP6e60Vq3ez+3J7Si30ycv90ONEpgksAhASzo/b7zRbHTv4tWxC
        wt2xmm/kzi+LjCd9LFOYMwWM7wupg50=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-251-A-YsgB38PryHPbpyaTC4Ig-1; Sun, 29 Mar 2020 08:08:23 -0400
X-MC-Unique: A-YsgB38PryHPbpyaTC4Ig-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 56ABE8017CC;
        Sun, 29 Mar 2020 12:08:21 +0000 (UTC)
Received: from krava (unknown [10.40.192.75])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id 8E4965E026;
        Sun, 29 Mar 2020 12:08:18 +0000 (UTC)
Date:   Sun, 29 Mar 2020 14:08:16 +0200
From:   Jiri Olsa <jolsa@redhat.com>
To:     ahmadkhorrami <ahmadkhorrami@ut.ac.ir>
Cc:     Steven Rostedt <rostedt@goodmis.org>,
        Arnaldo Carvalho de Melo <acme@redhat.com>,
        Linux-trace Users <linux-trace-users@vger.kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        linux-trace-users-owner@vger.kernel.org,
        Jin Yao <yao.jin@linux.intel.com>,
        Milian Wolff <milian.wolff@kdab.com>,
        Namhyung Kim <namhyung@kernel.org>,
        Andi Kleen <ak@linux.intel.com>
Subject: Re: Wrong Perf Backtraces
Message-ID: <20200329120816.GD2155755@krava>
References: <821540886fc57d7749edee585a50602f@ut.ac.ir>
 <decdc878b1bf207c68f1bc9e21178486@ut.ac.ir>
 <fd99185b401a451fdbf96439eadcb101@ut.ac.ir>
 <20200327223743.GA2155755@krava>
 <57b9e24200019a41bd465e2d78c09e29@ut.ac.ir>
 <20200328233431.GB2155755@krava>
 <d7f65793a15bb80667e384c320549e69@ut.ac.ir>
 <8a58f8eda97525e5e49daeb001107c9d@ut.ac.ir>
 <20200329111959.GC2155755@krava>
 <9f7cae225ed99222e05ca1e840cd93dd@ut.ac.ir>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9f7cae225ed99222e05ca1e840cd93dd@ut.ac.ir>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Sender: linux-trace-users-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-trace-users.vger.kernel.org>
X-Mailing-List: linux-trace-users@vger.kernel.org

On Sun, Mar 29, 2020 at 04:22:27PM +0430, ahmadkhorrami wrote:
> Hi,
> Thanks. Still no change. Sorry, I forgot to say that you should initialize
> the "perfCMD" variable to your perf binary path.

sure I did that, and your script detected the double entries,
now when we show also srcline for them it's silent

so there's no change at all for your perf script output?

jirka

> Regards.
> 
> On 2020-03-29 15:49, Jiri Olsa wrote:
> 
> > On Sun, Mar 29, 2020 at 05:46:57AM +0430, ahmadkhorrami wrote:
> > 
> > > Hi,
> > > Each line is correct. I mean addresses match symbols. But some
> > > callers and
> > > callees do not match. Perhaps callchain misses some callers in
> > > between.
> > > Regards
> > 
> > right, I missed another case.. how about the change below?
> > your script is silent now on my data
> > 
> > jirka
> > 
> > ---
> > diff --git a/tools/perf/util/evsel_fprintf.c
> > b/tools/perf/util/evsel_fprintf.c
> > index 3b4842840db0..fc4fb88937ed 100644
> > --- a/tools/perf/util/evsel_fprintf.c
> > +++ b/tools/perf/util/evsel_fprintf.c
> > @@ -173,6 +173,8 @@ int sample__fprintf_callchain(struct perf_sample
> > *sample, int left_alignment,
> > 
> > if (print_srcline)
> > printed += map__fprintf_srcline(map, addr, "\n  ", fp);
> > +            else if (node->srcline)
> > +                printed += fprintf(fp, " %s", node->srcline);
> > 
> > if (sym && sym->inlined)
> > printed += fprintf(fp, " (inlined)");
> 

