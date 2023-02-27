Return-Path: <linux-trace-users-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B82EAC64ED6
	for <linux-trace-users@archiver.kernel.org>; Mon, 27 Feb 2023 07:10:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229916AbjB0HKD (ORCPT
        <rfc822;linux-trace-users@archiver.kernel.org>);
        Mon, 27 Feb 2023 02:10:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33268 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229593AbjB0HKC (ORCPT
        <rfc822;linux-trace-users@vger.kernel.org>);
        Mon, 27 Feb 2023 02:10:02 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E87EC17E
        for <linux-trace-users@vger.kernel.org>; Sun, 26 Feb 2023 23:09:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1677481755;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=/G/rR6r3M1fMDoyNYuH0Rztb/qVGcrhpPkJ54tuPdpI=;
        b=jADiILqc8hsfLVhmDEvDkahi6rVIu8B5tXWXT1+pCZO+6iUOLDn5rG4/ufq8MHHUPq4jK9
        NYVc2q6/D9bIEf+tT6TTniMO/UJI99w+XaQ8ByOsrSXIGKF+urcPjq6QMbdbKqOa0Fa9oH
        cepA/U1P51yjUSztRaeEyAzSN20QCVo=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-117-WCQgUVdfMTO0bnJcBC9n3A-1; Mon, 27 Feb 2023 02:09:11 -0500
X-MC-Unique: WCQgUVdfMTO0bnJcBC9n3A-1
Received: by mail-wr1-f71.google.com with SMTP id n6-20020a5d51c6000000b002ca3c48ba46so347452wrv.4
        for <linux-trace-users@vger.kernel.org>; Sun, 26 Feb 2023 23:09:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/G/rR6r3M1fMDoyNYuH0Rztb/qVGcrhpPkJ54tuPdpI=;
        b=gbMSWKnx6BR1B/f1yQ188IFtiTaqCsDcW7btFwpA57d0qKwYsLV+7/YKuGiIsaqmMD
         UuM3c2Nd1ImKP7vdZQudMyDz4dcnQSlisdnFHqHVuVE6qMFaJQZli/JMwh5eXeTUItOc
         BB46ZRdsechNJN3nFiACUtk6J3y5pqz6GXWGNOFnq7R1/usHxayDmo5/83o2AqdUrkSK
         SdO9ATSBrFtJv+IeiV+oBNzaRskVT4R6DS3+ePq1AKSKUxq2ZTKqcdFbWD+c6SWewBjN
         nmjkl5EN4c3MXdOT+Sx/DPu1A0OPstyQXAc091AChCfE65pVLZfagzAhD4pojc58kW4P
         5GZg==
X-Gm-Message-State: AO0yUKXvqj63/qFMGLJED4eieA3KbjWKeMU7qKVGa6DcKhbzrGpG1zZ+
        rMaYXrif8v4lJigrVvEVJckEJB7xJnICFIkZz0hQ0REqlNBiwKFkiyJJbSjzPJzEndrNujOdszf
        H2uREXra/3C9/WYm/IHlySpSkI1UJ9BHBbkLHwKumf9Kmw+fxQfl+b3s=
X-Received: by 2002:a5d:4d8d:0:b0:2c7:eb4d:a4a5 with SMTP id b13-20020a5d4d8d000000b002c7eb4da4a5mr1441700wru.6.1677481749646;
        Sun, 26 Feb 2023 23:09:09 -0800 (PST)
X-Google-Smtp-Source: AK7set8b3InD0OdWXZtQBwZwk75Nnp+1zjrTQARQuEsRZWyHLJQqOEFInare3JmcXAKvCJqO71XgaIsctPG0A9qpikM=
X-Received: by 2002:a5d:4d8d:0:b0:2c7:eb4d:a4a5 with SMTP id
 b13-20020a5d4d8d000000b002c7eb4da4a5mr1441695wru.6.1677481749313; Sun, 26 Feb
 2023 23:09:09 -0800 (PST)
MIME-Version: 1.0
References: <CAE8KmOxedTiM8GJVp+-HuBW=jkuE=aSKFYrmaj8zHLmQP-1RCg@mail.gmail.com>
 <8ae9144f-6d7c-2b63-4fe7-4f124b5515bf@kernel.org> <CAE8KmOzuCqp5w4FBVd6GjPg_znQhumcsA=PKozZbQWxXPdZYXg@mail.gmail.com>
 <e7db6b57-ca5b-3f9a-b436-a263ff663f20@kernel.org> <CAE8KmOxV8u3v4ALVvqOUO+zvnd99d6iSXw0RiSLondvdX_JJSA@mail.gmail.com>
 <0d75a9a8-ba31-c2d2-e317-0a28d01cd36b@kernel.org> <20230223093900.6a89b7a5@gandalf.local.home>
 <b224dcc7-9713-0f26-180b-efda6902511e@kernel.org>
In-Reply-To: <b224dcc7-9713-0f26-180b-efda6902511e@kernel.org>
From:   Prasad Pandit <ppandit@redhat.com>
Date:   Mon, 27 Feb 2023 12:40:41 +0530
Message-ID: <CAE8KmOwz9cTRGR0gWoFss3uX4PnQAOtD-V8HxJRzGYmwdi1Jag@mail.gmail.com>
Subject: Re: About rtla osnoise and timerlat usage
To:     Daniel Bristot de Oliveira <bristot@kernel.org>
Cc:     Steven Rostedt <rostedt@goodmis.org>,
        linux-trace-users@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-trace-users.vger.kernel.org>
X-Mailing-List: linux-trace-users@vger.kernel.org

Hello Daniel, Steve,

On Thu, 23 Feb 2023 at 20:24, Daniel Bristot de Oliveira
<bristot@kernel.org> wrote:
> On 2/23/23 11:39, Steven Rostedt wrote:
>>> kworker/[120] <--- this 120 is likely not the same as
>>> ktimer/[97] <---- this 97
>>>
>>> The kworker is likely a SCHED_OTHER 0 nice, and ktimer a FIFO:97.
>>> You are placing your load in between them.

* Oh right, even those threads have different priorities.

>>> That would not be bad if we ran a traditional periodic/sporadic real-time
>>> workload. That is, task that waits for an event, wakes up, runs, and goes
>>> to sleep waiting for the next event.
>>>
>>> The problem is that oslat/osnoise run non-stop.
>>>
>>> Then a kworker awakened on the CPU will... starve. You will not see it
>>> causing a sched_switch, but if the kworker is pinned to that CPU, it wil
>>> not make progress.
>>
>> Note, the kworker and other kernel threads that are pinned to a CPU are
>> ones that service requests that were triggered on that CPU. It is possible
>> to run a task at FIFO 99 on an isolated CPU non stop without causing any
>> issue (you may also need to enable NO_HZ_FULL and make sure RCU has
>> no-callbacks enabled where the RCU for that isolated CPU gets its work done
>> on other CPUs).
>
> Yes, but in the perfect isolation case, where no other task is scheduled there, being
> FIFO and OTHER or even IDLE is... equivalent as no scheduler is needed :-).
>
>> If your FIFO task calls into the kernel and does something that triggers a
>> worker, then you may then have an issue. You will need to make sure that
>> worker gets time to run.
>>
>> The point I'm making is that it is possible to get something working where
>> you have a FIFO task running 100%, but you need to set up the system where
>> it will not cause issues. That requires knowing what system calls that are
>> done on that CPU that may require workers.
>>
>> Oh, and there's another issue that can cause problems. Even if you figured
>> out everything your task does, and make sure that it doesn't trigger any
>> pinned kworkers, and you are using NO_CB_RCU and NO_HZ_FULL, there's still
>> an issue that needs to be taken care of. That is, if there was some task
>> running on that CPU just before your FIFO task runs, it could have
>> triggered a kworker. And even though it may be done, or even migrated to
>> another CPU, that kworker will still need to execute. I've seen this cause
>> days of debugging to why the system crashed.
>
> There are also cases where kworkers are dispatched to all CPUs, from a non-isolated CPU,
> to do some house-keeping work. E.g., I think that ftrace used to do that to allocate buffers.
> Ideally, all these cases should be reworked to avoid dispatching kworkers where they are
> not needed. But as kworkers are added to the code as part of the development, and bad
> 3rd part drivers can also do it... and... who knows?
>
> in the exceptional case of something happening to that CPU, they are likely sort living
> kernel work that is is just easier to let them run, one monitors those cases and try
> to fix the code to avoid them.
>
> That is why the safest path is to: assuming that the isolcpus is done at the perfection,
> no schedule will happen, and so all the schedulers are equivalent.
>

* I see, got it. Thank you so much for your kind replies and detailed
explanations, I appreciate it.

Thank you.
---
  - P J P

