Return-Path: <linux-trace-users-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5F86C38145
	for <linux-trace-users@archiver.kernel.org>; Tue,  6 Sep 2022 08:42:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239333AbiIFImO convert rfc822-to-8bit (ORCPT
        <rfc822;linux-trace-users@archiver.kernel.org>);
        Tue, 6 Sep 2022 04:42:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55044 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239397AbiIFIlJ (ORCPT
        <rfc822;linux-trace-users@vger.kernel.org>);
        Tue, 6 Sep 2022 04:41:09 -0400
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AEDEE7A750
        for <linux-trace-users@vger.kernel.org>; Tue,  6 Sep 2022 01:38:10 -0700 (PDT)
Received: from fraeml744-chm.china.huawei.com (unknown [172.18.147.201])
        by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4MMJZK2lM6z684wN;
        Tue,  6 Sep 2022 16:33:45 +0800 (CST)
Received: from lhrpeml100006.china.huawei.com (7.191.160.224) by
 fraeml744-chm.china.huawei.com (10.206.15.225) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 6 Sep 2022 10:37:46 +0200
Received: from lhrpeml500003.china.huawei.com (7.191.162.67) by
 lhrpeml100006.china.huawei.com (7.191.160.224) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 6 Sep 2022 09:37:46 +0100
Received: from lhrpeml500003.china.huawei.com ([7.191.162.67]) by
 lhrpeml500003.china.huawei.com ([7.191.162.67]) with mapi id 15.01.2375.031;
 Tue, 6 Sep 2022 09:37:46 +0100
From:   Matteo Bertolino <matteo.bertolino@huawei.com>
To:     Steven Rostedt <rostedt@goodmis.org>
CC:     "linux-trace-users@vger.kernel.org" 
        <linux-trace-users@vger.kernel.org>
Subject: RE: `fungraph_entry` and `funcgraph_exit` entries: is there a
 mismatch between trace-cmd and the format of debugfs?
Thread-Topic: `fungraph_entry` and `funcgraph_exit` entries: is there a
 mismatch between trace-cmd and the format of debugfs?
Thread-Index: Adi8UaCYyVhy3GKeRViBYI/Q5yasxABsAuQAAPKGzwA=
Date:   Tue, 6 Sep 2022 08:37:45 +0000
Message-ID: <9e6c2c2494c842e7b9487727ac818755@huawei.com>
References: <6100d47186aa485589b282cacc42b5a5@huawei.com>
 <20220901095220.147d1f68@gandalf.local.home>
In-Reply-To: <20220901095220.147d1f68@gandalf.local.home>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.123.160.159]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
MIME-Version: 1.0
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-trace-users.vger.kernel.org>
X-Mailing-List: linux-trace-users@vger.kernel.org

Dear Steve,
This has been very useful.

In fact, there are no mismatches: it was my bad understanding of the format, but everything is now clear.
Best Regards,
Matteo

-----Original Message-----
From: Steven Rostedt [mailto:rostedt@goodmis.org] 
Sent: Thursday, September 1, 2022 3:52 PM
To: Matteo Bertolino <matteo.bertolino@huawei.com>
Cc: "linux-trace-users@vger.kernel.org\" <linux-trace-users@vger.kernel.org>"@domain.invalid
Subject: Re: `fungraph_entry` and `funcgraph_exit` entries: is there a mismatch between trace-cmd and the format of debugfs?

On Tue, 30 Aug 2022 09:19:43 +0000
Matteo Bertolino <matteo.bertolino@huawei.com> wrote:

> Dear Community,
> 
> I would like to share with you something interesting came out from one of my tests. 
> 
> I am manually  writing a binary trace composed of `funcgraph_entry` and `funcgraph_exit` entries: 

So you are writing the raw data?

> This is an example:
> CPU0: Task A entry ------- Task B entry  ------- Task B exit ------- Task A exit.
> 
> After writing the trace, I display it with Kernelshark.
> 
> Both entries and exit give me problems. Let's start with the entry.
> 
> I gave to the section 17 of the trace.dat the following file:
> ````
> name: funcgraph_entry
> ID: 11
> format:
> 	field:unsigned short common_type;	offset:0;	size:2;	signed:0;
> 	field:unsigned char common_flags;	offset:2;	size:1;	signed:0;
> 	field:unsigned char common_preempt_count;	offset:3;	size:1;	signed:0;
> 	field:int common_pid;	offset:4;	size:4;	signed:1;
> 	field:unsigned long func;	offset:8;	size:8;	signed:0;
> 	field:int depth;	offset:16;	size:4;	signed:1;
> 
> print fmt: "--> %ps (%d)", (void *)REC->func, REC->depth ````

Note, the above is only the payload of the event. If you are creating several events, you need to add the ring buffer data, which is a bit more complex (and partially defined in /sys/kernel/tracing/events/

  /sys/kernel/tracing/events/header_page

and

  /sys/kernel/tracing/events/header_event

The header_page defines what information looks like per sub buffer. The data is made up of several sub buffers that are the same size (in most cases that is 4096 bytes, or PAGE_SIZE).

 # cat header_page
	field: u64 timestamp;	offset:0;	size:8;	signed:0;
	field: local_t commit;	offset:8;	size:8;	signed:1;
	field: int overwrite;	offset:8;	size:1;	signed:1;
	field: char data;	offset:16;	size:4080;	signed:1;

The first 8 bytes is the time stamp. The next 8 bytes defines the amount of data on the sub buffer. Ignore overwrite as you do not need it. And then data holds the events.

Then in the data section, each event has:

 # cat header_event
	type_len    :    5 bits
	time_delta  :   27 bits
	array       :   32 bits

	padding     : type == 29
	time_extend : type == 30
	time_stamp : type == 31
	data max type_len  == 28

Where the first 4 bytes is the "type_len/delta". The first 5 bits define the type/length.

 0 means the length is defined in the next 4 bytes and the data comes after
  that.

 1-28 means the data length is 4 * this number, and the data starts in the
      next 4 bytes.

 29 - means padding, and the next 4 bytes define the length.
 30/31 is for when the time delta is too big between events (greater than
       2^27)

The time_delta is 27 bits that defines the time between events.

Then the data payload is what is defined by the event format files above.

> 
> So, in the trace, after the event header, I write 2 bytes for the ID 
> (11 in this case), 1 for the flags, and so and so, until the last one: 
> 4 bytes for depth. The problem arrives there: if I don't write 4 
> additional bytes on field `depth` (or 4 additional bytes of padding), 
> the next entry is not displayed on Kernelshark, which shows an [UNKNOWN EVENT[.

It depends on how you created the event meta data explained above.

> 
> A little hypothesis: I noticed that `fgraph_ent_handler()` function on 
> `trace-ftrace.c` calls `print_graph_nested()`. The latter declares `depth` as `unsigned long long depth;`  , namely on 8 bytes instead of the declared 4.
> 
> If I modify the file in this way (below) and, for each `funcgraph_entry` entry, I write the depth 8 bytes instead of 4, everything is ok:
> ````
> name: funcgraph_entry
> ID: 11
> format:
> 	field:unsigned short common_type;	offset:0;	size:2;	signed:0;
> 	field:unsigned char common_flags;	offset:2;	size:1;	signed:0;
> 	field:unsigned char common_preempt_count;	offset:3;	size:1;	signed:0;
> 	field:int common_pid;	offset:4;	size:4;	signed:1;
> 	field:unsigned long func;	offset:8;	size:8;	signed:0;
> 	field:int depth;	offset:16;	size:8;	signed:1;
> 
> print fmt: "--> %ps (%d)", (void *)REC->func, REC->depth ````
> 
> Now, unfortunately, I have the same problem with `funcgraph_exit` entries, but this this I cannot find a workaround.
> The first `funcgraph_exit` entry that I write is perfectly displayed on Kernelshark, but everything subsequent to it is broken.
> 
> Example of `funcgraph_exit` entry:
> 4 bytes of TS delta
> 2 bytes for the ID (11)
> 1 byte for common_flags, I don't use this field, so I wrote the value 0.
> 1 byte for common_preempt_count, I don't use this field, so I wrote the value 0.
> 4 bytes of PID
> 8 bytes of func field
> 4 bytes of depth (here, I left this on 4 bytes)
> 4 bytes of overrun, I don't use this field, so I wrote value 0.
> 8 bytes for calltime
> 8 bytes for rettime.
> 
> My questions are:
> 1- Do you think that my fix for `funcgraph_entry` entry's depth value is correct?
> 2- If so, can we have a double check on the `funcgraph_exit` entry as well?

How are you creating the event headers that holds this data? That's key to your answer.

-- Steve
