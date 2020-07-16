Return-Path: <SRS0=CYr2=A3=vger.kernel.org=linux-trace-users-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9BFDC433DF
	for <linux-trace-users@archiver.kernel.org>; Thu, 16 Jul 2020 01:49:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B70B42078C
	for <linux-trace-users@archiver.kernel.org>; Thu, 16 Jul 2020 01:49:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="MI2v5E7y"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727948AbgGPBtn (ORCPT
        <rfc822;linux-trace-users@archiver.kernel.org>);
        Wed, 15 Jul 2020 21:49:43 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:42141 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726785AbgGPBtn (ORCPT
        <rfc822;linux-trace-users@vger.kernel.org>);
        Wed, 15 Jul 2020 21:49:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1594864181;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=Uzof8KXooqKNAKvrjm3bLHucKzse13iR2TxQjM6h3dg=;
        b=MI2v5E7y/PwpwRyzHaZm5uXQlwe7NFOfCt5hhg24wD3T63twh/0IGFwlnuk3cmnXJX0FcO
        kP9BtI0wmvyDPn+FLhsBa6+j4lbXB3hQI8/iHh5seMetnsxzd/aDdzrc1uN9D5J2hInMId
        HkqDKHGXm/9Z6aSp7R/dRUt03IiUF1o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-347-NZGckounOVaCjCtky7ZpgA-1; Wed, 15 Jul 2020 21:49:38 -0400
X-MC-Unique: NZGckounOVaCjCtky7ZpgA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3AF7C1B18BC0;
        Thu, 16 Jul 2020 01:49:36 +0000 (UTC)
Received: from redhat.com (ovpn-112-64.phx2.redhat.com [10.3.112.64])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id 2890378471;
        Thu, 16 Jul 2020 01:49:35 +0000 (UTC)
Received: from fche by redhat.com with local (Exim 4.94)
        (envelope-from <fche@redhat.com>)
        id 1jvt1g-00054r-R5; Wed, 15 Jul 2020 21:49:32 -0400
Date:   Wed, 15 Jul 2020 21:49:32 -0400
From:   "Frank Ch. Eigler" <fche@redhat.com>
To:     Michel Dagenais <michel.dagenais@polymtl.ca>
Cc:     Steven Rostedt <rostedt@goodmis.org>,
        ahmadkhorrami <ahmadkhorrami@ut.ac.ir>,
        linux-trace-users-owner@vger.kernel.org,
        linux-trace-users <linux-trace-users@vger.kernel.org>,
        lttng-dev <lttng-dev@lists.lttng.org>,
        Namhyung Kim <namhyung@kernel.org>
Subject: Re: [lttng-dev] Capturing User-Level Function Calls/Returns
Message-ID: <20200716014932.GB10566@redhat.com>
References: <e9c7400ff0075f3beba2863c4432a905@ut.ac.ir>
 <20200715142849.0bfe909a@oasis.local.home>
 <83963025.14828.1594838718290.JavaMail.zimbra@efficios.com>
 <98de6fe15a816d8f06ba3d5df0f10540@ut.ac.ir>
 <20200715174858.4698803c@oasis.local.home>
 <489547987.230950.1594861561764.JavaMail.zimbra@polymtl.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <489547987.230950.1594861561764.JavaMail.zimbra@polymtl.ca>
User-Agent: Mutt/1.12.0 (2019-05-25)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Sender: linux-trace-users-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-trace-users.vger.kernel.org>
X-Mailing-List: linux-trace-users@vger.kernel.org

Hi -

> If you can afford a more invasive tool, that requires a lot of
> memory and stops your application for quite some time, you can look
> at approaches like dyninst that decompile the binary, insert
> instrumentation code and reassemble the code.

> https://dyninst.org/

For the record, systemtap includes a backend that uses dyninst as a
pure userspace backend.


% cat foo.c
#include <stdio.h>

int foo() {
  printf("foo\n");
  return 1;
}

int main() {
  foo();
}

% gcc -g foo.c

% stap --runtime=dyninst -e '
   probe process.function("*").{call,return} { println(pp()) }
' -c a.out

foo
process("/home/fche/a.out").function("main@/home/fche/foo.c:8").call
process("/home/fche/a.out").function("foo@/home/fche/foo.c:3").call
process("/home/fche/a.out").function("foo@/home/fche/foo.c:3").return
process("/home/fche/a.out").function("main@/home/fche/foo.c:8").return


- FChE

