Return-Path: <SRS0=ls0D=5M=vger.kernel.org=linux-trace-users-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8983C43331
	for <linux-trace-users@archiver.kernel.org>; Fri, 27 Mar 2020 22:38:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B3EBE20717
	for <linux-trace-users@archiver.kernel.org>; Fri, 27 Mar 2020 22:38:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dKfIlzcS"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727585AbgC0WiC (ORCPT
        <rfc822;linux-trace-users@archiver.kernel.org>);
        Fri, 27 Mar 2020 18:38:02 -0400
Received: from us-smtp-delivery-74.mimecast.com ([216.205.24.74]:37017 "EHLO
        us-smtp-delivery-74.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726781AbgC0WiB (ORCPT
        <rfc822;linux-trace-users@vger.kernel.org>);
        Fri, 27 Mar 2020 18:38:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1585348679;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=ZBup+S4SKiQxgW1wXOp+D5cRPVLb/GVM+p/T3t3WSqk=;
        b=dKfIlzcS6fCM+2bkEzFxLmq+8Q7VKw6MZet6DiehqWdImvUyl2ANWgxCWf/Pqlx0OY+U1M
        B/SifrKpzT7lmE+4K21BrRWGPTdCBSQArk4FR4DiWpNG+C+RhbPTJ1KLaH4oA3rMNgkTE/
        dt+zdq3F4lW8Vzzz4iEfUthVKj5UAag=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-129-6pdb6nl0OyG-D3u6FnDbSA-1; Fri, 27 Mar 2020 18:37:53 -0400
X-MC-Unique: 6pdb6nl0OyG-D3u6FnDbSA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 223511005516;
        Fri, 27 Mar 2020 22:37:51 +0000 (UTC)
Received: from krava (unknown [10.40.196.17])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id CC83F60BF3;
        Fri, 27 Mar 2020 22:37:47 +0000 (UTC)
Date:   Fri, 27 Mar 2020 23:37:43 +0100
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
Message-ID: <20200327223743.GA2155755@krava>
References: <fba145203611e7edcd674cc0cec9974b@ut.ac.ir>
 <52904543671bcb68ea9109b90c3e4267@ut.ac.ir>
 <20200326095928.GF1947699@krava>
 <243486883401862967ec2b06348c67f3@ut.ac.ir>
 <20200326153950.GG1947699@krava>
 <bf654a5cfe5a2a4188a286f1f5868e17@ut.ac.ir>
 <20200327092045.GH1947699@krava>
 <821540886fc57d7749edee585a50602f@ut.ac.ir>
 <decdc878b1bf207c68f1bc9e21178486@ut.ac.ir>
 <fd99185b401a451fdbf96439eadcb101@ut.ac.ir>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fd99185b401a451fdbf96439eadcb101@ut.ac.ir>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Sender: linux-trace-users-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-trace-users.vger.kernel.org>
X-Mailing-List: linux-trace-users@vger.kernel.org

On Fri, Mar 27, 2020 at 11:13:27PM +0430, ahmadkhorrami wrote:
> Hi,
> I revised the code. Hopefully, it works. Could you check it with your own
> outputs? It is valuable for me to know if your output contains wrong
> backtraces or not. Here is the link:
> https://gofile.io/?c=rz2kGc

will check, so far caught one.. might be same case:

evince 2168454 1549196.055094:      43831 cycles:u:
  ffffffffaec012f0 [unknown] ([unknown])
      7f0dd44776b6 __mmap64+0x26 (inlined)
      7f0dd44776b6 __mmap64+0x26 (inlined)

will try to investigate next week

thanks,
jirka

> Regards.
> 
> On 2020-03-27 15:34, ahmadkhorrami wrote:
> 
> > I do the following:
> > If this line is in the perf script backtrace:
> > 7f21ffe256db g_main_context_iteration+0x2b
> > (/usr/lib/x86_64-linux-gnu/libglib-2.0.so.0.5600.4)
> > I run the following command:
> > gdb -batch -ex 'file /usr/lib/x86_64-linux-gnu/libglib-2.0.so.0.5600.4'
> > -ex 'disass g_main_context_iteration'.
> > 
> > Regards.
> > 
> > On 2020-03-27 15:29, ahmadkhorrami wrote:
> > 
> > > Hi,
> > > Thanks! Could you tell me what should be changed in order to make
> > > the code runnable on your system, if it is possible?
> > > Regards.
> > > 
> > > On 2020-03-27 13:50, Jiri Olsa wrote:
> > > 
> > > On Thu, Mar 26, 2020 at 10:49:12PM +0430, ahmadkhorrami wrote:
> > > 
> > > Hi,
> > > Here is the link for the python script:
> > > https://gofile.io/?c=1ZSLwe
> > > It is written in python-3 and takes the perf script output as input.
> > > It looks for consecutive repeated backtrace lines and checks if the
> > > function
> > > in these lines calls itself at the offset in the line (i.e., checks if
> > > recursion is possible). If not possible it reports an error. Could
> > > you check
> > > to see if any error is detected in your outputs, please?
> > > I'm getting tons of following output:
> > > 
> > > /usr/lib/x86_64-linux-gnu/libgtk-3.so.0.2200.30: No such file or
> > > directory.
> > > No symbol table is loaded.  Use the "file" command.
> > > 7ffff71b9bc1 gtk_css_node_invalidate_timestamp+0x31
> > > (/usr/lib/x86_64-linux-gnu/libgtk-3.so.0.2200.30)
> > > 
> > > I assume it's because I have all the dso binaries stored
> > > under .biuldid path, while you check the output name
> > > 
> > > jirka
> > > 
> > > Regards.
> > > On 2020-03-26 20:09, Jiri Olsa wrote:
> > > 
> > > On Thu, Mar 26, 2020 at 05:50:27PM +0430, ahmadkhorrami wrote:
> > > 
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
> > > I can se all the files, but I just can't see the issue yet
> > > but it's probably because of issues with perf archive..
> > > 
> > > let's see if somebody else can chime in
> > > 
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
> > > ok
> > > 
> > > jirka
> 

