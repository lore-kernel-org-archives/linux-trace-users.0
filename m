Return-Path: <linux-trace-users-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B10F5EB64D7
	for <linux-trace-users@archiver.kernel.org>; Tue, 20 Jun 2023 06:35:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231163AbjFTGf7 (ORCPT
        <rfc822;linux-trace-users@archiver.kernel.org>);
        Tue, 20 Jun 2023 02:35:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43976 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231184AbjFTGf6 (ORCPT
        <rfc822;linux-trace-users@vger.kernel.org>);
        Tue, 20 Jun 2023 02:35:58 -0400
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com [IPv6:2607:f8b0:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB8DF10DD
        for <linux-trace-users@vger.kernel.org>; Mon, 19 Jun 2023 23:35:56 -0700 (PDT)
Received: by mail-pg1-x52a.google.com with SMTP id 41be03b00d2f7-553b2979fceso913513a12.3
        for <linux-trace-users@vger.kernel.org>; Mon, 19 Jun 2023 23:35:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687242956; x=1689834956;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=L/REP5a5NFZ2MTaJYC/YKIh24yj2BFbtPwBzBCheh18=;
        b=L+roaaFyGqeTxI1cXXM1rjI+SynJydZfBnkBqaFo1tX47jdZ621Om5U6YCu2O6JjJR
         ddJMMVQIBJ62DnluSLQKwKovGWg9HRvgKmvrPq1gZ7RPjfhf3JdK8hlKdaTXFtRdENeE
         nXnoQaWClzg8Ohx/6V6IC4jUTZqpXh9PxW1sRtn3P0fPadZe5aVJRCpo+xDsvTrGZaDy
         qmUJmrrKI9jrbIUsLCK1UcFmOzZOcBI5CO4R6lWPd2s5i3qbNQWN5D2itgy4lp1i4Jjs
         b4BPNfuq8Du1lBeY+3UzSMBipCFwKyK3RCsESPq3uq/jpjvS4E0Ur37Zn9kTujnrKpor
         6VuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687242956; x=1689834956;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L/REP5a5NFZ2MTaJYC/YKIh24yj2BFbtPwBzBCheh18=;
        b=REI71SMnBOeVD6eVphWnUqNEzLgE0j6cbvolztaS/XkfFTHMW6A5RaEkY+yfwgeM3L
         NAYTItjNjzymgNpdHXj7xKj83CMsJ/gKeXBpjGIgQDmb246a1XOrmmnzu2nLq5AIb2xe
         mbrUhoKUs8ELGXsMO6outQnu6Y3BPS3tOSGtRiJ6XLdjRwUbVLfnO0qPuyvPBkJ3bD+F
         aAzsT6KdCVxg7NBdAxkfh1Hf5fhVFEG7PINNDnMY+lbvgciezdgRn/uxIXm4HXY/5v8+
         CCR0stfJ63ELGNPzra3zKF4/jvMhmrPGN5IAC5ilHMGxVajoPrI6fjWDG+q1BREx9eaM
         Nv+g==
X-Gm-Message-State: AC+VfDxfh4GCaZzbrWututkZSi0rdkreBzyrWsXlqWX6BtNVQmpd3FKt
        5AVuJa2oeSYhQnxxKjMyE4ZdH6a//4g=
X-Google-Smtp-Source: ACHHUZ6X9Ii/MxDyDIyoBLKiElW5bSRSIzCkIpAXMWoLWhG9jEVZz3YyDiTn2y9cBiE2ivZO5RKq+A==
X-Received: by 2002:a05:6a21:114d:b0:107:10b6:4c8a with SMTP id oi13-20020a056a21114d00b0010710b64c8amr9492739pzb.24.1687242955918;
        Mon, 19 Jun 2023 23:35:55 -0700 (PDT)
Received: from bangji.hsd1.ca.comcast.net ([2601:647:6700:7f00:2e9c:90fb:9fe0:29f4])
        by smtp.gmail.com with ESMTPSA id w15-20020a170902e88f00b001b01547d0e8sm818754plg.142.2023.06.19.23.35.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jun 2023 23:35:55 -0700 (PDT)
From:   Namhyung Kim <namhyung@gmail.com>
To:     uftrace@googlegroups.com
Cc:     linux-trace-users@vger.kernel.org
Subject: [ANNOUNCE] uftrace v0.14 is out!
Date:   Mon, 19 Jun 2023 23:35:53 -0700
Message-ID: <20230620063553.1599371-1-namhyung@gmail.com>
X-Mailer: git-send-email 2.41.0.185.g7c58973941-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-trace-users.vger.kernel.org>
X-Mailing-List: linux-trace-users@vger.kernel.org

Hello,

I'm excited to announce that uftrace v0.14 is just released.
This release comes with new cool features and bug fixes.
You can get it from the below link:

  https://github.com/namhyung/uftrace/releases/tag/v0.14

The first thing is Python language support!  Now uftrace can trace python
functions and methods like C/C++ functions.  Internally, it uses python's
sys.setprofile() and pass the entry/exit info to the libmcount.

For example, it can trace the following python script (it needs to be a
standalone executable - it should have #! line and executable permission).

    $ cat abc.py 
    #! /usr/bin/python3
    def a(): b()
    def b(): c()
    def c(): print("Hello")
    if __name__ == '__main__':
        a()

    $ chmod +x abc.py

Then uftrace can trace the functions like below:

    $ uftrace abc.py 
    Hello
    # DURATION     TID     FUNCTION
                [235209] | __main__.<module>() {
                [235209] |   a() {
                [235209] |     b() {
                [235209] |       c() {
      10.810 us [235209] |         builtins.print();
      14.926 us [235209] |       } /* c */
      16.628 us [235209] |     } /* b */
      18.867 us [235209] |   } /* a */
      22.000 us [235209] | } /* __main__.<module> */

Not all features work well with python scripts, but filters by name (-F
and -N), depth (-D), time (-t), location (-L) would work.  However you
can use full features for analysis after recording the data.

The next is the improved agent control.  The agent listens to a client
connection in background when started with -g option.  Then users can
connect to it with uftrace live using -p <PID> option.  The <PID> should
be a process ID of the target, not the uftrace itself.

Say we want to trace my program with a filter at first.  Please don't
forget to start an agent.

    $ uftrace record -g -F ^mycode -- myprog

Later we don't want to use the function filter anymore, and decided to use
a time filter instead.  Let's change the option for the uftrace record
like below:

    $ uftrace -p $(pidof myprog) -F ^mycode@clear -t 100us

Note that the above command would not produce any data and just pass the
new options to the existing uftrace record session (for myprog).

One more big thing is Android build support.  While it's not officially
supported, you can build uftrace as an external tool.  This needed various
improvements in terms of portability like abstracting shmem access and
better handling of the tmp directory and dynamic linker behaviors.

It has been tested with Android 9+ on AArch64 and x86_64.  You probably
want to use dynamic tracing due to issues with the Android runtime.
Please see INSTALL.md for the details.

The size filter at replay now works as same as record, since the symbol
file format was changed to save the symbol size as well.

Symbol demangling on Rust programs was improved to handle trait names in a
more compact way.  The new demangling scheme (v0) is not supported yet.

There are also more fixes and improvements.  Thank you all for making
uftrace more useful, efficient and portable!

Namhyung
