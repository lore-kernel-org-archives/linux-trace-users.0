Return-Path: <SRS0=v7Zq=5H=vger.kernel.org=linux-trace-users-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AF5CC4332B
	for <linux-trace-users@archiver.kernel.org>; Sun, 22 Mar 2020 14:06:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3534C20719
	for <linux-trace-users@archiver.kernel.org>; Sun, 22 Mar 2020 14:06:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pGQ9a6hY"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725881AbgCVOG0 (ORCPT
        <rfc822;linux-trace-users@archiver.kernel.org>);
        Sun, 22 Mar 2020 10:06:26 -0400
Received: from mail-pj1-f42.google.com ([209.85.216.42]:36494 "EHLO
        mail-pj1-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725785AbgCVOG0 (ORCPT
        <rfc822;linux-trace-users@vger.kernel.org>);
        Sun, 22 Mar 2020 10:06:26 -0400
Received: by mail-pj1-f42.google.com with SMTP id nu11so4804061pjb.1
        for <linux-trace-users@vger.kernel.org>; Sun, 22 Mar 2020 07:06:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:cc:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=AEpMjweFXmaol32xAKXL9Lku7uVlFDvgcCVpx14d7gE=;
        b=pGQ9a6hYtViWxw4dT+Gu0eLXB5B27dVSTn0h/Pp0BQ2kBz5qg4BVtU7qphg3dYKQAD
         ltThEt0f1B/VQLXQlqAM0ACtNGmQYvarKW4nrqPWlCwSTEYhnZh1oC7qU9Tp2Br17i6d
         uU+8jX+y+z672BCEJZo5MtLFO+27ddzrjS5g5MFJUDwIMRgCvbx5z7CJT/3uOax5Pd/u
         iIRpBBXkE0Uy4rbwseEaL+WBKBNvAm6THbN4d+9YZ182UKTiessFKI5o9bAb1Be02Y/N
         tD78R3r3m5r7t7+ND5s6byLNJphtvkspa6KF5fDdx8dgbyaomLH4IJ6CqQVkSiNA24fV
         9HNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:cc:from:subject:message-id:date:user-agent
         :mime-version:content-language:content-transfer-encoding;
        bh=AEpMjweFXmaol32xAKXL9Lku7uVlFDvgcCVpx14d7gE=;
        b=bgC1a5iM+mmGoS6O/7MedP2V6SuIK1AszcS8HwRFHbpbk+KpVyDdeZSrozWUg0CZFE
         Cw/mkvbGCaCUpsZgDlMK2xNA1sNABNxu23m9g/z9HcSEobvCipAbsdlPkItArgFBr8V/
         sal5saAJtsL7WlhX+sxTKVG1EbEu9kwr51g4nVg5pbZmZKSZ09XhpAJEBZY3igWKjbFS
         Jy5UWdYIlkW3vnFDPm9rcVup+KZwk5SF43ZI3/QS+bKttXkfMesMj8LMxWVshLApzPkW
         OEaLxHQpwpCo9pN6ZmGbYIseYYsLLSGI7C+9nC1ihcmLn6R2+VEV+QxoxRYkZCHrBxvs
         WCuw==
X-Gm-Message-State: ANhLgQ20BFyP58U3HxGKD99rxdZDvCatdow/u0NN49L5zbHJmyB1DbC3
        sZDLCTkLlDRCaTNVta8V8LA=
X-Google-Smtp-Source: ADFU+vsIMlKDsUibJBGfrxKY+NnsKz+KJAagibIwuJymV8O+QI6lw6OE52fM/2syiSGy3zMOORMVfA==
X-Received: by 2002:a17:902:7c0c:: with SMTP id x12mr14876358pll.196.1584885984106;
        Sun, 22 Mar 2020 07:06:24 -0700 (PDT)
Received: from [192.168.0.18] ([106.254.212.20])
        by smtp.gmail.com with ESMTPSA id ep7sm9553034pjb.24.2020.03.22.07.06.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Mar 2020 07:06:23 -0700 (PDT)
To:     linux-trace-users@vger.kernel.org
Cc:     Masami Hiramatsu <mhiramat@kernel.org>,
        "David S. Miller" <davem@davemloft.net>
From:   Taeung Song <treeze.taeung@gmail.com>
Subject: How to recheck 'maxactive' ?
Message-ID: <4762764a-6df7-bc93-ed60-e336146dce1f@gmail.com>
Date:   Sun, 22 Mar 2020 23:06:20 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-trace-users-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-trace-users.vger.kernel.org>
X-Mailing-List: linux-trace-users@vger.kernel.org

Hi,

After setting 'maxactive' for kretprobe,
how can I recheck the value of 'maxactive' ?
For example, in order to distinguish the difference
between two kretprobe events
(kmem_cache_alloc_node and kmem_cache_alloc_node10)

   $ cd /sys/kernel/debug/tracing
   $ echo 'r:kmem_cache_alloc_node kmem_cache_alloc_node' >> kprobe_events
   $ echo 'r10:kmem_cache_alloc_node10 kmem_cache_alloc_node' >> 
kprobe_events

   $ cat kprobe_events
   r:kprobes/kmem_cache_alloc_node kmem_cache_alloc_node
   r:kprobes/kmem_cache_alloc_node10 kmem_cache_alloc_node

Thanks,
Taeung
