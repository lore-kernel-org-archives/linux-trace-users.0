Return-Path: <linux-trace-users-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BDE8C61DA4
	for <linux-trace-users@archiver.kernel.org>; Wed, 15 Mar 2023 20:24:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230356AbjCOUYu (ORCPT
        <rfc822;linux-trace-users@archiver.kernel.org>);
        Wed, 15 Mar 2023 16:24:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47084 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233025AbjCOUYt (ORCPT
        <rfc822;linux-trace-users@vger.kernel.org>);
        Wed, 15 Mar 2023 16:24:49 -0400
Received: from mail2-relais-roc.national.inria.fr (mail2-relais-roc.national.inria.fr [192.134.164.83])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 93E713250E
        for <linux-trace-users@vger.kernel.org>; Wed, 15 Mar 2023 13:24:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=1KOIRMXs+UZ/a9ObOf9tJxZ00QDsJe0XgPyM7p3xSrk=;
  b=MQ6mY+z8UYzCo64VD9Gblo95fQ8VPPeqskqceDBHvnP9wJ3uBdW5MuL4
   J549LYVobptmuoCB7I7s+0XH2NZJ3NK/1SJS+/nGRMYzsDn/ULKkUvpxv
   oG3QDvxHZeuDTE0Ws7N1cLtyVbw+xf0nPjnLLu0wQL7XjwVNyVCnb/AHz
   c=;
Authentication-Results: mail2-relais-roc.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="5.98,262,1673910000"; 
   d="scan'208";a="97437204"
Received: from 231.85.89.92.rev.sfr.net (HELO hadrien) ([92.89.85.231])
  by mail2-relais-roc.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Mar 2023 21:24:14 +0100
Date:   Wed, 15 Mar 2023 21:24:13 +0100 (CET)
From:   Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To:     Alexander Aring <aahringo@redhat.com>
cc:     Steven Rostedt <rostedt@goodmis.org>,
        linux-trace-users@vger.kernel.org
Subject: Re: CSV output
In-Reply-To: <CAK-6q+jfqRPVXihH7OzGJgzyjtt3g0hHEcjtBWwQVi8LHzpNzg@mail.gmail.com>
Message-ID: <alpine.DEB.2.22.394.2303152122491.2816@hadrien>
References: <alpine.DEB.2.22.394.2303120805430.2865@hadrien> <20230313121528.5650068b@gandalf.local.home> <87b0589-28a5-1cb5-f3ee-4d5c2e817116@inria.fr> <20230313135332.075af0a9@gandalf.local.home> <606f40f1-a411-b688-9136-cbc6fa95541f@inria.fr>
 <20230313142424.26107bcb@gandalf.local.home> <CAK-6q+jfqRPVXihH7OzGJgzyjtt3g0hHEcjtBWwQVi8LHzpNzg@mail.gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-407161473-1678911854=:2816"
Precedence: bulk
List-ID: <linux-trace-users.vger.kernel.org>
X-Mailing-List: linux-trace-users@vger.kernel.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-407161473-1678911854=:2816
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT



On Wed, 15 Mar 2023, Alexander Aring wrote:

> Hi,
>
> On Mon, Mar 13, 2023 at 2:26 PM Steven Rostedt <rostedt@goodmis.org> wrote:
> >
> > On Mon, 13 Mar 2023 18:59:50 +0100 (CET)
> > Julia Lawall <julia.lawall@inria.fr> wrote:
> >
> > > > Better yet, I'm hoping to get some time to finish looking at the python
> > > > updates that were sent to me, and where it could be possible to just allow
> > > > you to override the output with a python script.
> > >
> > > OK, no hurry.  I looked into the plugins, but they seem to control only
> > > part of the output and it seems that one would be needed for every type of
> > > event.  I could try writing python, if there is an example.
> >
> > The python plugins are currently broken, and we started adding more
> > features to the plugins to control the output a bit more.
>
> what about the python bindings (under trace-cmd/python/) to parse
> trace files and using the python csv module? I guess the python

What do you mean by parse?  My only goal is to reduce running time, so
parsing the existing output to produce a csv file won't be a benefit.

thanks,
julia

> bindings are something different than the python plugins and they are
> still working?
>
> - Alex
>
>
--8323329-407161473-1678911854=:2816--
