Return-Path: <linux-trace-users-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40995C433EF
	for <linux-trace-users@archiver.kernel.org>; Fri, 17 Jun 2022 13:08:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236563AbiFQNIn convert rfc822-to-8bit (ORCPT
        <rfc822;linux-trace-users@archiver.kernel.org>);
        Fri, 17 Jun 2022 09:08:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55586 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236509AbiFQNIn (ORCPT
        <rfc822;linux-trace-users@vger.kernel.org>);
        Fri, 17 Jun 2022 09:08:43 -0400
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F49610FC9
        for <linux-trace-users@vger.kernel.org>; Fri, 17 Jun 2022 06:08:42 -0700 (PDT)
Received: from fraeml734-chm.china.huawei.com (unknown [172.18.147.206])
        by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4LPfVh477Bz6GDFb;
        Fri, 17 Jun 2022 21:08:28 +0800 (CST)
Received: from lhreml738-chm.china.huawei.com (10.201.108.188) by
 fraeml734-chm.china.huawei.com (10.206.15.215) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Fri, 17 Jun 2022 15:08:40 +0200
Received: from lhreml739-chm.china.huawei.com (10.201.108.189) by
 lhreml738-chm.china.huawei.com (10.201.108.188) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Fri, 17 Jun 2022 14:08:39 +0100
Received: from lhreml739-chm.china.huawei.com ([10.201.108.189]) by
 lhreml739-chm.china.huawei.com ([10.201.108.189]) with mapi id
 15.01.2375.024; Fri, 17 Jun 2022 14:08:39 +0100
From:   Matteo Bertolino <matteo.bertolino@huawei.com>
To:     "linux-trace-users@vger.kernel.org" 
        <linux-trace-users@vger.kernel.org>
CC:     Steven Rostedt <rostedt@goodmis.org>,
        Tzvetomir Stoyanov <tz.stoyanov@gmail.com>
Subject: RE: Format of trace.dat flyrecord section
Thread-Topic: Format of trace.dat flyrecord section
Thread-Index: AdiAyt5H6PwunLT9TtSAaZGsGqRoggArhoSAAAAJFwAANIJIQA==
Date:   Fri, 17 Jun 2022 13:08:39 +0000
Message-ID: <7082a3842cac4fe4bd3e6fcb8e693ff6@huawei.com>
References: <e3287c4e7ae2407f873bedf74df9651c@huawei.com>
        <20220616090237.2c9dda8b@gandalf.local.home>
 <20220616090338.3172219b@gandalf.local.home>
In-Reply-To: <20220616090338.3172219b@gandalf.local.home>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.123.160.240]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
MIME-Version: 1.0
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-trace-users.vger.kernel.org>
X-Mailing-List: linux-trace-users@vger.kernel.org

Dear Mr Rostedt and mr Stoyanov,
thanks for your warming welcoming and for your answers.

I had clearer ideas now. If possible, I would like to ask some clarifications.
Once everything is clear in my mind, I will write a resume with an example for the mailing list, so it can be usefulf for future experiments.

Let's suppose that I want to write some events like the "function tracer":
Thanks to your explanation, I successfully communicated in the header this format. This is confirmed by:

```
dreamer@dreamer-VB:~/Desktop/mydotdat/input$ trace-cmd dump --events -i ../mytrace_v7.dat 
	[Section 18 @ 617: "Unknown", flags 0x0, 485 bytes]
	[Events format, 1 systems]
name: function
ID: 1
format:
	field:unsigned short common_type;	offset:0;	size:2;	signed:0;
	field:unsigned char common_flags;	offset:2;	size:1;	signed:0;
	field:unsigned char common_preempt_count;	offset:3;	size:1;	signed:0;
	field:int common_pid;	offset:4;	size:4;	signed:1;

	field:unsigned long ip;	offset:8;	size:8;	signed:0;
	field:unsigned long parent_ip;	offset:16;	size:8;	signed:0;

print fmt: " %ps <-- %ps", (void *)REC->ip, (void *)REC->parent_ip
```

Now, in my trace.dat, I want to write the real information.
If you permit me, I'd like to continue this discussion with a concrete example.

Let's suppose that I want to represent the following information:

Event: function trace event
Timestamp 9 seconds
PID: 7777
Function address: 0x2266D
Parent: 0x2266E

I start by filling the header_event information:
- Writing 900000000000 on 8 bytes (timestamp).
- Writing `24`in 8 bytes (commit) --> event data for event ID are on 24 bytes, indeed: common_* are on 8 bytes, ip and parent ip on 8.
- Ignoring overwrite: indeed, I already used commit.

Then, I have the 4080 bytes of payload event, but I use only 24 of them, as expressed in commit.
- common_type is 1, (2 bytes), because I want a function event
- common_flags is 0 (1 byte)
- common_preempt_count is 0 (1 byte)
- common_pid is 7777 (4 bytes)
- ip is 0x2266D (8 bytes)
- parent_ip is 0x2266E (8 bytes)
- the remaining 4096 - 24 bytes are of padding, so I can complete the 4080 bytes of data.

Unfortunately, in this way, only CPU number and timestamp are correctly displayed on the frontend (kernelshark).
Event is marked as "unknown" and PID is wrong.
Timestamp astonishes me too: to correctly display it, I just need to write 900000000000 on 8 bytes.
Trying to put "1" on time_type (5bits), 0 on delta (27 bits) and 900000000000 on array (1*4 bytes), the timestamp is not correct.

Thus, I think I am doing something wrong. May you help me in correcting this example, please?

Another thing that did let me with a doubt is the following one: do I need a page (4096 bytes) for an event?
In other words: the 4096-24 bytes of padding to complete the 4080 bytes of "data" are mandatory to express another event?

Thanks for your help,
Matteo

-----Original Message-----
From: Steven Rostedt [mailto:rostedt@goodmis.org] 
Sent: Thursday, June 16, 2022 3:04 PM
To: Matteo Bertolino <matteo.bertolino@huawei.com>
Cc: linux-trace-users@vger.kernel.org
Subject: Re: Format of trace.dat flyrecord section


OK, this is a claws-mail bug. It added the '\' in the email address when doing a reply all.

-- Steve


On Thu, 16 Jun 2022 09:02:37 -0400
Steven Rostedt <rostedt@goodmis.org> wrote:

> This is just a test to see if the added '\' was due to a claws-mail 
> bug or somehow I did it.
> 
> -- Steve

