Return-Path: <SRS0=Bv4Z=5P=vger.kernel.org=linux-trace-users-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C279DC43331
	for <linux-trace-users@archiver.kernel.org>; Mon, 30 Mar 2020 21:05:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8E40C20774
	for <linux-trace-users@archiver.kernel.org>; Mon, 30 Mar 2020 21:05:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="UuqMAO8P"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728317AbgC3VFq (ORCPT
        <rfc822;linux-trace-users@archiver.kernel.org>);
        Mon, 30 Mar 2020 17:05:46 -0400
Received: from us-smtp-delivery-74.mimecast.com ([216.205.24.74]:48477 "EHLO
        us-smtp-delivery-74.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728754AbgC3VFq (ORCPT
        <rfc822;linux-trace-users@vger.kernel.org>);
        Mon, 30 Mar 2020 17:05:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1585602344;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=RPaaR21KW8eV7v7SJEOwA6A2sv2a417FWPgwl15SqU8=;
        b=UuqMAO8P8hRxcxnuXVUiev2hkxITSnZf/muX5kwVqNnIMw9mtXV7PEudqpAIQfuaxbzaIm
        TYqNCrxrCDPBx9Z2LzwDf/46ReZeOCduCQF66k2ucU1+8yOJxDR/dus5xc4ogBYrxY/lsX
        PxBQsffD44MtbqjskUtF4qrcPtIGsY0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-245-BugHy0O8MTmdiNWBURxy4A-1; Mon, 30 Mar 2020 17:05:40 -0400
X-MC-Unique: BugHy0O8MTmdiNWBURxy4A-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5B0791005509;
        Mon, 30 Mar 2020 21:05:38 +0000 (UTC)
Received: from redhat.com (ovpn-112-181.phx2.redhat.com [10.3.112.181])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id 92BB45DA66;
        Mon, 30 Mar 2020 21:05:37 +0000 (UTC)
Received: from fche by redhat.com with local (Exim 4.92.3)
        (envelope-from <fche@redhat.com>)
        id 1jJ1bC-0002X0-P1; Mon, 30 Mar 2020 17:05:34 -0400
Date:   Mon, 30 Mar 2020 17:05:34 -0400
From:   "Frank Ch. Eigler" <fche@redhat.com>
To:     ahmadkhorrami <ahmadkhorrami@ut.ac.ir>
Cc:     Jiri Olsa <jolsa@redhat.com>, Milian Wolff <milian.wolff@kdab.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Arnaldo Carvalho de Melo <acme@redhat.com>,
        Linux-trace Users <linux-trace-users@vger.kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        linux-trace-users-owner@vger.kernel.org,
        Jin Yao <yao.jin@linux.intel.com>,
        Namhyung Kim <namhyung@kernel.org>,
        Andi Kleen <ak@linux.intel.com>
Subject: debuginfod-based dwarf downloading, was Re: Wrong Perf Backtraces
Message-ID: <20200330210534.GC7303@redhat.com>
References: <821540886fc57d7749edee585a50602f@ut.ac.ir>
 <1867036.PIDvDuAF1L@agathebauer>
 <20200329192010.GA2361248@krava>
 <2522580.mvXUDI8C0e@agathebauer>
 <20200330130750.GC2361248@krava>
 <e51e7fc0bed5e79f5e7774fcd5389c3d@ut.ac.ir>
 <8cb4f94b11fbac6ca3a44b924b6ee7b3@ut.ac.ir>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8cb4f94b11fbac6ca3a44b924b6ee7b3@ut.ac.ir>
User-Agent: Mutt/1.12.0 (2019-05-25)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Sender: linux-trace-users-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-trace-users.vger.kernel.org>
X-Mailing-List: linux-trace-users@vger.kernel.org

Hi -

I was reminded by the thread that debuginfo downloading for perf is
worth automating more.  Since perf uses elfutils, recently-added
facilities to elfutils 0.178 (2019-11) already allow automated
downloading from some perf code paths.  The following patch [2] builds
a little bit on that by ensuring that the downloaded debuginfo is
plopped into the $HOME/.debug/ hierarchy explicitly, and should cover
a few more code paths.  Feel free to take / adapt this code as you
like.

debuginfod can also do source code downloading on the fly, but the
perf/util/srccode.c machinery would need buildids passed, and I
couldn't quickly figure it out.  (Sorry, I also couldn't quickly
figure out the perf testsuite.)

[1] https://sourceware.org/elfutils/Debuginfod.html

[2]

Author: Frank Ch. Eigler <fche@redhat.com>
Date:   Mon Mar 30 16:15:47 2020 -0400

    perf build-ids: fall back to debuginfod query if debuginfo not found
    
    During a perf-record, use the -ldebuginfod API to query a debuginfod
    server, should the debug data not be found in the usual system
    locations.  If successful, the usual $HOME/.debug dir is populated.
    
    Signed-off-by: Frank Ch. Eigler <fche@redhat.com>

diff --git a/tools/build/Makefile.feature b/tools/build/Makefile.feature
index 574c2e0b9d20..51e051858d21 100644
--- a/tools/build/Makefile.feature
+++ b/tools/build/Makefile.feature
@@ -48,6 +48,7 @@ FEATURE_TESTS_BASIC :=                  \
         libelf-gelf_getnote             \
         libelf-getshdrstrndx            \
         libelf-mmap                     \
+        libdebuginfod                   \
         libnuma                         \
         numa_num_possible_cpus          \
         libperl                         \
@@ -114,6 +115,7 @@ FEATURE_DISPLAY ?=              \
          libbfd                 \
          libcap                 \
          libelf                 \
+         libdebuginfod          \
          libnuma                \
          numa_num_possible_cpus \
          libperl                \
diff --git a/tools/build/feature/Makefile b/tools/build/feature/Makefile
index 7ac0d8088565..1109f5ec96f7 100644
--- a/tools/build/feature/Makefile
+++ b/tools/build/feature/Makefile
@@ -26,6 +26,7 @@ FILES=                                          \
          test-libelf-gelf_getnote.bin           \
          test-libelf-getshdrstrndx.bin          \
          test-libelf-mmap.bin                   \
+         test-libdebuginfod.bin                 \
          test-libnuma.bin                       \
          test-numa_num_possible_cpus.bin        \
          test-libperl.bin                       \
@@ -155,6 +156,9 @@ endif
 $(OUTPUT)test-libelf-getshdrstrndx.bin:
 	$(BUILD) -lelf
 
+$(OUTPUT)test-libdebuginfod.bin:
+	$(BUILD) -ldebuginfod
+
 $(OUTPUT)test-libnuma.bin:
 	$(BUILD) -lnuma
 
diff --git a/tools/perf/Makefile.config b/tools/perf/Makefile.config
index 80e55e796be9..15eeecf4ff17 100644
--- a/tools/perf/Makefile.config
+++ b/tools/perf/Makefile.config
@@ -467,6 +467,11 @@ ifndef NO_LIBELF
     CFLAGS += -DHAVE_ELF_GETSHDRSTRNDX_SUPPORT
   endif
 
+  ifeq ($(feature-libdebuginfod), 1)
+    CFLAGS += -DHAVE_DEBUGINFOD_SUPPORT
+    EXTLIBS += -ldebuginfod
+  endif
+
   ifndef NO_DWARF
     ifeq ($(origin PERF_HAVE_DWARF_REGS), undefined)
       msg := $(warning DWARF register mappings have not been defined for architecture $(SRCARCH), DWARF support disabled);
diff --git a/tools/perf/util/build-id.c b/tools/perf/util/build-id.c
index c076fc7fe025..a33d00837d81 100644
--- a/tools/perf/util/build-id.c
+++ b/tools/perf/util/build-id.c
@@ -31,6 +31,10 @@
 #include "probe-file.h"
 #include "strlist.h"
 
+#if HAVE_DEBUGINFOD_SUPPORT
+#include <elfutils/debuginfod.h>
+#endif
+
 #include <linux/ctype.h>
 #include <linux/zalloc.h>
 
@@ -636,6 +640,21 @@ static char *build_id_cache__find_debug(const char *sbuild_id,
 	if (realname && access(realname, R_OK))
 		zfree(&realname);
 	nsinfo__mountns_exit(&nsc);
+
+#if HAVE_DEBUGINFOD_SUPPORT
+        if (realname == NULL) {
+                debuginfod_client* c = debuginfod_begin();
+                if (c != NULL) {
+                        int fd = debuginfod_find_debuginfo(c,
+                                                           (const unsigned char*)sbuild_id, 0,
+                                                           &realname);
+                        if (fd >= 0)
+                                close(fd); /* retaining reference by realname */
+                        debuginfod_end(c);
+                }
+        }
+#endif
+
 out:
 	free(debugfile);
 	return realname;

