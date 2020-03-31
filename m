Return-Path: <SRS0=9mrg=5Q=vger.kernel.org=linux-trace-users-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CE8DC43331
	for <linux-trace-users@archiver.kernel.org>; Tue, 31 Mar 2020 09:30:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C5BFD2072E
	for <linux-trace-users@archiver.kernel.org>; Tue, 31 Mar 2020 09:30:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fRi/Uaii"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730261AbgCaJas (ORCPT
        <rfc822;linux-trace-users@archiver.kernel.org>);
        Tue, 31 Mar 2020 05:30:48 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:55758 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1730235AbgCaJas (ORCPT
        <rfc822;linux-trace-users@vger.kernel.org>);
        Tue, 31 Mar 2020 05:30:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1585647047;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=voAjwrZ3h7eTi533GBPbXjA/t6daangvgKObSNi5Utc=;
        b=fRi/UaiiHXfR7P3NxleJXYnS+py69Q7ZlHU0SZLG+sm3gWDRujIFeuyErNWDEgR1BRA1X8
        xiM9GgPqc6ow6ZWNFApamLjlL799D/Toyy81fjUazsNOidLc+vKs8iOf/h0N1e/Gr5+sdY
        6OHAKKvf1fmiw9O2tubWWEGQnD1JuA4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-168-lTs5Q-WOPKCer6UTkBtNLg-1; Tue, 31 Mar 2020 05:30:42 -0400
X-MC-Unique: lTs5Q-WOPKCer6UTkBtNLg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 17D9FA0CBF;
        Tue, 31 Mar 2020 09:30:41 +0000 (UTC)
Received: from krava (unknown [10.40.192.75])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id E073060BE0;
        Tue, 31 Mar 2020 09:30:38 +0000 (UTC)
Date:   Tue, 31 Mar 2020 11:30:35 +0200
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
Message-ID: <20200331093035.GB2518490@krava>
References: <821540886fc57d7749edee585a50602f@ut.ac.ir>
 <1867036.PIDvDuAF1L@agathebauer>
 <20200329192010.GA2361248@krava>
 <2522580.mvXUDI8C0e@agathebauer>
 <20200330130750.GC2361248@krava>
 <e51e7fc0bed5e79f5e7774fcd5389c3d@ut.ac.ir>
 <8cb4f94b11fbac6ca3a44b924b6ee7b3@ut.ac.ir>
 <c1a64287c45da58def62a45e44525f02@ut.ac.ir>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c1a64287c45da58def62a45e44525f02@ut.ac.ir>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Sender: linux-trace-users-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-trace-users.vger.kernel.org>
X-Mailing-List: linux-trace-users@vger.kernel.org

On Tue, Mar 31, 2020 at 09:13:28AM +0430, ahmadkhorrami wrote:
> Hi,
> I checked the reported address in libgtk. GDB could map it to the source
> files. Also, once, I read at Stackoverflow that perf gives up on printing
> the backtrace (truncates the output backtrace), whenever it detects a binary
> file without debug info. Could you describe more about this situation?
> And dear Mr. Olsa, if these cases do not occur on your system, could you
> tell me how you installed the debug info for the binaries on your system,
> please?

google: 'how to install debuginfo on <whatever distro you run on>'

jirka

