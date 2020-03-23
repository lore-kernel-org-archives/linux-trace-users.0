Return-Path: <SRS0=Ymyf=5I=vger.kernel.org=linux-trace-users-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 386DAC4332B
	for <linux-trace-users@archiver.kernel.org>; Mon, 23 Mar 2020 08:51:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0756220736
	for <linux-trace-users@archiver.kernel.org>; Mon, 23 Mar 2020 08:51:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="EeBkfitZ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727587AbgCWIvB (ORCPT
        <rfc822;linux-trace-users@archiver.kernel.org>);
        Mon, 23 Mar 2020 04:51:01 -0400
Received: from us-smtp-delivery-74.mimecast.com ([216.205.24.74]:49706 "EHLO
        us-smtp-delivery-74.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727477AbgCWIvB (ORCPT
        <rfc822;linux-trace-users@vger.kernel.org>);
        Mon, 23 Mar 2020 04:51:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1584953460;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=AwEtQqsTBv2eDwjh04Fid+dxME8YRj5BdmT50Hz9xAg=;
        b=EeBkfitZkQRlJWlgsyyO8tgbRfJKGPT+ih4hZ9fLv/qhwl4iEBUhw7/mwsBAY3F3T6U654
        vEDPYMKVASkaZ6rCYnn8/774w+oRLDqFxEW3MjiHEihFWhHIPBjzLUITsJVyU3kuXYjNEj
        J+whsknsN99/SvKpMWHMewK1a3ePRWs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-415-NbzOaqobOhyR4HjhngvgZg-1; Mon, 23 Mar 2020 04:50:54 -0400
X-MC-Unique: NbzOaqobOhyR4HjhngvgZg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EE45F1907268;
        Mon, 23 Mar 2020 08:49:47 +0000 (UTC)
Received: from krava (unknown [10.40.192.119])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id 313AD6683E;
        Mon, 23 Mar 2020 08:49:44 +0000 (UTC)
Date:   Mon, 23 Mar 2020 09:49:42 +0100
From:   Jiri Olsa <jolsa@redhat.com>
To:     ahmadkhorrami <ahmadkhorrami@ut.ac.ir>
Cc:     Steven Rostedt <rostedt@goodmis.org>,
        Linux-trace Users <linux-trace-users@vger.kernel.org>,
        Arnaldo Carvalho de Melo <acme@redhat.com>,
        Peter Zijlstra <peterz@infradead.org>,
        linux-trace-users-owner@vger.kernel.org,
        Jin Yao <yao.jin@linux.intel.com>
Subject: Re: Wrong Perf Backtraces
Message-ID: <20200323084942.GA1534489@krava>
References: <157597d74ff17f781d9de7e7e3defd13@ut.ac.ir>
 <bd85fc28dfb5dcf7fc10507c3c86a56d@ut.ac.ir>
 <20200322203421.715b32d8@oasis.local.home>
 <21b3df4080709f193d62b159887e2a83@ut.ac.ir>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <21b3df4080709f193d62b159887e2a83@ut.ac.ir>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Sender: linux-trace-users-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-trace-users.vger.kernel.org>
X-Mailing-List: linux-trace-users@vger.kernel.org

On Mon, Mar 23, 2020 at 07:48:26AM +0430, ahmadkhorrami wrote:
> Here is a link to the detailed question at Stackoverflow: 
> 
> https://stackoverflow.com/questions/60766026/wrong-perf-backtraces 

hi,
what perf version are you running?

jirka


> 
> I can copy it here, if needed. 
> 
> Thanks 
> 
> On 2020-03-23 05:04, Steven Rostedt wrote:
> 
> > On Mon, 23 Mar 2020 00:54:01 +0430
> > ahmadkhorrami <ahmadkhorrami@ut.ac.ir> wrote:
> > 
> >> Hi,
> >> I used "Perf" to extract call graphs in an evince benchmark. The command 
> >> used is as follows:
> >> sudo perf record -d --call-graph dwarf -c 10000 e 
> >> mem_load_uops_retired.l3_miss:uppp /opt/evince-3.28.4/bin/evince
> >> 
> >> I extracted the backtraces using "perf script" and found out that there 
> >> are many corrupted backtrace instances. Some contained repeated function 
> >> calls, for example two consecutive gmallocn()s exactly at the same 
> >> offsets. There are also some backtraces where the callers and callees do 
> >> not match.
> > 
> > Could you show some examples of the backtraces you mention?
> > 
> >> Note that that mappings are correct. In other words, each single line of 
> >> the reported backtraces is correct (i.e., addresses match with 
> >> functions). But is seems that there are some function calls in the 
> >> middle, which are missed by "Perf". Strangely, in all runs (and also 
> >> with different sampling frequencies) the problem occurs exactly at the 
> >> same place.
> >> 
> >> I am really confused and looking forward to any help. I can also send 
> >> backtraces if needed.
> > 
> > -- Steve

