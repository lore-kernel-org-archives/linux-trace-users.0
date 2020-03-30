Return-Path: <SRS0=Bv4Z=5P=vger.kernel.org=linux-trace-users-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23B5AC2D0EC
	for <linux-trace-users@archiver.kernel.org>; Mon, 30 Mar 2020 13:08:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id EE1C020733
	for <linux-trace-users@archiver.kernel.org>; Mon, 30 Mar 2020 13:08:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="NEroY7Ax"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730278AbgC3NIE (ORCPT
        <rfc822;linux-trace-users@archiver.kernel.org>);
        Mon, 30 Mar 2020 09:08:04 -0400
Received: from us-smtp-delivery-74.mimecast.com ([216.205.24.74]:51665 "EHLO
        us-smtp-delivery-74.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729985AbgC3NIC (ORCPT
        <rfc822;linux-trace-users@vger.kernel.org>);
        Mon, 30 Mar 2020 09:08:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1585573681;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=bqlmTT+JX8TT97O+1iCgUC8PAn5IfoLxVlNth7styFI=;
        b=NEroY7Axo1F+9WCHntHZ8KzhurLEGMhVxb2xK/+giK4l6bbwmx47sCFY2t+gJkwb+I3cxS
        zg02MgKAkfqlztCxSKguHq0xqpzXLZALErQVyqTcXk3yopeOlCj1XRUOsnSyDbjttRO5O+
        2w9DhTDrY4+b/0FRVTAsPgt5coSEd+A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-381-oaoZXeZ_NGesXsR-N7kslw-1; Mon, 30 Mar 2020 09:07:59 -0400
X-MC-Unique: oaoZXeZ_NGesXsR-N7kslw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4FC7C1005509;
        Mon, 30 Mar 2020 13:07:57 +0000 (UTC)
Received: from krava (unknown [10.40.192.75])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id 308F460BEC;
        Mon, 30 Mar 2020 13:07:52 +0000 (UTC)
Date:   Mon, 30 Mar 2020 15:07:50 +0200
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
Message-ID: <20200330130750.GC2361248@krava>
References: <821540886fc57d7749edee585a50602f@ut.ac.ir>
 <1867036.PIDvDuAF1L@agathebauer>
 <20200329192010.GA2361248@krava>
 <2522580.mvXUDI8C0e@agathebauer>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <2522580.mvXUDI8C0e@agathebauer>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Content-Transfer-Encoding: quoted-printable
Sender: linux-trace-users-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-trace-users.vger.kernel.org>
X-Mailing-List: linux-trace-users@vger.kernel.org

On Mon, Mar 30, 2020 at 08:09:53AM +0200, Milian Wolff wrote:
> On Sonntag, 29. M=E4rz 2020 21:20:10 CEST Jiri Olsa wrote:
> > On Sun, Mar 29, 2020 at 03:50:57PM +0200, Milian Wolff wrote:
> > > On Sonntag, 29. M=E4rz 2020 14:39:33 CEST ahmadkhorrami wrote:
> > > > Thanks. I did both of your changes. Perhaps some outputs are revi=
sed.
> > > > But I still have repeated function calls and the script detects t=
hem.
> > >=20
> > > > Here is one of them when the sampling period is 1000 events:
> > > <snip>
> > >=20
> > > > Here, we have two consecutive "7f91788120b5
> > > > gtk_widget_propagate_state+0x195
> > > > (/usr/lib/x86_64-linux-gnu/libgtk-3.so.0.2200.30) gtkwidget.c:0" =
lines,
> > > > while "gtk_widget_propagate_state+0x195" is not recursive. It sho=
uld
> > > > call "gtk_container_forall", which does not occur even after the =
second
> > > > (inner) call.
> > >=20
> > > Potentially you are just lacking some debug symbols here for this G=
TK
> > > library. note that "gtkwidget.c:0" is bogus already - the line numb=
ers
> > > start with 1, so
> > could we just skip those then? pass on all zero lined inlines
> > and not add/display them
>=20
> I guess so - but quite frankly I'm a bit uneasy to do this without furt=
her=20
> exploration about the actual causes here. Afaik DWARF does not say anyt=
hing=20
> about the validity, so in theory there might be some language/compiler =
that=20
> encodes valid DWARF locations with line 0?
>=20
> Generally, it would be quite interesting to figure out why there is /so=
me/=20
> DWARF data here such that the code thinks it's able to decode the inlin=
e frame=20
> but then fails and leads to this confusing result?

right, but it's beyond my DWARF expertise ;-) we'll need
to wait till one of you guys could take a look on it

thanks,
jirka

