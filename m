Return-Path: <linux-trace-users-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62F70C32772
	for <linux-trace-users@archiver.kernel.org>; Fri, 19 Aug 2022 10:06:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347952AbiHSKGZ (ORCPT
        <rfc822;linux-trace-users@archiver.kernel.org>);
        Fri, 19 Aug 2022 06:06:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43930 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345562AbiHSKGY (ORCPT
        <rfc822;linux-trace-users@vger.kernel.org>);
        Fri, 19 Aug 2022 06:06:24 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 122022B257
        for <linux-trace-users@vger.kernel.org>; Fri, 19 Aug 2022 03:06:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1660903582;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type;
        bh=mdSu21JqXH5844+ltnIsCLWq2jUZ5lFP49Ylu0e8zhA=;
        b=ND0lRqwS5XRgbU/ZZaF6rFR1Z0asX9weaJ7S25LauP/9/IpIAGMPC+qC/JTncfmAQ3ucCO
        2tn//yd29pX82sVwFEcETayAsUcYuEOLHMw0eaeha74/uXYmTvDkhdd98/WeVVVnjjSugt
        JwIMYqqP+ogn/0dhWjVQPiLRi/F4EOs=
Received: from mail-oa1-f69.google.com (mail-oa1-f69.google.com
 [209.85.160.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-414-rWmsaWxdPtCkG_nc70UceQ-1; Fri, 19 Aug 2022 06:06:20 -0400
X-MC-Unique: rWmsaWxdPtCkG_nc70UceQ-1
Received: by mail-oa1-f69.google.com with SMTP id 586e51a60fabf-1048dffc888so2064543fac.11
        for <linux-trace-users@vger.kernel.org>; Fri, 19 Aug 2022 03:06:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc;
        bh=mdSu21JqXH5844+ltnIsCLWq2jUZ5lFP49Ylu0e8zhA=;
        b=hBLH6jqSJfmGZVd2HSbZK9rRNrtz76FVW6b+5tIB0z1zcgUY9sijVy5Ufwxct5m/c+
         CnDbZXYfFujmVlgSWMQP5JK63ddbCaCqnwurOhY4Jv4JQuhsuXJMaDBkJNzVMGt/ZSCU
         o/MNrVL90V/FKtX9egPSV+ozHJdIxlI9nOB27quyL5VG6ShvM7L72giex+0Jh+ILiIXA
         lZAs1Zlsriv+EuKsdkw39b50fCmdZCbh70xPsUrtsv67hEs6VAJhhdPzp8HLcR/8jrCf
         cRVRmVHEe8LvnZPi+1u6Ly7u/nrKN9POZQP0IrFZfD6GWJK+rI0WW7BJqq3V2Q5GOeOS
         8usg==
X-Gm-Message-State: ACgBeo0UDI5e3+VL/dS01E/KHATBkyhzft/oNFuxDHNrQWQnU78vizia
        xfcj+hqmLKN+3zGtSgwEeBTswquek1Ln/WtIvUjLXYF65AHI3mXGVqnJDNTlDqaAQ5jjG6xFLwV
        SQYWgAiIwYGo/CSglx3YZ4C6t4HXzUHQKtsHg8WmrzVA7gAg=
X-Received: by 2002:a05:6808:17a7:b0:343:4d0e:c5c9 with SMTP id bg39-20020a05680817a700b003434d0ec5c9mr5715339oib.154.1660903579803;
        Fri, 19 Aug 2022 03:06:19 -0700 (PDT)
X-Google-Smtp-Source: AA6agR56Cyn49Sf2bWEZOP/CjeDUBKjSJFgrF14mX4FeTYuONazgA5if+qxnGjzyX97XVLmsReq38FA9duqOxLITANE=
X-Received: by 2002:a05:6808:17a7:b0:343:4d0e:c5c9 with SMTP id
 bg39-20020a05680817a700b003434d0ec5c9mr5715330oib.154.1660903579499; Fri, 19
 Aug 2022 03:06:19 -0700 (PDT)
MIME-Version: 1.0
From:   Prasad Pandit <ppandit@redhat.com>
Date:   Fri, 19 Aug 2022 15:36:03 +0530
Message-ID: <CAE8KmOwGONSzSDczNdadyMSvn84qBbqS0wKUMbctnPgio0Uxgg@mail.gmail.com>
Subject: About tracing clues
To:     linux-trace-users@vger.kernel.org
Cc:     rostedt@goodmis.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-trace-users.vger.kernel.org>
X-Mailing-List: linux-trace-users@vger.kernel.org

Hello,

* While running oslat(8) tests in a guest running on RHEL kernel-rt
host, I'm seeing occasional peculiar latency spikes as below
===
# trace-cmd record -p nop --poll -M 1E -e all
/home/test/rt-tests/oslat --cpu-list 1-4 --rtprio 1 --duration 12h -T
30
oslat V 2.30
INFO: debugfs mountpoint: /sys/kernel/debug/tracing/
Total runtime:          43200 seconds
Thread priority:        SCHED_FIFO:1
CPU list:               1-4
CPU for main thread:    0
Workload:               no
Workload mem:           0 (KiB)
Preheat cores:          4

Pre-heat for 1 seconds...
Test starts...
/home/test/rt-tests/oslat: Trace threshold (30 us) triggered on cpu 2
with 67 us!
Stopping the test.
...
             <idle>-0     [002]   265.041487: tlb_flush:
pages=0 reason=flush on task switch (0)
           oslat-16074 [002]   265.041489: print:
tracing_mark_write: /home/test/rt-tests/oslat: Starting thread on CPU
2.
           oslat-16074 [002]   265.041490: kfree:
(__audit_syscall_exit+0x249) call_site=ffffffff95fb8889 ptr=(nil)
           oslat-16074 [002]   265.041490: sys_exit:             NR 1 = 53
           oslat-16074 [002]   265.041490: sys_exit_write:       0x35
           oslat-16074 [002]   265.041490: user_enter:
           oslat-16074 [002]   300.576710: user_exit:
           oslat-16074 [002]   300.576734: irq_handler_entry:
irq=21 name=virtio3
           oslat-16074 [002]   300.576734: irq_handler_exit:
irq=21 ret=handled
           oslat-16074 [002]   300.576734: sched_waking:
comm=irq/21-virtio3 pid=219 prio=49 target_cpu=002
           oslat-16074 [002]   300.576736: sched_migrate_task:
comm=irq/21-virtio3 pid=219 prio=49 orig_cpu=2 dest_cpu=0
           oslat-16074 [002]   300.576740: write_msr:            830, value fd
           oslat-16074 [002]   300.576740: sched_wakeup:
irq/21-virtio3:219 [49] success=1 CPU:000
           oslat-16074 [002]   300.576742: read_msr:             819, value 4
           oslat-16074 [002]   300.576754: irq_matrix_alloc:
bit=38 cpu=0 online=1 avl=195 alloc=6 managed=1 online_maps=6
global_avl=1178, global_rsvd=10, total_alloc=28
           oslat-16074 [002]   300.576755: vector_update:
irq=21 vector=38 cpu=0 prev_vector=34 prev_cpu=2
           oslat-16074 [002]   300.576755: vector_alloc:
irq=21 vector=38 reserved=0 ret=0
           oslat-16074 [002]   300.576756: vector_config:
irq=21 vector=38 cpu=0 apicdest=0x00000000
           oslat-16074 [002]   300.576773: user_enter:
           oslat-16074 [002]   300.576778: user_exit:
           oslat-16074 [002]   300.576778: sys_enter:            NR 1
(3, 7fcbb683c300, 65, 0, 0, 7fcbb683b816)
           oslat-16074 [002]   300.576778: sys_enter_write:      fd:
0x00000003, buf: 0x7fcbb683c300, count: 0x00000065
           oslat-16074 [002]   300.576780: print:
tracing_mark_write: /home/test/rt-tests/oslat: Trace threshold (30 us)
triggered on cpu 2 with 67 us!
Stopping the test.
           oslat-16074 [002]   300.576780: kfree:
(__audit_syscall_exit+0x249) call_site=ffffffff95fb8889 ptr=(nil)
           oslat-16074 [002]   300.576781: sys_exit:             NR 1 = 101
           oslat-16074 [002]   300.576781: sys_exit_write:       0x65
           oslat-16074 [002]   300.576781: user_enter:
===

* Looking at these traces it is difficult to see/conclude the source
of the said (67us) latency spike.
* Other logs I have for the same host/guest show
_call_function_entry/exit or timer softirq entries in traces.
* Peculiar is that these spikes seem to occur when oslat(8) is invoked
after the guest boot-up.
   Subsequent oslat(8) sessions in the same guest run over 12 hrs
without any sign of latency spike.

* Is there a way to find further clues or conclusively figure out the
source of such occasional latency spikes?

Thank you.
---
  - P J P

