Return-Path: <linux-trace-users-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9003AC433EF
	for <linux-trace-users@archiver.kernel.org>; Thu, 30 Jun 2022 04:21:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230303AbiF3EVM (ORCPT
        <rfc822;linux-trace-users@archiver.kernel.org>);
        Thu, 30 Jun 2022 00:21:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35628 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229732AbiF3EVL (ORCPT
        <rfc822;linux-trace-users@vger.kernel.org>);
        Thu, 30 Jun 2022 00:21:11 -0400
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9CF77369D5
        for <linux-trace-users@vger.kernel.org>; Wed, 29 Jun 2022 21:21:10 -0700 (PDT)
Received: by mail-wr1-x42f.google.com with SMTP id q9so25351407wrd.8
        for <linux-trace-users@vger.kernel.org>; Wed, 29 Jun 2022 21:21:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to;
        bh=gKQ5LYvffQnqyiWXV6eQeCDq3LYIG/1F9ljzqkobgJI=;
        b=kAmdQ+ebhmF8r89RfOkRu/vudhFdMXHru0U5RRykya1lcY67fykF0CthLAcJg3Hzut
         RY1sM1x/eZz77gPflTkEtC6T+5OeF8AwcXV78QzOxJou4YYyBefMOvp+M1gqBZaRd18K
         OY7DPiWFZ8As/m7FebG9NSFLOWSUTzVE+Vfx0AMJuUrXZ2kou3Bo9DShzaJpKbE3J1K3
         SVV9fLAL6RsyWHcuXen/6xEP2Msz9p/ZgE4wCi5E22LG4hPFhGgkiZbEstLPM8OIGMxU
         ukXMkQXOHXZ1L9MS9mO/k8yOuoP22BDPv9Xld3B8Oqw7wTBcrToBnaP8/e8BAb9emwdl
         FURw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=gKQ5LYvffQnqyiWXV6eQeCDq3LYIG/1F9ljzqkobgJI=;
        b=rf1zrOwGKuIxEIrlKnHv600l/nbDs5br3ORmltDDiMhhzLirP4mrJR03IcCGdx6gPU
         3nN+OMNB7AxYVUdpmETWR8UDNi29mMlwocOEuOorz19ypO7//6tL3jZT0hrS9f8LKMTU
         6bDL+IxdBTZtRIKQvSaGG5BddbKMp3oDbAXzAa7O/icvEExFPcKcI6NHZr0GsBJ9dwjL
         EDiX+EUJEAicm5ixUvIY+fdm+0JmokgrSMad+ApFnQfu6uj23ch2KWVW+DssGDHyv8lh
         GDR5yt+5HwInw8fId7CfcUWarLlDsjYtlpfq1vNpK5lUcQKOD+cveZxTWfBYTeQBvuOv
         19mg==
X-Gm-Message-State: AJIora94S686bHreeO3/DGN+B7cvyF/AWH6gKCy3+XGNKuo1ssz0+xQr
        CYi5jE1jlmnrHjocTGpRDjVg9lg5RO/SDCwszpur5RwzyH4=
X-Google-Smtp-Source: AGRyM1uyult5SRu49VWysVlOmgAtxnREfrla7KXiJP5HH4cOoUFqfGOdhKxzevFcpFq4kcXvdEh+yTcmso792fXFabc=
X-Received: by 2002:adf:e7c7:0:b0:21d:3f77:7621 with SMTP id
 e7-20020adfe7c7000000b0021d3f777621mr239790wrn.602.1656562868694; Wed, 29 Jun
 2022 21:21:08 -0700 (PDT)
MIME-Version: 1.0
From:   Brian Hutchinson <b.hutchman@gmail.com>
Date:   Thu, 30 Jun 2022 00:20:57 -0400
Message-ID: <CAFZh4h87S5xoYisfN53SVBfXaCHKH1dwao_12L55K6Bq2Gd2Gg@mail.gmail.com>
Subject: Having difficulty trying to cross-compile latest trace-cmd
To:     linux-trace-users@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-trace-users.vger.kernel.org>
X-Mailing-List: linux-trace-users@vger.kernel.org

Hi,

I've been using trace-cmd 2.9.1 from a yocto build but I want to try
out the sql synthetic events ultil and it looks like I need to go to
the latest to get that.

After reading this:

https://www.spinics.net/lists//linux-trace-devel/msg08977.html

.... thanks Steven for rescuing the orphans but I guess I'm a
red-headded step child trying to cross-compile all of this (on Ubuntu
20.04 machine) for a iMX8MM SoC.  And you're right, Makefiles do suck!
 Especially ones you didn't write yourself and you try to figure out
what others were trying to do.

I'm struggling to cross-compile everything.

I checked out the latest libtraceevent and that cross-compiled ok (I'm
using a sdk I built from Yocto ex: source
/opt/poky.3.1.7/environment-setup-aarch64-poky-linux) but the install
wouldn't work until I used DESTDIR to point the install somewhere
other than Ubuntu directories.

I checked out libtracefs and it wouldn't build until I fooled around
and set TEST_LIBTRACEEVENT to point specifically to the
libtraceevent.pc file in the directory used in libtraceevent DISTDIR
path I set.

Once I got past that I started having issues with libtracefs failing
to find include files (event-parse.h, trace-seq.h etc.) that lived in
the libtraceevent repo.  I created a symlink for one of them but then
ran into others and gave up figuring I was going about this wrong way
and it was time to admit defeat and just ask how you cross compile
this without building packages for Ubuntu.

Thanks,

Brian
