Return-Path: <SRS0=ls0D=5M=vger.kernel.org=linux-trace-users-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9657C43331
	for <linux-trace-users@archiver.kernel.org>; Fri, 27 Mar 2020 09:21:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7B09220716
	for <linux-trace-users@archiver.kernel.org>; Fri, 27 Mar 2020 09:21:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Xw5nhRtR"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725946AbgC0JVF (ORCPT
        <rfc822;linux-trace-users@archiver.kernel.org>);
        Fri, 27 Mar 2020 05:21:05 -0400
Received: from us-smtp-delivery-74.mimecast.com ([63.128.21.74]:43785 "EHLO
        us-smtp-delivery-74.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726002AbgC0JVF (ORCPT
        <rfc822;linux-trace-users@vger.kernel.org>);
        Fri, 27 Mar 2020 05:21:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1585300864;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=DAaMjWdhAOb7L37wvteNjXCzmV/oSCwYwlpioYKDJw8=;
        b=Xw5nhRtRDb3vrbnLbLhSVnR4s3RBB/RUYBjHykUOmj5qaNeg3jcKu27ytjsuf3zDfQMOem
        BoHn+0WiYLE0uxkvokRRjlLo52evUcUqo2x9iAof+FhV4tGyur/yWTyiv/Fv7tKEsuyoAu
        akEMsUwop8QHwIHxWlZ51YjfokqNvw4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-118-dUzDfZrtN-iPx6ODEZp_rA-1; Fri, 27 Mar 2020 05:20:57 -0400
X-MC-Unique: dUzDfZrtN-iPx6ODEZp_rA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 27F1A8010C7;
        Fri, 27 Mar 2020 09:20:55 +0000 (UTC)
Received: from krava (unknown [10.40.192.119])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id 64C9B5C1D4;
        Fri, 27 Mar 2020 09:20:49 +0000 (UTC)
Date:   Fri, 27 Mar 2020 10:20:45 +0100
From:   Jiri Olsa <jolsa@redhat.com>
To:     ahmadkhorrami <ahmadkhorrami@ut.ac.ir>
Cc:     Steven Rostedt <rostedt@goodmis.org>,
        Arnaldo Carvalho de Melo <acme@redhat.com>,
        Linux-trace Users <linux-trace-users@vger.kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        linux-trace-users-owner@vger.kernel.org,
        Jin Yao <yao.jin@linux.intel.com>,
        Milian Wolff <milian.wolff@kdab.com>,
        Namhyung Kim <namhyung@kernel.org>,
        Changbin Du <changbin.du@intel.com>,
        Andi Kleen <ak@linux.intel.com>
Subject: Re: Wrong Perf Backtraces
Message-ID: <20200327092045.GH1947699@krava>
References: <20200325210252.GC1947699@krava>
 <20200325170932.34d52269@gandalf.local.home>
 <edcf2ce8838d83b1c2d44204d9ca001f@ut.ac.ir>
 <20200325214624.GD1947699@krava>
 <fba145203611e7edcd674cc0cec9974b@ut.ac.ir>
 <52904543671bcb68ea9109b90c3e4267@ut.ac.ir>
 <20200326095928.GF1947699@krava>
 <243486883401862967ec2b06348c67f3@ut.ac.ir>
 <20200326153950.GG1947699@krava>
 <bf654a5cfe5a2a4188a286f1f5868e17@ut.ac.ir>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bf654a5cfe5a2a4188a286f1f5868e17@ut.ac.ir>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Sender: linux-trace-users-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-trace-users.vger.kernel.org>
X-Mailing-List: linux-trace-users@vger.kernel.org

On Thu, Mar 26, 2020 at 10:49:12PM +0430, ahmadkhorrami wrote:
> Hi,
> Here is the link for the python script:
> https://gofile.io/?c=1ZSLwe
> It is written in python-3 and takes the perf script output as input.
> It looks for consecutive repeated backtrace lines and checks if the function
> in these lines calls itself at the offset in the line (i.e., checks if
> recursion is possible). If not possible it reports an error. Could you check
> to see if any error is detected in your outputs, please?

I'm getting tons of following output:

/usr/lib/x86_64-linux-gnu/libgtk-3.so.0.2200.30: No such file or directory.
No symbol table is loaded.  Use the "file" command.
            7ffff71b9bc1 gtk_css_node_invalidate_timestamp+0x31 (/usr/lib/x86_64-linux-gnu/libgtk-3.so.0.2200.30)

I assume it's because I have all the dso binaries stored
under .biuldid path, while you check the output name

jirka

> Regards.
> On 2020-03-26 20:09, Jiri Olsa wrote:
> 
> > On Thu, Mar 26, 2020 at 05:50:27PM +0430, ahmadkhorrami wrote:
> > 
> > > Hi,
> > > First of all, many thanks for your time. Did you say that the first
> > > file has
> > > problems?
> > > 
> > > The first file (http://gofile.io/?c=qk6oXv) has repeated gmallocn()s
> > > while
> > > the second (https://gofile.io/?c=oGxgSM) also has problems with
> > > unmatched
> > > (not necessarily repeated) function calls. I am not sure if the
> > > kernel for
> > > the second one is 5.4.7 or the generic Ubuntu kernel. But the first
> > > one is
> > > certainly 5.4.7. Just to be clear, there were many instances of these
> > > unmatched <caller, callees>.
> > 
> > I can se all the files, but I just can't see the issue yet
> > but it's probably because of issues with perf archive..
> > 
> > let's see if somebody else can chime in
> > 
> > > I have a simple python script that checks for this situation. It
> > > disassembles functions using GDB and checks the (directly called)
> > > target of
> > > each caller. I will put some comments in the script and upload it.
> > > Could you
> > > check to see if the python script detects any mismatches in your
> > > backtraces?
> > > It takes the perf script output file as input. I will upload the
> > > script in
> > > an hour.
> > 
> > ok
> > 
> > jirka
> 

