Return-Path: <SRS0=QNZT=5L=vger.kernel.org=linux-trace-users-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28FC5C43331
	for <linux-trace-users@archiver.kernel.org>; Thu, 26 Mar 2020 15:40:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id EDC7820714
	for <linux-trace-users@archiver.kernel.org>; Thu, 26 Mar 2020 15:40:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZUXI0JuF"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726296AbgCZPkE (ORCPT
        <rfc822;linux-trace-users@archiver.kernel.org>);
        Thu, 26 Mar 2020 11:40:04 -0400
Received: from us-smtp-delivery-74.mimecast.com ([63.128.21.74]:49866 "EHLO
        us-smtp-delivery-74.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727646AbgCZPkE (ORCPT
        <rfc822;linux-trace-users@vger.kernel.org>);
        Thu, 26 Mar 2020 11:40:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1585237203;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=BjhtsWqLMOP1dKfR0L84QOWDBpRe70Unnoijkhtm+E4=;
        b=ZUXI0JuFj/ThrKgn+2z4reXQGcaR7SAtqX7AVAjfAiwVaJ+8nIcJBsMLGwDQnn4dp1uCPG
        zzZ3AB2Tk7E4bT93Gooev98TGKz9avcR/WWRTHVPXI70ZBaeuvg4u3rLpzL7M7c3DXgPAm
        NYmeUnmnOBrkTPYPSJJBL30+w20PBrA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-300-KTewKUx1PHmYqwRxOgF0Fw-1; Thu, 26 Mar 2020 11:39:58 -0400
X-MC-Unique: KTewKUx1PHmYqwRxOgF0Fw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 77EEC801E66;
        Thu, 26 Mar 2020 15:39:56 +0000 (UTC)
Received: from krava (unknown [10.40.192.119])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id 7AE0B60BF3;
        Thu, 26 Mar 2020 15:39:53 +0000 (UTC)
Date:   Thu, 26 Mar 2020 16:39:50 +0100
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
Message-ID: <20200326153950.GG1947699@krava>
References: <4ffb7e2b6e272c20616fbf133a125fdf@ut.ac.ir>
 <20200325203921.GB1947699@krava>
 <20200325210252.GC1947699@krava>
 <20200325170932.34d52269@gandalf.local.home>
 <edcf2ce8838d83b1c2d44204d9ca001f@ut.ac.ir>
 <20200325214624.GD1947699@krava>
 <fba145203611e7edcd674cc0cec9974b@ut.ac.ir>
 <52904543671bcb68ea9109b90c3e4267@ut.ac.ir>
 <20200326095928.GF1947699@krava>
 <243486883401862967ec2b06348c67f3@ut.ac.ir>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <243486883401862967ec2b06348c67f3@ut.ac.ir>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Sender: linux-trace-users-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-trace-users.vger.kernel.org>
X-Mailing-List: linux-trace-users@vger.kernel.org

On Thu, Mar 26, 2020 at 05:50:27PM +0430, ahmadkhorrami wrote:
> Hi,
> First of all, many thanks for your time. Did you say that the first file has
> problems?
> 
> The first file (http://gofile.io/?c=qk6oXv) has repeated gmallocn()s while
> the second (https://gofile.io/?c=oGxgSM) also has problems with unmatched
> (not necessarily repeated) function calls. I am not sure if the kernel for
> the second one is 5.4.7 or the generic Ubuntu kernel. But the first one is
> certainly 5.4.7. Just to be clear, there were many instances of these
> unmatched <caller, callees>.

I can se all the files, but I just can't see the issue yet
but it's probably because of issues with perf archive..

let's see if somebody else can chime in

> I have a simple python script that checks for this situation. It
> disassembles functions using GDB and checks the (directly called) target of
> each caller. I will put some comments in the script and upload it. Could you
> check to see if the python script detects any mismatches in your backtraces?
> It takes the perf script output file as input. I will upload the script in
> an hour.

ok

jirka

