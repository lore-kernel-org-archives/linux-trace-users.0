Return-Path: <SRS0=cwR1=YK=vger.kernel.org=linux-trace-users-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=3.0 tests=FSL_HELO_FAKE,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2B51ECE58D
	for <linux-trace-users@archiver.kernel.org>; Thu, 17 Oct 2019 22:08:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id BBB0821D7C
	for <linux-trace-users@archiver.kernel.org>; Thu, 17 Oct 2019 22:08:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2438225AbfJQWIr (ORCPT
        <rfc822;linux-trace-users@archiver.kernel.org>);
        Thu, 17 Oct 2019 18:08:47 -0400
Received: from mail-qt1-f194.google.com ([209.85.160.194]:34731 "EHLO
        mail-qt1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727050AbfJQWIr (ORCPT
        <rfc822;linux-trace-users@vger.kernel.org>);
        Thu, 17 Oct 2019 18:08:47 -0400
Received: by mail-qt1-f194.google.com with SMTP id 3so6021699qta.1
        for <linux-trace-users@vger.kernel.org>; Thu, 17 Oct 2019 15:08:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:mime-version
         :content-disposition:content-transfer-encoding:user-agent;
        bh=1j2pJ1pqG6wHoD4Uz3ympJP9oHfrXxesBhib/WlpV0M=;
        b=MaXswjjPC7SoQ7C8mIi3mrKnoAsK0RIxMzTANlSXOY6ain02j75bHzWaZETAzS8Q54
         dBVnwe3toEY4A6umVMH3PtTU5scfqopkVQ0Q/GDubFLW2f6OF9si6BmQUglxKg5Y5rri
         WQ3ZwjwCi8+O5+d2ARu2AcB3eG0gmvdsl0uDYmwu9czzE5cfPIaiXdDG5L3apE3rvlu0
         XzXW2R28C1C0oUWL52te+R+Fd87qH6T9+m1O80zyxPtG6k4o/3WxrUL614q11ME7G4fe
         n+itspv/ey0xQbvX25CAd0hEYlEg+mCuh7nNIRv02XppLdFulnCuYHqSpatp8fNTNxSB
         r34Q==
X-Gm-Message-State: APjAAAWnFu/qxoraO7i7bUhJZkwvxo3AyI0TQH9F6oQUsKCohZeqvH8z
        o1gSynQGgp9ASviFfDzEwx1rKLjarw0=
X-Google-Smtp-Source: APXvYqz05VBknFcCQE34RXhJ+7trNG6Pm6sCXMPzeqI5+rj9wdl9edEEgn+tIKynDfF0IG873X8EfQ==
X-Received: by 2002:ac8:7007:: with SMTP id x7mr6120561qtm.89.1571350125278;
        Thu, 17 Oct 2019 15:08:45 -0700 (PDT)
Received: from gmail.com (192-222-181-218.qc.cable.ebox.net. [192.222.181.218])
        by smtp.gmail.com with ESMTPSA id q207sm2107992qke.98.2019.10.17.15.08.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Oct 2019 15:08:44 -0700 (PDT)
Date:   Thu, 17 Oct 2019 18:08:42 -0400
From:   =?iso-8859-1?Q?J=E9r=E9mie?= Galarneau 
        <jeremie.galarneau@efficios.com>
To:     lttng-dev@lists.lttng.org,
        diamon-discuss@lists.linuxfoundation.org,
        linux-trace-users@vger.kernel.org
Subject: [RELEASE] Babeltrace 2.0.0-rc1
Message-ID: <20191017220842.GA63331@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-trace-users-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-trace-users.vger.kernel.org>
X-Mailing-List: linux-trace-users@vger.kernel.org

Hi everyone!

We're very excited to announce the first Babeltrace 2.0 release
candidate! 😃

A prettified version of this announcement is available at:
https://diamon.org/babeltrace/docs/release-notes/babeltrace-2.0.0-rc1-release-notes.html

What's new since Babeltrace 2.0.0-pre5?
=======================================
Babeltrace 2.0.0-pre5 was released 3 May 2019.

We brought many improvements to the CLI, the project plugins, and the
library and its Python bindings.

We also updated all the Babeltrace 2 manual pages.

The build-time and run-time requirements for Babeltrace 2.0.0-rc1
are updated:

* Babeltrace 2.0.0-rc1 does not need the popt library anymore to
  parse command-line arguments.

  We wrote our own command-line argument parser to remove this obsolete
  requirement and to support advanced, position-dependent parsing.

* Babeltrace 2.0.0-rc1 requires GLib ≥ 2.28 at build time and run time
  instead of the previous ≥ 2.22 requirement.

Command-line interface
----------------------

Automatic source component discovery
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
With the `convert` [1] command's new **automatic source component
discovery** feature, specify a path, URI, or arbitrary string to let
`babeltrace2` find the most appropriate components to use:

    $ babeltrace2 /path/to/ctf/trace
    $ babeltrace2 net://localhost/host/myhost/my-session

This means you don't need to create an explicit component with the
`--component` [2] option most of the time.

Behind the scenes, this feature queries the
`babeltrace.support-info` [3] object from all known component classes: a
component class can reply with a confidence score to indicate its
ability to handle a given path or custom string.

For example, a `source.ctf.fs` [4] (CTF trace directory source)
component class replies to this query whether or not the given path
looks like a CTF trace directory.

NOTE: Source component classes do _not_ have to implement the
`babeltrace.support-info` query. If a component class does not implement
this query, the automatic source component discovery algorithm won't
consider it. In that case, you must instantiate such a component class
explicitly with the `--component` option.

Plugins
-------

New `sink.text.details` component class
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
This new component [5] pretty-prints all the details of the messages it
consumes.

The output is optimized to be human-readable, yet it is deterministic
for testing and debugging purposes.

You can use a `sink.text.details` component to easily inspect messages
flowing at any point of a graph and make it easy to test and
troubleshoot other component classes.

The Babeltrace 2 project uses this component class for many tests.

`source.ctf.fs`
~~~~~~~~~~~~~~~
A `source.ctf.fs` [4] component can now open and read malformed CTF
traces produced by tracers having known bugs and corner cases
(LTTng-UST [6], LTTng-modules, and barectf [7]).

For example, a `source.ctf.fs` component can now read data streams which
the `lttng-crash` [8] tool generates, even if the last packets can be
malformed.

See the "Trace quirks" [9] section of the `babeltrace2-source.ctf.fs(7)`
manual page for more details.

Library and Python bindings
---------------------------

Library-specific: simple sink component
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Add a sink component to a graph easily using the new **simple sink
component** C API.

A simple sink component is a sink component with a single input port and
a single message iterator.

This interface reduces the amount of code you need to write to create a
basic Babeltrace 2 message consumer.

Just provide a consumption user function which receives the component's
message iterator to consume upstream messages.

You can also implement other user functions:

Initialization function:
    Called once during the initialization phase of the graph.

Finalization function:
    Called once during the finalization phase of the graph.

Python-specific: automatic source component discovery using
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
`bt2.TraceCollectionMessageIterator`
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Integrate the same **automatic source component discovery** mechanism
which the `babeltrace2` CLI's `convert` [1] command uses to a Python
application using a `bt2.TraceCollectionMessageIterator` object.

With a `bt2.TraceCollectionMessageIterator` object, your application can
access additional component classes installed on the system from the get
go.

New field class types
~~~~~~~~~~~~~~~~~~~~~
New field classes are available in libbabeltrace2 and its Python
bindings to support eventual, new CTF 2 field classes.

The new fields are:

Boolean:
    Contains a boolean value.

Bit array:
    Contains a fixed-size array of bits.

    A bit array field can represent a CPU status or flag register value,
    for example.

    Unlike integer fields, a bit array field is _not_ a numerical field.

Option:
    Contains an optional field.

    An option field class is conceptually equivalent to a variant field
    class with two options: no field class and the optional field class.

User attributes
~~~~~~~~~~~~~~~
Attach custom user attributes to any of the following trace IR objects:

* Clock class
* Event class
* Field class
* Stream
* Stream class
* Trace
* Trace class

This new property exists because we expect the CTF 2 metadata
objects to contain **user attributes** too.

Error reporting
~~~~~~~~~~~~~~~
Report rich error causes from user functions with the new thread-safe
**error reporting** API.

The error reporting API makes it possible for the various actors
interacting through libbabeltrace2 to precisely describe the chain of
events that lead to a given error. As a library user, you can access
this list of causes and reduce the time needed to troubleshoot problems.

This feature is similar to the stack trace which exception objects
contain in many programming languages.

When an error occurs, the `babeltrace2` CLI [10] uses this error
reporting API to show the top-level error itself, but also a detailed
list of its causes, for example:

    ERROR:    [Babeltrace CLI] (babeltrace2.c:2546)
      Graph failed to complete successfully
    CAUSED BY [Babeltrace library] (graph.c:604)
      Component's "consume" method failed: ..., comp-name="sink.text.details", ...
    CAUSED BY [Babeltrace library] (iterator.c:889)
      Component input port message iterator's "next" method failed: ..., iter-upstream-comp-class-name="debug-info", ...
    CAUSED BY [Babeltrace library] (iterator.c:889)
      Component input port message iterator's "next" method failed: ..., iter-upstream-comp-name="muxer", ...
    CAUSED BY [Babeltrace library] (iterator.c:889)
      Component input port message iterator's "next" method failed: ..., iter-upstream-comp-class-name="MyFirstSource", ...
    CAUSED BY [src.demo.MyFirstSource (some-name): 'source.demo.MyFirstSource'] (bt2/native_bt_log_and_append_error.h:100)
      Traceback (most recent call last):
        File "/usr/local/lib/python3.6/dist-packages/bt2/message_iterator.py", line 151, in _bt_next_from_native
          msg = next(self)
        File "./bt_plugin_foo.py", line 33, in __next__
          raise Exception
      Exception

In the Python bindings, raise any exception object as usual from a user
function: the `bt2` package converts it to a libbabeltrace2 error cause
for other parties.

Coinstallation with Babeltrace 1
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
To make the transition from Babeltrace 1 to Babeltrace 2 easier, we
decided to make both projects coinstallable thanks to those changes:

* The Babeltrace 2 CLI tool is named `babeltrace2`.
* The Babeltrace 2 library's include directory is named `babeltrace2`.
* The Babeltrace 2 library is named `libbabeltrace2`.
* The Babeltrace 2 manual page names start with `babeltrace2-`.

Distribution packages will be available for both Babeltrace 1
and Babeltrace 2.

Message Interchange Protocol versioning
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Future-proof component classes using **Message Interchange Protocol
versioning**.

As Babeltrace 2 evolves, we expect to introduce new concepts and objects
to libbabeltrace2 such as field class types, message types, methods, and
message ordering requirements. To ensure forward and backward
compatibility can be maintained across future releases of Babeltrace 2,
Babeltrace 2.0.0-rc1 adds the concept of **Message Interchange
Protocol** (MIP).

Should we introduce a breaking change to the protocol which trace
processing graph components must honor, we'll bump the MIP version to
announce the modified interface.

You can consider the MIP version as an implicit precondition variable
for almost all the libbabeltrace2 functions.

Given the expected initialization parameters, a component class can
report a range of supported MIP versions. You can then build a graph
which operates with a specific MIP version to ensure all its components
exchange messages using the same protocol.

`const` correctness
~~~~~~~~~~~~~~~~~~~
The Babeltrace 2 C API uses the `const` qualifier liberally to catch
many programming errors at compile time.

As the Python language does not have a `const` feature to express
immutability constraints, the Python classes are now split into constant
and mutable variants. Mutable variants of the classes have methods to
modify and read object properties whereas their constant counterpart
only have reading methods.

All constant classes end with `Const`.

If you try to modify a constant object, Python raises an attribute
error.

Optional packet support
~~~~~~~~~~~~~~~~~~~~~~~
The Babeltrace 2 packet concept exists because CTF [11] needs it.
However, many trace formats don't.

With Babeltrace 2.0.0-rc1, you don't need to create packet objects to
conceptually contain event objects. As such, you don't need to emit
packet beginning and end messages.

By default, packets are not supported for a given stream class: you need
to explicitly enable their support.

"TRACE" logging level
~~~~~~~~~~~~~~~~~~~~~
The "VERBOSE" logging level is now the "TRACE" logging level.

It's not obvious whether the "VERBOSE" level is more or less verbose
than the _DEBUG_ level. With "TRACE" instead, it becomes evident.

Documentation
-------------
Manual pages are finalized and reflect the changes introduced in
Babeltrace 2.0.0-rc1.

General:
    * `babeltrace2-intro(7)`

CLI:
    * `babeltrace2-convert(1)`
    * `babeltrace2-help(1)`
    * `babeltrace2-list-plugins(1)`
    * `babeltrace2-query(1)`
    * `babeltrace2-run(1)`
    * `babeltrace2(1)`

Standard query objects:
    * `babeltrace2-query-babeltrace.support-info(7)`
    * `babeltrace2-query-babeltrace.trace-infos(7)`

CTF input/output plugin:
    * `babeltrace2-plugin-ctf(7)`
    * `babeltrace2-sink.ctf.fs(7)`
    * `babeltrace2-source.ctf.fs(7)`
    * `babeltrace2-source.ctf.lttng-live(7)`

LTTng-specific utilities plugin:
    * `babeltrace2-plugin-lttng-utils(7)`
    * `babeltrace2-filter.lttng-utils.debug-info(7)`

General utilities plugin:
    * `babeltrace2-plugin-utils(7)`
    * `babeltrace2-filter.utils.muxer(7)`
    * `babeltrace2-filter.utils.trimmer(7)`
    * `babeltrace2-sink.utils.counter(7)`
    * `babeltrace2-sink.utils.dummy(7)`

Plain text input/output plugin:
    * `babeltrace2-plugin-text(7)`
    * `babeltrace2-sink.text.details(7)`
    * `babeltrace2-sink.text.pretty(7)`
    * `babeltrace2-source.text.dmesg(7)`

What's new since Babeltrace 1.5?
================================
This section presents a very high level view of the changes from
Babeltrace 1.5 to Babeltrace 2.

Read `babeltrace2-intro(7)` [12] to learn more about the Babeltrace 2
project and its core concepts.

Trace processing graph
----------------------
Connect components within a trace processing graph and run it to execute
trace manipulation or conversion tasks.

Components are instances of component classes. Babeltrace 2 plugins (shared
libraries or Python files) are distributable packages of component
classes.

The Babeltrace 2 project's component classes are:

CTF [11] file system source::
    Read CTF traces from the file system.

LTTng [6] live source::
    Connect to an LTTng relay daemon and receive CTF streams.

CTF file system sink::
    Write CTF traces to the file system.

Debugging information filter for LTTng traces::
    Augment compatible events with debugging information.

Linux kernel ring buffer source::
    Read Linux ring buffer lines (`dmesg(1)` output) from a file or from
    standard input.

Detailed sink::
    Print messages with details.

Pretty-printing sink::
    Pretty-print messages (`text` format of Babeltrace 1).

Message muxer filter::
    Sort messages from multiple input ports to a single output port
    by time.

Message trimmer filter::
    Discard messages that occur outside a specific time range.

Message counter sink::
    Count messages and print the statistics.

Dummy sink::
    Consume messages and discard them.

Read multiple CTF traces sharing the same UUID
----------------------------------------------
Merge multiple physical traces sharing the same UUID to a single logical
trace.

This is especially useful to read traces produced by the tracing session
rotation feature introduced in LTTng [6] 2.11.

Developer mode
--------------
Verify your custom component classes by building and running
Babeltrace 2 in **developer mode**.

This special operation mode enables a large number of libbabeltrace2
function precondition and postcondition checks. This is at the cost of
making the library less efficient.

With the developer mode, you can develop and test new plugins while
ensuring that they honour the contract of the various libbabeltrace2
functions you use.

Since we assume that component classes have been tested in developer
mode by their authors, the release, or production build configuration of
Babeltrace 2 does not check fast path preconditions and postconditions
at run time, resulting in improved performance.

To build Babeltrace 2 in developer mode and test your own plugins, set
the `BABELTRACE_DEV_MODE` environment variable to `1` at configuration
time:

    $ BABELTRACE_DEV_MODE=1 ./configure

When a function precondition or postcondition is not satisfied,
libbabeltrace2 prints why and details to the standard error and calls
`abort()`, just like `assert()`, so that you can inspect the programming
error's context with a debugger.

For example:

    10-06 09:12:20.228 62362 62362 F LIB/VALUE bt_value_array_get_length@value.c:887 Babeltrace 2 library precondition not satisfied; error is:
    10-06 09:12:20.228 62362 62362 F LIB/VALUE bt_value_array_get_length@value.c:887 Value object is NULL:
    10-06 09:12:20.228 62362 62362 F LIB/VALUE bt_value_array_get_length@value.c:887 Aborting...

Colors
------
The Babeltrace CLI and some components now use colors when the connected
terminal supports it.

LTTng live source's _subscribe_ mode
------------------------------------
Subscribe to a tracing session served by an LTTng [6] relay daemon with
a `source.ctf.lttng-live` component in **subscribe mode**.

To subscribe to a session, set the `source.ctf.lttng-live` component's
`session-not-found-action` [13] initialization parameter to `continue`.
In subscribe mode, the source attempts to consume an LTTng relay
daemon's tracing session and attempts to reconnect periodically if it
does not find the target session.

By default, the CLI's `convert` [1] command uses the `end`
session-not-found action: `babeltrace2` [10] exits with success, just
like Babeltrace 1's `babeltrace` program.

To use the `continue` action explicitly, do:

    $ babeltrace2 net://relayhost/host/tgthost/my-session \
                  --params='session-not-found-action="continue"'

API changes
-----------
The libbabeltrace2 API shares nothing with Babeltrace 1's libbabeltrace
API.

The libbabeltrace2 API is trace-format agnostic and aims at making it
easy to correctly manipulate traces and logs produced in a variety of
formats.

Babeltrace 2 still provides Python bindings through the `bt2` package,
exposing all the features of the C API. The `bt2` package is _not_ a
drop-in replacement of the Babeltrace 1's `babeltrace` package.

Upcoming
========
As we enter the **release candidate** phase of Babeltrace 2's
development cycle, we are hard at work putting the finishing touches on
our way to the final 2.0.0 release.

We invite you to try this release candidate and report any problems you
may encounter to the `lttng-dev@lists.lttng.org` [14] mailing list or
through the Babeltrace bug tracker [15].

Documentation
-------------
We are currently documenting the entire Babeltrace 2 C API to make the
development of new component classes as easy as possible.

We'll also work on the Python bindings documentation.

The documentation of the API will be made available on the official
Babeltrace website [16].

Other tasks
-----------
* Improve test coverage.
* Improve resilience to corrupted/malformed CTF traces.
* Minor internal cleanups and bug fixes.

Important links
===============
Babeltrace 2.0.0-rc1 tarball:
    https://www.efficios.com/files/babeltrace/babeltrace-2.0.0-rc1.tar.bz2

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
==========
[1]: https://diamon.org/babeltrace/docs/v2.0/man1/babeltrace2-convert.1/
[2]: https://diamon.org/babeltrace/docs/v2.0/man1/babeltrace2-convert.1/#doc-opt--component
[3]: https://diamon.org/babeltrace/docs/v2.0/man7/babeltrace2-query-babeltrace.support-info.7/
[4]: https://diamon.org/babeltrace/docs/v2.0/man7/babeltrace2-source.ctf.fs.7/
[5]: https://diamon.org/babeltrace/docs/v2.0/man7/babeltrace2-sink.text.details.7/
[6]: https://lttng.org/
[7]: https://github.com/efficios/barectf
[8]: https://lttng.org/man/1/lttng-crash
[9]: https://diamon.org/babeltrace/docs/v2.0/man7/babeltrace2-source.ctf.fs.7/#doc-_trace_quirks
[10]: https://diamon.org/babeltrace/docs/v2.0/man1/babeltrace2.1/
[11]: https://diamon.org/ctf/
[12]: https://diamon.org/babeltrace/docs/v2.0/man7/babeltrace2-intro.7/
[13]: https://diamon.org/babeltrace/docs/v2.0/man7/babeltrace2-source.ctf.lttng-live.7/#doc-param-session-not-found-action
[14]: https://lists.lttng.org/cgi-bin/mailman/listinfo/lttng-dev
[15]: https://bugs.lttng.org/projects/babeltrace
[16]: https://diamon.org/babeltrace/
