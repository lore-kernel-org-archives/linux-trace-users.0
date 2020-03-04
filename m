Return-Path: <SRS0=6sl8=4V=vger.kernel.org=linux-trace-users-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1884BC3F2D1
	for <linux-trace-users@archiver.kernel.org>; Wed,  4 Mar 2020 21:27:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C46D820828
	for <linux-trace-users@archiver.kernel.org>; Wed,  4 Mar 2020 21:27:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=efficios.com header.i=@efficios.com header.b="ltGzHkkj"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388281AbgCDV1K (ORCPT
        <rfc822;linux-trace-users@archiver.kernel.org>);
        Wed, 4 Mar 2020 16:27:10 -0500
Received: from mail.efficios.com ([167.114.26.124]:45892 "EHLO
        mail.efficios.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387762AbgCDV1K (ORCPT
        <rfc822;linux-trace-users@vger.kernel.org>);
        Wed, 4 Mar 2020 16:27:10 -0500
Received: from localhost (localhost [127.0.0.1])
        by mail.efficios.com (Postfix) with ESMTP id 4E5C926F4C1;
        Wed,  4 Mar 2020 16:27:09 -0500 (EST)
Received: from mail.efficios.com ([127.0.0.1])
        by localhost (mail03.efficios.com [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id UfrujlSfKNro; Wed,  4 Mar 2020 16:27:09 -0500 (EST)
Received: from localhost (localhost [127.0.0.1])
        by mail.efficios.com (Postfix) with ESMTP id 03F8426F4BE;
        Wed,  4 Mar 2020 16:27:09 -0500 (EST)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.efficios.com 03F8426F4BE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=efficios.com;
        s=default; t=1583357229;
        bh=JNyJCmg8U7uWmoq8iL+XYfXQOm0pFA3YkDAFZ9/IxPM=;
        h=Date:From:To:Message-ID:MIME-Version;
        b=ltGzHkkjenCskjTiMctP9h84fFNwx2/l1ycfQLKXJnhGpgxKwRKhVjTKZp5XIXScp
         OYw9+SCqSlWDVtvF2ztm0lUCP4JAWiF9LwyU+0ihA4yEv8v+0As8lW2z9CY6JOZXLz
         rzpVOoQliNDm620YrPBqORrCx1f+NQKB8sfeiKrBXHhDHhqJ6zb5//n74Mhauyp7mt
         +pCeXzugHZ4WoulaEfOKVzKdBDDCrVByzhbLRdGjmcXfSLlIecdjf0dDukHUp8BBQn
         GGyF2umh/+2pYY5L0mBxdPt51WUr2vadq+HEqTOmUbEWc8pm/Wg5JR1mNeMrRCeZ78
         nx/VY/0OFxB7A==
X-Virus-Scanned: amavisd-new at efficios.com
Received: from mail.efficios.com ([127.0.0.1])
        by localhost (mail03.efficios.com [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id m0p9TLCX_nXU; Wed,  4 Mar 2020 16:27:08 -0500 (EST)
Received: from mail03.efficios.com (mail03.efficios.com [167.114.26.124])
        by mail.efficios.com (Postfix) with ESMTP id EDBC226F889;
        Wed,  4 Mar 2020 16:27:08 -0500 (EST)
Date:   Wed, 4 Mar 2020 16:27:08 -0500 (EST)
From:   Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
To:     lttng-dev@lists.lttng.org,
        diamon-discuss@lists.linuxfoundation.org,
        linux-trace-users@vger.kernel.org
Message-ID: <1372342050.18535.1583357228871.JavaMail.zimbra@efficios.com>
Subject: [RELEASE] LTTng-UST 2.10.7, 2.11.1, 2.12.0-rc2 (Linux user-space
 tracer)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Originating-IP: [167.114.26.124]
X-Mailer: Zimbra 8.8.15_GA_3901 (ZimbraWebClient - FF73 (Linux)/8.8.15_GA_3895)
Thread-Index: ha3oPyJw+hb4iGhFqKZ1pDV3/EMvow==
Thread-Topic: LTTng-UST 2.10.7, 2.11.1, 2.12.0-rc2 (Linux user-space tracer)
Sender: linux-trace-users-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-trace-users.vger.kernel.org>
X-Mailing-List: linux-trace-users@vger.kernel.org

Hi,

This announcement covers new releases in the two actively maintained
stable branches of the LTTng-UST project (2.10.7 and 2.11.1), as well as
the second release candidate for the 2.12 branch (2.12.0-rc2).

LTTng-UST, the Linux Trace Toolkit Next Generation Userspace Tracer,
is a low-overhead application tracer. The library "liblttng-ust" enables
tracing of applications and libraries.

* Noteworthy fixes:

All of these releases contain a fix which ensures the FD_CLOEXEC flag
is set for _all_ file descriptors received by lttng-ust over unix
socket. This fixes an issue where more file descriptors than expected
stay open over exec.

Fixes were introduced to please the address sanitizer (ASan) part of
clang-9. One documented out-of-bound access was done by jhash as an
"optimization" which was rightfully tripping ASan. Since this is
not a fast-path, the optimization was removed and we always use the
slower "valgrind-safe" code path. We also annotated the variables
emitted in the __tracepoints_ptrs to ensure ASan does not emit
redzones around those variables, which are means to be contiguous
within the section.

For the 2.10 and 2.11 branches, building with -fno-common is
enforced to prepare for the upcoming default behavior change
in gcc 10.

Please try it out, and as usual, feedback is welcome!

Thanks,

Mathieu

Project website: https://lttng.org
Documentation: https://lttng.org/docs
Download link: https://lttng.org/download

-- 
Mathieu Desnoyers
EfficiOS Inc.
http://www.efficios.com
