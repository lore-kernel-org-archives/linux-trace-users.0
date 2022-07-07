Return-Path: <linux-trace-users-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 740F0C433EF
	for <linux-trace-users@archiver.kernel.org>; Thu,  7 Jul 2022 12:15:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230187AbiGGMPt (ORCPT
        <rfc822;linux-trace-users@archiver.kernel.org>);
        Thu, 7 Jul 2022 08:15:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49878 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235194AbiGGMPs (ORCPT
        <rfc822;linux-trace-users@vger.kernel.org>);
        Thu, 7 Jul 2022 08:15:48 -0400
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 97EF216593
        for <linux-trace-users@vger.kernel.org>; Thu,  7 Jul 2022 05:15:47 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id 588562214A;
        Thu,  7 Jul 2022 12:15:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1657196146; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=9FLFdh/wa4zqEfPdQ/aNn2Q8kxm6OgFSlxZZnIHiRQc=;
        b=JaZg9E1C4uUXNdxxOGPjE7de0/pKnOqcaGvNUvE2/6+X65zHXEgwrck7XOnN8G2ogXjnBV
        nXPGUVFtDw+UHCU3uww72NaFD4m9jfCFDs4uXjWKqJfJh4GjL6NR9flY+8ukMRQT7BzLpu
        8tNWfP+v3dazPkXXwqnJG1m1CTKJTzo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1657196146;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=9FLFdh/wa4zqEfPdQ/aNn2Q8kxm6OgFSlxZZnIHiRQc=;
        b=U1nSrA+NQQDDPRa/B9/P+cYdbG9/FSKdR9j4y1yftRNv9pZ5FOX8vS1/ZkqXYbb2iqNaI5
        hEuucPVkV21nidBA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 4AEF913461;
        Thu,  7 Jul 2022 12:15:46 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id J2JJEnLOxmJxawAAMHmgww
        (envelope-from <dwagner@suse.de>); Thu, 07 Jul 2022 12:15:46 +0000
From:   Daniel Wagner <dwagner@suse.de>
To:     linux-trace-users@vger.kernel.org
Cc:     Daniel Wagner <dwagner@suse.de>
Subject: [RFC v1 2/2] libtracefs: Add initial support for meson
Date:   Thu,  7 Jul 2022 14:15:42 +0200
Message-Id: <20220707121542.28434-2-dwagner@suse.de>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220707121542.28434-1-dwagner@suse.de>
References: <20220707121542.28434-1-dwagner@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-trace-users.vger.kernel.org>
X-Mailing-List: linux-trace-users@vger.kernel.org

Add support for building the project with meson. It's not complete
yet, for example building and installing the documentation is missing.

The rest should work as expected. The only thing I was not really
clear what the purpose is the libtraceevent-dynamic-list which seems
not be used or installed. The meson build will also generate the file
but using the host nm and not the cross tool chain if any is used. I
didn't want to invest too much time figuring out this detail if it is
actually not used.

Obviously, meson is not make and there are some changes in how to use
this build system. The meson documentation is outstanding good and
usually has good tips and tricks to solve problems. But sure there is
learning curve but hopefully not so step.

Anyway, as pure user the build steps are (in source tree builds are
not supported):

  # configure using .build as build directory and install destination
  # /tmp/test
  meson .build --prefix=/tmp/test

  # trigger the build
  ninja -C .build

  # install the library
  ninja -C .build install

I am using an alias for 'ninja -C .build' which is called 'ni'. This
makes way more convenient to use.

Signed-off-by: Daniel Wagner <dwagner@suse.de>
---
 include/meson.build |  9 ++++++++
 meson.build         | 32 +++++++++++++++++++++++++++
 src/meson.build     | 53 +++++++++++++++++++++++++++++++++++++++++++++
 utest/meson.build   | 14 ++++++++++++
 4 files changed, 108 insertions(+)
 create mode 100644 include/meson.build
 create mode 100644 meson.build
 create mode 100644 src/meson.build
 create mode 100644 utest/meson.build

diff --git a/include/meson.build b/include/meson.build
new file mode 100644
index 000000000000..1bbfe8afb280
--- /dev/null
+++ b/include/meson.build
@@ -0,0 +1,9 @@
+# SPDX-License-Identifier: LGPL-2.1
+
+headers = [
+   'tracefs.h',
+]
+
+foreach h : headers
+	install_headers(h, subdir : 'libtracefs')
+endforeach
diff --git a/meson.build b/meson.build
new file mode 100644
index 000000000000..2138d2f149f1
--- /dev/null
+++ b/meson.build
@@ -0,0 +1,32 @@
+# SPDX-License-Identifier: LGPL-2.1
+
+project(
+    'libtracefs', ['c'],
+    meson_version: '>= 0.47.0',
+    license: 'LGPL-2.1',
+    version: '1.4.0',
+    default_options: [
+      'c_std=gnu99',
+      'buildtype=release',
+      'prefix=/usr',
+      'warning_level=1',
+    ]
+)
+
+library_version = meson.project_version()
+
+libtraceevent_dep = dependency('libtraceevent', required: true)
+cunit_dep = dependency('cunit', required : false)
+
+add_project_arguments(
+    [
+      '-D_GNU_SOURCE',
+    ],
+    language : 'c',
+)
+
+incdir = include_directories(['include'])
+
+subdir('src')
+subdir('include')
+subdir('utest')
diff --git a/src/meson.build b/src/meson.build
new file mode 100644
index 000000000000..36d3be359fae
--- /dev/null
+++ b/src/meson.build
@@ -0,0 +1,53 @@
+# SPDX-License-Identifier: LGPL-2.1
+
+sources= [
+   'tracefs-dynevents.c',
+   'tracefs-eprobes.c',
+   'tracefs-events.c',
+   'tracefs-filter.c',
+   'tracefs-hist.c',
+   'tracefs-instance.c',
+   'tracefs-kprobes.c',
+   'tracefs-marker.c',
+   'tracefs-sqlhist.c',
+   'tracefs-tools.c',
+   'tracefs-uprobes.c',
+   'tracefs-utils.c',
+]
+
+flex = find_program('flex', required: true)
+bison = find_program('bison', required: true)
+
+lgen = generator(flex,
+output : '@PLAINNAME@.yy.c',
+arguments : ['-o', '@OUTPUT@', '@INPUT@'])
+
+pgen = generator(bison,
+output : ['@BASENAME@.tab.c', '@BASENAME@.tab.h'],
+arguments : ['@INPUT@', '--defines=@OUTPUT1@', '--output=@OUTPUT0@'])
+
+lfiles = lgen.process('sqlhist.l')
+pfiles = pgen.process('sqlhist.y')
+
+libtracefs = library(
+    'tracefs',
+    sources, lfiles, pfiles,
+    version: library_version,
+    dependencies: [libtraceevent_dep],
+    include_directories: [incdir],
+    install: true,
+)
+
+pkg = import('pkgconfig')
+pkg.generate(libtracefs,
+    filebase: meson.project_name(),
+    name: meson.project_name(),
+    version: meson.project_version(),
+    description: 'Manage trace fs',
+    url: 'https://git.kernel.org/pub/scm/libs/libtrace/libtracefs.git/',
+)
+
+libtracefs_dep = declare_dependency(
+    include_directories: ['.'],
+    link_with: libtracefs,
+)
diff --git a/utest/meson.build b/utest/meson.build
new file mode 100644
index 000000000000..07058afb5f9b
--- /dev/null
+++ b/utest/meson.build
@@ -0,0 +1,14 @@
+# SPDX-License-Identifier: LGPL-2.1
+
+source = [
+    'trace-utest.c',
+    'tracefs-utest.c',
+]
+
+e = executable(
+   'trace-utest',
+   source,
+   include_directories: [incdir],
+   dependencies: [libtracefs_dep, libtraceevent_dep, cunit_dep])
+
+test('trace-utest', e)
-- 
2.36.1

