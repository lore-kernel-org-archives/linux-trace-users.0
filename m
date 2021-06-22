Return-Path: <linux-trace-users-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-26.3 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT,USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3AC0C49EA5
	for <linux-trace-users@archiver.kernel.org>; Tue, 22 Jun 2021 04:38:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 911E5611BF
	for <linux-trace-users@archiver.kernel.org>; Tue, 22 Jun 2021 04:38:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229817AbhFVEks (ORCPT
        <rfc822;linux-trace-users@archiver.kernel.org>);
        Tue, 22 Jun 2021 00:40:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51642 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229853AbhFVEkr (ORCPT
        <rfc822;linux-trace-users@vger.kernel.org>);
        Tue, 22 Jun 2021 00:40:47 -0400
Received: from mail-qv1-xf49.google.com (mail-qv1-xf49.google.com [IPv6:2607:f8b0:4864:20::f49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BFFFAC061756
        for <linux-trace-users@vger.kernel.org>; Mon, 21 Jun 2021 21:38:31 -0700 (PDT)
Received: by mail-qv1-xf49.google.com with SMTP id q20-20020a0cf5d40000b029027498137223so4496642qvm.15
        for <linux-trace-users@vger.kernel.org>; Mon, 21 Jun 2021 21:38:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=U/VtG6VE7zWrQke1C0jwUjUCh7PXfPilKdm/dVNjIos=;
        b=At3tjYzW+aFSYw1myhNWAaTNB303C9Gm+HrWCsXGtvwdOF+hwsoltElrV4tjYfmgOM
         0gTBEpF7oDWJQcIe37wsRjQUjH4WWgL4IYb2f/ACmGxHqKryZ4NcBQ+drJ0JA+ma3qj2
         W/a9SGjM+pKhArZaBKMaNNlZGp5gtNmKimXy61DDreny5u2kxK4qe0GQKyWTMd11TxFs
         k2hUOYSNu4DvOpOaFT+dvKs5oIeQIwQfvZ8u1WtNcyXKyCV+JnHwyEtTaF2nA2E0VO3e
         q1IUmQpxWhroj04rLGkjYqMS6pouxTxKBsR5AeoWO6qTyMeAedoKMNVn6MbrSXLBETBK
         iqLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=U/VtG6VE7zWrQke1C0jwUjUCh7PXfPilKdm/dVNjIos=;
        b=HqzPbLMt22vNaCVJS8+8YiIgxHGBh89kQgW9ZEZ3IL5QIvemR+0em9xVP42TwFspyQ
         VyZa52UK7p+vobllyWi7ryNSrhkDwhHepuOVCaNyUMm8kyrGNZNDMzhhqLpYwjhsbZRT
         y8KO6jm7ouM90GmubrlKR5x6m8R4XiIt5/0367PxPxzxUgJSdUXndopkFG5KcBmMSi2V
         G3H4cm6eHBA4BY4UuG6vcI0vcM/pL9e2nFft2M7GiKvlu/dfCQPUS79+y823cWgg/vM7
         bZqpPZrMtnxmYgB8UWgcmJSLjKVWFE0g2ccnpjZzptfnZkTDAFAsBVWGdYYL8OXjMfqf
         z7FA==
X-Gm-Message-State: AOAM530SRPSJPmGdIPQhApgs/lHf9Jijj3LrEwJkSC2vBBM8qhY9RXX9
        CY192Kl9d0lI1+MnpwzwpoGFbfb7/Lsy
X-Google-Smtp-Source: ABdhPJwduWsDu9nOn1wAVXUjgY9FmcJZlcoDsxFPK8CSVp1KqI55NfxIZsHalFp418moW6fMV41Bk7dDPhxf
X-Received: from irogers.svl.corp.google.com ([2620:15c:2cd:202:ffd6:b7f5:87ee:7be2])
 (user=irogers job=sendgmr) by 2002:a25:c045:: with SMTP id
 c66mr2293005ybf.296.1624336710873; Mon, 21 Jun 2021 21:38:30 -0700 (PDT)
Date:   Mon, 21 Jun 2021 21:38:11 -0700
In-Reply-To: <20210622043811.3108564-1-irogers@google.com>
Message-Id: <20210622043811.3108564-4-irogers@google.com>
Mime-Version: 1.0
References: <20210622043811.3108564-1-irogers@google.com>
X-Mailer: git-send-email 2.32.0.288.g62a8d224e6-goog
Subject: [PATCH 4/4] libtraceevent: Increase libtraceevent logging when verbose
From:   Ian Rogers <irogers@google.com>
To:     Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@redhat.com>,
        Arnaldo Carvalho de Melo <acme@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Jiri Olsa <jolsa@redhat.com>,
        Namhyung Kim <namhyung@kernel.org>,
        linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-trace-users@vger.kernel.org,
        Tzvetomir Stoyanov <tz.stoyanov@gmail.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Claire Jensen <cjense@google.com>
Cc:     eranian@google.com, Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-trace-users.vger.kernel.org>
X-Mailing-List: linux-trace-users@vger.kernel.org

libtraceevent has added more levels of debug printout and with changes
like:
https://lore.kernel.org/linux-trace-devel/20210507095022.1079364-3-tz.stoyanov@gmail.com
previously generated output like "registering plugin" is no longer
displayed. This change makes it so that if perf's verbose debug output
is enabled then the debug and info libtraceevent messages can be
displayed.
The code is conditionally enabled based on the libtraceevent version as
discussed in the RFC:
https://lore.kernel.org/lkml/20210610060643.595673-1-irogers@google.com/

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/debug.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/tools/perf/util/debug.c b/tools/perf/util/debug.c
index 2c06abf6dcd2..7e085d7cd8a9 100644
--- a/tools/perf/util/debug.c
+++ b/tools/perf/util/debug.c
@@ -24,6 +24,9 @@
 #include "util/parse-sublevel-options.h"
 
 #include <linux/ctype.h>
+#include <traceevent/event-parse.h>
+
+#define MAKE_LIBTRACEEVENT_VERSION(a, b, c) ((a)*255*255+(b)*255+(c))
 
 int verbose;
 int debug_peo_args;
@@ -228,6 +231,15 @@ int perf_debug_option(const char *str)
 	/* Allow only verbose value in range (0, 10), otherwise set 0. */
 	verbose = (verbose < 0) || (verbose > 10) ? 0 : verbose;
 
+#if MAKE_LIBTRACEEVENT_VERSION(1, 3, 0) <= LIBTRACEEVENT_VERSION
+	if (verbose == 1)
+		tep_set_loglevel(TEP_LOG_INFO);
+	else if (verbose == 2)
+		tep_set_loglevel(TEP_LOG_DEBUG);
+	else if (verbose >= 3)
+		tep_set_loglevel(TEP_LOG_ALL);
+#endif
+
 	return 0;
 }
 
-- 
2.32.0.288.g62a8d224e6-goog

