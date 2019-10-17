Return-Path: <SRS0=cwR1=YK=vger.kernel.org=linux-trace-users-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FFE7ECE58D
	for <linux-trace-users@archiver.kernel.org>; Thu, 17 Oct 2019 20:01:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3A47D21835
	for <linux-trace-users@archiver.kernel.org>; Thu, 17 Oct 2019 20:01:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=efficios.com header.i=@efficios.com header.b="Y3JgZH+d"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2436858AbfJQUBJ (ORCPT
        <rfc822;linux-trace-users@archiver.kernel.org>);
        Thu, 17 Oct 2019 16:01:09 -0400
Received: from mail.efficios.com ([167.114.142.138]:41594 "EHLO
        mail.efficios.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2436833AbfJQUBJ (ORCPT
        <rfc822;linux-trace-users@vger.kernel.org>);
        Thu, 17 Oct 2019 16:01:09 -0400
Received: from localhost (ip6-localhost [IPv6:::1])
        by mail.efficios.com (Postfix) with ESMTP id 45B483453BA;
        Thu, 17 Oct 2019 16:01:08 -0400 (EDT)
Received: from mail.efficios.com ([IPv6:::1])
        by localhost (mail02.efficios.com [IPv6:::1]) (amavisd-new, port 10032)
        with ESMTP id 1s_RqRVJmZUX; Thu, 17 Oct 2019 16:01:07 -0400 (EDT)
Received: from localhost (ip6-localhost [IPv6:::1])
        by mail.efficios.com (Postfix) with ESMTP id CD9BA3453B7;
        Thu, 17 Oct 2019 16:01:07 -0400 (EDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.efficios.com CD9BA3453B7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=efficios.com;
        s=default; t=1571342467;
        bh=yNnAgppoG/aCfnzexVvlMTcPAIVO/hxFqxSOBNMPSsQ=;
        h=Date:From:To:Message-ID:MIME-Version;
        b=Y3JgZH+dFM/Ew73oxBn4MlWlQtWF0V/Tr0gdKeJupL1ELafAnmu+CQBUBEZkNiGQF
         6KB+yFKSunitszXd9IAa3oVfBBKdNeMXVKnntvMhgNYURTArwaf64P3qHdL46QBfW+
         FRlfmZgLnNFBOQRmj50HENWN51NlePmT2UNhj2miJ8DTRN9PaNRXFOXWpWcr/oga/d
         UwE8A8gkQI7P+ngALChU22GVedivnihgefhY8uWd4s2Sf6X/VHpav4IDjylhkvKmm7
         +UbQLS/mQCpQkgAEhXqiI5yUd6vSP1kfIk+sJtq+e6ZfsBypsR1r1DOaYEC/5OmUf7
         Q42YBLKxr21UQ==
X-Virus-Scanned: amavisd-new at efficios.com
Received: from mail.efficios.com ([IPv6:::1])
        by localhost (mail02.efficios.com [IPv6:::1]) (amavisd-new, port 10026)
        with ESMTP id oKsqlekIoc1y; Thu, 17 Oct 2019 16:01:07 -0400 (EDT)
Received: from mail02.efficios.com (mail02.efficios.com [167.114.142.138])
        by mail.efficios.com (Postfix) with ESMTP id B543E3453AB;
        Thu, 17 Oct 2019 16:01:07 -0400 (EDT)
Date:   Thu, 17 Oct 2019 16:01:07 -0400 (EDT)
From:   Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
To:     lttng-dev@lists.lttng.org,
        diamon-discuss@lists.linuxfoundation.org,
        linux-trace-users@vger.kernel.org
Message-ID: <656595855.12717.1571342467573.JavaMail.zimbra@efficios.com>
Subject: [RELEASE] LTTng-UST 2.9.7 (EOL), 2.10.6 (Linux user-space tracer)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Originating-IP: [167.114.142.138]
X-Mailer: Zimbra 8.8.15_GA_3869 (ZimbraWebClient - FF69 (Linux)/8.8.15_GA_3869)
Thread-Index: MbRQU7UVZi5AaJQP1HXzIVHTd1CYNA==
Thread-Topic: LTTng-UST 2.9.7 (EOL), 2.10.6 (Linux user-space tracer)
Sender: linux-trace-users-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-trace-users.vger.kernel.org>
X-Mailing-List: linux-trace-users@vger.kernel.org

Hi,

We are pleased to announce the 2.9.7 (EOL) and 2.10.6 stable releases
of the LTTng-UST 2.9 and 2.10 stable branches.

LTTng-UST, the Linux Trace Toolkit Next Generation Userspace Tracer,
is a low-overhead application tracer. The library "liblttng-ust" enables
tracing of applications and libraries.

* New in this release:

Important fixes to the lttng-ust fd tracker (liblttng-ust-fd.so) were done,
taking care of locking the fd tracker across fork() in the liblttng-ust-fork.so
wrapper, eliminating hangs observed in the child if the parent was executing
close() concurrently with fork(). Also, given that close() is an async-signal-safe
function, ensure that the synchronization strategy is robust against signals
by disabling signals and using a TLS nesting counter when taking the fd tracker
lock. [1, 2]

Another important fix to the lttng-ust fd tracker is disabling thread
cancellation around fd tracker lock, and locking the fd tracker across
fork() in the liblttng-ust-fork.so wrapper. Failure to do so causes
deadlocks in child applications if a pthread cancellation is performed
on a thread while it ran the liblttng-ust-fd close(3) wrapper. [3]

The locking strategy of the LTTng perf counter contexts was revisited to
eliminate a deadlock occurring once in a while when using the perf counters
context with lttng-ust. [4]

Now that the release of LTTng-UST 2.11.0 is imminent, version 2.9.7 marks
the end of life (EOL) of the 2.9 stable branch of LTTng-UST.

Thanks!

Mathieu

Project website: http://lttng.org
Documentation: http://lttng.org/docs
Download link: http://lttng.org/download

[1] https://bugs.lttng.org/issues/1199
[2] https://bugs.lttng.org/issues/1200
[3] https://bugs.lttng.org/issues/1201
[4] https://bugs.lttng.org/issues/1202

-- 
Mathieu Desnoyers
EfficiOS Inc.
http://www.efficios.com
