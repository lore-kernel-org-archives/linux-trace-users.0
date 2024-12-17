Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6850B1E0493
	for <linux-trace-users@vger.kernel.org>; Tue, 17 Dec 2024 06:45:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734417926; cv=none; b=rV1GCio2EfbCAudJx4mbmWm8Whngt/LlUpXmjel8jR2GB7lsjt/DZ22HXKe/+f+bHtjkfPaxxLpAbCAu88pbMytjaqWaFyGAgnFUj/sxSlPGUqIEybNnCan33RtCzOVUfa4Efwftidf6k14U9HcwUyFTG/YNJVil8K2mRXJfjoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734417926; c=relaxed/simple;
	bh=00bWWcycGrAS8onLrsu/vtkfqW9/2cxZ0E/HMcl5dOk=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=Ru3NsedhSyWNBNfJsNFa2mLbCtoQXTb/bQXn05KrrNjOkuFvtZdVZoV+CR7P7gD/jSkL1A8SoZL2+OxzlVqzq5iaX/KpOJeiU/XDHlizoibzjTagcCffZG0WwtSN4vZ759sTwY75QCNQsFV+c/jai6QMXghQidf71vksAUJFz6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GnpwprXq; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GnpwprXq"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-21644aca3a0so58156575ad.3
        for <linux-trace-users@vger.kernel.org>; Mon, 16 Dec 2024 22:45:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734417923; x=1735022723; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=jaZF1glgFX0ZBKTHQJi79G9lbWZGzwa7YpOhtJh5u5Q=;
        b=GnpwprXqZyL0lC1d/IidzsnjfsAKiXfYJO+zsjuyVRyBttincgkbg7VmZBiAk82Cyu
         tLIF5nMGYGTpzYXxlUZ+Dfxt8sGABLa3YkbfJUzC6eTPyJj7oqi8hW0Ih0GAQB89ozcj
         66tQd/CBE4TpXXCdHvwBjFZgB8SJdcG6PyJLKCViWRf8FO5Iw/WW44dyzH9iM3r2CWZt
         aCEjOo4U9tXVsa024jDMsoew/4sqkCEjK8eBGdZV4pmHGN9gVfTkPFML8TyZtv9zgpMT
         QV2+PI7cMyBvdlpzdo6YPkySWPLAA0B6VyiFsjd6XGnYgWMw4BPLrDC9upz97t2e1yfF
         d2UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734417923; x=1735022723;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jaZF1glgFX0ZBKTHQJi79G9lbWZGzwa7YpOhtJh5u5Q=;
        b=hAi7aFG94vZ9Y9GZgfmhT5ba1PmeB/l0IA1/y/vfBxUHxLO6oVSMvLuFQqAnD5KPrU
         HDAqRbBJjDX9IY5GDxykf6iZBYjiJuI/axMzeFIENTKXGPt2mGo7/yShYS66iVKiKxZf
         gFdOyi5Kb09uCkRiDOEqwoDPL84aOcSOx3IFDyHMYHB4+I56KeuV9Soc+VYrCK95taSY
         BS+fK5+JyIdWq9m7S4IFLxFFpxEFaEu59D7n57EoOCsUMwjQaXJ5LQLF3j5wkERiVLA6
         tQTkdDLbbv/um41gCqg9ncmCf3GSf1FqXmYYMIo5uUtOeQvWTm/OpTtu0ZgcmurUiiwT
         bxMg==
X-Forwarded-Encrypted: i=1; AJvYcCUCgFMCV5t9pGCU+kveTaB5J9VySb68lP58kmQZZEnT307S9HX635cuuma4MeogHgMHXIl4fwuEWRHqZ7euXNCD5w==@vger.kernel.org
X-Gm-Message-State: AOJu0YxSflKUZnEnxpqCtWP4eYOUYpv5N021cVp3aSZD+mNA7NFgkuKz
	jTH2hTvXOHDElw7luBRFe2rmI13mk+KzfBHoyqyMoDgNY7UxpLH+x6JXug==
X-Gm-Gg: ASbGncvBWjAbpZ60LIXBis690yFZ9zvUnICAbD1BEv8MLiRywJ2nF4sIgiDrl62eou1
	+RrlwjxzXK89N20gWXA6gKnakSSPKiMPp8EXHDSM30yGygMML7yukD1lVYkosgAprarHMWP0uKx
	x2rOxEVTBSilTwNdfTCX/DxfZKhLYszxOClt0Sh5yKEi2Xiz/8Hl09lpz5zN4nEv3Kvkn9fwF5O
	5Xs249I+AAdesjIfAkY45isWG7n7EPrHeNOGDINIwEXciIXG8SBr7hjGMfqGEKfSXZCdQHWTFSZ
	Qg==
X-Google-Smtp-Source: AGHT+IHPmll+Z8CRBty+HmjuXNlv00XJJi9G8OuJ2WjkIih1hSwT/DyDof8V0IH6udeey+QQhlMDwA==
X-Received: by 2002:a17:902:f690:b0:215:8695:ef91 with SMTP id d9443c01a7336-21892981749mr203462295ad.6.1734417923420;
        Mon, 16 Dec 2024 22:45:23 -0800 (PST)
Received: from bangji.hsd1.ca.comcast.net ([2601:647:4401:2cb0:5035:16c1:909a:945d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-218a1e5424bsm52584715ad.138.2024.12.16.22.45.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Dec 2024 22:45:22 -0800 (PST)
From: Namhyung Kim <namhyung@gmail.com>
To: uftrace@googlegroups.com,
	linux-trace-users@vger.kernel.org
Subject: [ANNOUNCE] uftrace v0.17 is released
Date: Mon, 16 Dec 2024 22:45:21 -0800
Message-ID: <20241217064521.2742124-1-namhyung@gmail.com>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Precedence: bulk
X-Mailing-List: linux-trace-users@vger.kernel.org
List-Id: <linux-trace-users.vger.kernel.org>
List-Subscribe: <mailto:linux-trace-users+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-trace-users+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello,

I'm excited to announce that uftrace v0.17 is just released.
This release comes with many bug fixes and a few new features.
You can get it from the below link:

  https://github.com/namhyung/uftrace/releases/tag/v0.17

One notable change is the watchpoint support for global variables.
This is still very limited but users can track changes of the given
variable at the entry and the exit of each function.  Please keep in
mind that it doesn't use hardware debug registers and checks the value
in softwawre.  Currently it can only handle integer types.

This is an example output of trivial test program called 'watchy'
which changes a variable called 'global' multiple times.

    $ uftrace -W var:global ./watchy
    # DURATION     TID      FUNCTION
                [2736290] | main() {
                [2736290] |   /* watch:var (global=1) */
                [2736290] |   foo() {
                [2736290] |     /* watch:var (global=2) */
                [2736290] |     bar() {
                [2736290] |       /* watch:var (global=3) */
       0.142 us [2736290] |     } /* bar */
                [2736290] |     /* watch:var (global=4) */
       3.523 us [2736290] |   } /* foo */
                [2736290] |   /* watch:var (global=5) */
      24.555 us [2736290] | } /* main */

Another important improvement is the dlopen support.  From now on, it
can capture arguments and return values as well as other debug info such
as srcline.

The below test program opens two libraries with dlopen(3) and calls
functions in them.  The lib_[abc] and foo are from the libraries and you
can see the arguments the source code information.

    $ uftrace -a --srcline ./t-dlopen 
    # DURATION     TID      FUNCTION [SOURCE]
       0.747 us [2737082] | __monstartup();
       0.374 us [2737082] | __cxa_atexit();
                [2737082] | main(1, 0x7ffed8abe788) { /* s-dlopen.c:5 */
                [2737082] |   dlopen("./libabc_test_lib.so", RTLD_LAZY) {
       1.000  s [2737082] |     /* linux:schedule */
       1.004  s [2737082] |   } = 0x55eb7cb474c0; /* dlopen */
      11.505 us [2737082] |   dlsym(0x55eb7cb474c0, "lib_a") = &lib_a;
                [2737082] |   lib_a(1) { /* s-lib.c:10 */
                [2737082] |     lib_b(2) { /* s-lib.c:15 */
       4.867 us [2737082] |       lib_c(1) = 0; /* s-lib.c:20 */
       6.624 us [2737082] |     } = 1; /* lib_b */
       7.875 us [2737082] |   } = 0; /* lib_a */
      98.767 us [2737082] |   dlclose(0x55eb7cb474c0) = 0;
                [2737082] |   dlopen("./libfoo.so", RTLD_LAZY) {
       1.000  s [2737082] |     /* linux:schedule */
       1.015  s [2737082] |   } = 0x55eb7cb474c0; /* dlopen */
       9.467 us [2737082] |   dlsym(0x55eb7cb474c0, "foo") = &foo;
                [2737082] |   foo(1) { /* s-libfoo.cpp:12 */
       0.285 us [2737082] |     AAA::bar(1);
       5.261 us [2737082] |   } /* foo */
      95.406 us [2737082] |   dlclose(0x55eb7cb474c0) = 0;
       2.020  s [2737082] | } = 0; /* main */

But this also comes with a cost.  Now it needs to exchange the internal
data structure to track arguments and others when dlopen is called.  For
now it needs to wait for 1 second before releasing the old one.

Thank you all for making uftrace more useful, efficient and portable!

Namhyung
