Return-Path: <linux-trace-users-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7915DECAAD4
	for <linux-trace-users@archiver.kernel.org>; Wed, 31 Aug 2022 15:24:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231273AbiHaPY4 convert rfc822-to-8bit (ORCPT
        <rfc822;linux-trace-users@archiver.kernel.org>);
        Wed, 31 Aug 2022 11:24:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40226 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230034AbiHaPYy (ORCPT
        <rfc822;linux-trace-users@vger.kernel.org>);
        Wed, 31 Aug 2022 11:24:54 -0400
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B419E2DD3
        for <linux-trace-users@vger.kernel.org>; Wed, 31 Aug 2022 08:24:49 -0700 (PDT)
Received: from fraeml740-chm.china.huawei.com (unknown [172.18.147.206])
        by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4MHnv241t6z6HJH0
        for <linux-trace-users@vger.kernel.org>; Wed, 31 Aug 2022 23:21:02 +0800 (CST)
Received: from lhrpeml500003.china.huawei.com (7.191.162.67) by
 fraeml740-chm.china.huawei.com (10.206.15.221) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 31 Aug 2022 17:24:47 +0200
Received: from lhrpeml500003.china.huawei.com (7.191.162.67) by
 lhrpeml500003.china.huawei.com (7.191.162.67) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Wed, 31 Aug 2022 16:24:47 +0100
Received: from lhrpeml500003.china.huawei.com ([7.191.162.67]) by
 lhrpeml500003.china.huawei.com ([7.191.162.67]) with mapi id 15.01.2375.024;
 Wed, 31 Aug 2022 16:24:47 +0100
From:   Matteo Bertolino <matteo.bertolino@huawei.com>
To:     "linux-trace-users@vger.kernel.org" 
        <linux-trace-users@vger.kernel.org>
Subject: RE: `fungraph_entry` and `funcgraph_exit` entries: is there a
 mismatch between trace-cmd and the format of debugfs?
Thread-Topic: `fungraph_entry` and `funcgraph_exit` entries: is there a
 mismatch between trace-cmd and the format of debugfs?
Thread-Index: Adi8UaCYyVhy3GKeRViBYI/Q5yasxAA/AmWg
Date:   Wed, 31 Aug 2022 15:24:46 +0000
Message-ID: <50fa51e229964968879861898ffde830@huawei.com>
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

Dear community,
My problem was a bad understanding of the `type_len` field of the event header.
You can ignore this mail, sorry.
Bests,
Matteo

-----Original Message-----
From: Matteo Bertolino 
Sent: Tuesday, August 30, 2022 11:20 AM
To: 'linux-trace-users@vger.kernel.org' <linux-trace-users@vger.kernel.org>
Subject: `fungraph_entry` and `funcgraph_exit` entries: is there a mismatch between trace-cmd and the format of debugfs?

Dear Community,

I would like to share with you something interesting came out from one of my tests. 

I am manually  writing a binary trace composed of `funcgraph_entry` and `funcgraph_exit` entries: 
This is an example:
CPU0: Task A entry ------- Task B entry  ------- Task B exit ------- Task A exit.

After writing the trace, I display it with Kernelshark.

Both entries and exit give me problems. Let's start with the entry.

I gave to the section 17 of the trace.dat the following file:
````
name: funcgraph_entry
ID: 11
format:
	field:unsigned short common_type;	offset:0;	size:2;	signed:0;
	field:unsigned char common_flags;	offset:2;	size:1;	signed:0;
	field:unsigned char common_preempt_count;	offset:3;	size:1;	signed:0;
	field:int common_pid;	offset:4;	size:4;	signed:1;
	field:unsigned long func;	offset:8;	size:8;	signed:0;
	field:int depth;	offset:16;	size:4;	signed:1;

print fmt: "--> %ps (%d)", (void *)REC->func, REC->depth ````

So, in the trace, after the event header, I write 2 bytes for the ID (11 in this case), 1 for the flags, and so and so, until the last one: 4 bytes for depth.
The problem arrives there: if I don't write 4 additional bytes on field `depth` (or 4 additional bytes of padding), the next entry is not displayed on Kernelshark, which shows an [UNKNOWN EVENT[.

A little hypothesis: I noticed that `fgraph_ent_handler()` function on `trace-ftrace.c` calls `print_graph_nested()`. The latter declares `depth` as `unsigned long long depth;`  , namely on 8 bytes instead of the declared 4.

If I modify the file in this way (below) and, for each `funcgraph_entry` entry, I write the depth 8 bytes instead of 4, everything is ok:
````
name: funcgraph_entry
ID: 11
format:
	field:unsigned short common_type;	offset:0;	size:2;	signed:0;
	field:unsigned char common_flags;	offset:2;	size:1;	signed:0;
	field:unsigned char common_preempt_count;	offset:3;	size:1;	signed:0;
	field:int common_pid;	offset:4;	size:4;	signed:1;
	field:unsigned long func;	offset:8;	size:8;	signed:0;
	field:int depth;	offset:16;	size:8;	signed:1;

print fmt: "--> %ps (%d)", (void *)REC->func, REC->depth ````

Now, unfortunately, I have the same problem with `funcgraph_exit` entries, but this this I cannot find a workaround.
The first `funcgraph_exit` entry that I write is perfectly displayed on Kernelshark, but everything subsequent to it is broken.

Example of `funcgraph_exit` entry:
4 bytes of TS delta
2 bytes for the ID (11)
1 byte for common_flags, I don't use this field, so I wrote the value 0.
1 byte for common_preempt_count, I don't use this field, so I wrote the value 0.
4 bytes of PID
8 bytes of func field
4 bytes of depth (here, I left this on 4 bytes)
4 bytes of overrun, I don't use this field, so I wrote value 0.
8 bytes for calltime
8 bytes for rettime.

My questions are:
1- Do you think that my fix for `funcgraph_entry` entry's depth value is correct?
2- If so, can we have a double check on the `funcgraph_exit` entry as well?

Cheers,
Matteo
