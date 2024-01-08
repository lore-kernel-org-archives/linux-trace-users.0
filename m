Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F8868F59
	for <linux-trace-users@vger.kernel.org>; Mon,  8 Jan 2024 04:16:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ac/wmE08"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-1d420aaa2abso4400765ad.3
        for <linux-trace-users@vger.kernel.org>; Sun, 07 Jan 2024 20:16:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704687410; x=1705292210; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=fkCNQZHhr0pnME3mEb10LmyBtROJh7URDWkTEIcpb50=;
        b=Ac/wmE08u6jcPJQpGmeI1DX7FGFm3RZ5oEQv8zAD3aj709JeIhK04AmQ+LAeE4+pho
         c4mOYHRRmVA6k+HrBtcun5wgcFXzBt/zMpcaB5zRXvH+yvjU1PQ042W8w6mREOjuxfo8
         TxNa7Wf0zMQZZksOPp83rxP+b/ddZ5RvDdvBRxb/O/NoIVDmoFjYXYpjU4xAop8OoqIF
         T+BPgV+4Xsg9JCpfK1AJbteFdchENFoNH9q/jinfvW8r4sZx4xsXt0ZXUvrIKBQ4QQ7n
         q/uX1CWQoI3EgdKM8O1CX+T3IbBoKfiDOK5ztFfNkWrV2KsAj5EqgvvTrObdNoATkgWP
         8cZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704687410; x=1705292210;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fkCNQZHhr0pnME3mEb10LmyBtROJh7URDWkTEIcpb50=;
        b=ortoJ52U34xoaVGi5b8AKRd7t86sdbeC5WT4+aJlnHt1edivZ+ce9lBmVBvtBtmq1l
         KxVak8Hw6L1AuHvIQfd25p833g65UUx2yr4mIpdw9b4t//r88HVue1y580kHNw2S0Kk1
         pJc8RXpvmWiARmQoqMVnqdoy8hGqk/Hall2aN7Mdw58ik0Vd9JAUTsQkjQRo+7xX6JoV
         u0GGHqG22nhd42jkrxDa0QyTHqFufHjWXGBPvYChmGroluLzbPi6I3udCL+H2UMXuRto
         7myhi390NPzMK20cM8n4vNdDXM+Aubiao2Gd8dZeX+heBbAu2beLKLe3XHvVcdfn6av7
         ccrQ==
X-Gm-Message-State: AOJu0YyA+SilpeRXDow/glFmNo8e+Q0HKC976pVgNQmi/kpe6ymW+cbb
	wQVOZyW4w8eZX6kg+4SXz24=
X-Google-Smtp-Source: AGHT+IHGZhv1yiQXkO1Pmg/lNicpzZ1O3ClPUYoSl6vYjBgiOSDPIgXtYj0gQw0Cg0Hlwu00m1nxtQ==
X-Received: by 2002:a17:902:aa87:b0:1d4:bd4a:df44 with SMTP id d7-20020a170902aa8700b001d4bd4adf44mr847823plr.14.1704687409627;
        Sun, 07 Jan 2024 20:16:49 -0800 (PST)
Received: from archlinux.. (c-98-210-194-148.hsd1.ca.comcast.net. [98.210.194.148])
        by smtp.gmail.com with ESMTPSA id m4-20020a170902bb8400b001d492055303sm5107351pls.279.2024.01.07.20.16.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jan 2024 20:16:49 -0800 (PST)
From: Namhyung Kim <namhyung@gmail.com>
To: uftrace@googlegroups.com,
	linux-trace-users@vger.kernel.org
Subject: [ANNOUNCE] uftrace v0.15 is released!
Date: Sun,  7 Jan 2024 20:16:47 -0800
Message-ID: <20240108041647.273711-1-namhyung@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-trace-users@vger.kernel.org
List-Id: <linux-trace-users.vger.kernel.org>
List-Subscribe: <mailto:linux-trace-users+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-trace-users+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello,

I'm pleased to announce a new release of uftrace v0.15.
You can get it from the below link:

  https://github.com/namhyung/uftrace/releases/tag/v0.15

This version adds experimental RISC-V (64 bit) archirecture support
as well as many bug fixes and improvements.

From now on, uftrace can trace functions of RV64G binaries compiled by
gcc/clang with appropriate options (-pg or -finstrument-functions).
Library functions are also traced and you can see the arguments and
return values too.  There are issues in argument handling, but library
functions should be fine.

For example, the following command shows library calls longer than 3
usec (with arguments and return values) in the `uname` command.

    $ uftrace --force -a -t 3us -- uname -m
    riscv64
    # DURATION     TID     FUNCTION
     263.004 us [138960] | strrchr("uname", '/') = "NULL";
      87.751 us [138960] | setlocale(LC_ALL, "") = "NULL";
       5.000 us [138960] | bindtextdomain("coreutils", "/usr/share/locale");
       4.000 us [138960] | getopt_long(2, 0x3fecdcf328, "asnrvmpio") = 109;
       4.000 us [138960] | uname();
       8.250 us [138960] | fputs_unlocked();
     443.257 us [138960] | __overflow();
       3.250 us [138960] | __fpending();
       4.500 us [138960] | fclose(&_IO_2_1_stdout_) = 0;

However dynamic tracing is not supported yet.  (It will come later!)

Another important change is in the kernel tracing.  As libtraceevent is
available on recent distros, the kernel tracing uses the system installed
library and drops the old copy in the uftrace source.  This should help
resolving possible future kernel issues and reduce the maintenance burden.

Also some distros build binaries without PLT and it can confuse uftrace
about the library call tracing.  It now detects the case by verifying
PLT entries not to miss library calls without it.

And of course, there are many more things.  Please refer to the github
page for details.  Thank you all for making uftrace more useful,
efficient and portable!

Namhyung
