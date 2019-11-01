Return-Path: <SRS0=H37N=YZ=vger.kernel.org=linux-trace-users-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70948CA9ECF
	for <linux-trace-users@archiver.kernel.org>; Fri,  1 Nov 2019 22:50:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3AFE921855
	for <linux-trace-users@archiver.kernel.org>; Fri,  1 Nov 2019 22:50:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=efficios.com header.i=@efficios.com header.b="BQxaxRiN"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727355AbfKAWuY (ORCPT
        <rfc822;linux-trace-users@archiver.kernel.org>);
        Fri, 1 Nov 2019 18:50:24 -0400
Received: from mail.efficios.com ([167.114.142.138]:59296 "EHLO
        mail.efficios.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727316AbfKAWuY (ORCPT
        <rfc822;linux-trace-users@vger.kernel.org>);
        Fri, 1 Nov 2019 18:50:24 -0400
Received: from localhost (ip6-localhost [IPv6:::1])
        by mail.efficios.com (Postfix) with ESMTP id AD9893A378C
        for <linux-trace-users@vger.kernel.org>; Fri,  1 Nov 2019 18:50:22 -0400 (EDT)
Received: from mail.efficios.com ([IPv6:::1])
        by localhost (mail02.efficios.com [IPv6:::1]) (amavisd-new, port 10032)
        with ESMTP id GqELwfkQ8fTA for <linux-trace-users@vger.kernel.org>;
        Fri,  1 Nov 2019 18:50:22 -0400 (EDT)
Received: from localhost (ip6-localhost [IPv6:::1])
        by mail.efficios.com (Postfix) with ESMTP id ED9713A377E
        for <linux-trace-users@vger.kernel.org>; Fri,  1 Nov 2019 18:50:21 -0400 (EDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.efficios.com ED9713A377E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=efficios.com;
        s=default; t=1572648622;
        bh=l1mPwfX0F7Fcb0Pn8kSjYtFObrOOtnjppCsqY/t4cJ4=;
        h=MIME-Version:From:Date:Message-ID:To;
        b=BQxaxRiNeqfmLiII+7dV6xijbQ8p0xuHpfQD23p0DEUyAQINq/NCh2lesTjFvNKOn
         hoqg6/aSryYsuL+mcvpEaS1Y6BHEv38+KKgIkk/sWzSAphY6ZapRj62PXSt8mui4Ha
         bd4lK7OupvEv8r42NjQBEk9AzokZEDHJSRaI66F161HWV239s9QTU6/1A2cs8+7dEK
         rCM6AG8V32TC6RYSPwTZuzwG/k2LYhlw+/wlrX1ibgY1STkOgADK3DZmKG1kIsaSdy
         M3F1+1BuZ1W8mN61908Gia6bBdWndv43+2aXwDA+ojahnJX9CYKEtRWIXalJw/mFgW
         MruKvvM5tDPeQ==
X-Virus-Scanned: amavisd-new at efficios.com
Received: from mail.efficios.com ([IPv6:::1])
        by localhost (mail02.efficios.com [IPv6:::1]) (amavisd-new, port 10026)
        with ESMTP id 86OUaW_PL9Kj for <linux-trace-users@vger.kernel.org>;
        Fri,  1 Nov 2019 18:50:21 -0400 (EDT)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
        by mail.efficios.com (Postfix) with ESMTPSA id 9A5103A376B
        for <linux-trace-users@vger.kernel.org>; Fri,  1 Nov 2019 18:50:21 -0400 (EDT)
Received: by mail-lj1-f173.google.com with SMTP id 139so11785875ljf.1
        for <linux-trace-users@vger.kernel.org>; Fri, 01 Nov 2019 15:50:21 -0700 (PDT)
X-Gm-Message-State: APjAAAVi+YZ9qW0yNXf9ShINJuxMRI5fGqa7exZEyQm0NW9nr5+nsGW7
        CxHeb5+HhpoAuCYbw8Hv4u4SDaAHigHs1Bb37HU=
X-Google-Smtp-Source: APXvYqycYz34QSzOKVAJYd7CAMhZr84EWwek2s85HGr1aROIQV5Dj1dUePwImdjDUDVzzFB69m3V+QxLcEE/pNDiW6g=
X-Received: by 2002:a2e:8555:: with SMTP id u21mr9834632ljj.252.1572648620087;
 Fri, 01 Nov 2019 15:50:20 -0700 (PDT)
MIME-Version: 1.0
From:   =?UTF-8?Q?J=C3=A9r=C3=A9mie_Galarneau?= 
        <jeremie.galarneau@efficios.com>
Date:   Fri, 1 Nov 2019 18:49:43 -0400
X-Gmail-Original-Message-ID: <CA+jJMxvsE7rE3sVnHWkUkwqzfyw-Rwyg_97Ay4RxiUPmUoBCqg@mail.gmail.com>
Message-ID: <CA+jJMxvsE7rE3sVnHWkUkwqzfyw-Rwyg_97Ay4RxiUPmUoBCqg@mail.gmail.com>
Subject: [RELEASE] Babeltrace 2.0.0-rc2
To:     lttng-dev <lttng-dev@lists.lttng.org>,
        diamon-discuss@lists.linuxfoundation.org,
        linux-trace-users@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-trace-users-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-trace-users.vger.kernel.org>
X-Mailing-List: linux-trace-users@vger.kernel.org

Hi everyone!

Two weeks after having released [1] Babeltrace 2's first release
candidate, today we're releasing Babeltrace 2.0.0-rc2.

A prettified version of this announcement is available at:
https://diamon.org/babeltrace/docs/release-notes/babeltrace-2.0.0-rc2-relea=
se-notes.html

What's new since Babeltrace 2.0.0-rc1?
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

Improvements
------------
General:
    * Introduce `BT_ASSERT_DBG()` for assertions that must only be
      evaluated in debugging mode (when the `BABELTRACE_DEBUG_MODE`
      environment variable is set to `1` at configuration time).

      `BT_ASSERT()` assertions are now always evaluated, regardless of
      the debugging/production mode.

      This change's purpose is to keep as many slow-path assertions as
      possible to detect more Babeltrace 2 programming errors, even in
      production.

      See `98b15851`.

    * Remove ABI versioning in Babeltrace 2 shared object plugins as we
      don't need this property.

      See `7c0244d6`.

    * In libbabeltrace2's API:

      * Rename `BT_RANGE_SET_` prefixes to `BT_INTEGER_RANGE_SET_`.

        See `eb171ee9`.

      * Make `bt_version_get_major()`, `bt_version_get_minor()`, and
        `bt_version_get_patch()` functions return `unsigned int` instead
        of `int`.

        See `78deb913`.

      * Remove the `BT_GRAPH_RUN_STATUS_END` status code:
        `bt_graph_run()` now returns `BT_GRAPH_RUN_STATUS_OK` when all
        the graph's sink components are ended.

        See `9669d693`.

`ctf` plugin:
    Append error causes at more source locations.

    This means more precise error messages reported by the `babeltrace2`
    [2] CLI tool, for example.

    See `b7d2695a, `b30284d1, `2246e99da, and `1419db2bc.

`source.ctf.fs` component class:
    Return an error when failing to load or create an index for a
    trace.

    See `29a8227a`.

`filter.lttng-utils.debug-info` component class:
    Create stream classes and event classes which correspond to stream
    classes and event classes in incoming trace classes as soon as we
    encounter a new trace class, rather than as needed.

    See `db5d746d`.

Python bindings:
    In `bt2.Graph.add_component()`, validate that the `params` parameter
    is implicitly convertible to a `bt2.Mapvalue` object (`dict`, for
    example).

    See `401b7022`.

Bug fixes
---------
General:
    Fix many issues reported by static analysis tools (scan-build,
    Coverity [3], and compiler warnings).

`source.ctf.fs` component class:
    Fix an index handling bug which occured when multiple data stream
    files in a CTF trace belong to the same data stream.

    See `ce75de14`.

`source.ctf.lttng-live` component class:
    Fix a bug in which a disappearing LTTng live tracing session could
    lead to an assertion failure.

    See `ba90bce7`.

Python bindings:
    Fix an assertion failure which occurs when a trace or trace class
    destruction listener raises an exception.

    See `64961f8b`.

Upcoming
=3D=3D=3D=3D=3D=3D=3D=3D
We are still hard at work putting the finishing touches on our way to
the final 2.0.0 release.

We invite you to try this release candidate and report any problems you
may encounter to the `lttng-dev@lists.lttng.org` [4] mailing list or
through the Babeltrace bug tracker [5].

Documentation
-------------
We are currently documenting the entire Babeltrace 2 C API to make the
development of new component classes as easy as possible.

We'll also work on the Python bindings documentation.

The documentation of the API will be made available on the official
Babeltrace website [6].

Other tasks
-----------
* Improve test coverage.
* Improve resilience to corrupted/malformed CTF traces.
* Minor internal cleanups and bug fixes.

Important links
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Babeltrace 2.0.0-rc2 tarball:
    https://www.efficios.com/files/babeltrace/babeltrace-2.0.0-rc2.tar.bz2

Babeltrace website:
    https://diamon.org/babeltrace

Mailing list (for support and development):
    `lttng-dev@lists.lttng.org`

IRC channel:
    `#lttng` on `irc.oftc.net`

Git repository:
    https://bugs.lttng.org/projects/babeltrace

GitHub project:
    https://github.com/efficios/babeltrace

Continuous integration:
    https://ci.lttng.org/view/Babeltrace/

Code review:
    https://review.lttng.org/q/project:babeltrace

References
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
[1]: https://diamon.org/babeltrace/docs/release-notes/babeltrace-2.0.0-rc1-=
release-notes.html
[2]: https://diamon.org/babeltrace/docs/v2.0/man1/babeltrace2.1/
[3]: https://scan.coverity.com/projects/babeltrace
[4]: https://lists.lttng.org/cgi-bin/mailman/listinfo/lttng-dev
[5]: https://bugs.lttng.org/projects/babeltrace
[6]: https://diamon.org/babeltrace/

--=20
J=C3=A9r=C3=A9mie Galarneau
EfficiOS Inc.
http://www.efficios.com
