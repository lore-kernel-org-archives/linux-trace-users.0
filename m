Return-Path: <linux-trace-users-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69917C32772
	for <linux-trace-users@archiver.kernel.org>; Tue, 23 Aug 2022 20:07:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233556AbiHWUHy (ORCPT
        <rfc822;linux-trace-users@archiver.kernel.org>);
        Tue, 23 Aug 2022 16:07:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45550 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232882AbiHWUHk (ORCPT
        <rfc822;linux-trace-users@vger.kernel.org>);
        Tue, 23 Aug 2022 16:07:40 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3BA05760C4
        for <linux-trace-users@vger.kernel.org>; Tue, 23 Aug 2022 12:25:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1661282706;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=NQHBoL8TjLZd0rV8XXlJ7xtZ01OcH6u6hPwG2EEwCA4=;
        b=EwIkRWxZqYV7w5nmY7TacQanyT7it1vaH9qHxPzTk4nA1eNR9YZ//tMyPJvfsbiGMFzZSa
        k9PAcpQS3q+SBe2SVBqlZSy2UvR+EWlxo07nX5kAC/jEixTmzE9/sLRN3+k3NuE2jpNFII
        S16QmHyu9WowzQwUt9JvSedz4fGpVLg=
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com
 [209.85.167.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-669-RxgEoVjGMdG3VDjtqoJYdg-1; Tue, 23 Aug 2022 15:25:05 -0400
X-MC-Unique: RxgEoVjGMdG3VDjtqoJYdg-1
Received: by mail-oi1-f199.google.com with SMTP id r184-20020acadac1000000b00344bb8d5891so5028087oig.5
        for <linux-trace-users@vger.kernel.org>; Tue, 23 Aug 2022 12:25:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=NQHBoL8TjLZd0rV8XXlJ7xtZ01OcH6u6hPwG2EEwCA4=;
        b=OcVuLwxYmj6RSH+ba80oFKqPrVuO53gp5V/AYAyyWS34MKvzH4hM/JHm2xcDhBBXyn
         leBtkBJ5AGeebFpypi5d8oGmq/cYqnNeqynJDod0ypAQJkrAmfhx2SuSUDg9BmoJx4LL
         0Ggpx5BpJ6X2d5vfmBy7N37jmgqe+SLqZM4ifmHHuLRofqsgtrEninxmLGoK3N8xgfba
         ChT77Z+gumZ5meWzMU4Z8R47j6uuQZ8OMTh9lnYibL+8jEU9OTbQHsNLq3Cy4TySA+0c
         vIDuqVTD+OBWr8rI8Bp+B4s6qZ+iJGEnqBONt7YfQ+y2/UqPMJAc0JZrnkKCzky/yZ8z
         2x+g==
X-Gm-Message-State: ACgBeo10A+5i0hWWgOZt9OcRL4VJcLrRQGSwmdLB3lu1cCSn05h3cdzP
        Mj6nCa67PiEwt9ZPDI21LaDAMKkE5NXOEwmB75GUGW2co4ohTccKW3EoiIZdjV05R+1+AzsXHbv
        nnOTc2aasUnV/kDpS0kdDrZv4uHsRzWJjbAMJ8fVGMRVAT/E=
X-Received: by 2002:a05:6870:f693:b0:101:cb61:2937 with SMTP id el19-20020a056870f69300b00101cb612937mr2069171oab.151.1661282704683;
        Tue, 23 Aug 2022 12:25:04 -0700 (PDT)
X-Google-Smtp-Source: AA6agR65QCWZkVVoF6LtBS/gFPCVcF51une7IUZWFNiYvcS/aHx536/yHL2toP4o+Epw5JaNsn5dPbzPuJp4JrYG6z8=
X-Received: by 2002:a05:6870:f693:b0:101:cb61:2937 with SMTP id
 el19-20020a056870f69300b00101cb612937mr2069168oab.151.1661282704519; Tue, 23
 Aug 2022 12:25:04 -0700 (PDT)
MIME-Version: 1.0
References: <CAE8KmOwGONSzSDczNdadyMSvn84qBbqS0wKUMbctnPgio0Uxgg@mail.gmail.com>
 <20220819135047.45243742@gandalf.local.home> <CAE8KmOyUyRCCN035ScjbcsD9ftOvsn_Z++piiThyVgy7cwL4kw@mail.gmail.com>
In-Reply-To: <CAE8KmOyUyRCCN035ScjbcsD9ftOvsn_Z++piiThyVgy7cwL4kw@mail.gmail.com>
From:   Prasad Pandit <ppandit@redhat.com>
Date:   Wed, 24 Aug 2022 00:54:48 +0530
Message-ID: <CAE8KmOwuKSaOT-mPeJsV-2uUrF=KNyyfY5tNoPnh_AHnzOYfNA@mail.gmail.com>
Subject: Re: About tracing clues
To:     Steven Rostedt <rostedt@goodmis.org>
Cc:     Daniel Bristot de Oliveira <bristot@kernel.org>,
        linux-trace-users@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-trace-users.vger.kernel.org>
X-Mailing-List: linux-trace-users@vger.kernel.org

Hello Steve,

On Sat, 20 Aug 2022 at 14:51, Prasad Pandit <ppandit@redhat.com> wrote:
>>   # trace-cmd agent

* For me `trace-cmd agent` in the guest shows =>  listening on @4294967295:823

>>   # trace-cmd record --poll -M 1E -e all --proxy 2 --name host -e kvm -e sched -e irq /home/test/rt-tests/oslat --cpu-list 1-4 --rtprio 1 --duration 12h -T 30

* Running above command with --proxy 4294967295:823 throws an error =>
guest 4294967295 not found

* Looking through 'trace-record.c' source IIUC,
   -  The long type CID(=4294967295) causes atoi(3) calls in
parse_guest_name() to return -1
       so 'cid' is set to -1.
   - Later in parse_guest_name() guest->name is returned without
setting '*res' addrinfo parameter.
          guest = trace_get_guest(*cid, gname);
          if (guest) {
              *cid = guest->cid;
              return guest->name;     <==
          }

* ie. cid==-1 and result==NULL leads to the above error via  =>
die("guest %s not found", optarg);

* Instead of 'return guest->name', if we set 'gname = guest->name',
parse_guest_name() sets the '*res' addrinfo struct and returns gname.
  It helps to avoid above error, but then shows another error below
       ==>  Failed to connect to host host:823

* If I run above command with --name 4294967295, then it breaks with
      ==> Failed to connect to host 4294967295:823

* Not sure if the long type CID value is erroneous OR
parse_guest_name() function needs some fixing OR maybe both. Wdyt...?

Thank you.
---
  - P J P

