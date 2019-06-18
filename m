Return-Path: <SRS0=oy1S=UR=vger.kernel.org=linux-trace-users-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC99AC31E51
	for <linux-trace-users@archiver.kernel.org>; Tue, 18 Jun 2019 11:40:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A66762082C
	for <linux-trace-users@archiver.kernel.org>; Tue, 18 Jun 2019 11:40:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tGUAHGBN"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729608AbfFRLk1 (ORCPT
        <rfc822;linux-trace-users@archiver.kernel.org>);
        Tue, 18 Jun 2019 07:40:27 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:53202 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729110AbfFRLk1 (ORCPT
        <rfc822;linux-trace-users@vger.kernel.org>);
        Tue, 18 Jun 2019 07:40:27 -0400
Received: by mail-wm1-f67.google.com with SMTP id s3so2880689wms.2
        for <linux-trace-users@vger.kernel.org>; Tue, 18 Jun 2019 04:40:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=pTxs+LOmLgB7Id7bP6QG9mAXbOPh8bsbv1HGtX6c9yM=;
        b=tGUAHGBNHCD6usxNbDbnOgxfuWZPesvw8yfh0SHiiBYcpQxHISW92rJi2Ee/6CAnWJ
         XEqKkM0TKfIl1fezgmT//vZ7tpxbTs856+0thyt1CE6+UWaLPJm0SCTQi7nqg6FtZeeu
         ZOi2GY2yB/dIls7OXN4LEf/U09pGff6z5CUK5XXbNBnvu7z3YC5spLxl8spM+nAyvD/6
         krU8GoP3bvZyXx0ZHN86ERvaKBvu/3v0+DaCchAYagovZG7BzFk0NU6D16vQQNkOXp0Z
         utEJXSoeQ4jXPDdf+44YKU7D9vDfUb+PetjE35iVw6/tyni75tH+pVP5rEilq5JLhAA2
         NGBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=pTxs+LOmLgB7Id7bP6QG9mAXbOPh8bsbv1HGtX6c9yM=;
        b=agKUDn+Cl6cL3aRqdSj6vS0pOFEXUOaIiIBYVj/a5t8ZqG05zCVuxS/wFTc0VPE3ff
         xZ24HTXpcLNgkm81wehX7LmNxG6/f/m0RXNh8Am1n2oy/6VwNzRI3O3uke18LS+qNGYx
         HVlOSDTK4sASBQ7lCX3/f646nJ2INBdxc5IdRaDKC3cKTD7DXIujOCUBEsIrV4/P5yrA
         LLo/Rq7kxjLqAXjze6XRZuYe4+nc0unsRkuc59xJpYBqMERMXbbfLyOYz1ZkpCPT0kvn
         d/rSVI6Q2kfW5KxbdTC05ZQY56FLr8O3v4BHO+uQN0AdsU7c5o2HMiDAxuGwNQnFKrcZ
         eBow==
X-Gm-Message-State: APjAAAVgXeTVjaUVFsGYqZt4QxMtyO1S8NxD+IHC34oe+TaViQdeR8c0
        gKjs6jQTWTRtfpZhxAVLbbleECkAmHfpln5FHDOy5w==
X-Google-Smtp-Source: APXvYqxxS9H/pvwfByWsnzIsr+y/hciOn32y57FrOr4702/tBe6vwgKTZaGtP7qj32/44H2t83I2bfbER/XPUU8qOwU=
X-Received: by 2002:a05:600c:c4:: with SMTP id u4mr3281329wmm.96.1560858025086;
 Tue, 18 Jun 2019 04:40:25 -0700 (PDT)
MIME-Version: 1.0
From:   Naruto Nguyen <narutonguyen2018@gmail.com>
Date:   Tue, 18 Jun 2019 18:40:13 +0700
Message-ID: <CANpxKHEMjWRSbV8fq_iSR5XAzy7oMuht0xfRTeLtBxajxtW2eg@mail.gmail.com>
Subject: How to find out which process cause a strange increasing cpu load on
 a certain core?
To:     linux-trace-users@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-trace-users-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-trace-users.vger.kernel.org>
X-Mailing-List: linux-trace-users@vger.kernel.org

Hello everyone,

I have a kvm hypervisor and setup some VMs running OpenSUSE kernel
4.0. After some reboot, I saw that sometime there is a VM that a
certain core has higher %usr and %sys than other cores. The system is
in ide state. I have some applications running on this VM, but there
is no issue in other VMs.

If I enable ftrace in kernel or load any debug jprobe, the load is
back to normal. The pidstat command output does not show the high load
on one core like the "top" command. Could you please let me know if it
is the problem of "top' report higher usage? Any commands that can
help to troubleshoot this issue? I tried "perf" but most of the time
the perf output does not show any function that cause the increase as
well? Not sure, if the malfunction of top or anything else can add
more work load?

Thanks,
Brs,
Naruto
