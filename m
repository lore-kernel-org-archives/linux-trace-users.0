Return-Path: <SRS0=GCmP=3Z=vger.kernel.org=linux-trace-users-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=FSL_HELO_FAKE,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA38CC35247
	for <linux-trace-users@archiver.kernel.org>; Wed,  5 Feb 2020 19:38:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9D6C620730
	for <linux-trace-users@archiver.kernel.org>; Wed,  5 Feb 2020 19:38:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727309AbgBETi4 (ORCPT
        <rfc822;linux-trace-users@archiver.kernel.org>);
        Wed, 5 Feb 2020 14:38:56 -0500
Received: from mail-qk1-f180.google.com ([209.85.222.180]:42638 "EHLO
        mail-qk1-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727389AbgBETi4 (ORCPT
        <rfc822;linux-trace-users@vger.kernel.org>);
        Wed, 5 Feb 2020 14:38:56 -0500
Received: by mail-qk1-f180.google.com with SMTP id q15so3072970qke.9
        for <linux-trace-users@vger.kernel.org>; Wed, 05 Feb 2020 11:38:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:mime-version
         :content-disposition:content-transfer-encoding;
        bh=F5N6xstCxK59zE9Bup1NMyPjTwP2PlFDkHp5gQQiANY=;
        b=rKAMYzUGM2Lzj+j10NxQrQVj2yiS2vdP0Bqvwr7xEZEHPEUHm1dzxr1czUP693bR0j
         Nuq+bIRzzPbf0wWfZk4C5bvTIv30oBugHU5wrlCdqEsgzMbQsggsW4TbSMN3eh7353w6
         w2v3VEeKXFTkB1d8xg18Wd5BAYSmJOAFYaNDV1Xm5JeeYrFxmy4yNOc3ehJjpuXK/ocy
         44rKCJD+KjwH93bB2wuPSoiQGJxJuuNGnpmh0FR0Olk/xIWMKkxC6pSPdhaeCyxrZl7k
         D9OhWtQKyr8NdifCtKxtZAxgtZVYgOJtnf83Q+Sr3+aWMg6rh3VmhL3Q+ZB9ynbKW+Mu
         BecQ==
X-Gm-Message-State: APjAAAWp2iaUEkZLbE+sRv5WKps0XZCWSaOCEaJUuvMEPKVOW7PskkzT
        /vmn0iKo00uYd3A2bgMPzfXAmLkF
X-Google-Smtp-Source: APXvYqy7686fI5NUzJW00/OUnykATiLQtVGpDfmVtfwr7oRCsYopSpyxS1Umb9LpUBifLM811CY7dg==
X-Received: by 2002:a05:620a:10b3:: with SMTP id h19mr3483460qkk.149.1580931533207;
        Wed, 05 Feb 2020 11:38:53 -0800 (PST)
Received: from gmail.com (192-222-181-218.qc.cable.ebox.net. [192.222.181.218])
        by smtp.gmail.com with ESMTPSA id z5sm395058qts.64.2020.02.05.11.38.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2020 11:38:51 -0800 (PST)
Date:   Wed, 5 Feb 2020 14:38:49 -0500
From:   =?iso-8859-1?Q?J=E9r=E9mie?= Galarneau 
        <jeremie.galarneau@efficios.com>
To:     lttng-dev@lists.lttng.org,
        diamon-discuss@lists.linuxfoundation.org,
        linux-trace-users@vger.kernel.org
Subject: [RELEASE] LTTng 2.12-rc1 - (Ta) Meilleure
Message-ID: <20200205193849.GA6408@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Sender: linux-trace-users-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-trace-users.vger.kernel.org>
X-Mailing-List: linux-trace-users@vger.kernel.org

Hi everyone!

Today marks the release of the first LTTng 2.12 - (Ta) Meilleure
release candidate.

This release is named after "Ta Meilleure", a Northeast IPA beer
brewed by Lagabière. Translating to "Your best one", this beer gives
out strong aromas of passion fruit, lemon, and peaches. Tastewise,
expect a lot of fruit, a creamy texture, and a smooth lingering hop
bitterness.

The most notable features of this new release are:
  - session clearing,
  - uid and gid tracking,
  - file descriptor pooling (relay daemon),
  - per-session grouping (relay daemon),
  - working directory override (relay daemon),
  - new network reception entry/exit tracepoints,
  - statedump of interrupt threads,
  - statedump of x86 CPU topology,
  - new product UUID environment field.

Read on for a short description of each of these features and the
links to this release!

A prettified version of this announcement is available here:
https://github.com/lttng/lttng-tools/releases/tag/v2.12.0-rc1


Session clearing
---

You can use the new `lttng-clear` command to clear the contents of one
or more tracing sessions.

In essence, this new feature allows you to prune the content of
long-running sessions without destroying and reconfiguring them. This
is especially useful to clear a session's tracing data between
attempts to reproduce a problem.

Clearing a tracing session deletes the contents of the tracing buffers
and all local or streamed trace data on a remote peer. Note that an
lttng-relayd daemon can be configured to disallow clear operations
using the `LTTNG_RELAYD_DISALLOW_CLEAR` environment variable.

If a session is configured in snapshot mode, only the tracing buffers
are cleared.

If a session is configured in live mode, any attached client that is
lagging behind will finish the consumption of its current trace data
packets and jump forward in time to events generated after the
beginning of the clear command.

uid and gid tracking
---

The existing `lttng-track` command has been expanded to support uid
and gid tracking.

By default, a tracing session tracks all applications and users,
following LTTng's permission model.  However, this new options allows
you to restrict which users and groups are tracked by both the user
space and kernel tracers.

In previous versions of LTTng, it was effectively possible to filter
on the basis of uids and gids using the `--filter` mechanism. However,
this dedicated filtering mechanism is both more efficient in terms of
tracing overhead, but also prevents the creation of tracing buffers
for users and groups which are not tracked.

Overall, this results in far less memory consumption by the user space
tracer on systems which have multiple active users.

File descriptor pooling (relay daemon)
---

A number of users have reported having encountered file descriptor
exhaustion issues when using the relay daemon to serve a large number
of consumers or live clients.

The current on-disk CTF representation used by LTTng (and expected by
a number of viewers) uses one file per CPU, per channel, to organize
traces. This causes the default `RLIMIT_NOFILE` value (1024 on many
systems) to be reached easily, especially when tracing systems with a
large number of cores.

In order to alleviate this problem, the new `--fd-pool-size` option
allows you to specify a maximal number of simultaneously opened file
descriptors (using the soft `RLIMIT_NOFILE` resource limit of the
process by default). This is meant as a work-around for users who
can't bump the system-limit because of permission restrictions.

As its name indicates, this option causes the relay daemon to maintain
a pool (or cache) of open file descriptors which are re-purposed as
needed. The most recently used files' file descriptors are kept open
and only closed as the `--fd-pool-size` limit is reached, keeping the
number of simultaneously opened file descriptors under the
user-specified limit.

Note that setting this value too low can degrade the performance of
the relay daemon.

Per-session grouping (relay daemon)
---

By default, the relay daemon writes the traces under a predefined
directory hierarchy:
  `$LTTNG_HOME/lttng-traces/HOSTNAME/SESSION/DOMAIN` where
  - `HOSTNAME` is the remote hostname,
  - `SESSION` is the full session name,
  - `DOMAIN` is the tracing domain (`ust` or `kernel`),

Using the new relay daemon `--group-output-by-session` option, you can
now change this hierarchy to group traces by sessions, rather than by
hostname:
  `$LTTNG_HOME/lttng-traces/SESSION/HOST/DOMAIN`.

This proves especially useful if you are tracing a number of hosts
(with different hostnames) which share the same session name as part
of their configuration. Hence, a descriptive session name
(e.g. `connection-hang`) can be used across a fleet of machines
streaming to a given relay daemon.

Note that the default behaviour can be explicitly specified using the
`--group-output-by-host` option.

Working directory override (relay daemon)
---

Finally, this small quality of life feature allows you to override the
working directory of the relay daemon using the daemon's launch
options (`-w PATH`/`--working-directory=PATH`).

Statedump of interrupt threads (LTTng-modules)
---

Threaded IRQs have an associated `thread` field in the `irqaction`
structure which specifies the process to wake up when the IRQ
happens. This field is now extracted as part of the
`lttng_statedump_interrupt` statedump tracepoint.

You can use this information to know which processes handle the
various IRQs. It is also possible to associate the events occurring in
the context of those processes to their respective IRQ.

Statedump of x86 CPU topology (LTTng-modules)
---

A new `lttng_statedump_cpu_topology` tracepoint has been added to
extract the active CPU/NUMA topology. You can use this information to
know which CPUs are SMT siblings or part of the same socket. For the
time being, only x86 is supported since all architectures describe
their topologies differently.

The `architecture` field is statically defined and should be present
for all architecture implementations. Hence, it is possible for
analysis tools to anticipate the event's layout.

Example output:
lttng_statedump_cpu_topology: { cpu_id = 3 }, { architecture = "x86",
        cpu_id = 0, vendor = "GenuineIntel", family = 6, model = 142,
        model_name = "Intel(R) Core(TM) i7-7600U CPU @ 2.80GHz",
        physical_id = 0, core_id = 0, cores = 2 }

New product UUID environment field (LTTng-modules)
---

The product UUID, taken from the DMI system information, is now saved
as part of the kernel traces' environment fields as the
`product_uuid`. You can use this field to uniquely identify a machine
(virtual or physical) in order to correlate traces gathered on
multiple virtual machines.


Links
---

Project website: https://lttng.org

Download links:
https://lttng.org/files/lttng-tools/lttng-tools-2.12.0-rc1.tar.bz2
https://lttng.org/files/lttng-ust/lttng-ust-2.12.0-rc1.tar.bz2
https://lttng.org/files/lttng-modules/lttng-modules-2.12.0-rc1.tar.bz2

GPG signatures:
https://lttng.org/files/lttng-tools/lttng-tools-2.12.0-rc1.tar.bz2.asc
https://lttng.org/files/lttng-ust/lttng-ust-2.12.0-rc1.tar.bz2.asc
https://lttng.org/files/lttng-modules/lttng-modules-2.12.0-rc1.tar.bz2.asc
