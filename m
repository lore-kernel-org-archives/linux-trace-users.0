Return-Path: <linux-trace-users-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E03A4C43334
	for <linux-trace-users@archiver.kernel.org>; Wed, 15 Jun 2022 15:18:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349004AbiFOPSw convert rfc822-to-8bit (ORCPT
        <rfc822;linux-trace-users@archiver.kernel.org>);
        Wed, 15 Jun 2022 11:18:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42420 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347617AbiFOPSq (ORCPT
        <rfc822;linux-trace-users@vger.kernel.org>);
        Wed, 15 Jun 2022 11:18:46 -0400
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30EFE2E09B
        for <linux-trace-users@vger.kernel.org>; Wed, 15 Jun 2022 08:18:45 -0700 (PDT)
Received: from fraeml714-chm.china.huawei.com (unknown [172.18.147.206])
        by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4LNTTm40ppz687qR
        for <linux-trace-users@vger.kernel.org>; Wed, 15 Jun 2022 23:18:36 +0800 (CST)
Received: from lhreml745-chm.china.huawei.com (10.201.108.195) by
 fraeml714-chm.china.huawei.com (10.206.15.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Wed, 15 Jun 2022 17:18:42 +0200
Received: from lhreml739-chm.china.huawei.com (10.201.108.189) by
 lhreml745-chm.china.huawei.com (10.201.108.195) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Wed, 15 Jun 2022 16:18:42 +0100
Received: from lhreml739-chm.china.huawei.com ([10.201.108.189]) by
 lhreml739-chm.china.huawei.com ([10.201.108.189]) with mapi id
 15.01.2375.024; Wed, 15 Jun 2022 16:18:41 +0100
From:   Matteo Bertolino <matteo.bertolino@huawei.com>
To:     "linux-trace-users@vger.kernel.org" 
        <linux-trace-users@vger.kernel.org>
Subject: Format of trace.dat flyrecord section
Thread-Topic: Format of trace.dat flyrecord section
Thread-Index: AdiAyt5H6PwunLT9TtSAaZGsGqRogg==
Date:   Wed, 15 Jun 2022 15:18:41 +0000
Message-ID: <e3287c4e7ae2407f873bedf74df9651c@huawei.com>
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

[Goal] I am trying to understand more about tracing. In one of my experiments, I decided to try to write my own trace.dat file (with some dummy entries).
To do that, I am following the documentation for a "version-7 .dat" provided in https://github.com/rostedt/trace-cmd/blob/master/Documentation/trace-cmd/trace-cmd.dat.v7.5.txt , 
and trying to looking at the code of libtraceevent, trace-cmd and kernelshark. I use kernelshark to be sure I am writing a good trace.

[Context] I managed to write a complete header (I double-checked checking in strategical points in trace-cmd, kernelshark and libtraceevent code). In this header, I have three sections:
- Section 0, with options 16 (header_infos), option 8 (in which I stated to have a single CPU), and option 3. The latter states that I have a cpu whose data starts at offset 4096 of the trace.
- Section 16: in which I transfers the information of `header_page` and `header_event` files.
- Section 3: the flyrecord section, whose header is followed by a padding to be one-page aligned. After the padding, there should be the CPU datas.
Yet another check of the header's correctness are outputs of commands `trace-cmd dump --flyrecord -i mytrace.dat` and `trace-cmd dump --summary -i ../mytrace_v7.dat`.

[Problem] The problems occur there. I don't manage to get the format of flyrecords. 
I understood that timestamps need to follow the structure of ringbuffers (those expressed in `header_event` file), so 5 bits for the type_len, 27 for the time_delta, and an u32 array[].
But, kernelshark entries contains also: timestamp, CPUs, PID, EVENT, TASK, LATENCY and "INFO". 

Through flybuffer schema, I can only provide TIMESTAMP divided by CPUs, but where do I take other fields?
In addition to this, I didn't understand how I can provide multiple entries.

Thanks for you possible help,
Matteo

