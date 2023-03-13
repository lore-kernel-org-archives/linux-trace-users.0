Return-Path: <linux-trace-users-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25743C6FD19
	for <linux-trace-users@archiver.kernel.org>; Mon, 13 Mar 2023 17:53:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230103AbjCMRxo (ORCPT
        <rfc822;linux-trace-users@archiver.kernel.org>);
        Mon, 13 Mar 2023 13:53:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52268 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230005AbjCMRxo (ORCPT
        <rfc822;linux-trace-users@vger.kernel.org>);
        Mon, 13 Mar 2023 13:53:44 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 413791713
        for <linux-trace-users@vger.kernel.org>; Mon, 13 Mar 2023 10:53:37 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id D63C3B811B3
        for <linux-trace-users@vger.kernel.org>; Mon, 13 Mar 2023 17:53:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51888C433EF;
        Mon, 13 Mar 2023 17:53:34 +0000 (UTC)
Date:   Mon, 13 Mar 2023 13:53:32 -0400
From:   Steven Rostedt <rostedt@goodmis.org>
To:     Julia Lawall <julia.lawall@inria.fr>
Cc:     linux-trace-users@vger.kernel.org
Subject: Re: CSV output
Message-ID: <20230313135332.075af0a9@gandalf.local.home>
In-Reply-To: <87b0589-28a5-1cb5-f3ee-4d5c2e817116@inria.fr>
References: <alpine.DEB.2.22.394.2303120805430.2865@hadrien>
        <20230313121528.5650068b@gandalf.local.home>
        <87b0589-28a5-1cb5-f3ee-4d5c2e817116@inria.fr>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-trace-users.vger.kernel.org>
X-Mailing-List: linux-trace-users@vger.kernel.org

On Mon, 13 Mar 2023 18:40:16 +0100 (CET)
Julia Lawall <julia.lawall@inria.fr> wrote:

> Thanks for the patch.  But actually, I was hoping for something like this:
> 
> cpus=96
> <...>-20420,074,3057.962369,sched_process_exec,/tmp/tmp2abf06.sh,20420,20420
> <...>-20420,074,3057.963487,sched_switch,tmp2abf06.sh,20420,120,D,swapper/74,0,120
> <idle>-0,034,3057.963602,sched_waking,kworker/u192,6,500,120,075
> <idle>-0,075,3057.963632,sched_wakeup,kworker/u192,6,500,120,075
> <idle>-0,075,3057.963637,sched_switch,swapper/75,0,120,R,kworker/u192,6,500,120
> kworker/u192,6-500,075,3057.963656,sched_waking,tmp2abf06.sh,20420,120,074
> kworker/u192,6-500,075,3057.963665,sched_switch,kworker/u192,6,500,120,W,swapper/75,0,120
> <idle>-0,074,3057.963686,sched_wakeup,tmp2abf06.sh,20420,120,074
> <idle>-0,074,3057.963691,sched_switch,swapper/74,0,120,R,tmp2abf06.sh,20420,120
> 
> It still remains human readable (more or less, with practice), but there
> are not a lot of spaces that a parser has to get rid of.  The separator
> character would have to be something that can't occur in a command name.

Should be rather trivial to implement.

Better yet, I'm hoping to get some time to finish looking at the python
updates that were sent to me, and where it could be possible to just allow
you to override the output with a python script.

-- Steve
