Return-Path: <linux-trace-users-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA78BC6FD1C
	for <linux-trace-users@archiver.kernel.org>; Sun, 12 Mar 2023 07:07:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229633AbjCLHHG (ORCPT
        <rfc822;linux-trace-users@archiver.kernel.org>);
        Sun, 12 Mar 2023 03:07:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52274 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229437AbjCLHHF (ORCPT
        <rfc822;linux-trace-users@vger.kernel.org>);
        Sun, 12 Mar 2023 03:07:05 -0400
Received: from mail2-relais-roc.national.inria.fr (mail2-relais-roc.national.inria.fr [192.134.164.83])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A654434019
        for <linux-trace-users@vger.kernel.org>; Sat, 11 Mar 2023 23:07:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:subject:message-id:mime-version;
  bh=yZ33DLmjx+2dAw330e0JR1EDq6eFj1lAWH2Lo0J0Q0c=;
  b=WstmNDe0SVDyiuBBCNSbSywNL6D5FPVPvsA2bycTEfn/WlluHkfDT0Hh
   sttAHxR63HKbDfRRlL/8rvNulVIPbIerhuAWvkNySf1L/N1Df1VWLVmL4
   gSPp9uXVX2SBPAMp3IcRMnxf5ZoCmF74oGmAKI06x/KacXJaCU2+7Ufyb
   E=;
Authentication-Results: mail2-relais-roc.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="5.98,254,1673910000"; 
   d="scan'208";a="96684661"
Received: from 231.85.89.92.rev.sfr.net (HELO hadrien) ([92.89.85.231])
  by mail2-relais-roc.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2023 08:07:00 +0100
Date:   Sun, 12 Mar 2023 08:07:01 +0100 (CET)
From:   Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To:     linux-trace-users@vger.kernel.org
Subject: CSV output
Message-ID: <alpine.DEB.2.22.394.2303120805430.2865@hadrien>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-trace-users.vger.kernel.org>
X-Mailing-List: linux-trace-users@vger.kernel.org

Would it be possible with libtraceevent to get some kind of CSV output?
Ie something that is very easy or some other tool to parse, without having
to spend a lot of time removing spaces?

thanks,
julia
