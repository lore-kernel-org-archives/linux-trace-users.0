Return-Path: <SRS0=Bpf1=A2=vger.kernel.org=linux-trace-users-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00CC2C433E3
	for <linux-trace-users@archiver.kernel.org>; Wed, 15 Jul 2020 16:28:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DBFD920663
	for <linux-trace-users@archiver.kernel.org>; Wed, 15 Jul 2020 16:28:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726778AbgGOQ2N (ORCPT
        <rfc822;linux-trace-users@archiver.kernel.org>);
        Wed, 15 Jul 2020 12:28:13 -0400
Received: from mail.ut.ac.ir ([80.66.177.10]:60402 "EHLO mail.ut.ac.ir"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726354AbgGOQ2M (ORCPT
        <rfc822;linux-trace-users@vger.kernel.org>);
        Wed, 15 Jul 2020 12:28:12 -0400
Received: from localhost (localhost [127.0.0.1])
        by mail.ut.ac.ir (Postfix) with ESMTP id E7A7E1DAD59
        for <linux-trace-users@vger.kernel.org>; Wed, 15 Jul 2020 20:37:16 +0430 (+0430)
Received: from mail.ut.ac.ir ([127.0.0.1])
        by localhost (mail.ut.ac.ir [127.0.0.1]) (amavisd-new, port 10024)
        with LMTP id u_kxt3EuMCTn for <linux-trace-users@vger.kernel.org>;
        Wed, 15 Jul 2020 20:37:16 +0430 (+0430)
Received: from mail.ut.ac.ir (mail.ut.ac.ir [194.225.0.10])
        by mail.ut.ac.ir (Postfix) with ESMTP id 805BA1DAD45
        for <linux-trace-users@vger.kernel.org>; Wed, 15 Jul 2020 20:37:16 +0430 (+0430)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Wed, 15 Jul 2020 20:37:16 +0430
From:   ahmadkhorrami <ahmadkhorrami@ut.ac.ir>
To:     Linux-trace Users <linux-trace-users@vger.kernel.org>
Subject: Capturing User-Level Function Calls/Returns
Message-ID: <e9c7400ff0075f3beba2863c4432a905@ut.ac.ir>
X-Sender: ahmadkhorrami@ut.ac.ir
User-Agent: Roundcube Webmail/1.3.6
Sender: linux-trace-users-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-trace-users.vger.kernel.org>
X-Mailing-List: linux-trace-users@vger.kernel.org

Hi,
What is the most efficient way to capture occurrence of a function 
call/return of a binary program in userspace?
It seems the answer is Uprobes. 1) Am I right?
But Uprobes use "int" instruction which leads to a switch into kernel 
mode. 2) Wouldn't it be better to avoid this transition?
I'm looking forward to your reply and will be happy to read your 
opinions.
Regards.
