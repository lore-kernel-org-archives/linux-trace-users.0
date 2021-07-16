Return-Path: <linux-trace-users-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B58AC12002
	for <linux-trace-users@archiver.kernel.org>; Fri, 16 Jul 2021 21:56:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E6E7B613F3
	for <linux-trace-users@archiver.kernel.org>; Fri, 16 Jul 2021 21:55:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230490AbhGPV6w (ORCPT
        <rfc822;linux-trace-users@archiver.kernel.org>);
        Fri, 16 Jul 2021 17:58:52 -0400
Received: from mail.efficios.com ([167.114.26.124]:46994 "EHLO
        mail.efficios.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229951AbhGPV6w (ORCPT
        <rfc822;linux-trace-users@vger.kernel.org>);
        Fri, 16 Jul 2021 17:58:52 -0400
Received: from localhost (localhost [127.0.0.1])
        by mail.efficios.com (Postfix) with ESMTP id 96F223341F6;
        Fri, 16 Jul 2021 17:55:56 -0400 (EDT)
Received: from mail.efficios.com ([127.0.0.1])
        by localhost (mail03.efficios.com [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id DMGVAkOpagin; Fri, 16 Jul 2021 17:55:55 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
        by mail.efficios.com (Postfix) with ESMTP id 9C7DD334631;
        Fri, 16 Jul 2021 17:55:55 -0400 (EDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.efficios.com 9C7DD334631
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=efficios.com;
        s=default; t=1626472555;
        bh=/dyYYcX7CfiYNOwTGyCHlNlo2wyMDx0Ah4mjvvTMp9M=;
        h=Date:From:To:Message-ID:MIME-Version;
        b=cYlpZrfgG7aAGQDxJEQr8G+PQN5W6tWGIq/4pUPDePj43qRTpZey/DI1UuBsHD+QC
         VsC6qbWAhrUe8v2MNqmrGRP1WgBaZcjTCR5EvkfpicR/6KgZFoVe11P65gSY3MuQn/
         zv6M7I0jCMJOxYbD7CHbcUPQ+79d2eUnA79oYHIHN7OCUXO3mPrpmdelYnQFDSeuD+
         mmNm5akUW7j8HlRNoPO8VY5Uw3ixqr66PksEp4rVmoCxagxOhdhVA8eQFMmD45mJkv
         lTmYF+T4WG5FC79g00v6ROiMHx/cDBLAg+SS2ixvNhNR2ONUCKwzjN1j6SzeAiruE9
         PZGK+8oyxnRRA==
X-Virus-Scanned: amavisd-new at efficios.com
Received: from mail.efficios.com ([127.0.0.1])
        by localhost (mail03.efficios.com [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id irWXbAxvOj5G; Fri, 16 Jul 2021 17:55:55 -0400 (EDT)
Received: from mail03.efficios.com (mail03.efficios.com [167.114.26.124])
        by mail.efficios.com (Postfix) with ESMTP id 91CFB33462E;
        Fri, 16 Jul 2021 17:55:55 -0400 (EDT)
Date:   Fri, 16 Jul 2021 17:55:55 -0400 (EDT)
From:   =?utf-8?B?SsOpcsOpbWll?= Galarneau 
        <jeremie.galarneau@efficios.com>
To:     lttng-dev <lttng-dev@lists.lttng.org>
Cc:     diamon-discuss@lists.linuxfoundation.org,
        linux-trace-users@vger.kernel.org
Message-ID: <352801862.23977.1626472555562.JavaMail.zimbra@efficios.com>
Subject: =?utf-8?Q?[lttng-dev]_[RELEASE]_LTTng_2.13.0-rc3_-_No?=
 =?utf-8?Q?rdicit=C3=A9_-_Linux_kernel_and_user-space_tracer?=
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [167.114.26.124]
X-Mailer: Zimbra 8.8.15_GA_4059 (ZimbraWebClient - FF89 (Linux)/8.8.15_GA_4059)
Thread-Index: teRjBQLEZeB3Rw0IuqaQtG8G6/JBBQ==
Thread-Topic: LTTng 2.13.0-rc3 - =?utf-8?Q?Nordicit=C3=A9?= - Linux kernel and user-space tracer
Precedence: bulk
List-ID: <linux-trace-users.vger.kernel.org>
X-Mailing-List: linux-trace-users@vger.kernel.org

Hi everyone,

Today marks the release of the third LTTng 2.13 - Nordicit=C3=A9 release ca=
ndidate.

A prettified version of this announcement is available here:
https://github.com/lttng/lttng-tools/releases/tag/v2.13.0-rc3

Have a look at the first release candidate's release notes for an
overview of the features introduced in LTTng 2.13.

https://github.com/lttng/lttng-tools/releases/tag/v2.13.0-rc1


What's new in LTTng-UST (Linux application tracer) 2.13.0-rc3?
---

- Removed vtracelog and vtracef from the v0 compatibility API.

- Various documentation updates.

See the ChangeLog for the full list of changes:
https://github.com/lttng/lttng-ust/blob/v2.13.0-rc3/ChangeLog


What's new in LTTng-modules (Linux kernel tracer) 2.13.0-rc3?
---

- Adapted the instrumentation for 5.14-rc upstream kernels and recent RHEL =
8.4 kernels.

See the ChangeLog for the full list of changes:
https://github.com/lttng/lttng-modules/blob/v2.13.0-rc3/ChangeLog


What's new in LTTng-tools 2.13.0-rc3?
---

- Usage examples were added to all lttng command man pages.

- Some symbols introduced in liblttng-ctl as part of the 2.13 release were =
changed:
  - Error query actions are now specified using an lttng_action_path,
  - The event rule API has been namespaced to include the domain name.

- Bumped the minimal Userspace RCU dependency to 0.11.

- Added the Machine Interface (MI) for the CLI's newly introduced trigger c=
ommands
  (add-trigger, remove-trigger, list-triggers).

See the ChangeLog for the full list of changes:
https://github.com/lttng/lttng-tools/blob/v2.13.0-rc3/ChangeLog


Links
---

Project website:
https://lttng.org

Download links:
https://lttng.org/files/lttng-tools/lttng-tools-2.13.0-rc3.tar.bz2
https://lttng.org/files/lttng-ust/lttng-ust-2.13.0-rc3.tar.bz2
https://lttng.org/files/lttng-modules/lttng-modules-2.13.0-rc3.tar.bz2

GPG signatures:
https://lttng.org/files/lttng-tools/lttng-tools-2.13.0-rc3.tar.bz2.asc
https://lttng.org/files/lttng-ust/lttng-ust-2.13.0-rc3.tar.bz2.asc
https://lttng.org/files/lttng-modules/lttng-modules-2.13.0-rc3.tar.bz2.asc
