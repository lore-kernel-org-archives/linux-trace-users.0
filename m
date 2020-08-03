Return-Path: <SRS0=I5B7=BN=vger.kernel.org=linux-trace-users-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C53EC433E0
	for <linux-trace-users@archiver.kernel.org>; Mon,  3 Aug 2020 22:36:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B7CE22068F
	for <linux-trace-users@archiver.kernel.org>; Mon,  3 Aug 2020 22:36:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726948AbgHCWgX (ORCPT
        <rfc822;linux-trace-users@archiver.kernel.org>);
        Mon, 3 Aug 2020 18:36:23 -0400
Received: from mail-qv1-f45.google.com ([209.85.219.45]:45579 "EHLO
        mail-qv1-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726276AbgHCWgX (ORCPT
        <rfc822;linux-trace-users@vger.kernel.org>);
        Mon, 3 Aug 2020 18:36:23 -0400
Received: by mail-qv1-f45.google.com with SMTP id w2so6051932qvh.12
        for <linux-trace-users@vger.kernel.org>; Mon, 03 Aug 2020 15:36:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=Z7B91a0ismdHeVXkGUzfMhxmNZTHKKxA3STkVXpRr0o=;
        b=gw9eTNbV6qoXvF0fhTdpLkcVcFJZidsyCoMGcahNfrU9BGOGq6MyA+9w68RmaJeGGC
         BEQWuMbWkkwNSwQKL55CxdeoHhxdH1VGHxc+UmhoLzgy5j9XBYLh6mJvKd54PFdwkbjW
         YPOx3Jd+rfFdUfuxKKZ0XpGY+URmd03Pz/kZEQQ2YlG22XJIX4u7kdE8Y7i5XP4G/hac
         ovdV9qEA9RyPwmTfvG55vwJ/hE8L13iBA3wG23WSXi0nYzUTthjSy8UaT5Dxw3W4tNjz
         0tistZSGpsk6rrK3mrW9TxBkczyYJAyRQrRQPs229A/pXRHN52idLxguWVkngrHHXzvx
         BHBA==
X-Gm-Message-State: AOAM530uMe5SN5DIRdg6qbkAgE4dOWBQElBCayCRuwKptvJNX8ywpEXD
        4T2eSyqYY/Wyx92nLbrBeQc=
X-Google-Smtp-Source: ABdhPJzVioUi/eyrWNO4PClKDLDpSGGBs4Ne1AcNWAkvN0JH2QG3czZfHuOz34h3E8p6WHlIzhI2Aw==
X-Received: by 2002:a0c:a81a:: with SMTP id w26mr19419406qva.52.1596494181773;
        Mon, 03 Aug 2020 15:36:21 -0700 (PDT)
Received: from gmail.com (192-222-251-19.qc.cable.ebox.net. [192.222.251.19])
        by smtp.gmail.com with ESMTPSA id r18sm10684416qtc.90.2020.08.03.15.36.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2020 15:36:21 -0700 (PDT)
Date:   Mon, 3 Aug 2020 18:36:19 -0400
From:   =?iso-8859-1?Q?J=E9r=E9mie?= Galarneau 
        <jeremie.galarneau@efficios.com>
To:     lttng-dev@lists.lttng.org
Cc:     diamon-discuss@lists.linuxfoundation.org,
        linux-trace-users@vger.kernel.org
Subject: [RELEASE] LTTng 2.12.2 - (Ta) Meilleure
Message-ID: <20200803223619.GB2165704@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-trace-users-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-trace-users.vger.kernel.org>
X-Mailing-List: linux-trace-users@vger.kernel.org

Hi all,

The second bug-fix release of LTTng-tools 2.12 - (Ta) Meilleure has
just been released. This release addresses a number of issues listed
below.

2020-08-03 lttng-tools 2.12.2 (National Watermelon Day)
	* Tests: rework tracefile_count test to meet the tracefile count limit
	* Fix: extraneous empty/inactive flush on rotation out of a trace chunk
	* Fix: relayd: double unlock on viewer stream creation error
	* Fix: relayd: live connection fails to open file during clear
	* Fix: relayd: wrong stream type used in DBG statement
	* Fix: lttng: leak of userspace probe path on listing
	* Fix: uprobe: missing error code on allocation failure
	* Fix: sessiond: don't negate error code on list error
	* Fix: send/received actual size is overwritten by 'expected' size
	* Fix: partial recv lead to client disconnect
	* tests: return the proper TAP exit code
	* Tests: live/test_{lttng_,}kernel: use lttng_test_filter_event instead of sched_switch
	* Fix: consumer: Move sanity check within `consumer_subbuffer` functions
	* Fix: sessiond: wrong variable checked for error code
	* Fix: consumerd: double unlock on rotate channel error path
	* Fix: consumerd: packet sent before channel rotation
	* Fix: relayd: wrong specifier used in DBG format string
	* Tests: add a "new metadata after clear" test
	* Fix: relayd: send_viewer_streams sends stack data in padding
	* Fix: stream intersection fails on snapshot of cleared session
	* Fix: relayd: viewer metadata is not rotated after a session clear
	* Fix: post-clear trace chunk has a late beginning packet
	* Fix: kconsumer: missing wait for metadata thread in do_sync_metadata
	* Fix: tests: interrupting get_next_notification causes test to fail
	* Fix: consumer.c: wrong order of parameter in `DBG()` statement
	* Fix: consumer: dangling chunk on buffer allocation failure
	* Fix: consumerd: uninitialized written_bytes on no-data sleep
	* Build fix: consumerd misnamed label
	* consumerd: on_sleep not called on stream when no data is available
	* Fix: invalid discarded events on start/stop without event production
	* tests: truncate metadata file for regenerate metadata test
	* Fix: consumerd: user space metadata not regenerated
	* tests: gen-ust-events-ns/tp.h: Fix build with musl libc
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
	* Fix: liblttng-ctl: leak of tracker handle in lttng_[un]track_pid
	* Fix: common: fs_handle_seek returns negative value on success
	* Fix: common: abort on rotation after time manipulation
	* Tests: test_exclusion: exclusion after tracing active
	* Tests: `gen-ust-nevents`: add syncpoints
	* Tests: accept built-in kernel modules

As always, please report any issue you may encounter to bugs.lttng.org
or on this mailing list.

Project website: https://lttng.org

Download link:
https://lttng.org/files/lttng-tools/lttng-tools-2.12.2.tar.bz2

GPG signature:
https://lttng.org/files/lttng-tools/lttng-tools-2.12.2.tar.bz2.asc
