Return-Path: <SRS0=L3+l=5K=vger.kernel.org=linux-trace-users-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF3A0C2D0E7
	for <linux-trace-users@archiver.kernel.org>; Wed, 25 Mar 2020 21:09:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C6F16207FC
	for <linux-trace-users@archiver.kernel.org>; Wed, 25 Mar 2020 21:09:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727351AbgCYVJf (ORCPT
        <rfc822;linux-trace-users@archiver.kernel.org>);
        Wed, 25 Mar 2020 17:09:35 -0400
Received: from mail.kernel.org ([198.145.29.99]:55784 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727253AbgCYVJf (ORCPT
        <rfc822;linux-trace-users@vger.kernel.org>);
        Wed, 25 Mar 2020 17:09:35 -0400
Received: from gandalf.local.home (cpe-66-24-58-225.stny.res.rr.com [66.24.58.225])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E14D220737;
        Wed, 25 Mar 2020 21:09:33 +0000 (UTC)
Date:   Wed, 25 Mar 2020 17:09:32 -0400
From:   Steven Rostedt <rostedt@goodmis.org>
To:     Jiri Olsa <jolsa@redhat.com>
Cc:     ahmadkhorrami <ahmadkhorrami@ut.ac.ir>,
        Arnaldo Carvalho de Melo <acme@redhat.com>,
        Linux-trace Users <linux-trace-users@vger.kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        linux-trace-users-owner@vger.kernel.org,
        Jin Yao <yao.jin@linux.intel.com>
Subject: Re: Wrong Perf Backtraces
Message-ID: <20200325170932.34d52269@gandalf.local.home>
In-Reply-To: <20200325210252.GC1947699@krava>
References: <21b3df4080709f193d62b159887e2a83@ut.ac.ir>
        <20200323084942.GA1534489@krava>
        <ee43289d91fcae1c9ef5cc2429dc916b@ut.ac.ir>
        <8645d3626b4714690925328ab00373d6@ut.ac.ir>
        <20200325154643.GA1934048@krava>
        <20200325185831.GB19495@redhat.com>
        <9551c616b045299482fc9e26281c1062@ut.ac.ir>
        <20200325192858.GC19495@redhat.com>
        <4ffb7e2b6e272c20616fbf133a125fdf@ut.ac.ir>
        <20200325203921.GB1947699@krava>
        <20200325210252.GC1947699@krava>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-trace-users-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-trace-users.vger.kernel.org>
X-Mailing-List: linux-trace-users@vger.kernel.org

On Wed, 25 Mar 2020 22:02:52 +0100
Jiri Olsa <jolsa@redhat.com> wrote:

> yea, no luck.. so if you could generate some reasonable small perf.data that
> shows the issue and send it over together with 'perf archive' data privately
> to me and to whoever else ask for it, so we don't polute the list..

Right. And it may be better if you compress it too.

 xz perf.data

and attach the perf.data.xz (and only privately send it to Mr. Olsa).

-- Steve

> 
> or if you could put it somewhere on the web/ftp.. that'd be best
>
