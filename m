Return-Path: <linux-trace-users-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9102DC54EBD
	for <linux-trace-users@archiver.kernel.org>; Mon,  9 Jan 2023 06:59:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233143AbjAIG7X (ORCPT
        <rfc822;linux-trace-users@archiver.kernel.org>);
        Mon, 9 Jan 2023 01:59:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56994 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230327AbjAIG7N (ORCPT
        <rfc822;linux-trace-users@vger.kernel.org>);
        Mon, 9 Jan 2023 01:59:13 -0500
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 77D1C62FA
        for <linux-trace-users@vger.kernel.org>; Sun,  8 Jan 2023 22:59:12 -0800 (PST)
Received: by mail-pj1-x1031.google.com with SMTP id o7-20020a17090a0a0700b00226c9b82c3aso8427821pjo.3
        for <linux-trace-users@vger.kernel.org>; Sun, 08 Jan 2023 22:59:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dE5wi48qt8kKQYEAvueNLeOuSdCw8IqVZ3HqRoLMG0c=;
        b=ntngeHNlOGgNlfdrMtZFazB43pnM4yo1iDhRJ84RqJBk0Q2kNXQ2Ec+J7kp9vhns1Z
         4Qg/X2/+20k4lBGFwSl1E9NNDLxNK5RLTcCyHz/kNSQDW4pfWJFCNFH8hZ/4tiZqqBrF
         Crvdh3JhacV1e5kLEjOu6q59wbHGCpwOw6J768SzE89utYSdq90q/9RBhseGadl0OreT
         jneJz2hqP84dIjJ9dp24PuV/VVVxzAxkoJvW0027ylnFVbpayD67VJ9GvZvLiD6BYS/N
         uPWtMmWvgvKcxsRMtIHRYJdOx8mUgb8rnhg8F37FFzlayFBOB7fmv9BPIn2/YgyPej6I
         cQbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dE5wi48qt8kKQYEAvueNLeOuSdCw8IqVZ3HqRoLMG0c=;
        b=DuFsL5XCgnYxtQEYdiADXz0GCKT8OruC7iT1AmqrpSiQENl+dYPjCMfrfnrXBqahb7
         d8pqC+eLsWN3N6m+4DtAkjKgurRngbvgOuvna5y6IUWyqlkRvq9GBrZKJOnOUNMTfGUo
         /QKNf5K9wlmXxt5+fCtVo+SsGHPm8Rhotl8FamRcJS//+Ima8Jf+BFc4lPruFQyGRzHp
         sLRf3Jd3V9iXpmWwpUk+P3BqRu0cr2gddsH3D3l8vIkSVfaWUwa1cwkogPMp64O9VDyR
         eP+akpDO0dp//URJ654xkwMxCNqfdUuhq818yyUtQkwEwLAsVrZ9zweIyRXunxQhdBIg
         VaxQ==
X-Gm-Message-State: AFqh2kqq8GGfzsdoNnsydbUktIRk7VM04kn5ySl1xuDSD3IqRhSzesNY
        XOIHF3CpaveJJOqOZxZDUuv256m7yeo=
X-Google-Smtp-Source: AMrXdXtWVCf3mLd5qi5n4q1v4QfCORuUQliMFxy0lnN7mZnh74ppZS8YsNp8R/oXFVeo/ZHKcJ5oTw==
X-Received: by 2002:a17:902:e884:b0:192:c014:f6ba with SMTP id w4-20020a170902e88400b00192c014f6bamr42244033plg.33.1673247551740;
        Sun, 08 Jan 2023 22:59:11 -0800 (PST)
Received: from balhae.hsd1.ca.comcast.net ([2601:647:6780:ff0:1bb7:db28:d1e:f78c])
        by smtp.gmail.com with ESMTPSA id z10-20020a170903018a00b001868981a18esm5314965plg.6.2023.01.08.22.59.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Jan 2023 22:59:11 -0800 (PST)
From:   Namhyung Kim <namhyung@gmail.com>
To:     uftrace@googlegroups.com
Cc:     linux-trace-users@vger.kernel.org
Subject: [ANNOUNCE] uftrace v0.13 is released!
Date:   Sun,  8 Jan 2023 22:59:08 -0800
Message-Id: <20230109065908.1993001-1-namhyung@gmail.com>
X-Mailer: git-send-email 2.39.0.314.g84b9a713c41-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-trace-users.vger.kernel.org>
X-Mailing-List: linux-trace-users@vger.kernel.org

Hello,

I'm happy to announce that uftrace v0.13 is released.
You can get it from the below link:

  https://github.com/namhyung/uftrace/releases/tag/v0.13

As usual, this release contains new features and many bug fixes.

This release comes with a couple of new filtering options.  The first one
is the location filter.  The -L or --loc-filter option can specify names
of directory or file for the source code.  That means the binary should
have the debug information (DWARF).  Since uftrace saves the (reduced
form of) debug info separately, we can use this option at replay as well.

    $ uftrace -L myfile.c  myprog

The above will show functions only in the 'myfile.c' file.  You can also
use directory names and mix the two.  When you use a directory name, it
will match all files under the directory.  And the regex or the wildcard
patterns can be used for more fine-grainded filtering.

The next one is the size filter using -Z or --size-filter option.
Actually this is not a new addition, we had it for the dynamic tracing.
But now we can use it as a general filter regardless if you use the
dynamic tracing or not.

    $ uftrace -Z 100  myprog

The above will show functions that their size is greater than equal to
100 bytes.  At record (or in live command), it can read the size from
the ELF symbol table directly.  When you use the option during replay
(or report and so on), it determines the size from the symbol file in
the uftrace data.

But it can have a small difference than the original symbol size
(usually bigger than the original).  This is because the symbol file
doesn't actually save the size of functions.  It currently saves the
symbol addresses only and function size is calculated as a difference
between the two adjacent fucntions.  If your compiler added some
paddings at the end of the function (to aligned the function start
address), it'll have a different size.  Please be aware of that when
using it from replay.

To check the size in the symbol file, you can use 'size' field in the
uftrace report output.

    $ uftrace report -f size

This will show the size of functions (saved in the uftrace data).

The uftrace dump got `--mermaid` option to produce the mermaid format
[1] for visualizing function call graphs.  Also it supports to change
the base function of the graph interactively.

The --no-sched-preempt option is to suppress schedule events only if
it's pre-empted.  So the voluntary schedules will be shown.

And we added many testing/CI infra changes thanks for Github actions.
I appreciate Travis CI team for the works so far but decided to move.

Finally, it added the preliminary support for running an agent in
background.  It does nothing as of now, but it will talk to external
uftrace processes via a unix socket to control the tracing behavior
later.  The uftrace live got -p option to specify the pid of the
original process with the agent.

There are many more things. Thank you all for making uftrace more
useful, efficient and portable!

Namhyung


[1] https://mermaid-js.github.io
