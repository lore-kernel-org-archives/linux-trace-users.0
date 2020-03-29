Return-Path: <SRS0=qAvV=5O=vger.kernel.org=linux-trace-users-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5FAEC43331
	for <linux-trace-users@archiver.kernel.org>; Sun, 29 Mar 2020 19:20:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id BA0D920774
	for <linux-trace-users@archiver.kernel.org>; Sun, 29 Mar 2020 19:20:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="azNJCH+x"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728261AbgC2TUV (ORCPT
        <rfc822;linux-trace-users@archiver.kernel.org>);
        Sun, 29 Mar 2020 15:20:21 -0400
Received: from us-smtp-delivery-74.mimecast.com ([216.205.24.74]:48842 "EHLO
        us-smtp-delivery-74.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727370AbgC2TUV (ORCPT
        <rfc822;linux-trace-users@vger.kernel.org>);
        Sun, 29 Mar 2020 15:20:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1585509620;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=2/BSZHqPbthY115fOKT/jVPD/SJ9bCt4Ad3fEgOlTMI=;
        b=azNJCH+xIu79khQSpy0FTOhndIsg9c5v8DFcEYJ1vMiUswwgYmlywjyZ63TP1IL/iWUhdt
        wPiBIjStzxGcHsIyJ6R3maX1OGLS1ckSDCL4IxyoiA7N9nUyUNHPDi3xQTdWkbAsNFluuL
        zDX0p06uruIgo/awEgXhKkXTW2qdG84=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-31-2MQLTGtjPROsSgWokxo-3Q-1; Sun, 29 Mar 2020 15:20:18 -0400
X-MC-Unique: 2MQLTGtjPROsSgWokxo-3Q-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3C60E800D53;
        Sun, 29 Mar 2020 19:20:16 +0000 (UTC)
Received: from krava (unknown [10.40.192.75])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id E47EB1000325;
        Sun, 29 Mar 2020 19:20:13 +0000 (UTC)
Date:   Sun, 29 Mar 2020 21:20:10 +0200
From:   Jiri Olsa <jolsa@redhat.com>
To:     Milian Wolff <milian.wolff@kdab.com>
Cc:     ahmadkhorrami <ahmadkhorrami@ut.ac.ir>,
        Steven Rostedt <rostedt@goodmis.org>,
        Arnaldo Carvalho de Melo <acme@redhat.com>,
        Linux-trace Users <linux-trace-users@vger.kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        linux-trace-users-owner@vger.kernel.org,
        Jin Yao <yao.jin@linux.intel.com>,
        Namhyung Kim <namhyung@kernel.org>,
        Andi Kleen <ak@linux.intel.com>
Subject: Re: Wrong Perf Backtraces
Message-ID: <20200329192010.GA2361248@krava>
References: <821540886fc57d7749edee585a50602f@ut.ac.ir>
 <20200329120816.GD2155755@krava>
 <ff979b3fffc8222d8da848b8cb92f77c@ut.ac.ir>
 <1867036.PIDvDuAF1L@agathebauer>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <1867036.PIDvDuAF1L@agathebauer>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Content-Transfer-Encoding: quoted-printable
Sender: linux-trace-users-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-trace-users.vger.kernel.org>
X-Mailing-List: linux-trace-users@vger.kernel.org

On Sun, Mar 29, 2020 at 03:50:57PM +0200, Milian Wolff wrote:
> On Sonntag, 29. M=E4rz 2020 14:39:33 CEST ahmadkhorrami wrote:
> > Thanks. I did both of your changes. Perhaps some outputs are revised.
> > But I still have repeated function calls and the script detects them.
> > Here is one of them when the sampling period is 1000 events:
>=20
> <snip>
>=20
> > Here, we have two consecutive "7f91788120b5
> > gtk_widget_propagate_state+0x195
> > (/usr/lib/x86_64-linux-gnu/libgtk-3.so.0.2200.30) gtkwidget.c:0" line=
s,
> > while "gtk_widget_propagate_state+0x195" is not recursive. It should
> > call "gtk_container_forall", which does not occur even after the seco=
nd
> > (inner) call.
>=20
> Potentially you are just lacking some debug symbols here for this GTK l=
ibrary.=20
> note that "gtkwidget.c:0" is bogus already - the line numbers start wit=
h 1, so=20

could we just skip those then? pass on all zero lined inlines
and not add/display them

jirka

> a line of 0 reported indicates a lack of (full) debug information for t=
his=20
> file.
>=20
> Cheers
>=20
> --=20
> Milian Wolff | milian.wolff@kdab.com | Senior Software Engineer
> KDAB (Deutschland) GmbH, a KDAB Group company
> Tel: +49-30-521325470
> KDAB - The Qt, C++ and OpenGL Experts


