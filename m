Return-Path: <linux-trace-users-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C36D3C61DA4
	for <linux-trace-users@archiver.kernel.org>; Mon, 13 Mar 2023 18:00:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229516AbjCMSAD (ORCPT
        <rfc822;linux-trace-users@archiver.kernel.org>);
        Mon, 13 Mar 2023 14:00:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33486 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230337AbjCMR7x (ORCPT
        <rfc822;linux-trace-users@vger.kernel.org>);
        Mon, 13 Mar 2023 13:59:53 -0400
Received: from mail2-relais-roc.national.inria.fr (mail2-relais-roc.national.inria.fr [192.134.164.83])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EBBB72470D
        for <linux-trace-users@vger.kernel.org>; Mon, 13 Mar 2023 10:59:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=K/WRUkdSHTawEOGGGqXUfpG/lT/xw0Zjf/IQkX0kkTY=;
  b=l87ETKlZ5zX4+DgCLPNF9z70BnXHlSjVNkVn74qJ6naSYlPKjkpztuX1
   hiwj17K4Xclz2LAJtNao+ni6Zi7yEN3E2M1ya+3PpnAitfHenpWdFeOmi
   KEAScN8+16de8m6ZphpkSRHFZpYnblHF9PmX8ICAMIxwN/Jt58VRf/HNS
   E=;
Authentication-Results: mail2-relais-roc.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="5.98,257,1673910000"; 
   d="scan'208";a="96949032"
Received: from dt-lawall.paris.inria.fr ([128.93.67.65])
  by mail2-relais-roc.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2023 18:59:50 +0100
Date:   Mon, 13 Mar 2023 18:59:50 +0100 (CET)
From:   Julia Lawall <julia.lawall@inria.fr>
To:     Steven Rostedt <rostedt@goodmis.org>
cc:     linux-trace-users@vger.kernel.org
Subject: Re: CSV output
In-Reply-To: <20230313135332.075af0a9@gandalf.local.home>
Message-ID: <606f40f1-a411-b688-9136-cbc6fa95541f@inria.fr>
References: <alpine.DEB.2.22.394.2303120805430.2865@hadrien> <20230313121528.5650068b@gandalf.local.home> <87b0589-28a5-1cb5-f3ee-4d5c2e817116@inria.fr> <20230313135332.075af0a9@gandalf.local.home>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-trace-users.vger.kernel.org>
X-Mailing-List: linux-trace-users@vger.kernel.org



On Mon, 13 Mar 2023, Steven Rostedt wrote:

> On Mon, 13 Mar 2023 18:40:16 +0100 (CET)
> Julia Lawall <julia.lawall@inria.fr> wrote:
>
> > Thanks for the patch.  But actually, I was hoping for something like this:
> >
> > cpus=96
> > <...>-20420,074,3057.962369,sched_process_exec,/tmp/tmp2abf06.sh,20420,20420
> > <...>-20420,074,3057.963487,sched_switch,tmp2abf06.sh,20420,120,D,swapper/74,0,120
> > <idle>-0,034,3057.963602,sched_waking,kworker/u192,6,500,120,075
> > <idle>-0,075,3057.963632,sched_wakeup,kworker/u192,6,500,120,075
> > <idle>-0,075,3057.963637,sched_switch,swapper/75,0,120,R,kworker/u192,6,500,120
> > kworker/u192,6-500,075,3057.963656,sched_waking,tmp2abf06.sh,20420,120,074
> > kworker/u192,6-500,075,3057.963665,sched_switch,kworker/u192,6,500,120,W,swapper/75,0,120
> > <idle>-0,074,3057.963686,sched_wakeup,tmp2abf06.sh,20420,120,074
> > <idle>-0,074,3057.963691,sched_switch,swapper/74,0,120,R,tmp2abf06.sh,20420,120
> >
> > It still remains human readable (more or less, with practice), but there
> > are not a lot of spaces that a parser has to get rid of.  The separator
> > character would have to be something that can't occur in a command name.
>
> Should be rather trivial to implement.
>
> Better yet, I'm hoping to get some time to finish looking at the python
> updates that were sent to me, and where it could be possible to just allow
> you to override the output with a python script.

OK, no hurry.  I looked into the plugins, but they seem to control only
part of the output and it seems that one would be needed for every type of
event.  I could try writing python, if there is an example.

thanks,
julia
