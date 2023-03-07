Return-Path: <linux-trace-users-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21F89C6FD1E
	for <linux-trace-users@archiver.kernel.org>; Tue,  7 Mar 2023 22:43:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229636AbjCGWnS (ORCPT
        <rfc822;linux-trace-users@archiver.kernel.org>);
        Tue, 7 Mar 2023 17:43:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49024 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229646AbjCGWmr (ORCPT
        <rfc822;linux-trace-users@vger.kernel.org>);
        Tue, 7 Mar 2023 17:42:47 -0500
Received: from mx1.riseup.net (mx1.riseup.net [198.252.153.129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24185B328D
        for <linux-trace-users@vger.kernel.org>; Tue,  7 Mar 2023 14:42:07 -0800 (PST)
Received: from fews2.riseup.net (fews2-pn.riseup.net [10.0.1.84])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
         client-signature RSA-PSS (2048 bits) client-digest SHA256)
        (Client CN "mail.riseup.net", Issuer "R3" (not verified))
        by mx1.riseup.net (Postfix) with ESMTPS id 4PWVn85brvzDrQQ
        for <linux-trace-users@vger.kernel.org>; Tue,  7 Mar 2023 22:42:04 +0000 (UTC)
X-Riseup-User-ID: DEDEDA06DAC34FE421519CD02BC5CE56B62FEA42E324EE3BE9C7267FD09FEC67
Received: from [127.0.0.1] (localhost [127.0.0.1])
         by fews2.riseup.net (Postfix) with ESMTPSA id 4PWVn81kCdz1y7V
        for <linux-trace-users@vger.kernel.org>; Tue,  7 Mar 2023 22:42:04 +0000 (UTC)
Message-ID: <9fb46232-824f-f0a5-5468-ee7240811719@ubuntu.com>
Date:   Tue, 7 Mar 2023 19:42:02 -0300
MIME-Version: 1.0
Content-Language: en-US
To:     linux-trace-users@vger.kernel.org
Reply-To: kanashiro@ubuntu.com
From:   Lucas Kanashiro <kanashiro@ubuntu.com>
Subject: [PATCH] libtraceevent: fix make test on big endian architectures
Organization: Ubuntu
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-trace-users.vger.kernel.org>
X-Mailing-List: linux-trace-users@vger.kernel.org

The make test command is failing on big endian architectures, the 
following was identified on s390x:

	make -j1 test
make[1]: Entering directory '/<<PKGBUILDDIR>>'
   DESCEND            src libtraceevent.a
   BUILD STATIC LIB   libtraceevent.a
   DESCEND            utest test
   COMPILE FPIC       trace-utest.o
   COMPILE FPIC       traceevent-utest.o
traceevent-utest.c:50:41: error: expected ‘}’ before numeric constant
    50 |         /* common flags */              0x00,
       |                                         ^~~~
traceevent-utest.c:44:30: note: to match this ‘{’
    44 | static char dyn_str_data[] = {
       |                              ^
traceevent-utest.c:87:41: error: expected ‘}’ before numeric constant
    87 |         /* common flags */              0x00,
       |                                         ^~~~
traceevent-utest.c:81:34: note: to match this ‘{’
    81 | static char dyn_str_old_data[] = {
       |                                  ^
traceevent-utest.c:171:41: error: expected ‘}’ before numeric constant
   171 |         /* common flags */              0x00,
       |                                         ^~~~
traceevent-utest.c:165:29: note: to match this ‘{’
   165 | static char sizeof_data[] = {
       |                             ^
make[2]: *** [Makefile:25: /<<PKGBUILDDIR>>/utest/traceevent-utest.o] Error 1
make[1]: *** [Makefile:258: test] Error 2

The proposed patch fixes this issue.

 From fc37d22dd26a77a26d4268097bb4ebe464b892c9 Mon Sep 17 00:00:00 2001
From: Lucas Kanashiro <lucas.kanashiro@canonical.com>
Date: Tue, 7 Mar 2023 19:03:17 -0300
Subject: [PATCH] utest/traceevent-utest.c: fix array definition in big 
endian
  arches

A comma is missing in the definition of the array values.

diff --git a/utest/traceevent-utest.c b/utest/traceevent-utest.c
index ebd5eb9..041843e 100644
--- a/utest/traceevent-utest.c
+++ b/utest/traceevent-utest.c
@@ -45,7 +45,7 @@ static char dyn_str_data[] = {
  #if __BYTE_ORDER__ == __ORDER_LITTLE_ENDIAN__
      /* common type */        1, 0x00,
  #else
-    /* common type */        0x00, 1
+    /* common type */        0x00, 1,
  #endif
      /* common flags */        0x00,
      /* common_preempt_count */    0x00,
@@ -82,7 +82,7 @@ static char dyn_str_old_data[] = {
  #if __BYTE_ORDER__ == __ORDER_LITTLE_ENDIAN__
      /* common type */        2, 0x00,
  #else
-    /* common type */        0x00, 2
+    /* common type */        0x00, 2,
  #endif
      /* common flags */        0x00,
      /* common_preempt_count */    0x00,
@@ -166,7 +166,7 @@ static char sizeof_data[] = {
  #if __BYTE_ORDER__ == __ORDER_LITTLE_ENDIAN__
      /* common type */        23, 0x00,
  #else
-    /* common type */        0x00, 23
+    /* common type */        0x00, 23,
  #endif
      /* common flags */        0x00,
      /* common_preempt_count */    0x00,
-- 
2.25.1



