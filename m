Return-Path: <linux-trace-users-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54126C433F5
	for <linux-trace-users@archiver.kernel.org>; Wed, 13 Apr 2022 20:42:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237554AbiDMUo2 (ORCPT
        <rfc822;linux-trace-users@archiver.kernel.org>);
        Wed, 13 Apr 2022 16:44:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58130 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232789AbiDMUo1 (ORCPT
        <rfc822;linux-trace-users@vger.kernel.org>);
        Wed, 13 Apr 2022 16:44:27 -0400
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E9FB246645
        for <linux-trace-users@vger.kernel.org>; Wed, 13 Apr 2022 13:42:04 -0700 (PDT)
Received: by mail-qt1-f181.google.com with SMTP id z16so2252575qtq.6
        for <linux-trace-users@vger.kernel.org>; Wed, 13 Apr 2022 13:42:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:content-transfer-encoding;
        bh=BJxa92HvKHPb8ETwFORtqSnwEirugxeKIDKbbsKFKvk=;
        b=2/KdJcJmc+hQQP4moBgz3Af6odXixqFfO3P6xOtgtT8CqwuYHpkW+O6WETMCyV9n3M
         KQTcpFlbTGh761u7UEM+Mp0ngYiEveZ8FLXaAQOs8im0i8CifuqytUdvFGhz0Q/TJmna
         dQrHXu7cyxfCucdQ82Ihwur6ezbOVj+stcs0JzRuPNVQvOLZ8+zBCq29nFpPwZd8pp/R
         HSFoPzxeqq3HQvkHwnnzmv/tIkFCldtec5bgdMncxCSiLMvHv6kmbvw9KgB4hVnLDuVB
         A60ZqiRN3odvjlqI/cMrpooMxVciua9seBj2/6Xmbbe3ZH1Ht/+SAqM0iRyE6asQwd4L
         /F0g==
X-Gm-Message-State: AOAM533Vqoskp77jfso4Z/3u0UIal5oy6j0sKOHz5XNMNjKCZtPAt+Q1
        XYLh41SOVuN4+ygTIQNXRvo=
X-Google-Smtp-Source: ABdhPJxV+vndoKvSeAvxg7YMtMA8E4zjVbjUC76uURsAqlB6VN6ZvE0hwW8SGzjjo2KQegoGEYAXvw==
X-Received: by 2002:ac8:5b86:0:b0:2e2:72c:9e06 with SMTP id a6-20020ac85b86000000b002e2072c9e06mr8565168qta.113.1649882523942;
        Wed, 13 Apr 2022 13:42:03 -0700 (PDT)
Received: from gmail.com (192-222-180-24.qc.cable.ebox.net. [192.222.180.24])
        by smtp.gmail.com with ESMTPSA id x20-20020a05620a12b400b0069bf14f11d9sm9143126qki.134.2022.04.13.13.42.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Apr 2022 13:42:03 -0700 (PDT)
Date:   Wed, 13 Apr 2022 16:42:01 -0400
From:   =?iso-8859-1?Q?J=E9r=E9mie?= Galarneau 
        <jeremie.galarneau@efficios.com>
To:     lttng-dev@lists.lttng.org
Cc:     linux-trace-users <linux-trace-users@vger.kernel.org>,
        diamon-discuss <diamon-discuss@lists.linuxfoundation.org>
Subject: [RELEASE] LTTng-tools =?iso-8859-1?B?Mi4x?=
 =?iso-8859-1?Q?3=2E7_-_Nordicit=E9?=
Message-ID: <Ylc1mZ6XoPvmFdwo@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-trace-users.vger.kernel.org>
X-Mailing-List: linux-trace-users@vger.kernel.org

Hi all,

We have just released the seventh bug-fix release of LTTng-tools 2.13 -
Nordicité. This release addresses a number of issues listed below.

2022-04-13 lttng-tools 2.13.7 (International Day of Pink)
	* Fix: sessiond: assert on empty payload when handling client out event
	* Fix: Revert of 814b4934e2604a419bcb8eec57c0450dbb47e2c3
	* Fix: sessiond: inverted condition checking for empty hash table
	* Fix: notification: kernel: consumption of event notification stalls
	* Fix: notification: assert on len > 0 for dropped notification message
	* Fix: example: print_notification is called on status all returned status
	* Fix: sessiond: assertion hit in ltt_sessions_ht_empty
	* Fix: tests: missing _GNU_SOURCE for F_GETPIPE_SZ
	* Fix: compat: 'LTTNG_UST_ABI_PROCNAME_LEN' is undeclared
	* Fix: sessiond: cmd_enable_channel: negative error code used

As always, please report any issue you may encounter to bugs.lttng.org
or on this mailing list.

Project website: https://lttng.org

Download link:
https://lttng.org/files/lttng-tools/lttng-tools-2.13.7.tar.bz2

GPG signature:
https://lttng.org/files/lttng-tools/lttng-tools-2.13.7.tar.bz2.asc
