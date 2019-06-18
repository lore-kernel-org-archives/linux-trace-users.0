Return-Path: <SRS0=oy1S=UR=vger.kernel.org=linux-trace-users-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 635DDC31E51
	for <linux-trace-users@archiver.kernel.org>; Tue, 18 Jun 2019 13:02:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 38FBB20665
	for <linux-trace-users@archiver.kernel.org>; Tue, 18 Jun 2019 13:02:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725955AbfFRNCi (ORCPT
        <rfc822;linux-trace-users@archiver.kernel.org>);
        Tue, 18 Jun 2019 09:02:38 -0400
Received: from mail.kernel.org ([198.145.29.99]:59898 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725913AbfFRNCh (ORCPT
        <rfc822;linux-trace-users@vger.kernel.org>);
        Tue, 18 Jun 2019 09:02:37 -0400
Received: from gandalf.local.home (cpe-66-24-58-225.stny.res.rr.com [66.24.58.225])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D52CB20665;
        Tue, 18 Jun 2019 13:02:36 +0000 (UTC)
Date:   Tue, 18 Jun 2019 09:02:35 -0400
From:   Steven Rostedt <rostedt@goodmis.org>
To:     Naruto Nguyen <narutonguyen2018@gmail.com>
Cc:     linux-trace-users@vger.kernel.org
Subject: Re: How to find out which process cause a strange increasing cpu
 load on a certain core?
Message-ID: <20190618090235.6a7b5a60@gandalf.local.home>
In-Reply-To: <CANpxKHEMjWRSbV8fq_iSR5XAzy7oMuht0xfRTeLtBxajxtW2eg@mail.gmail.com>
References: <CANpxKHEMjWRSbV8fq_iSR5XAzy7oMuht0xfRTeLtBxajxtW2eg@mail.gmail.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-trace-users-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-trace-users.vger.kernel.org>
X-Mailing-List: linux-trace-users@vger.kernel.org

On Tue, 18 Jun 2019 18:40:13 +0700
Naruto Nguyen <narutonguyen2018@gmail.com> wrote:

> Hello everyone,
> 
> I have a kvm hypervisor and setup some VMs running OpenSUSE kernel
> 4.0. After some reboot, I saw that sometime there is a VM that a
> certain core has higher %usr and %sys than other cores. The system is
> in ide state. I have some applications running on this VM, but there
> is no issue in other VMs.

How much higher? And is it always an issue with the same core on the
same VM?

> 
> If I enable ftrace in kernel or load any debug jprobe, the load is

I'm assuming by "ftrace" you mean the full function tracer?

 # echo function > /sys/kernel/tracing/current_tracer

> back to normal. The pidstat command output does not show the high load
> on one core like the "top" command. Could you please let me know if it
> is the problem of "top' report higher usage? Any commands that can
> help to troubleshoot this issue? I tried "perf" but most of the time
> the perf output does not show any function that cause the increase as
> well? Not sure, if the malfunction of top or anything else can add
> more work load?

I would suggest just tracing sched switches and interrupts. That
shouldn't affect the load, as it is very low weight.

 # cd /sys/kernel/tracing
 # echo 1 > events/sched/sched_waking/enable
 # echo 1 > events/sched/sched_switch/enable
 # echo 1 > events/irq/enable

And then monitor that.

-- Steve
