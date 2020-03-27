Return-Path: <SRS0=ls0D=5M=vger.kernel.org=linux-trace-users-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8ABDCC43331
	for <linux-trace-users@archiver.kernel.org>; Fri, 27 Mar 2020 21:19:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5AC94206F1
	for <linux-trace-users@archiver.kernel.org>; Fri, 27 Mar 2020 21:19:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727505AbgC0VTn (ORCPT
        <rfc822;linux-trace-users@archiver.kernel.org>);
        Fri, 27 Mar 2020 17:19:43 -0400
Received: from mail-qv1-f68.google.com ([209.85.219.68]:46822 "EHLO
        mail-qv1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727444AbgC0VTm (ORCPT
        <rfc822;linux-trace-users@vger.kernel.org>);
        Fri, 27 Mar 2020 17:19:42 -0400
Received: by mail-qv1-f68.google.com with SMTP id m2so5658926qvu.13
        for <linux-trace-users@vger.kernel.org>; Fri, 27 Mar 2020 14:19:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:content-transfer-encoding;
        bh=l70WF0DuP09hHD7wII4OBF3saI9QGwlfP/kORlWshvI=;
        b=B7k4bl5WhFaS+0oIHZaejgBpgNYGgpct8kUFwKlAaq4uSj4DAbGKs52aIViaERX91Z
         UJZPcQOyBurpMIhpfdwZzUHtMOAUaYA4x9FeM62HlDTKhwefx+ySF1IEI4JYsqRa7iS6
         KViuP0rLzcsB0kFh2As0RuQ8Na2v58bkVgp9aLjC4yox5Ab4AfZ7tjO26A/4vXjlxluz
         3O147twPt55E5RkONlW+lMrI7RwAzvXzGjdJ3KYstAUmyDJOV4KONOmAa9gq69P12bZi
         ECqhKIR/6IH+23l4W8RD6rXyhiklu+dvdxbOKuDEcOavsNTEFRP0aOQwlaPtO0QP0yOs
         yIYg==
X-Gm-Message-State: ANhLgQ3elY6XLYizNpJBq+4tlS9gK+tv1hwdp4OpdYCYJhYtoGRKJfsk
        ubX2+3s4tYawTWKVt8Bgir4x/RM0
X-Google-Smtp-Source: ADFU+vuL/oyk72B/H1JDwmGF59ndG2g7JGBcz7sFw9ncbdAtkxch9jhRVzmVXo/U89tgr7fYpBYySw==
X-Received: by 2002:a0c:f7d1:: with SMTP id f17mr1267975qvo.24.1585343981175;
        Fri, 27 Mar 2020 14:19:41 -0700 (PDT)
Received: from gmail.com (192-222-251-19.qc.cable.ebox.net. [192.222.251.19])
        by smtp.gmail.com with ESMTPSA id b145sm4590684qkg.52.2020.03.27.14.19.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2020 14:19:39 -0700 (PDT)
Date:   Fri, 27 Mar 2020 17:19:36 -0400
From:   =?iso-8859-1?Q?J=E9r=E9mie?= Galarneau 
        <jeremie.galarneau@efficios.com>
To:     lttng-dev@lists.lttng.org
Cc:     diamon-discuss@lists.linuxfoundation.org,
        linux-trace-users@vger.kernel.org
Subject: [RELEASE] LTTng 2.12-rc3 - (Ta) Meilleure
Message-ID: <20200327211936.GA278029@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Sender: linux-trace-users-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-trace-users.vger.kernel.org>
X-Mailing-List: linux-trace-users@vger.kernel.org

Hi everyone,

Today marks the release of the third LTTng 2.12 - (Ta) Meilleure
release candidate.

The second release candidate was skipped as the configure script
was garbled by my release script. I unfortunately noticed this
after having pushed the tag... Mea culpa!

Have a look at the first release candidate's release notes for an
overview of the features introduced in LTTng 2.12.

https://github.com/lttng/lttng-tools/releases/tag/v2.12.0-rc1

This release is named after "Ta Meilleure", a Northeast IPA beer
brewed by Lagabière. Translating to "Your best one", this beer gives
out strong aromas of passion fruit, lemon, and peaches. Tastewise,
expect a lot of fruit, a creamy texture, and a smooth lingering hop
bitterness.

Of note, the tracker API was changed and the lttng-track(1) and
lttng-untrack(1) man pages were updated to clarify the usage of the
new uid/gid tracking feature.

We have also integrated a number of bug fixes which made their way to
the master branch as we continue to work on the LTTng 2.13 release.

Be safe!

2020-03-27 lttng-tools 2.12.0-rc3 (International Stay at Home Month)
	* Fix: remove duplicated AC_INIT directive

2020-03-27 lttng-tools 2.12.0-rc2 (International Stay at Home Month)
	* Fix: sessiond: NULL pointer dereference after NULL check
	* Fix: sessiond: missing goto in error handler
	* Fix: sessiond: user/group name can be leaked on malformed command
	* configure: add -Wmissing-declarations, -Wmissing-prototypes, and more
	* Fix: sessiond: make the --without-lttng-ust version of launch_application_notification_thread static
	* Fix: tests: include callsites.h from callsites.c
	* Fix: relayd: cast idigit argument to unsigned char
	* Fix: tests: make some functions static
	* Fix: tests: add `void` parameter to functions that take no parameters
	* Fix: common: make lttng_trace_chunk_remove_subdirectory_recursive static
	* Fix: common: add `void` parameter to log_add_time declaration
	* CONTRIBUTING.md: harmonize list style with the rest of the docs
	* CONTRIBUTING.md: clarify the guidelines for commit messages
	* Fix: lttng-list: don't warn when the kernel domain has no channels
	* Refactor: lttng-ctl: follow terminology of the tracker documentation
	* lttng: list: replace domain headers with the official names
	* lttng: list: print `per-user` and `per-process` buffer types
	* Docs: overhaul of lttng-track(1) and lttng-untrack(1)
	* Fix: MI: bump MI schema version to 4.0 in mi-lttng.c
	* Fix: sessiond: occasional badfd error on repeated SIGTERM
	* Fix: lttng: incorrect domain list printed when no domain is provided
	* Fix all -Wdiscarded-qualifiers warning instances
	* Remove part of last name to fit in a 80 character line
	* Fix: Tests: trace path wildcards not expanded
	* Fix: Tests: `gen-ust-events` doesn't error out on invalid option
	* Fix: Tests: utils.sh: merge `validate_{directory,folder_is}_empty` functions
	* Fix: Tests: undefined `NR_USEC_WAIT` bash variable
	* directory-handle: print `errno` reason on `unlinkat()` error
	* Fix: lttng-ctl: _handle can be NULL
	* Fix: sessiond: domain subdirectory not deleted on empty clear
	* Ignore -Wincomplete-setjmp-declaration warnings
	* tests: put -no-pie in LDFLAGS instead of CFLAGS
	* Silence `POSIX Yacc` warnings
	* Fix -Wmissing-declarations warnings in filter-parser.y
	* Include cmd-2-2.h in cmd-2-1.h
	* Make create_file function static in gen-ust-tracef.c
	* Make remove_file_from_hierarchy function static in test_directory_handle.c
	* Make fd_count function static in test_fd_tracker.c
	* Add declarations for exported functions in health_exit.c
	* Add declarations for exported functions in health_fail.c
	* Make functions in live_test.c static
	* Add declarations for exported functions in consumer_testpoints.c
	* Make parse_arguments static in base_client.c
	* Fix all -Wmissing-declarations warning instances
	* Fix: fd-tracker: mark symbols as hidden
	* Fix: liblttng-ctl: hide new tracker config symbols
	* configure: add --enable-Werror
	* configure: use AX_APPEND_COMPILE_FLAGS to detect supported warning flags
	* Tests: notification.c: remove extra space
	* Tests: remove unused libhealthexit code
	* Fix: remove broken health monitoring test `test_thread_exit`
	* Fix: directory-handle: use of free'd handle on fstat() error
	* Fix: relayd: use of relay_session ref count before initialization
	* Fix: relayd: unchecked return value when opening relay socket
	* tests: append to AM_CFLAGS instead of overriding it
	* Tests: gen-ust-nevents: use options instead of arguments
	* Tests: Cleanup: test_exclusion: more detailed output
	* Fix: Tests: `test_exclusion` passing for the wrong reason
	* Fix: trace-chunk: useless assignment to 'ret'
	* Fix: lttng: track-untrack: error assigned to wrong variable
	* Fix: relayd: live: unchecked poll set creation return value
	* Fix: relayd: live: unchecked return value when opening relay socket
	* Fix: relayd: unchecked poll set creation return value
	* Fix: lttng: uninitialized pointer free'd when no sessiond is present
	* Fix: tracker: inclusion of internal header in public header
	* Tests: Fix: `wait_on_file()` returns too early
	* Fix: Tests: utils.sh: fix unbound variable
	* Tests: Fix typo: registerd -> registered
	* Tests: Cleanup: remove unused bash variable
	* Typo: 'toogle' -> 'toggle'
	* Fix: lttng-sessiond: control reaches end of non-void function warning
	* Fix: possible null dereference
	* Fix: string might be uninitialized
	* Fix: force the use of our _FORTIFY_SOURCE definition

Links
---

Project website: https://lttng.org

Download links:
https://lttng.org/files/lttng-tools/lttng-tools-2.12.0-rc3.tar.bz2
https://lttng.org/files/lttng-ust/lttng-ust-2.12.0-rc3.tar.bz2
https://lttng.org/files/lttng-modules/lttng-modules-2.12.0-rc3.tar.bz2

GPG signatures:
https://lttng.org/files/lttng-tools/lttng-tools-2.12.0-rc3.tar.bz2.asc
https://lttng.org/files/lttng-ust/lttng-ust-2.12.0-rc3.tar.bz2.asc
https://lttng.org/files/lttng-modules/lttng-modules-2.12.0-rc3.tar.bz2.asc
