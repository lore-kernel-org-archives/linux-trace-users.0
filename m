Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com [209.85.161.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5482172761
	for <linux-trace-users@vger.kernel.org>; Tue, 30 Apr 2024 14:09:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714486145; cv=none; b=Khw28NYPoI9Kf5xg2e8oAMwAUSLOekwNMYiHOr9NgRlyAT/b1fMKzW2DL48hdor3Uxjw2tuoKvoqfGI7LGJibVIAMOh4ACYUiAhNLbTDzU82MfaHya9uOJEM0yJanIyz8ubbSaX/4RlTRaaLnkh7Fe8fYZtqtjcoOhEpelFqJMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714486145; c=relaxed/simple;
	bh=MSMPOfGADzGoWN082qMFa/RynstWuA0sfBZak8e0dqg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ianQkHepOHAIP716iHuZvpufR1jw72eFBpeT3EJTwChTMgPSysPqTiTTE9uPyo0UyAjzB2HpeihRcUMSx/HjN6POglOfaqvwi2KhU8qVsN7bq3lu6M7x7wLi0EfCaTAagMOT8ODUL8TJkxv8gSY6AZLxqQzseKcy0o9mu54zlRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E4cBbkAg; arc=none smtp.client-ip=209.85.161.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E4cBbkAg"
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-5aa26990d5aso3694977eaf.1
        for <linux-trace-users@vger.kernel.org>; Tue, 30 Apr 2024 07:09:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714486142; x=1715090942; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mNJjvsSgpZB+HeKgM7BvXUXzWO6ajx3FqMg67pxo1XQ=;
        b=E4cBbkAg/gbvlW/D7C8i3nDtoCYsXK/48ahHKHqzQrx95iUnjD7lrh75oQCcXsBQgj
         zEp1D2Z72A06qLwqN+kkXbLg4PDqcMdSSjCsPVgER1L9R+XA54TxJnbyKFfOOk9AZgMI
         4XNN1QvjhuunGQNab4DJtqkKgD5U+b9dT4dwG7v1xf/sr21h9Tlf0BonTChB7csj7ycR
         yOqSVFoWeySJmBi2YqpF2LkEhAEE1RqDFJ98BjRgUm6v12IPshdwFXbDWy2KDShzB0eu
         180FnXw8zelXAv4sleb8bqsaQgE/u2eaRnNAICle2+Fl2Kh2Mryslbncn4uXOgK3QaqF
         cmmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714486142; x=1715090942;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mNJjvsSgpZB+HeKgM7BvXUXzWO6ajx3FqMg67pxo1XQ=;
        b=g6dD6kdxvLQ8Oq5mgW2Y/6ADa0dYShw7euGmTQQ05Y2OS5byyBuJrVVDwTYCLae5q1
         LMgF3pYx7RUpQb81Q4ChsARwppElgzEobVyAlYSRNGLgbNnhjQMKvyZl/ODVid+1j24M
         WHiT7/lAA6nbNHol0AY2kybaFUz6jUd4i6swaS6qwOwTw6Qs8BdQ3E3sLlijlUTzrEMY
         LM26c5obhEwGwCbSDt1s/+BFwkERpZ7QkuPeSizUMFl0BzNUmWrvCgiLPUE/lWT+SWhx
         KhqpUZnXbibhAc00KiaHAUxXxJPusligu0GbJCcHWw3Sto2VT3h0znEo55xfydNteKWo
         nRQg==
X-Gm-Message-State: AOJu0Yys0SYkV2embFACS48rTwvABGJ8C/WJTnIBMITfEF65QvjJtuzv
	Xx+TMdvsmN7EzGZny5+dKal2RGjpnblJLhmKc30MwjpHOUl87wDUdixoKg3NWM02H3dl5Augkim
	HdVwJihXnnUYb5OlD9myXhgaqcNfehiqA
X-Google-Smtp-Source: AGHT+IFiEzH0+xcJp7ky+4+sqVY21yZFTQHZlKEnnaAOrDDfwTVGefBwdb9cdwja8Flby2yL10TTq46ZY1tWM2wR+Ik=
X-Received: by 2002:a4a:1784:0:b0:5aa:4a0c:d99e with SMTP id
 126-20020a4a1784000000b005aa4a0cd99emr3131272ooe.8.1714486141741; Tue, 30 Apr
 2024 07:09:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-trace-users@vger.kernel.org
List-Id: <linux-trace-users.vger.kernel.org>
List-Subscribe: <mailto:linux-trace-users+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-trace-users+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAJK_ieiBK5OSxAfXK=wuDpiuEBA0Oj++oRSW29SrrUkPpt6TtQ@mail.gmail.com>
 <cbe25526-254b-b7b6-4ff2-26d4289cbfc3@gmail.com>
In-Reply-To: <cbe25526-254b-b7b6-4ff2-26d4289cbfc3@gmail.com>
From: David Aldrich <david.aldrich.ntml@gmail.com>
Date: Tue, 30 Apr 2024 15:08:51 +0100
Message-ID: <CAJK_ieinnyDq3_jW+T7OPWWYf3rHaVB-PzPH-A0OcJbYmW6+kg@mail.gmail.com>
Subject: Re: Cannot build KernelShark on Ubuntu 22.04
To: Yordan Karadzhov <y.karadz@gmail.com>
Cc: linux-trace-users@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks Yordan

I am now using the instructions at GitHub:

https://github.com/yordan-karadzhov/kernel-shark/tree/kernelshark

I installed:

sudo apt-get install qt6-base-dev qt6-scxml-dev
sudo apt-get install libtraceevent-dev libtracefs-dev libtracecmd-dev trace=
-cmd

but I see:

$ cmake ../

 project: Kernel Shark: (version: 2.3.1)

CMake Error at CMakeLists.txt:48 (find_package):
  By not providing "FindTraceEvent.cmake" in CMAKE_MODULE_PATH this project
  has asked CMake to find a package configuration file provided by
  "TraceEvent", but CMake did not find one.

  Could not find a package configuration file provided by "TraceEvent" with
  any of the following names:

    TraceEventConfig.cmake
    traceevent-config.cmake

  Add the installation prefix of "TraceEvent" to CMAKE_PREFIX_PATH or set
  "TraceEvent_DIR" to a directory containing one of the above files.  If
  "TraceEvent" provides a separate development package or SDK, be sure it h=
as
  been installed.

On Tue, Apr 30, 2024 at 2:53=E2=80=AFPM Yordan Karadzhov <y.karadz@gmail.co=
m> wrote:
>
> Hi
>
> Please try to build KernelShark following the instructions given in the
> README file in the git repository and let me know if you still run into
> issues.
>
> Thanks!
> Yordan
>
> On 4/30/24 16:41, David Aldrich wrote:
> > Hi
> >
> > Working on WSL with Ubuntu 22.04 LTS, I am unable to build
> > KernelShark. I will try installing it as a package, but perhaps my
> > experience below will be useful for the project.
> >
> > I cloned KernelShark:
> >
> > git clone git://git.kernel.org/pub/scm/utils/trace-cmd/kernel-shark.git
> >
> > I followed the instructions at:
> >
> > https://kernelshark.org/build.html
> >
> > which requires:
> >
> > sudo apt-get install qtbase5-dev -y
> >
> > When I attempt to build KernelShark with:
> >
> > cmake ../
> >
> > I see:
> >
> > CMake Warning at CMakeLists.txt:76 (find_package):
> >    Could not find a configuration file for package "Qt6Widgets" that is
> >    compatible with requested version "6.3.0".
> >
> >    The following configuration files were considered but not accepted:
> >
> >      /usr/lib/x86_64-linux-gnu/cmake/Qt6Widgets/Qt6WidgetsConfig.cmake,
> > version: 6.2.4
> >      /lib/x86_64-linux-gnu/cmake/Qt6Widgets/Qt6WidgetsConfig.cmake,
> > version: 6.2.4
> >
> > -- Could NOT find XKB (missing: XKB_LIBRARY XKB_INCLUDE_DIR) (Required
> > is at least version "0.5.0")
> > -- Could NOT find Qt6StateMachine (missing: Qt6StateMachine_DIR)
> > CMake Error at CMakeLists.txt:77 (find_package):
> >    Found package configuration file:
> >
> >      /usr/lib/x86_64-linux-gnu/cmake/Qt6/Qt6Config.cmake
> >
> >    but it set Qt6_FOUND to FALSE so package "Qt6" is considered to be N=
OT
> >    FOUND.  Reason given by package:
> >
> >    Failed to find Qt component "StateMachine".
> >
> >    Expected Config file at
> >    "/usr/lib/x86_64-linux-gnu/cmake/Qt6StateMachine/Qt6StateMachineConf=
ig.cmake"
> >    does NOT exist
> >
> > This was despite installing:
> >
> > apt install qt6-base-dev
> >
