Return-Path: <SRS0=CYr2=A3=vger.kernel.org=linux-trace-users-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFB6BC433DF
	for <linux-trace-users@archiver.kernel.org>; Thu, 16 Jul 2020 16:26:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8D02F20739
	for <linux-trace-users@archiver.kernel.org>; Thu, 16 Jul 2020 16:26:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729151AbgGPQ0R (ORCPT
        <rfc822;linux-trace-users@archiver.kernel.org>);
        Thu, 16 Jul 2020 12:26:17 -0400
Received: from mail.ut.ac.ir ([80.66.177.10]:37688 "EHLO mail.ut.ac.ir"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728845AbgGPQ0R (ORCPT
        <rfc822;linux-trace-users@vger.kernel.org>);
        Thu, 16 Jul 2020 12:26:17 -0400
Received: from localhost (localhost [127.0.0.1])
        by mail.ut.ac.ir (Postfix) with ESMTP id 0896F1DAF64;
        Thu, 16 Jul 2020 20:56:15 +0430 (+0430)
Received: from mail.ut.ac.ir ([127.0.0.1])
        by localhost (mail.ut.ac.ir [127.0.0.1]) (amavisd-new, port 10024)
        with LMTP id fyBNJ0CFXIIt; Thu, 16 Jul 2020 20:56:14 +0430 (+0430)
Received: from mail.ut.ac.ir (mail.ut.ac.ir [194.225.0.10])
        by mail.ut.ac.ir (Postfix) with ESMTP id E5B2D1DAF5B;
        Thu, 16 Jul 2020 20:56:13 +0430 (+0430)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Thu, 16 Jul 2020 20:56:13 +0430
From:   ahmadkhorrami <ahmadkhorrami@ut.ac.ir>
To:     "Frank Ch. Eigler" <fche@redhat.com>
Cc:     Michel Dagenais <michel.dagenais@polymtl.ca>,
        Steven Rostedt <rostedt@goodmis.org>,
        linux-trace-users-owner@vger.kernel.org,
        linux-trace-users <linux-trace-users@vger.kernel.org>,
        lttng-dev <lttng-dev@lists.lttng.org>,
        Namhyung Kim <namhyung@kernel.org>
Subject: Re: [lttng-dev] Capturing User-Level Function Calls/Returns
In-Reply-To: <20200716014932.GB10566@redhat.com>
References: <e9c7400ff0075f3beba2863c4432a905@ut.ac.ir>
 <20200715142849.0bfe909a@oasis.local.home>
 <83963025.14828.1594838718290.JavaMail.zimbra@efficios.com>
 <98de6fe15a816d8f06ba3d5df0f10540@ut.ac.ir>
 <20200715174858.4698803c@oasis.local.home>
 <489547987.230950.1594861561764.JavaMail.zimbra@polymtl.ca>
 <20200716014932.GB10566@redhat.com>
Message-ID: <7f301943d8e46bb21068c2d8017e7b4f@ut.ac.ir>
X-Sender: ahmadkhorrami@ut.ac.ir
User-Agent: Roundcube Webmail/1.3.6
Sender: linux-trace-users-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-trace-users.vger.kernel.org>
X-Mailing-List: linux-trace-users@vger.kernel.org

Hi Frank,

Thanks for the point!

Regards.


On 2020-07-16 06:19, Frank Ch. Eigler wrote:

> Hi -
> 
>> If you can afford a more invasive tool, that requires a lot of
>> memory and stops your application for quite some time, you can look
>> at approaches like dyninst that decompile the binary, insert
>> instrumentation code and reassemble the code.
> 
>> https://dyninst.org/
> 
> For the record, systemtap includes a backend that uses dyninst as a
> pure userspace backend.
> 
> % cat foo.c
> #include <stdio.h>
> 
> int foo() {
> printf("foo\n");
> return 1;
> }
> 
> int main() {
> foo();
> }
> 
> % gcc -g foo.c
> 
> % stap --runtime=dyninst -e '
> probe process.function("*").{call,return} { println(pp()) }
> ' -c a.out
> 
> foo
> process("/home/fche/a.out").function("main@/home/fche/foo.c:8").call
> process("/home/fche/a.out").function("foo@/home/fche/foo.c:3").call
> process("/home/fche/a.out").function("foo@/home/fche/foo.c:3").return
> process("/home/fche/a.out").function("main@/home/fche/foo.c:8").return
> 
> - FChE
