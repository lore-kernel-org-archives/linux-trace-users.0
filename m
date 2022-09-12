Return-Path: <linux-trace-users-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24E86ECAAD5
	for <linux-trace-users@archiver.kernel.org>; Mon, 12 Sep 2022 09:47:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229608AbiILJr2 (ORCPT
        <rfc822;linux-trace-users@archiver.kernel.org>);
        Mon, 12 Sep 2022 05:47:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44232 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229567AbiILJr1 (ORCPT
        <rfc822;linux-trace-users@vger.kernel.org>);
        Mon, 12 Sep 2022 05:47:27 -0400
Received: from mail-vs1-xe2d.google.com (mail-vs1-xe2d.google.com [IPv6:2607:f8b0:4864:20::e2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7739633E37
        for <linux-trace-users@vger.kernel.org>; Mon, 12 Sep 2022 02:47:26 -0700 (PDT)
Received: by mail-vs1-xe2d.google.com with SMTP id u189so8362235vsb.4
        for <linux-trace-users@vger.kernel.org>; Mon, 12 Sep 2022 02:47:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date;
        bh=BQgHH4IJuD82oGPdxMQKjmwk9KDl1CB1tAr2uXpzAEE=;
        b=FpyoWjKzj31SoNSR1SndLoPfiHGkyRFQ4UkoXzB1eQeRy7mzaFQ3My7YGwNXw3It9W
         dTON464BuZ+pdpznvQCIrj5mVchYyA0Vil9uGcnVdxfozDDxDDI0nEfZNrPTB515NDV6
         1RBpcPmmA8RlGlP4JYAhiOzFd3TKHAwdFggyZNSPvyw57twAe8y64I+iUWAJi3nBJ8xs
         36gQjfvCgaLlKKToBjroP4NLL/3IiWYriT6L+8SC3t/i43bjvzIBDs8+pWHm2gYWndT2
         L5YUNmV3DYXrTr5sDHlWZfO/o8DfR1TRjis5BN2j7ZYuNX8uE8KF//Lcc7p8dRZfFA+V
         VULw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date;
        bh=BQgHH4IJuD82oGPdxMQKjmwk9KDl1CB1tAr2uXpzAEE=;
        b=U6l2bhKcxC6tN+ez0xByEW/ma7VQ79o+3Uec3nxojSJXiwww0f2Kf6fSGPJ2Y1UpUk
         Fase+vRph/kBn9zVMdDkRfbSWsuB+L10VIv1MXojyFlftvAbP7NUVg6WNaQbt4lvqbIE
         7fChReTHiFQ2T7CpdZR88Bfh2DJee99D6E/cGOSr/OsWuuQigVNjgEe3Wxkwg+Pxq+5M
         VdgUwwBG4x7bZtbGWAv0PxQVYNmtt4QyEzswmY4sqXvlXaK2JvSm4lkLmOI0KmMrjWuN
         IagX7BBFAqKebKtH6u1irsfbwYLRHm88q3bUA9IPjDXa8kJ8vau8mVSSUBWYP1fahbyg
         LBLg==
X-Gm-Message-State: ACgBeo355F69eZUz9qMErAwpouoMSlsBkrqz97GmwMNuGaYDdRaxx2H0
        sV6fKeAzBiNBPU3QV5rtP90OBkrL+3PZeX7Xr6HN7gdbdaI=
X-Google-Smtp-Source: AA6agR5BVH/Koh5ybKIiwQ8hsovrQIQE2nf7eCMyiK6ZwK+toKIX/7JnjgwXquYtv1Lxe5/jSoxZZTMZuoX7KxovMy8=
X-Received: by 2002:a05:6102:254:b0:398:7c83:6d04 with SMTP id
 a20-20020a056102025400b003987c836d04mr1748953vsq.82.1662976045481; Mon, 12
 Sep 2022 02:47:25 -0700 (PDT)
MIME-Version: 1.0
References: <VE1PR09MB3535D091888EFAF84EA09E20F2459@VE1PR09MB3535.eurprd09.prod.outlook.com>
In-Reply-To: <VE1PR09MB3535D091888EFAF84EA09E20F2459@VE1PR09MB3535.eurprd09.prod.outlook.com>
From:   Tzvetomir Stoyanov <tz.stoyanov@gmail.com>
Date:   Mon, 12 Sep 2022 12:47:09 +0300
Message-ID: <CAPpZLN4o_O+ePT5YGStZknKCrMvQ17XupP4Y0LfQ=1Y9Cn20PQ@mail.gmail.com>
Subject: Re: trace-cmd: Using the python wrapping to read trace markers
To:     Sharon Gabay <Sharon.Gabay@mobileye.com>
Cc:     "linux-trace-users@vger.kernel.org" 
        <linux-trace-users@vger.kernel.org>,
        Steven Rostedt <rostedt@goodmis.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-trace-users.vger.kernel.org>
X-Mailing-List: linux-trace-users@vger.kernel.org

On Sun, Sep 11, 2022 at 11:03 PM Sharon Gabay <Sharon.Gabay@mobileye.com> w=
rote:
>
> Hi !

Hi Sharon,

>
> We are using this article to generate trace markers:
> https://lwn.net/Articles/366796/
>
> I am responsible for reading the trace.dat binary into our tools and we a=
re using the trace-cmd python wrapping.

The trace-cmd python wrappers are auto generated. The logic for that
may not be up to date, so I do not know what is the current state of
those wrappers.

>
> I'm trying to use the python wrapping in order to read trace markers, so =
far unsuccessfully (See below). I've noticed that the trace marker string i=
s written directly into the event, without using pointers, indices etc, and=
 that the size field in this case equals zero (in bold, below). So I'm gues=
sing that the way to read it is a bit different (using the method for readi=
ng regular string field does not seem to work). Here's how the event descri=
ption looks like inside trace.dat:
>
> name: print
> ID: 5
> format:
>         field:unsigned short common_type;       offset:0;       size:2; s=
igned:0;
>         field:unsigned char common_flags;       offset:2;       size:1; s=
igned:0;
>         field:unsigned char common_preempt_count;       offset:3;       s=
ize:1; signed:0;
>         field:int common_pid;   offset:4;       size:4; signed:1;
>         field:unsigned char common_migrate_disable;     offset:8;       s=
ize:1; signed:0;
>         field:unsigned char common_preempt_lazy_count;  offset:9;       s=
ize:1; signed:0;
>         field:unsigned long ip; offset:16;      size:8; signed:0;
>         field:char buf[];       offset:24;      size:0; signed:1;
> print fmt: "%ps: %s", (void *)REC->ip, REC->buf
>
> And here are some of the methods I've tried to access the "buf" field abo=
ve:
> field_name =3D "buf"
> // method 1:
> f =3D tep_find_any_field(self._event, field_name)
> if f is None:
>     return None
> str =3D py_field_get_str(f, self._record) // (returns empty string)
>
> // method 2:
> f =3D tep_find_any_field(self._event, name)
> if f is None:
>     return None
> data =3D py_field_get_data(f, self._record) // (returns empty buffer)
>

This is the flow that should work in your case, but I do not know if
it can be implemented with the existing python wrappers :

 1. Get the ID of the trace marker event. Event IDs are assigned at
kernel boot time, so the ID can be different, depending on the ftace
configuration:
     event =3D tep_find_event_by_name(tep, "ftrace", "print"), if you
are using the "trace_marker" file to inject marker events, or
     event =3D tep_find_event_by_name(tep, "ftrace", "raw_data"), if you
are using the "trace_marker_raw" file.
     marker_id =3D event->id
2. Iterate over the events from the file and look for events with id
=3D=3D marker_id. For these events, you can the field with name "buf",
either as string or as binary buffer.

> Thanks in advance,

Thanks for using trace-cmd and helping to improve it!

If you are interested in writing Python programs for ftrace tracing, I
would encourage to try trace-cruncher:
  https://github.com/vmware/trace-cruncher
Although it is still in its beta development stage, it is quite useful
for use cases such as yours. Take a look at examples/sched_wakeup.py
file - it does exactly what you want to achieve. That example opens a
trace.dat file, iterates over all events from it looking for specific
events.

> Sharon Gabay




--
Tzvetomir (Ceco) Stoyanov
VMware Open Source Technology Center
