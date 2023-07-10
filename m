Return-Path: <linux-trace-users-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69659EB64D9
	for <linux-trace-users@archiver.kernel.org>; Mon, 10 Jul 2023 15:00:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231438AbjGJPAi (ORCPT
        <rfc822;linux-trace-users@archiver.kernel.org>);
        Mon, 10 Jul 2023 11:00:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229954AbjGJPAi (ORCPT
        <rfc822;linux-trace-users@vger.kernel.org>);
        Mon, 10 Jul 2023 11:00:38 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8DA10C7
        for <linux-trace-users@vger.kernel.org>; Mon, 10 Jul 2023 08:00:37 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 2B8FE6102E
        for <linux-trace-users@vger.kernel.org>; Mon, 10 Jul 2023 15:00:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44C3AC433C8;
        Mon, 10 Jul 2023 15:00:36 +0000 (UTC)
Date:   Mon, 10 Jul 2023 11:00:33 -0400
From:   Steven Rostedt <rostedt@goodmis.org>
To:     Sharon Gabay <Sharon.Gabay@mobileye.com>
Cc:     "linux-trace-users@vger.kernel.org" 
        <linux-trace-users@vger.kernel.org>
Subject: Re: cannot run trace-cmd split in parallel
Message-ID: <20230710110033.7897fbde@gandalf.local.home>
In-Reply-To: <VE1PR09MB3535FFA94A0481583EF7992CF230A@VE1PR09MB3535.eurprd09.prod.outlook.com>
References: <VE1PR09MB3535122A0DA44242886307B9F233A@VE1PR09MB3535.eurprd09.prod.outlook.com>
        <20230709151604.73725086@rorschach.local.home>
        <VE1PR09MB3535FFA94A0481583EF7992CF230A@VE1PR09MB3535.eurprd09.prod.outlook.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-trace-users.vger.kernel.org>
X-Mailing-List: linux-trace-users@vger.kernel.org

On Mon, 10 Jul 2023 06:44:53 +0000
Sharon Gabay <Sharon.Gabay@mobileye.com> wrote:

> I think it would be useful to have two fixes:
> - make trace-cmd create the temporary output ("tmp.0.0") using either a
> uuid, or the name of the output file itself, or maybe add some suffix to
> it. In short, avoid collisions.

And the patch pretty much does the above ;-)

> - I'm not sure why but "trace-cmd split -o /tmp/a" will actually write to
> /tmp/a.1, if possible it would be best to write to the exact name
> specified by the user.

That was partially due to the default of the output file being the same as
the input file, and the '.1' made sure that the two did not collide.

But I can modify it to do the following:

diff --git a/tracecmd/trace-split.c b/tracecmd/trace-split.c
index 1daa847d9775..59df1d02b345 100644
--- a/tracecmd/trace-split.c
+++ b/tracecmd/trace-split.c
@@ -545,7 +545,7 @@ void trace_split (int argc, char **argv)
 	if (!output)
 		output = strdup(input_file);
 
-	if (!repeat) {
+	if (!repeat && strcmp(output, input_file) == 0) {
 		output = realloc(output, strlen(output) + 3);
 		strcat(output, ".1");
 	}

That is, only add the '.1' if the output file is the same as the input file.

-- Steve
