Return-Path: <SRS0=I5B7=BN=vger.kernel.org=linux-trace-users-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C488FC433E0
	for <linux-trace-users@archiver.kernel.org>; Mon,  3 Aug 2020 22:34:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E1A80208C7
	for <linux-trace-users@archiver.kernel.org>; Mon,  3 Aug 2020 22:34:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726948AbgHCWe4 (ORCPT
        <rfc822;linux-trace-users@archiver.kernel.org>);
        Mon, 3 Aug 2020 18:34:56 -0400
Received: from mail-qt1-f176.google.com ([209.85.160.176]:40800 "EHLO
        mail-qt1-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726276AbgHCWe4 (ORCPT
        <rfc822;linux-trace-users@vger.kernel.org>);
        Mon, 3 Aug 2020 18:34:56 -0400
Received: by mail-qt1-f176.google.com with SMTP id s16so29521058qtn.7
        for <linux-trace-users@vger.kernel.org>; Mon, 03 Aug 2020 15:34:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=XXXqlxq8vYx19nlPfxnkR6X3lNfVgSLDoF5vGR+u0Wc=;
        b=rWaX5DpEoJxEfV/2AMeS2cRnllpudUt9tAdLmJUtTR87jch9o5ZhArAHmxeMRTSH0O
         FvRXGCq5p/eTAgXWRV84gHlWffgeXktC5REpHB4GSAWh4QAXAMJwsCt8449hCJvkX9mL
         4s/99FueFd4bdLe8ZpY8YV8eK2kKIw6UMttYDcHxOAsT21RACZZTdqwN2UsU08a4L4Ox
         R4VMXYzCvinRzOmMR2H/oCBL4RN0UPj1oYKd3F/Q6OLQwCiJAjKc+8EzsvQrtRuPbHsU
         VKC/opFNMA2F4RqSjYayK9r62NlKpV0ojABSRmNDOJpkit/36JF9+BQ58Rir2ohKa+Ex
         i75A==
X-Gm-Message-State: AOAM533lHZm0SdaKQdvq+taZjtGRdCYP/Wj/B+trb5yRwIwd2PHv3Q0L
        +g4g0uILNAsVwBSfl8/Int4=
X-Google-Smtp-Source: ABdhPJzsxAqefqEhxum08zlaOI2OhW6qitcoRW/EC+Hr6NJXHIcbg99hZB0Hq/o5kltfvH5QXyIo3Q==
X-Received: by 2002:ac8:6a06:: with SMTP id t6mr18699196qtr.206.1596494094791;
        Mon, 03 Aug 2020 15:34:54 -0700 (PDT)
Received: from gmail.com (192-222-251-19.qc.cable.ebox.net. [192.222.251.19])
        by smtp.gmail.com with ESMTPSA id l31sm24639967qtc.33.2020.08.03.15.34.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2020 15:34:53 -0700 (PDT)
Date:   Mon, 3 Aug 2020 18:34:51 -0400
From:   =?iso-8859-1?Q?J=E9r=E9mie?= Galarneau 
        <jeremie.galarneau@efficios.com>
To:     lttng-dev@lists.lttng.org
Cc:     diamon-discuss@lists.linuxfoundation.org,
        linux-trace-users@vger.kernel.org
Subject: [RELEASE] LTTng-tools 2.11.5 - Lafontaine
Message-ID: <20200803223451.GA2165704@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-trace-users-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-trace-users.vger.kernel.org>
X-Mailing-List: linux-trace-users@vger.kernel.org

Hi all,

The fifth bug-fix release of LTTng-tools 2.11 - Lafontaine has just
been released. This release addresses a number of issues listed below.

2020-08-03 lttng-tools 2.11.5 (National Watermelon Day)
	* Fix: lttng: leak of userspace probe path on listing
	* Fix: uprobe: missing error code on allocation failure
	* Fix: sessiond: don't negate error code on list error
	* Fix: send/received actual size is overwritten by 'expected' size
	* Fix: partial recv lead to client disconnect
	* tests: return the proper TAP exit code
	* Tests: live/test_{lttng_,}kernel: use lttng_test_filter_event instead of sched_switch
	* Fix: consumer: Move sanity check within `consumer_subbuffer` functions
	* Cleanup: typo in DBG() statements
	* Fix: relayd: send_viewer_streams sends stack data in padding
	* Fix: kconsumer: missing wait for metadata thread in do_sync_metadata
	* Fix: tests: interrupting get_next_notification causes test to fail
	* Fix: consumer.c: wrong order of parameter in `DBG()` statement
	* Fix: kernel metadata file outside of kernel/ directory
	* Fix: consumer: dangling chunk on buffer allocation failure
	* Fix: consumerd: uninitialized written_bytes on no-data sleep
	* Build fix: consumerd misnamed label
	* consumerd: on_sleep not called on stream when no data is available
	* Fix: invalid discarded events on start/stop without event production
	* tests: truncate metadata file for regenerate metadata test
	* Fix: consumerd: user space metadata not regenerated
	* Fix: tests: output_dir contains the consumerd pipe
	* Fix: unix: don't PERROR on EAGAIN for non-blocking sockets
	* Fix: sessiond: sessiond and agent deadlock on destroy
	* Fix: incorrect specifier %lu used with size_t argument
	* Fix: consumerd: live client receives incomplete metadata
	* consumerd: refactor: split read_subbuf into sub-operations
	* consumerd: move rotation logic to domain-agnostic read path
	* sessiond: enforce mmap output type for kernel metadata channel
	* consumerd: tag metadata channel as being part of a live session
	* consumerd: pass channel instance to stream creation function
	* consumerd: cleanup: use buffer view interface for mmap read subbuf
	* consumerd: move address computation from on_read_subbuffer_mmap
	* consumerd: refactor: combine duplicated check_*_functions
	* kerner-ctl: add RING_RING_BUFFER_GET_NEXT_SUBBUF_METADATA_CHECK
	* Add lttng_dynamic_buffer_append_view util
	* Fix: lttng: Destroying session message repeated during destruction

As always, please report any issue you may encounter to bugs.lttng.org
or on this mailing list.

Project website: https://lttng.org

Download link:
https://lttng.org/files/lttng-tools/lttng-tools-2.11.5.tar.bz2

GPG signature:
https://lttng.org/files/lttng-tools/lttng-tools-2.11.5.tar.bz2.asc
