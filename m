Return-Path: <SRS0=YE05=5N=vger.kernel.org=linux-trace-users-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42E98C43331
	for <linux-trace-users@archiver.kernel.org>; Sat, 28 Mar 2020 23:34:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0B4A720748
	for <linux-trace-users@archiver.kernel.org>; Sat, 28 Mar 2020 23:34:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="D35QPX6T"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726604AbgC1Xeq (ORCPT
        <rfc822;linux-trace-users@archiver.kernel.org>);
        Sat, 28 Mar 2020 19:34:46 -0400
Received: from us-smtp-delivery-74.mimecast.com ([63.128.21.74]:46270 "EHLO
        us-smtp-delivery-74.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727199AbgC1Xeq (ORCPT
        <rfc822;linux-trace-users@vger.kernel.org>);
        Sat, 28 Mar 2020 19:34:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1585438484;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=EY8/01davzQFJYUUXZc+RlOf5oCqfut5KUxvUmfZ2fE=;
        b=D35QPX6TAuo365tseB8ibdXWKyna8WaXVj2fQXXM4tTp8LpUGoQ+8pIq4ui9PGbRFTJORS
        Vsu+qt+vT1IkVidL5IaSPSWa8K5CgXMkHna2eLdzEdodbniHTw20J26zKVQJBggZcnEQp1
        V2iXorx2T/9mfj/s81mSCSYWRE7HV6c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-278-JKMoIwMBMcmvG9ycUlbqWw-1; Sat, 28 Mar 2020 19:34:40 -0400
X-MC-Unique: JKMoIwMBMcmvG9ycUlbqWw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E5C3E8017CC;
        Sat, 28 Mar 2020 23:34:37 +0000 (UTC)
Received: from krava (unknown [10.40.192.75])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id 8DC1319C7F;
        Sat, 28 Mar 2020 23:34:33 +0000 (UTC)
Date:   Sun, 29 Mar 2020 00:34:31 +0100
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
        Changbin Du <changbin.du@intel.com>,
        Andi Kleen <ak@linux.intel.com>
Subject: Re: Wrong Perf Backtraces
Message-ID: <20200328233431.GB2155755@krava>
References: <20200326095928.GF1947699@krava>
 <243486883401862967ec2b06348c67f3@ut.ac.ir>
 <20200326153950.GG1947699@krava>
 <bf654a5cfe5a2a4188a286f1f5868e17@ut.ac.ir>
 <20200327092045.GH1947699@krava>
 <821540886fc57d7749edee585a50602f@ut.ac.ir>
 <decdc878b1bf207c68f1bc9e21178486@ut.ac.ir>
 <fd99185b401a451fdbf96439eadcb101@ut.ac.ir>
 <20200327223743.GA2155755@krava>
 <57b9e24200019a41bd465e2d78c09e29@ut.ac.ir>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <57b9e24200019a41bd465e2d78c09e29@ut.ac.ir>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Sender: linux-trace-users-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-trace-users.vger.kernel.org>
X-Mailing-List: linux-trace-users@vger.kernel.org

On Sat, Mar 28, 2020 at 03:42:53AM +0430, ahmadkhorrami wrote:
> Hi,
> Thanks. If you suggest the potentially bogus locations of the source code, I
> will give a try.
> Regards.

heya,
the change below 'fixes' it for me:

	$ perf script ...
	...
	evince 2220122 1605573.007639:      11759 cycles:u: 
		ffffffffaec012f0 [unknown] ([unknown])
		    7f93f17116b6 __mmap64+0x26 mmap64.c:59 (inlined)
		    7f93f17116b6 __mmap64+0x26 mmap64.c:47 (inlined)

it wasn't really broken, the output is just missing the source line
info in perf script callchain output, which adds the "missing part",
because for inlined entries the entry address stays the same for all
its inlined parts

could you try the change?

thanks,
jirka


diff --git a/tools/perf/util/evsel_fprintf.c b/tools/perf/util/evsel_fprintf.c
index 3b4842840db0..7349dfbbef2e 100644
--- a/tools/perf/util/evsel_fprintf.c
+++ b/tools/perf/util/evsel_fprintf.c
@@ -174,8 +174,11 @@ int sample__fprintf_callchain(struct perf_sample *sample, int left_alignment,
 			if (print_srcline)
 				printed += map__fprintf_srcline(map, addr, "\n  ", fp);
 
-			if (sym && sym->inlined)
+			if (sym && sym->inlined) {
+				if (node->srcline)
+					printed += fprintf(fp, " %s", node->srcline);
 				printed += fprintf(fp, " (inlined)");
+			}
 
 			if (!print_oneline)
 				printed += fprintf(fp, "\n");

