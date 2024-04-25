Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BEA22232B
	for <linux-trace-users@vger.kernel.org>; Thu, 25 Apr 2024 04:02:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714017775; cv=none; b=ih4AqoCXSfckBzjXYGBXM1MS7DoSHEF92vr5mVMAK8EW+KWWVPBzQngPahcpocbuoHLTgNQDJKmrqcxeoPkUElrCKxkLgMUWAdXuwBBMdQmK3FX5OnwieS2305J2o+ebjuhwitIXllDuwjQgENMi1PG4EoVtf0XEEOExfhvkHe8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714017775; c=relaxed/simple;
	bh=bKLZljDA2+KoxgrSvdRni1T2uUSjZ470l818zRidwF8=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=VgYtG2nS+Fsy3hxuJ9JJKfaV6MVrfwZfVqC6CY3/lLyuXEOEKH+km+LHgI+RQRmNupkQuJreQA1rPDy2bZisLAHFcL7x31DBo3ZnSVZ7c8CilIIyTLQECFv55v9oovFMW7SF7wBs+KJmJH2aRVlk8l43+C9+cYdnrQ2XtkgV9Xc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QhBXNv69; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QhBXNv69"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-5d3907ff128so447181a12.3
        for <linux-trace-users@vger.kernel.org>; Wed, 24 Apr 2024 21:02:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714017774; x=1714622574; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=yEV34+91M5iXUxt8VNKLliQe8cOyAv3y65OeZ33M1X8=;
        b=QhBXNv694D8JVee7NAmOhQse3G8BGHqzxJmbroUNio/H0BBslDPdP7BJgj+1g0ufkV
         p3oESDHYzot7kiuicC0dfKEWk5Pw5/ljp8cDabdrVg8sTmC4Jj2EnMJ4sPypvnbhr9G4
         ypQ0/n1osslmSpwTQdhjc+mpnlT6Fu2yekHrCoXIbhLgYP4JP5d7IYVOsDp/EJ5Y+CYX
         m2Y8QIoXF8AUslXQ7Y2Yf1LFvV9qxkAzJvpwpPU07LBdy52OCAtRjlToItL5iaw6iefI
         phzn+oJD9WG+XzQtWJ3mgXdysR+3QqjgunhbEd9mYhsjNYLfxVmysgoL1/l0bMbFgK/1
         TgBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714017774; x=1714622574;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yEV34+91M5iXUxt8VNKLliQe8cOyAv3y65OeZ33M1X8=;
        b=bCWbVeNOTHJ+d5HnImF9HLaRu3ZPYJtLpJaFtZCWTCYCHoxcAoHQp5qXaj1EruwQ5w
         nQYg1J3g0tiwHXgbNCEc3Yvb0bf2va3zj8y3cwE/JCvF0KSpf4YMHaIs//0fEDoiPLmI
         rJcMMHEJHJ4nYRWl2I6gwAG6qbhvw6YXlvuLpgDnByvJHkLbzszcr+ZJvXd7nUnn7STj
         Z+NbsH9V6ptM6mHygda9kVcYTdQFV09isFRHkeWg3buQaHb98YQcoj7Fx+jYrBT9v1wA
         Fykx6mA8TbtywGngdzRtc0tWg0dKUrmj61BtjmVAMeGixAIubQachOuE+03Yp+xFGECg
         7yKg==
X-Forwarded-Encrypted: i=1; AJvYcCVpcCwhh+gnTpfZONFcOuMCwqTjsyktogqukcyDEq65Bf7dx3qDaWTUt4zTCM1yrStHhLhtOCv0sLiY3sOqiID3r8a2EdmX+HT1xEVFXLuRECE=
X-Gm-Message-State: AOJu0YwuweVGp+hCeFlyxscmE52a1EAzXvM9VNtFI/Zjq9dUIRS6aRKw
	OtTDJ+f0unIYzPwDVNaCZTAw3SD1z+dTXa9ft/eLKzHY7zoBpqixiLSr5w==
X-Google-Smtp-Source: AGHT+IGu0W24W0WOKbQ1ktFMO/ChjVoYLRg6zeKQbiIj7IKcbw38kfnM26PpScD6Ow7Uq1T4tjrNIw==
X-Received: by 2002:a17:90a:a417:b0:2ab:d82e:1afb with SMTP id y23-20020a17090aa41700b002abd82e1afbmr5016384pjp.16.1714017773407;
        Wed, 24 Apr 2024 21:02:53 -0700 (PDT)
Received: from bangji.hsd1.ca.comcast.net ([2601:647:4401:24f0:3983:a6ec:499b:9bb4])
        by smtp.gmail.com with ESMTPSA id y17-20020a17090322d100b001e5572a99c3sm12653671plg.207.2024.04.24.21.02.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Apr 2024 21:02:51 -0700 (PDT)
From: Namhyung Kim <namhyung@gmail.com>
To: uftrace@googlegroups.com,
	linux-trace-users@vger.kernel.org
Subject: [ANNOUNCE] uftrace v0.16 is released
Date: Wed, 24 Apr 2024 21:02:48 -0700
Message-ID: <20240425040248.1116810-1-namhyung@gmail.com>
X-Mailer: git-send-email 2.44.0.769.g3c40516874-goog
Precedence: bulk
X-Mailing-List: linux-trace-users@vger.kernel.org
List-Id: <linux-trace-users.vger.kernel.org>
List-Subscribe: <mailto:linux-trace-users+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-trace-users+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello,

I'm excited to announce that uftrace v0.16 is just released.
This release comes with many bug fixes and a few new features.
You can get it from the below link:

  https://github.com/namhyung/uftrace/releases/tag/v0.16

From now on, it supports reading symbol and debug information from the
separate debug files which are usually installed with debug packages.
This can be useful when you trace system binaries which may be stripped.

For example, you can only see library calls for such a binary.  Let's
trace pwd program which just prints the current directory name.

    $ nm /usr/bin/pwd
    nm: /usr/bin/pwd: no symbols

    $ uftrace pwd
    uftrace: /home/namhyung/project/uftrace/cmds/record.c:1677:check_binary
     ERROR: Can't find 'mcount' symbol in the '/usr/bin/pwd'.
	    It seems not to be compiled with -pg or -finstrument-functions flag.
	    You can rebuild your program with it or use -P option for dynamic tracing.

    $ uftrace -P. pwd
    /home/namhyung/tmp
    # DURATION     TID     FUNCTION
       3.156 us [955818] | getenv();
       0.739 us [955818] | strrchr();
     488.277 us [955818] | setlocale();
       1.372 us [955818] | bindtextdomain();
       0.886 us [955818] | textdomain();
       0.703 us [955818] | __cxa_atexit();
       5.760 us [955818] | getopt_long();
       5.014 us [955818] | getcwd();
      11.120 us [955818] | puts();
       0.597 us [955818] | free();
    ...

But if you install the debug package, it can see the symbols and enable
the dynamic tracing as well.

    $ sudo apt install coreutils-dbgsym

    $ uftrace -P. -F main pwd
    /home/namhyung/tmp
    # DURATION     TID     FUNCTION
                [955863] | main() {
       1.779 us [955863] |   getenv();
                [955863] |   set_program_name() {
       0.423 us [955863] |     strrchr();
       0.734 us [955863] |   } /* set_program_name */
     222.047 us [955863] |   setlocale();
       1.089 us [955863] |   bindtextdomain();
       0.461 us [955863] |   textdomain();
                [955863] |   atexit() {
       0.604 us [955863] |     __cxa_atexit();
       0.850 us [955863] |   } /* atexit */
       0.992 us [955863] |   getopt_long();
                [955863] |   xgetcwd() {
       1.337 us [955863] |     getcwd();
       1.668 us [955863] |   } /* xgetcwd */
       7.242 us [955863] |   puts();
       0.312 us [955863] |   free();
     240.040 us [955863] | } /* main */

The next change is to support octal format argument which is usally used
in the library functions dealing with filesystems.  It used to have a
predefined set of mode bits like 0755 and 0644 as an enum data type.  But
obviously it cannot support all combination and shows broken numbers for
them.  Now it works as expected with octal arguments.

    $ uftrace -F .*chmod.* -a -- chmod 747 myfile
    # DURATION     TID     FUNCTION
     173.103 us [963584] | fchmodat(-100, "myfile", 0747, 0) = 0;

Also `uftrace report` got two new output fields of (relative) standard
deviation for total and self time respectively.  It'll be added when one
of --avg-total or --avg-self option is used.

    $ uftrace report --avg-total
       Total avg   Total min   Total max  Total stdv  Function
      ==========  ==========  ==========  ==========  ====================
      671.447 us  671.447 us  671.447 us       0.00%  setlocale
       15.323 us   15.323 us   15.323 us       0.00%  puts
        8.458 us    8.458 us    8.458 us       0.00%  getopt_long
        7.044 us    7.044 us    7.044 us       0.00%  getcwd
        4.116 us    4.116 us    4.116 us       0.00%  getenv
        1.908 us    1.476 us    2.340 us      22.64%  fclose
        1.843 us    1.843 us    1.843 us       0.00%  bindtextdomain
        1.307 us    1.307 us    1.307 us       0.00%  __cxa_atexit
        1.294 us    1.294 us    1.294 us       0.00%  strrchr
        1.147 us    1.147 us    1.147 us       0.00%  textdomain
        0.980 us    0.980 us    0.980 us       0.00%  free
        0.734 us    0.251 us    1.217 us      65.80%  __fpending
        0.692 us    0.258 us    1.126 us      62.72%  fileno
        0.674 us    0.283 us    1.065 us      58.01%  fflush
        0.440 us    0.167 us    1.109 us      88.12%  __freading

There are also more fixes and improvements.  Notably it got big improvements
in Python tracing.  So it can now trace sizeable projects written in Python
thanks to bug fixes in the debug file handling and symbol management without
affecting GC.  Also there's a bug fix for library call tracing.

Thank you all for making uftrace more useful, efficient and portable!

Namhyung
