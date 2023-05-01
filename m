Return-Path: <linux-trace-users-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EC63C77B61
	for <linux-trace-users@archiver.kernel.org>; Mon,  1 May 2023 04:42:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229679AbjEAEmW (ORCPT
        <rfc822;linux-trace-users@archiver.kernel.org>);
        Mon, 1 May 2023 00:42:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38256 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232137AbjEAEmT (ORCPT
        <rfc822;linux-trace-users@vger.kernel.org>);
        Mon, 1 May 2023 00:42:19 -0400
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65C0D10D4
        for <linux-trace-users@vger.kernel.org>; Sun, 30 Apr 2023 21:42:16 -0700 (PDT)
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-50bc5197d33so1250561a12.1
        for <linux-trace-users@vger.kernel.org>; Sun, 30 Apr 2023 21:42:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682916134; x=1685508134;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=B4FudS0x2Uf+gBefZQ7w33Ja+yIL96C7oERgppo29Ww=;
        b=D12iYu/PK05NSEGSSfKtIWw8FwoC6nbdwtkKupYxv/HXFGiuxlWueyKi7Xe+WsnEVF
         zXrOZ8t0k3C23sv+WrG3wT1rTu+duIHipiY/+JwYmSbBm72VSbQVlPxQgcddIjAqzDi8
         1V22wzsSAz7DzOgkvAmgu+MtiDVXZLJjlDLwsOUenNhLdWO/BQKWzNkAPTglo/xsBzCd
         kaP0jzivolc6X9CRpa0EcT8IgUY0bg+bgI2t96UIdAmA6T/rfZ0UNcl5DLLqlqCbtC05
         S4zRYqqPF2fEntWqDoLpXgSGGlV9CjaUPcsAriIZPRufCtoLHYaxfe+V3bmAhDin4Ich
         9XeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682916134; x=1685508134;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=B4FudS0x2Uf+gBefZQ7w33Ja+yIL96C7oERgppo29Ww=;
        b=YDpWvOeY/5jpUi+WUVPG4XS0mbVRCgGtJ0EoI0EHdsq9SDKtghImHZPUC02InxUTaH
         YXd1agi72zCxA84sPFejqBezfrJ+a+3eMMPE1H4Srz4Pjr3xCNtg49qyuzBq9aZVvRBw
         i3dpoeOZOhcKkpFFC7HVjeb07mxXoMivvRFE++yVaR1UqhZNB6WIinNYBFFo1LrrPkVR
         n7iGPaaHEGoYxM/AbepKmNOUUMx6KVVr0LfJfBHABSdrflux1QcPPQTbqpWS3EcygRU+
         t/nAYcr3+wtH2HUjuwdm2u68dzhmnU1JFIFpvSgYfmHTf/PiaUgafI2ubT7p/70MshGx
         z1AQ==
X-Gm-Message-State: AC+VfDyfyZRXP5hl4ABeCpZgO/2Vm4sRf0Ayr+/HgY2mVmoKuFwvHvEf
        8jM0vU48+EQ5SnXq0ruvSRBygFUjG2kIOfwYaoq07VTe5LU=
X-Google-Smtp-Source: ACHHUZ5A24GdHEL0PdDM1g+3mqZfZSymbwA/Tf+dC3jYi85b6jqAzsuCrKQJtZQMB8uehS2v2L9YE13uGg/ujdFpL6c=
X-Received: by 2002:aa7:cc04:0:b0:50b:c164:b045 with SMTP id
 q4-20020aa7cc04000000b0050bc164b045mr2675048edt.2.1682916134326; Sun, 30 Apr
 2023 21:42:14 -0700 (PDT)
MIME-Version: 1.0
From:   Brian Hutchinson <b.hutchman@gmail.com>
Date:   Mon, 1 May 2023 00:42:03 -0400
Message-ID: <CAFZh4h89N2FedvTePY7cXUjwZw61mpjcy+f9oBu5a54gYiozTw@mail.gmail.com>
Subject: Trying to trace when RT FF & RR threads hit RT Throttle limit (kernel.sched_rt_runtime_us)
To:     linux-trace-users@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-trace-users.vger.kernel.org>
X-Mailing-List: linux-trace-users@vger.kernel.org

Hi,

Using 5.10.69 kernel on a i.MX8 platform with isolated cpu's (isolcpus
on cmd line) with RT_RUNTIME_SHARE and wanting to know if (and who) is
hitting the RT Throttle limit.  Since my kernel does not have a
tracepoint for this, I used gdb and disassembled kernel/sched/rt.c to
find the address where throttling gets set and then added a kprobe for
it.

When I look at the trace I'm seeing what looks like "idle" being
throttled in addition to other things.  I "think" my probe is working
as when I look at the trace, the processes that show up look like they
have run over the 95% limit of one period (defaulted to 1 second) but
I'm confused as to why Idle shows up.

I've not ran lttng trace capturing context switches yet to see what
other processes might be involved around the time the throttle kicks
in, at the moment I'm just trying to validate I'm going after the
problem and setting it up the right way.

I did identify a patch that enables a tracepoint for the rt throttle
but it is for RT_GROUP_SCHED and we aren't using that at the moment.

I suspect the application I'm trying to debug has some misbehaving
realtime processes (not using a rt patched kernel) that are being
throttled so I'm trying to identify them so they can be studied and
made to behave better.

If anyone has a better idea or advice on how to go about this please
point me in the right direction.

Below is a sample of a trace I captured using the kprobe I mentioned
above when rt_throttled=1.  I don't quite understand how Idle can be 3
levels deep in preemption or why "idle" is even showing up.

CPU's 1, 2 and 3 have been isolated and the application that appears
to be getting throttled is on core 2:

# tracer: nop
#
# entries-in-buffer/entries-written: 592/592   #P:4
#
#                                _-----=> irqs-off
#                               / _----=> need-resched
#                              | / _---=> hardirq/softirq
#                              || / _--=> preempt-depth
#                              ||| /     delay
#           TASK-PID     CPU#  ||||   TIMESTAMP  FUNCTION
#              | |         |   ||||      |         |
         <idle>-0       [002] d.h3   508.964800: p_0x00000000223c0e95:
(sched_rt_period_timer+0x1f0/0x328) arg1=0x0
         <idle>-0       [002] d.h3   508.964815: p_0x00000000223c0e95:
(sched_rt_period_timer+0x1f0/0x328) arg1=0x0
         <idle>-0       [002] d.h3   508.964822: p_0x00000000223c0e95:
(sched_rt_period_timer+0x1f0/0x328) arg1=0x0
         <idle>-0       [002] d.h3   508.964831: p_0x00000000223c0e95:
(sched_rt_period_timer+0x1f0/0x328) arg1=0x0
         <idle>-0       [002] d.h3   509.964801: p_0x00000000223c0e95:
(sched_rt_period_timer+0x1f0/0x328) arg1=0x0
         <idle>-0       [002] d.h3   509.964817: p_0x00000000223c0e95:
(sched_rt_period_timer+0x1f0/0x328) arg1=0x0
         <idle>-0       [002] d.h3   509.964824: p_0x00000000223c0e95:
(sched_rt_period_timer+0x1f0/0x328) arg1=0x0
         <idle>-0       [002] d.h3   509.964832: p_0x00000000223c0e95:
(sched_rt_period_timer+0x1f0/0x328) arg1=0x0
         <idle>-0       [002] d.h3   510.964799: p_0x00000000223c0e95:
(sched_rt_period_timer+0x1f0/0x328) arg1=0x0
         <idle>-0       [002] d.h3   510.964814: p_0x00000000223c0e95:
(sched_rt_period_timer+0x1f0/0x328) arg1=0x0
         <idle>-0       [002] d.h3   510.964821: p_0x00000000223c0e95:
(sched_rt_period_timer+0x1f0/0x328) arg1=0x0
         <idle>-0       [002] d.h3   510.964832: p_0x00000000223c0e95:
(sched_rt_period_timer+0x1f0/0x328) arg1=0x0
         <idle>-0       [002] d.h3   511.964799: p_0x00000000223c0e95:
(sched_rt_period_timer+0x1f0/0x328) arg1=0x0
         <idle>-0       [002] d.h3   511.964816: p_0x00000000223c0e95:
(sched_rt_period_timer+0x1f0/0x328) arg1=0x0
         <idle>-0       [002] d.h3   511.964823: p_0x00000000223c0e95:
(sched_rt_period_timer+0x1f0/0x328) arg1=0x0
         <idle>-0       [002] d.h3   511.964830: p_0x00000000223c0e95:
(sched_rt_period_timer+0x1f0/0x328) arg1=0x0
         <idle>-0       [002] d.h3   512.964800: p_0x00000000223c0e95:
(sched_rt_period_timer+0x1f0/0x328) arg1=0x0
         <idle>-0       [002] d.h3   512.964815: p_0x00000000223c0e95:
(sched_rt_period_timer+0x1f0/0x328) arg1=0x0
         <idle>-0       [002] d.h3   512.964822: p_0x00000000223c0e95:
(sched_rt_period_timer+0x1f0/0x328) arg1=0x0
         <idle>-0       [002] d.h3   512.964829: p_0x00000000223c0e95:
(sched_rt_period_timer+0x1f0/0x328) arg1=0x0
         <idle>-0       [002] d.h3   513.964801: p_0x00000000223c0e95:
(sched_rt_period_timer+0x1f0/0x328) arg1=0x0
         <idle>-0       [002] d.h3   513.964817: p_0x00000000223c0e95:
(sched_rt_period_timer+0x1f0/0x328) arg1=0x0
         <idle>-0       [002] d.h3   513.964826: p_0x00000000223c0e95:
(sched_rt_period_timer+0x1f0/0x328) arg1=0x0
         <idle>-0       [002] d.h3   513.964835: p_0x00000000223c0e95:
(sched_rt_period_timer+0x1f0/0x328) arg1=0x0
         <idle>-0       [002] d.h3   514.964803: p_0x00000000223c0e95:
(sched_rt_period_timer+0x1f0/0x328) arg1=0x0
         <idle>-0       [002] d.h3   514.964818: p_0x00000000223c0e95:
(sched_rt_period_timer+0x1f0/0x328) arg1=0x0
         <idle>-0       [002] d.h3   514.964825: p_0x00000000223c0e95:
(sched_rt_period_timer+0x1f0/0x328) arg1=0x0
         <idle>-0       [002] d.h3   514.964832: p_0x00000000223c0e95:
(sched_rt_period_timer+0x1f0/0x328) arg1=0x0
         <idle>-0       [002] d.h3   515.964801: p_0x00000000223c0e95:
(sched_rt_period_timer+0x1f0/0x328) arg1=0x0
         <idle>-0       [002] d.h3   515.964818: p_0x00000000223c0e95:
(sched_rt_period_timer+0x1f0/0x328) arg1=0x0
         <idle>-0       [002] d.h3   515.964825: p_0x00000000223c0e95:
(sched_rt_period_timer+0x1f0/0x328) arg1=0x0
         <idle>-0       [002] d.h3   515.964834: p_0x00000000223c0e95:
(sched_rt_period_timer+0x1f0/0x328) arg1=0x0
         <idle>-0       [002] d.h3   516.964797: p_0x00000000223c0e95:
(sched_rt_period_timer+0x1f0/0x328) arg1=0x0
         <idle>-0       [002] d.h3   516.964809: p_0x00000000223c0e95:
(sched_rt_period_timer+0x1f0/0x328) arg1=0x0
         <idle>-0       [002] d.h3   516.964815: p_0x00000000223c0e95:
(sched_rt_period_timer+0x1f0/0x328) arg1=0x0
         <idle>-0       [002] d.h3   516.964820: p_0x00000000223c0e95:
(sched_rt_period_timer+0x1f0/0x328) arg1=0x0
         <idle>-0       [000] d.h3   517.964804: p_0x00000000223c0e95:
(sched_rt_period_timer+0x1f0/0x328) arg1=0x0
         <idle>-0       [000] d.h3   517.964820: p_0x00000000223c0e95:
(sched_rt_period_timer+0x1f0/0x328) arg1=0x0
         <idle>-0       [000] d.h3   517.964829: p_0x00000000223c0e95:
(sched_rt_period_timer+0x1f0/0x328) arg1=0x0
         <idle>-0       [000] d.h3   517.964839: p_0x00000000223c0e95:
(sched_rt_period_timer+0x1f0/0x328) arg1=0x0
         <idle>-0       [002] d.h3   518.964799: p_0x00000000223c0e95:
(sched_rt_period_timer+0x1f0/0x328) arg1=0x0
         <idle>-0       [002] d.h3   518.964815: p_0x00000000223c0e95:
(sched_rt_period_timer+0x1f0/0x328) arg1=0x0
         <idle>-0       [002] d.h3   518.964823: p_0x00000000223c0e95:
(sched_rt_period_timer+0x1f0/0x328) arg1=0x0
         <idle>-0       [002] d.h3   518.964831: p_0x00000000223c0e95:
(sched_rt_period_timer+0x1f0/0x328) arg1=0x0
         <idle>-0       [002] d.h3   519.964801: p_0x00000000223c0e95:
(sched_rt_period_timer+0x1f0/0x328) arg1=0x0
         <idle>-0       [002] d.h3   519.964817: p_0x00000000223c0e95:
(sched_rt_period_timer+0x1f0/0x328) arg1=0x0
         <idle>-0       [002] d.h3   519.964824: p_0x00000000223c0e95:
(sched_rt_period_timer+0x1f0/0x328) arg1=0x0
         <idle>-0       [002] d.h3   519.964833: p_0x00000000223c0e95:
(sched_rt_period_timer+0x1f0/0x328) arg1=0x0
         <idle>-0       [002] d.h3   520.964800: p_0x00000000223c0e95:
(sched_rt_period_timer+0x1f0/0x328) arg1=0x0
         <idle>-0       [002] d.h3   520.964815: p_0x00000000223c0e95:
(sched_rt_period_timer+0x1f0/0x328) arg1=0x0
         <idle>-0       [002] d.h3   520.964822: p_0x00000000223c0e95:
(sched_rt_period_timer+0x1f0/0x328) arg1=0x0
         <idle>-0       [002] d.h3   520.964831: p_0x00000000223c0e95:
(sched_rt_period_timer+0x1f0/0x328) arg1=0x0
         <idle>-0       [002] dNh3   521.964811: p_0x00000000223c0e95:
(sched_rt_period_timer+0x1f0/0x328) arg1=0x0
         <idle>-0       [002] dNh3   521.964828: p_0x00000000223c0e95:
(sched_rt_period_timer+0x1f0/0x328) arg1=0x0
         <idle>-0       [002] dNh3   521.964835: p_0x00000000223c0e95:
(sched_rt_period_timer+0x1f0/0x328) arg1=0x0
         <idle>-0       [002] dNh3   521.964847: p_0x00000000223c0e95:
(sched_rt_period_timer+0x1f0/0x328) arg1=0x0
         <idle>-0       [002] dNh3   522.964795: p_0x00000000223c0e95:
(sched_rt_period_timer+0x1f0/0x328) arg1=0x0
         <idle>-0       [002] dNh3   522.964811: p_0x00000000223c0e95:
(sched_rt_period_timer+0x1f0/0x328) arg1=0x0
         <idle>-0       [002] dNh3   522.964819: p_0x00000000223c0e95:
(sched_rt_period_timer+0x1f0/0x328) arg1=0x0
         <idle>-0       [002] dNh3   522.964826: p_0x00000000223c0e95:
(sched_rt_period_timer+0x1f0/0x328) arg1=0x0
    irq/33-sdma-369     [002] dNh3   523.964811: p_0x00000000223c0e95:
(sched_rt_period_timer+0x1f0/0x328) arg1=0x0
    irq/33-sdma-369     [002] dNh3   523.964826: p_0x00000000223c0e95:
(sched_rt_period_timer+0x1f0/0x328) arg1=0x0
    irq/33-sdma-369     [002] dNh3   523.964833: p_0x00000000223c0e95:
(sched_rt_period_timer+0x1f0/0x328) arg1=0x0
    irq/33-sdma-369     [002] dNh3   523.964842: p_0x00000000223c0e95:
(sched_rt_period_timer+0x1f0/0x328) arg1=0x0
    some-thread-758     [002] d.h4   524.964799: p_0x00000000223c0e95:
(sched_rt_period_timer+0x1f0/0x328) arg1=0x0
    some-thread-758     [002] d.h4   524.964816: p_0x00000000223c0e95:
(sched_rt_period_timer+0x1f0/0x328) arg1=0x0
    some-thread-758     [002] d.h4   524.964825: p_0x00000000223c0e95:
(sched_rt_period_timer+0x1f0/0x328) arg1=0x0
    some-thread-758     [002] d.h4   524.964834: p_0x00000000223c0e95:
(sched_rt_period_timer+0x1f0/0x328) arg1=0x0
    some-thread-758     [002] d.h3   525.964794: p_0x00000000223c0e95:
(sched_rt_period_timer+0x1f0/0x328) arg1=0x0
    some-thread-758     [002] d.h3   525.964810: p_0x00000000223c0e95:
(sched_rt_period_timer+0x1f0/0x328) arg1=0x0
    some-thread-758     [002] d.h3   525.964817: p_0x00000000223c0e95:
(sched_rt_period_timer+0x1f0/0x328) arg1=0x0
    some-thread-758     [002] d.h3   525.964825: p_0x00000000223c0e95:
(sched_rt_period_timer+0x1f0/0x328) arg1=0x0
    some-thread-758     [002] d.h2   526.964793: p_0x00000000223c0e95:
(sched_rt_period_timer+0x1f0/0x328) arg1=0x0
    some-thread-758     [002] d.h2   526.964808: p_0x00000000223c0e95:
(sched_rt_period_timer+0x1f0/0x328) arg1=0x0
    some-thread-758     [002] d.h2   526.964815: p_0x00000000223c0e95:
(sched_rt_period_timer+0x1f0/0x328) arg1=0x0
    some-thread-758     [002] d.h2   526.964823: p_0x00000000223c0e95:
(sched_rt_period_timer+0x1f0/0x328) arg1=0x0
    irq/33-sdma-369     [002] d.h4   527.964802: p_0x00000000223c0e95:
(sched_rt_period_timer+0x1f0/0x328) arg1=0x0
    irq/33-sdma-369     [002] d.h4   527.964818: p_0x00000000223c0e95:
(sched_rt_period_timer+0x1f0/0x328) arg1=0x0
    irq/33-sdma-369     [002] d.h4   527.964826: p_0x00000000223c0e95:
(sched_rt_period_timer+0x1f0/0x328) arg1=0x0
    irq/33-sdma-369     [002] d.h4   527.964835: p_0x00000000223c0e95:
(sched_rt_period_timer+0x1f0/0x328) arg1=0x0
         <idle>-0       [002] d.h4   528.964803: p_0x00000000223c0e95:
(sched_rt_period_timer+0x1f0/0x328) arg1=0x0
         <idle>-0       [002] d.h4   528.964818: p_0x00000000223c0e95:
(sched_rt_period_timer+0x1f0/0x328) arg1=0x0
         <idle>-0       [002] d.h4   528.964827: p_0x00000000223c0e95:
(sched_rt_period_timer+0x1f0/0x328) arg1=0x0
         <idle>-0       [002] d.h4   528.964837: p_0x00000000223c0e95:
(sched_rt_period_timer+0x1f0/0x328) arg1=0x0
         <idle>-0       [002] d.h3   529.964797: p_0x00000000223c0e95:
(sched_rt_period_timer+0x1f0/0x328) arg1=0x0
         <idle>-0       [002] d.h3   529.964812: p_0x00000000223c0e95:
(sched_rt_period_timer+0x1f0/0x328) arg1=0x0
         <idle>-0       [002] d.h3   529.964820: p_0x00000000223c0e95:
(sched_rt_period_timer+0x1f0/0x328) arg1=0x0
         <idle>-0       [002] d.h3   529.964830: p_0x00000000223c0e95:
(sched_rt_period_timer+0x1f0/0x328) arg1=0x0
         <idle>-0       [002] dNh3   530.964793: p_0x00000000223c0e95:
(sched_rt_period_timer+0x1f0/0x328) arg1=0x0
         <idle>-0       [002] dNh3   530.964808: p_0x00000000223c0e95:
(sched_rt_period_timer+0x1f0/0x328) arg1=0x0
         <idle>-0       [002] dNh3   530.964815: p_0x00000000223c0e95:
(sched_rt_period_timer+0x1f0/0x328) arg1=0x0
         <idle>-0       [002] dNh3   530.964824: p_0x00000000223c0e95:
(sched_rt_period_timer+0x1f0/0x328) arg1=0x0

Thanks for any guidance/pointers.

Regards,

Brian
