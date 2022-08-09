Return-Path: <linux-trace-users-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 670ACC25B07
	for <linux-trace-users@archiver.kernel.org>; Tue,  9 Aug 2022 13:32:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237990AbiHINcJ convert rfc822-to-8bit (ORCPT
        <rfc822;linux-trace-users@archiver.kernel.org>);
        Tue, 9 Aug 2022 09:32:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44390 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231578AbiHINcI (ORCPT
        <rfc822;linux-trace-users@vger.kernel.org>);
        Tue, 9 Aug 2022 09:32:08 -0400
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE3381FA
        for <linux-trace-users@vger.kernel.org>; Tue,  9 Aug 2022 06:32:07 -0700 (PDT)
Received: from fraeml710-chm.china.huawei.com (unknown [172.18.147.200])
        by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4M2DSM2cDHz67GMp
        for <linux-trace-users@vger.kernel.org>; Tue,  9 Aug 2022 21:29:23 +0800 (CST)
Received: from lhrpeml500003.china.huawei.com (7.191.162.67) by
 fraeml710-chm.china.huawei.com (10.206.15.59) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Tue, 9 Aug 2022 15:32:05 +0200
Received: from lhrpeml500003.china.huawei.com (7.191.162.67) by
 lhrpeml500003.china.huawei.com (7.191.162.67) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Tue, 9 Aug 2022 14:32:05 +0100
Received: from lhrpeml500003.china.huawei.com ([7.191.162.67]) by
 lhrpeml500003.china.huawei.com ([7.191.162.67]) with mapi id 15.01.2375.024;
 Tue, 9 Aug 2022 14:32:04 +0100
From:   Matteo Bertolino <matteo.bertolino@huawei.com>
To:     "linux-trace-users@vger.kernel.org" 
        <linux-trace-users@vger.kernel.org>
Subject: Format of funcgraph_{entry, exit} ftrace event
Thread-Topic: Format of funcgraph_{entry, exit} ftrace event
Thread-Index: Adir8XMFshY36WwNQGaM9Zipr+gIaQ==
Date:   Tue, 9 Aug 2022 13:32:04 +0000
Message-ID: <41ac8a9190b647d4ad711d3d8f82ceea@huawei.com>
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

Dear community, 
I wish to ask you some clarifications about the format of two ftrace events: `funcgraph_entry` and `funcgraph_exit`, basically those in `$ANY_DEBUG_FS/tracing/events/ftrace`.
Let me copy and paste them here:


# cat funcgraph_entry/format
name: funcgraph_entry
ID: 11
format:
	field:unsigned short common_type;	offset:0;	size:2;	signed:0;
	field:unsigned char common_flags;	offset:2;	size:1;	signed:0;
	field:unsigned char common_preempt_count;	offset:3;	size:1;	signed:0;
	field:int common_pid;	offset:4;	size:4;	signed:1;

	field:unsigned long func;	offset:8;	size:8;	signed:0;
	field:int depth;	offset:16;	size:4;	signed:1;

print fmt: "--> %ps (%d)", (void *)REC->func, REC->depth


AND

# cat funcgraph_exit/format
name: funcgraph_exit
ID: 10
format:
	field:unsigned short common_type;	offset:0;	size:2;	signed:0;
	field:unsigned char common_flags;	offset:2;	size:1;	signed:0;
	field:unsigned char common_preempt_count;	offset:3;	size:1;	signed:0;
	field:int common_pid;	offset:4;	size:4;	signed:1;

	field:unsigned long func;	offset:8;	size:8;	signed:0;
	field:int depth;	offset:16;	size:4;	signed:1;
	field:unsigned int overrun;	offset:20;	size:4;	signed:0;
	field:unsigned long long calltime;	offset:24;	size:8;	signed:0;
	field:unsigned long long rettime;	offset:32;	size:8;	signed:0;

print fmt: "<-- %ps (%d) (start: %llx  end: %llx) over: %d", (void *)REC->func, REC->depth, REC->calltime, REC->rettime, REC->depth


While writing a `trace.dat`, I know that all the entries have an header, described by the Linux ringbuffer format (file `header_event`):
# compressed entry header
	type_len    :    5 bits
	time_delta  :   27 bits
	array       :   32 bits

	padding     : type == 29
	time_extend : type == 30
	time_stamp : type == 31
	data max type_len  == 28

Such header includes a timestamp (that can be a delta of the timestamp present in the `header_page`).

I have one question for the ftrace's community:
Why are the following fields of a `funcgraph_exit` entry useful? ` calltime` and ` rettime`. 
They look like redundant for me, because the timing information is already present on the `header_event`. 

Please can you clarify me whether I am wrong? 
Best Regards && have lovely holidays,
Matteo
