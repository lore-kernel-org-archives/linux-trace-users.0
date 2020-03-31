Return-Path: <SRS0=9mrg=5Q=vger.kernel.org=linux-trace-users-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 297D3C2D0EE
	for <linux-trace-users@archiver.kernel.org>; Tue, 31 Mar 2020 13:21:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E657D20784
	for <linux-trace-users@archiver.kernel.org>; Tue, 31 Mar 2020 13:21:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="XSpgwfvv"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730974AbgCaNVF (ORCPT
        <rfc822;linux-trace-users@archiver.kernel.org>);
        Tue, 31 Mar 2020 09:21:05 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:33398 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1730963AbgCaNVF (ORCPT
        <rfc822;linux-trace-users@vger.kernel.org>);
        Tue, 31 Mar 2020 09:21:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1585660864;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=MeEto8FtHLX84bOWdZu7obHS/D8whODi/v8nAHpwl/c=;
        b=XSpgwfvv+0zmxx9YyQv5lMgiafbfVWItE0CC1oL1O3AP/8Sd+sqpjXnWobxoe/0oeD4Ld9
        r/aCzTmVnPRuegj2mmf7wLG7lnfLRt4AKX+BTXF5bwal3SZg1FrZMFXKeP9nRZTVg/x6ms
        TdbV6g3LxaJx0nVrG5JSzvAHzqTuJwU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-436-o-v-HHoBMDSxcI37yfVAAw-1; Tue, 31 Mar 2020 09:21:00 -0400
X-MC-Unique: o-v-HHoBMDSxcI37yfVAAw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2245F18C35CD;
        Tue, 31 Mar 2020 13:20:58 +0000 (UTC)
Received: from krava (unknown [10.40.194.72])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id 881EB96B8F;
        Tue, 31 Mar 2020 13:20:54 +0000 (UTC)
Date:   Tue, 31 Mar 2020 15:20:52 +0200
From:   Jiri Olsa <jolsa@redhat.com>
To:     ahmadkhorrami <ahmadkhorrami@ut.ac.ir>
Cc:     Milian Wolff <milian.wolff@kdab.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Arnaldo Carvalho de Melo <acme@redhat.com>,
        Linux-trace Users <linux-trace-users@vger.kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        linux-trace-users-owner@vger.kernel.org,
        Jin Yao <yao.jin@linux.intel.com>,
        Namhyung Kim <namhyung@kernel.org>,
        Andi Kleen <ak@linux.intel.com>
Subject: Re: Wrong Perf Backtraces
Message-ID: <20200331132052.GD2518490@krava>
References: <821540886fc57d7749edee585a50602f@ut.ac.ir>
 <1867036.PIDvDuAF1L@agathebauer>
 <20200329192010.GA2361248@krava>
 <2522580.mvXUDI8C0e@agathebauer>
 <20200330130750.GC2361248@krava>
 <e51e7fc0bed5e79f5e7774fcd5389c3d@ut.ac.ir>
 <8cb4f94b11fbac6ca3a44b924b6ee7b3@ut.ac.ir>
 <cc4c1410059a672b81d27a1992cb5a9e@ut.ac.ir>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cc4c1410059a672b81d27a1992cb5a9e@ut.ac.ir>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Sender: linux-trace-users-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-trace-users.vger.kernel.org>
X-Mailing-List: linux-trace-users@vger.kernel.org

On Tue, Mar 31, 2020 at 05:13:00PM +0430, ahmadkhorrami wrote:
> Hi,
> Please confirm my thought in the previous email, if it is correct.
> Regards.
> On 2020-03-30 23:35, ahmadkhorrami wrote:
> 
> > Hi,
> > Sorry, I did not pay attention to the fact that we need debug info to be
> > able to decode the callchain. So, without complete debug info the
> > backtrace (either the symbols or the addresses) is bogus. But you say
> > that the backtrace portions containing binaries with full debug info are
> > OK. Am I right? Please confirm if this is the case.
> > If so, these portions may be enough for my current usecase.

you need debuginfo to resolve symbols and inlines,
raw addresses should be coorect

jirka

