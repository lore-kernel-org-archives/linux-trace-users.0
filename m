Return-Path: <linux-trace-users-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 944FBC43334
	for <linux-trace-users@archiver.kernel.org>; Thu,  7 Jul 2022 14:01:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234209AbiGGOBR (ORCPT
        <rfc822;linux-trace-users@archiver.kernel.org>);
        Thu, 7 Jul 2022 10:01:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58546 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232815AbiGGOBQ (ORCPT
        <rfc822;linux-trace-users@vger.kernel.org>);
        Thu, 7 Jul 2022 10:01:16 -0400
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C1E931BE98
        for <linux-trace-users@vger.kernel.org>; Thu,  7 Jul 2022 07:01:15 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id 7F2C11FE2E;
        Thu,  7 Jul 2022 14:01:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1657202474; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=vimwdhAXWy1OMPTgMGEXDrxxd7tmD5V8AXDBhX1XhXU=;
        b=o0od81yF1v4JW/JY9LLducn4/nH+fQIzQhUyjvQ/XP8vHzR0PMjnho+6lzS9L6k7sTkgaY
        +lnlQEXDEgGerhoDl0KM/MafJN8kEYe09Gx+XOkfT89DSzbCxw04zvODAcnjdRPU/m2SBw
        XionixhwiN186PTLfo7ePea6MYC/vuA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1657202474;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=vimwdhAXWy1OMPTgMGEXDrxxd7tmD5V8AXDBhX1XhXU=;
        b=dQkYLNHMzzbrFKkfk53S1bJPxnfg7iCp08QdowRau0rfUYZ96yjHsMBkV91EM8s+N5iT9N
        gGI/xV/RRYbJh2Bw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 719D813A33;
        Thu,  7 Jul 2022 14:01:14 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id GHOxGyrnxmK4IwAAMHmgww
        (envelope-from <dwagner@suse.de>); Thu, 07 Jul 2022 14:01:14 +0000
Date:   Thu, 7 Jul 2022 16:01:13 +0200
From:   Daniel Wagner <dwagner@suse.de>
To:     Steven Rostedt <rostedt@goodmis.org>
Cc:     linux-trace-users@vger.kernel.org
Subject: Re: [RFC v1] libtraceevent: Add initial support for meson
Message-ID: <20220707140113.ephz6il665xc4nh4@carbon>
References: <20220707121440.28216-1-dwagner@suse.de>
 <20220707094422.1bf96c9d@gandalf.local.home>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220707094422.1bf96c9d@gandalf.local.home>
Precedence: bulk
List-ID: <linux-trace-users.vger.kernel.org>
X-Mailing-List: linux-trace-users@vger.kernel.org

On Thu, Jul 07, 2022 at 09:44:22AM -0400, Steven Rostedt wrote:
> Thanks for doing this. Hopefully I'll get some time to try it out.

Cool, let me know if you need any help. There are some (low) hurdles to
jump over but nothing serious IMO.

> Anyway, as for the libtraceevent-dynamic-list, it was brought over from the
> kernel tools/lib directory. I guess it is needed for the plugins to work
> properly, although I have not had issues with it.

The current Makefile doesn't install it nor use it in anyway. Chances
are no one is using it. Also looking at the content shows a handful of
symbols which shouldn't be there:

{
        free;
        memcpy;
        memset;
        realloc;
        sprintf;
        strcmp;
        strdup;
        strncmp;
        tep_find_any_field;
        tep_find_field;
        tep_find_function;
...
};

> But if you want to know more, see commit e3d09ec8126fe ("tools lib
> traceevent: Export dynamic symbols used by traceevent plugins") in the
> Linux kernel source.

Well, if this is a use case which needs to be supported we might need to
figure out how to get a correct export map. In a different project we
currently maintain the map file manual with the usual problems of
syncing up the *.c files and the map file. I was thinking about
introducing a macro like the ones in the kernel *_EXPORT from which the
map file is generated. Just as idea.
