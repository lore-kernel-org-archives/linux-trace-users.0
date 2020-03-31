Return-Path: <SRS0=9mrg=5Q=vger.kernel.org=linux-trace-users-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22EB3C43331
	for <linux-trace-users@archiver.kernel.org>; Tue, 31 Mar 2020 16:10:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id EC347206CC
	for <linux-trace-users@archiver.kernel.org>; Tue, 31 Mar 2020 16:10:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gJRVfj1W"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731053AbgCaQKS (ORCPT
        <rfc822;linux-trace-users@archiver.kernel.org>);
        Tue, 31 Mar 2020 12:10:18 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:60236 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1730562AbgCaQKS (ORCPT
        <rfc822;linux-trace-users@vger.kernel.org>);
        Tue, 31 Mar 2020 12:10:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1585671017;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Voe2qrXDe5Yx0QpIR9//IUXba58ao3Ab+K8YcD8EZhE=;
        b=gJRVfj1WzoxhrSnEx+8KlaXm9HdEf5Q74ZbxbAqXlKcCSptOxCDnG+QH1ItbfDe+oO23Zj
        fUCzR6Jw7cv/NQSgStyw94/t9RJLv5Sh3C5k+KItlK+ohz04CV8ypv6tEppnyj8JhJtc5r
        zNG+9KrtxMOd/jMo4GVUcludHSeWPdI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-343-l_hc7TnpMfu61olT8aiA3A-1; Tue, 31 Mar 2020 12:10:12 -0400
X-MC-Unique: l_hc7TnpMfu61olT8aiA3A-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8B6CF13FB;
        Tue, 31 Mar 2020 16:10:08 +0000 (UTC)
Received: from sandy.ghostprotocols.net (unknown [10.3.128.20])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id 69BB05E009;
        Tue, 31 Mar 2020 16:10:07 +0000 (UTC)
Received: by sandy.ghostprotocols.net (Postfix, from userid 1000)
        id 92C9182; Tue, 31 Mar 2020 13:10:02 -0300 (BRT)
Date:   Tue, 31 Mar 2020 13:10:02 -0300
From:   Arnaldo Carvalho de Melo <acme@redhat.com>
To:     Milian Wolff <milian.wolff@kdab.com>
Cc:     ahmadkhorrami <ahmadkhorrami@ut.ac.ir>,
        Jiri Olsa <jolsa@redhat.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Linux-trace Users <linux-trace-users@vger.kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        linux-trace-users-owner@vger.kernel.org,
        Jin Yao <yao.jin@linux.intel.com>,
        Namhyung Kim <namhyung@kernel.org>,
        Andi Kleen <ak@linux.intel.com>
Subject: Re: Wrong Perf Backtraces
Message-ID: <20200331161002.GB23207@redhat.com>
References: <821540886fc57d7749edee585a50602f@ut.ac.ir>
 <8573002.CDJkKcVGEf@agathebauer>
 <fe8e797932c0cb6d1b8db2ee9b991ed0@ut.ac.ir>
 <7774721.NyiUUSuA9g@agathebauer>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <7774721.NyiUUSuA9g@agathebauer>
X-Url:  http://acmel.wordpress.com
User-Agent: Mutt/1.5.20 (2009-12-10)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Content-Transfer-Encoding: quoted-printable
Sender: linux-trace-users-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-trace-users.vger.kernel.org>
X-Mailing-List: linux-trace-users@vger.kernel.org

Em Tue, Mar 31, 2020 at 05:29:17PM +0200, Milian Wolff escreveu:
> On Dienstag, 31. M=E4rz 2020 17:02:37 CEST ahmadkhorrami wrote:
> > Hi Milian,
> > Thanks for the detailed answer. Well, the bug you mentioned is bad ne=
ws.
> > Because I sample using uppp. Perhaps this leads to these weird traces=
.
>=20
> Please read the full thread from here on:
>=20
> https://lkml.org/lkml/2018/11/2/86
>=20
> But as I said - it should be easy to check if this is really the issue =
are=20
> running into or not: Try to see if you see the problem when you sample =
without=20
> `ppp`. If not, then you can be pretty sure it's this issue. If you stil=
l see=20
> it, then it's something different.
>=20
> > Is this a purely software bug?
>=20
> I wouldn't call it that, personally. Rather, it's a limitation in the h=
ardware=20
> and software. We would need something completely different to "fix" thi=
s, i.e.=20
> something like a deeper LBR. That's btw another alternative you could t=
ry:=20
> `perf record --call-graph lbr` and live with the short call stacks. But=
 at=20
> least these should be correct (afaik). For me personally they are alway=
s far=20
> too short and thus not practical to use in reality.

Probably this may help:

  From: Kan Liang <kan.liang@linux.intel.com>
  Subject: [PATCH V4 00/17] Stitch LBR call stack (Perf Tools)
  Date: Thu, 19 Mar 2020 13:25:00 -0700
  https://lore.kernel.org/lkml/20200319202517.23423-1-kan.liang@linux.int=
el.com/

- Arnaldo

