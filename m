Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com [209.85.161.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4469152799
	for <linux-trace-users@vger.kernel.org>; Tue, 30 Apr 2024 15:19:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714490391; cv=none; b=c9p2Vw31M9+jViO8zURXG/1H25EUqEc/JPHFC2xgrrgO2fOLpGEb3N9g3z2FxuUAkEsNqrGkHj+9bY4BQBP5vNor1j8uCHdJrTxFZMpx5T6DT42kJVNbqxYyROR1KkA7U+1F5OnUeeF27GHNoinCVtiglr9rwD8bC1QcFftGcdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714490391; c=relaxed/simple;
	bh=Lh+bXA6ul2CNDZ+6Im+o4V4mjo0P8L2XL+/uTm7gWhs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZyfFd0X/eR/fqQ8pTDql4K8RLcqgUzGJa/TK89AaT+Q/geILWI7198ZMAyei72U4OYEz21Ywt16wmPI4ThIvnYObTVGAw/iA5hpG8zU8Jq6yvd/32hPmz10Dt7Ttd8oyy+7AI7V9Ba4eAKxb6xor6FttWI4TKokWXZg4e014Q7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OgVz4kOD; arc=none smtp.client-ip=209.85.161.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OgVz4kOD"
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-5aa2551d33dso3942771eaf.0
        for <linux-trace-users@vger.kernel.org>; Tue, 30 Apr 2024 08:19:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714490389; x=1715095189; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CLaIB8HfCbsoFRr+yFDKuCHb3XB37PcvL4c8wzc0BIc=;
        b=OgVz4kODr73a92cGzRupc2H34UNJiQ91vFNP3zoCXjobe5p6Zas8QP20w+DkDWE66W
         ps4ux1A6e/NcYGYmaCqGntNtO0EwcykTMpVPxgPT+eMKC9x7DEg9s+tLHkvyS40I7LuQ
         KBJ9dKk7qLWOt+z9RL+vyVR+n2qDqwsf9dXAZaUbfhfbh8K0dvobUjIdSHR3L8t4D/9/
         qtFHq2eqkmTxt3F1h9DJyDfQdp23FmZjfC7hfSw3sueEzuoPNYQpuzdabKaAdT9SOioy
         izrFgOzU5HgJcPTN6RpW7QPdGa/YHep5I6siLMvg9PehRBsp7i+L8ME3Dl/qED1qMXIk
         8QAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714490389; x=1715095189;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CLaIB8HfCbsoFRr+yFDKuCHb3XB37PcvL4c8wzc0BIc=;
        b=omglUXpMg3wvCL6AFXual1SZ2CS01FJ3OAa6V1QIn4zYAEx24j2DvU1HSy+7cGATUI
         H4PpDZYegjQSX7o6PBzQeppkx79kO94YXVzzI4Kh4wrPw4ZIkSx3ngcBBOnuyhkt+ill
         oxMzmrDutij3tjYbGLQAI0YHB+r4n2fRbwB57zWwS7Qb7yPBd3euiNySRRuDUaAjnTsQ
         4evFwCnZxYMER0CdRAnb9/jn1kjjY3kOV+nuEz0NfvPuhpDjYlk56foKT6MpOy/KbY8Y
         PYm1aM5Q72HNAdRUZrYMfUMnYeOQNy5ohFqQPRi4arzZALApI4OoW8hcgA/Tg/v4N3rU
         l90g==
X-Gm-Message-State: AOJu0YyAEZSuq6axlugLUBLt40colowh5gWD9DkoDtQoYVTMjr0W446T
	KkwSA47ElckRjdtO8/lMy7+T4iHD0WImSdAbKbPYXA5T+4YS3Zf2uMnmtjnP4EIgigGBqEiXqDD
	S5tU0Ci0bNYs4yR4P/Dg6HPkFTh18Tlx1
X-Google-Smtp-Source: AGHT+IGnit2TYPhlEwmKKu9YpI1eX7qAnjUsobqkwDv8H+IlswTHhNqO6pl7hPDMdeu7ghL17dPUOQr/Glgidm70BAY=
X-Received: by 2002:a4a:cb05:0:b0:5af:73b5:eb4c with SMTP id
 r5-20020a4acb05000000b005af73b5eb4cmr16413032ooq.0.1714490388518; Tue, 30 Apr
 2024 08:19:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-trace-users@vger.kernel.org
List-Id: <linux-trace-users.vger.kernel.org>
List-Subscribe: <mailto:linux-trace-users+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-trace-users+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAJK_ieiBK5OSxAfXK=wuDpiuEBA0Oj++oRSW29SrrUkPpt6TtQ@mail.gmail.com>
 <cbe25526-254b-b7b6-4ff2-26d4289cbfc3@gmail.com> <CAJK_ieinnyDq3_jW+T7OPWWYf3rHaVB-PzPH-A0OcJbYmW6+kg@mail.gmail.com>
 <a4390fe3-1442-0e1a-a6e9-26b96840b7bc@gmail.com>
In-Reply-To: <a4390fe3-1442-0e1a-a6e9-26b96840b7bc@gmail.com>
From: David Aldrich <david.aldrich.ntml@gmail.com>
Date: Tue, 30 Apr 2024 16:19:37 +0100
Message-ID: <CAJK_ieiFtN8o7h08WvB4UziKK=rbV1LeOBqStn26DA9BHF5jBA@mail.gmail.com>
Subject: Re: Cannot build KernelShark on Ubuntu 22.04
To: Yordan Karadzhov <y.karadz@gmail.com>
Cc: linux-trace-users@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Yordan

Thanks for your patience. I did a fresh clone and all built fine.
However, I have a runtime problem:

~/kernelshark_test/kernel-shark$ bin/kernelshark
bin/kernelshark: error while loading shared libraries:
libQt6Core.so.6: cannot open shared object file: No such file or
directory

Is that a LD_LIBRARY_PATH problem?

On Tue, Apr 30, 2024 at 3:59=E2=80=AFPM Yordan Karadzhov <y.karadz@gmail.co=
m> wrote:
>
> Hi,
>
> I just tested building on Ubuntu 22.04 and everything was fine. My guess
> would be that in the build instructions you haven't done the first step,
> namely:
>
> cd kernel-shark/build
>
> Note that it is important that you are in the 'build' directory before
> doing the following steps.
>
> Thanks!
> Yordan
>
> On 4/30/24 17:08, David Aldrich wrote:
> > Thanks Yordan
> >
> > I am now using the instructions at GitHub:
> >
> > https://github.com/yordan-karadzhov/kernel-shark/tree/kernelshark
> >
> > I installed:
> >
> > sudo apt-get install qt6-base-dev qt6-scxml-dev
> > sudo apt-get install libtraceevent-dev libtracefs-dev libtracecmd-dev t=
race-cmd
> >
> > but I see:
> >
> > $ cmake ../
> >
> >   project: Kernel Shark: (version: 2.3.1)
> >
> > CMake Error at CMakeLists.txt:48 (find_package):
> >    By not providing "FindTraceEvent.cmake" in CMAKE_MODULE_PATH this pr=
oject
> >    has asked CMake to find a package configuration file provided by
> >    "TraceEvent", but CMake did not find one.
> >
> >    Could not find a package configuration file provided by "TraceEvent"=
 with
> >    any of the following names:
> >
> >      TraceEventConfig.cmake
> >      traceevent-config.cmake
> >
> >    Add the installation prefix of "TraceEvent" to CMAKE_PREFIX_PATH or =
set
> >    "TraceEvent_DIR" to a directory containing one of the above files.  =
If
> >    "TraceEvent" provides a separate development package or SDK, be sure=
 it has
> >    been installed.
> >
> > On Tue, Apr 30, 2024 at 2:53=E2=80=AFPM Yordan Karadzhov <y.karadz@gmai=
l.com> wrote:
> >>
> >> Hi
> >>
> >> Please try to build KernelShark following the instructions given in th=
e
> >> README file in the git repository and let me know if you still run int=
o
> >> issues.
> >>
> >> Thanks!
> >> Yordan
> >>
> >> On 4/30/24 16:41, David Aldrich wrote:
> >>> Hi
> >>>
> >>> Working on WSL with Ubuntu 22.04 LTS, I am unable to build
> >>> KernelShark. I will try installing it as a package, but perhaps my
> >>> experience below will be useful for the project.
> >>>
> >>> I cloned KernelShark:
> >>>
> >>> git clone git://git.kernel.org/pub/scm/utils/trace-cmd/kernel-shark.g=
it
> >>>
> >>> I followed the instructions at:
> >>>
> >>> https://kernelshark.org/build.html
> >>>
> >>> which requires:
> >>>
> >>> sudo apt-get install qtbase5-dev -y
> >>>
> >>> When I attempt to build KernelShark with:
> >>>
> >>> cmake ../
> >>>
> >>> I see:
> >>>
> >>> CMake Warning at CMakeLists.txt:76 (find_package):
> >>>     Could not find a configuration file for package "Qt6Widgets" that=
 is
> >>>     compatible with requested version "6.3.0".
> >>>
> >>>     The following configuration files were considered but not accepte=
d:
> >>>
> >>>       /usr/lib/x86_64-linux-gnu/cmake/Qt6Widgets/Qt6WidgetsConfig.cma=
ke,
> >>> version: 6.2.4
> >>>       /lib/x86_64-linux-gnu/cmake/Qt6Widgets/Qt6WidgetsConfig.cmake,
> >>> version: 6.2.4
> >>>
> >>> -- Could NOT find XKB (missing: XKB_LIBRARY XKB_INCLUDE_DIR) (Require=
d
> >>> is at least version "0.5.0")
> >>> -- Could NOT find Qt6StateMachine (missing: Qt6StateMachine_DIR)
> >>> CMake Error at CMakeLists.txt:77 (find_package):
> >>>     Found package configuration file:
> >>>
> >>>       /usr/lib/x86_64-linux-gnu/cmake/Qt6/Qt6Config.cmake
> >>>
> >>>     but it set Qt6_FOUND to FALSE so package "Qt6" is considered to b=
e NOT
> >>>     FOUND.  Reason given by package:
> >>>
> >>>     Failed to find Qt component "StateMachine".
> >>>
> >>>     Expected Config file at
> >>>     "/usr/lib/x86_64-linux-gnu/cmake/Qt6StateMachine/Qt6StateMachineC=
onfig.cmake"
> >>>     does NOT exist
> >>>
> >>> This was despite installing:
> >>>
> >>> apt install qt6-base-dev
> >>>
