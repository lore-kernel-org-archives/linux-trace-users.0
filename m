Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com [209.85.161.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E647E1F171
	for <linux-trace-users@vger.kernel.org>; Tue, 30 Apr 2024 13:41:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714484512; cv=none; b=nqF3yvL3eu+wbHyUG7zFBTx7dbzcqfpyK29wMpLwlzMh9pgnr3lqmgCIxNwDgl+NU42I89PZo72lNJNRfm4tJGd72Z59tfA1WSr6fApXRswJA2g2diy0WNGpAwHRtDLk+0QzmizYtpQY9y9YgciyaBmRb+tRmIZA2l+pSE8eYcQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714484512; c=relaxed/simple;
	bh=FH54Fy0OMce1xkNPgdmVJYsiyCBhEw/lanuTEVfRg1A=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=cH5t45k9GIfeB5suL5iNHpLmKE4YR9QrfTPVoteYicggdZn/dXbK+tTMVuUAbZ7txC6Wf51541H5Yp0gfwknkZVwau3MLGIs9PmsLlowu/YdkUbH95OYjEjY9dMOwUX87bqQJUw36a4Cwo5kBQ88QNzWhCv9VkjRBT+/KuN5LxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kWlCuAbv; arc=none smtp.client-ip=209.85.161.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kWlCuAbv"
Received: by mail-oo1-f49.google.com with SMTP id 006d021491bc7-5ac90ad396dso3101154eaf.3
        for <linux-trace-users@vger.kernel.org>; Tue, 30 Apr 2024 06:41:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714484510; x=1715089310; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=vUZTZ/02Lxat+FVbTqHeQrDEZzYLJJrYIJLWI61Q2mo=;
        b=kWlCuAbvOzz9AAG18u2c5bFZz7wuc9hFTWetz94Ag/tfhQTrEhiKTtCReBrEr6c9Ya
         fLQZjxFLtvrJSBe+W1YZ2VlujtR7VIaOPe0HQVJvb5kKYOwzhw6qcPuxOuJ3iQyV9DBZ
         WHy9lq04MOsDL3JesoozDqI5hw2RvYRMWCHcT6W2ekre06gPw52/do20F8YAd9vYZKKa
         7FsdqBazopk8oCFjEEvXMw/P9mB40B+vaF4Mbpcg3Sp50H/NYUwE92DWRGUaREQCLDKN
         bEpgLPRvPZMbC9H50DrvFtcUeE3IpJ8aVBVA+VKLrJKmuazwRWU8eYNpHJNGXvz9bK3h
         L0LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714484510; x=1715089310;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vUZTZ/02Lxat+FVbTqHeQrDEZzYLJJrYIJLWI61Q2mo=;
        b=k6gcR2tiIvn6GlMLBiRtpjDjw3aSuADopRpnL1BW4jpYFAzPMBM2E/7h2Pc3kX7QiJ
         tK1BlssHLtzYIXPdlaU4N+cQLCbyrRu/0vKZ0Gd9Te1UUnJ5Kshcd2bG0ieGonEDk3GB
         2VI72nCu0OMVMf75l9BVJMMoyN349FDX6G1QI5wqtsOd5joaK8oiePYG1GqfFG7U49Jy
         jAllQ5/Bn0XxNSS7bcXv5n/ri0VPMbA216gGrZk2S2hqgSfJXGCOI9R4CBiv3w0AXCQ8
         rm5hZxR/VBpz7PkzQrrE89Aon0MUEKR1TXociUfcujzpJDubstp+2U/5xMOUX+Hvv0/i
         94Tw==
X-Gm-Message-State: AOJu0Ywt9qFBpIOc2kB/n1M3/UBrPIm5qPDMsZc5P0g3inrBJvGEKIVV
	Hwxk9Pf/T1mwQBlSK2JAbekT8a+q3UE1hrqg8P99JEsCCS4M0S3ggHYLDKfbMkJ63TNMQyGFUz6
	KYGGYP7nQyfFGFjrSNunsx8XbHiPiyiZS
X-Google-Smtp-Source: AGHT+IEgU+ydLE76vKp3/R0WThjJweu3hAhZl1sulJfoJ7vpWBjwLNJHNwiwwiFsHLUBqPPS7xFqjRsc6qoDLyaibjc=
X-Received: by 2002:a4a:ae8d:0:b0:5ac:9f37:3ef4 with SMTP id
 u13-20020a4aae8d000000b005ac9f373ef4mr16686214oon.4.1714484509884; Tue, 30
 Apr 2024 06:41:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-trace-users@vger.kernel.org
List-Id: <linux-trace-users.vger.kernel.org>
List-Subscribe: <mailto:linux-trace-users+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-trace-users+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: David Aldrich <david.aldrich.ntml@gmail.com>
Date: Tue, 30 Apr 2024 14:41:39 +0100
Message-ID: <CAJK_ieiBK5OSxAfXK=wuDpiuEBA0Oj++oRSW29SrrUkPpt6TtQ@mail.gmail.com>
Subject: Cannot build KernelShark on Ubuntu 22.04
To: linux-trace-users@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi

Working on WSL with Ubuntu 22.04 LTS, I am unable to build
KernelShark. I will try installing it as a package, but perhaps my
experience below will be useful for the project.

I cloned KernelShark:

git clone git://git.kernel.org/pub/scm/utils/trace-cmd/kernel-shark.git

I followed the instructions at:

https://kernelshark.org/build.html

which requires:

sudo apt-get install qtbase5-dev -y

When I attempt to build KernelShark with:

cmake ../

I see:

CMake Warning at CMakeLists.txt:76 (find_package):
  Could not find a configuration file for package "Qt6Widgets" that is
  compatible with requested version "6.3.0".

  The following configuration files were considered but not accepted:

    /usr/lib/x86_64-linux-gnu/cmake/Qt6Widgets/Qt6WidgetsConfig.cmake,
version: 6.2.4
    /lib/x86_64-linux-gnu/cmake/Qt6Widgets/Qt6WidgetsConfig.cmake,
version: 6.2.4

-- Could NOT find XKB (missing: XKB_LIBRARY XKB_INCLUDE_DIR) (Required
is at least version "0.5.0")
-- Could NOT find Qt6StateMachine (missing: Qt6StateMachine_DIR)
CMake Error at CMakeLists.txt:77 (find_package):
  Found package configuration file:

    /usr/lib/x86_64-linux-gnu/cmake/Qt6/Qt6Config.cmake

  but it set Qt6_FOUND to FALSE so package "Qt6" is considered to be NOT
  FOUND.  Reason given by package:

  Failed to find Qt component "StateMachine".

  Expected Config file at
  "/usr/lib/x86_64-linux-gnu/cmake/Qt6StateMachine/Qt6StateMachineConfig.cmake"
  does NOT exist

This was despite installing:

apt install qt6-base-dev
