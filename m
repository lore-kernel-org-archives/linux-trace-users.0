Return-Path: <linux-trace-users-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7754C6FA83
	for <linux-trace-users@archiver.kernel.org>; Tue,  6 Sep 2022 09:29:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233303AbiIFJ30 convert rfc822-to-8bit (ORCPT
        <rfc822;linux-trace-users@archiver.kernel.org>);
        Tue, 6 Sep 2022 05:29:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38304 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239021AbiIFJ3R (ORCPT
        <rfc822;linux-trace-users@vger.kernel.org>);
        Tue, 6 Sep 2022 05:29:17 -0400
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 82C3D1CB36
        for <linux-trace-users@vger.kernel.org>; Tue,  6 Sep 2022 02:29:16 -0700 (PDT)
Received: from fraeml703-chm.china.huawei.com (unknown [172.18.147.226])
        by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4MMKnF2Tflz6H6l7
        for <linux-trace-users@vger.kernel.org>; Tue,  6 Sep 2022 17:28:17 +0800 (CST)
Received: from lhrpeml100005.china.huawei.com (7.191.160.25) by
 fraeml703-chm.china.huawei.com (10.206.15.52) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2375.31; Tue, 6 Sep 2022 11:29:14 +0200
Received: from lhrpeml500003.china.huawei.com (7.191.162.67) by
 lhrpeml100005.china.huawei.com (7.191.160.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 6 Sep 2022 10:29:13 +0100
Received: from lhrpeml500003.china.huawei.com ([7.191.162.67]) by
 lhrpeml500003.china.huawei.com ([7.191.162.67]) with mapi id 15.01.2375.031;
 Tue, 6 Sep 2022 10:29:13 +0100
From:   Matteo Bertolino <matteo.bertolino@huawei.com>
To:     "linux-trace-users@vger.kernel.org" 
        <linux-trace-users@vger.kernel.org>
Subject: Kernelshark: funcgraph_exit events don't seem to exit?
Thread-Topic: Kernelshark: funcgraph_exit events don't seem to exit?
Thread-Index: AdjB0vgZiTKOLdjrR7qANsLEu7G47A==
Date:   Tue, 6 Sep 2022 09:29:13 +0000
Message-ID: <97aca26a196b4c72aaf2141b5a0c12c9@huawei.com>
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
In order to explain my problem, I need to ask you to have a look to the visual trace in my github (I cannot attach it to the mail nor using an image uploading service): https://github.com/the-red-robin/trace-cmd-experiments/blob/main/README.md 

In the trace, we have one CPU, CPU0. On it:
- `Task3` runs `foo5()` at time 8.000000 cycles
- `Task2` takes place running `foo3()` at time 8.010000 cycles.
- `Task1` takes place running `foo1()` at time 8.060000 cycles.
For now, everything OK.
Then, I wish to `exit` the three tasks.

- `Task1` exits at 8.090000 cycles. Here the trace does not show what I expect, namely `Task1` (in red) shall end at 8.090000 cycles. Instead, there is a red trace until the beginning of the next exit event, `Task2` at 8.130000.

This doesn't seem an `exit` event. Do you have any suggestions to show what I wish on Kernelshark?

Best Regards,
Matteo
