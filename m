Return-Path: <linux-trace-users-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.3 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_IN_DEF_DKIM_WL
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B72BC48BD1
	for <linux-trace-users@archiver.kernel.org>; Thu, 10 Jun 2021 18:51:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4FEC2613B0
	for <linux-trace-users@archiver.kernel.org>; Thu, 10 Jun 2021 18:51:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229935AbhFJSxU (ORCPT
        <rfc822;linux-trace-users@archiver.kernel.org>);
        Thu, 10 Jun 2021 14:53:20 -0400
Received: from mail-wm1-f44.google.com ([209.85.128.44]:35684 "EHLO
        mail-wm1-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230312AbhFJSxT (ORCPT
        <rfc822;linux-trace-users@vger.kernel.org>);
        Thu, 10 Jun 2021 14:53:19 -0400
Received: by mail-wm1-f44.google.com with SMTP id k5-20020a05600c1c85b02901affeec3ef8so7237954wms.0
        for <linux-trace-users@vger.kernel.org>; Thu, 10 Jun 2021 11:51:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=J21h3J8NVq3CdoGsD791C/g3nKNn/C1NFZAumTjol6w=;
        b=Y/Dc+vtX0dMNI2J1k+8fWMwRKoND/FZhtD9xDRSycyTrbFDvJND+xMM58qM2pvkp5E
         Ee8MMWjbDdYTiRqGQPmkkmZQ4vewdM9GwTqDdCLZzXXMbKs05zHSpU0YhCKpP9lBCdaQ
         mhFcSqBH2OvI2N3zDAXAvmhkQKBSd2wHzsgzLa3eM+cNzVF+9uzEwSLOHmwo6JR+Tlds
         Y9ZlXr9X8ebKE1aC/mdyd6OU54ydQvHaVLq4whjaO+Ee/TZHy1GaSTIsYFq4Mz8ejS6m
         Uh94HXhKle7/1cMx2/Eecuc28gxbh76KImlTsmSrRFrDBifW1M4S/ZoGFEhe5Mj1joVO
         MpMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=J21h3J8NVq3CdoGsD791C/g3nKNn/C1NFZAumTjol6w=;
        b=SqKD35mDWLo0+m9RbdYVaBuU2KpFdgbamsfrBTYXLT/Uckm3sisQuR9IT5WfKO6eT6
         b5VqyYwbAZn4NNeEpkz0APUCxViNVX+J6WSg/iU88FAS1inl5VfmQ/e49aM141oD6e3m
         ELaG6FwbWqQaD/dIY4PU2+dBKFIecQEBWfwCGDjOOqbThnw5Y4f9aBHP6n1oXRAvV/lW
         o4eQwviAj5zJbyxIgq1C/i6oQUMnzlRoquRDgOds9ilCuf1pELrf8AL0XvPeg8Ygds3X
         graX8th1+X/LIHZhLJ2U1RusE86g12NyJmytqNYueRCX72+7yqZg8DymCx6aIj8qiPw8
         6SLQ==
X-Gm-Message-State: AOAM533Lv1nGArsGdpGfJ1TYj7UyvCygSg8wlNnaaU8lqkdIID+3S+5V
        B/Y3xO6//Fs82b95xtrco4cUYUhnTVlqjF12VMPsRQ==
X-Google-Smtp-Source: ABdhPJwN6VUAoyeKBEXSZ7+YssMTmMPGp62MKEVGpKypso05r3nUnm3gJlrUmQgll/Tcrrzwth4Wa0qM7YTc+6x92lI=
X-Received: by 2002:a1c:b603:: with SMTP id g3mr16392963wmf.58.1623351012835;
 Thu, 10 Jun 2021 11:50:12 -0700 (PDT)
MIME-Version: 1.0
References: <20210610060643.595673-1-irogers@google.com> <20210610103927.44462e35@oasis.local.home>
In-Reply-To: <20210610103927.44462e35@oasis.local.home>
From:   Ian Rogers <irogers@google.com>
Date:   Thu, 10 Jun 2021 11:50:00 -0700
Message-ID: <CAP-5=fVWCpuC98O=Y3HWCEJspSMWmLwAjhBChStT4APkNboDeQ@mail.gmail.com>
Subject: Re: [RFC PATCH] libtraceevent: Increase libtraceevent logging when verbose
To:     Steven Rostedt <rostedt@goodmis.org>
Cc:     Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@redhat.com>,
        Arnaldo Carvalho de Melo <acme@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Jiri Olsa <jolsa@redhat.com>,
        Namhyung Kim <namhyung@kernel.org>,
        linux-perf-users <linux-perf-users@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Linux-trace Users <linux-trace-users@vger.kernel.org>,
        Tzvetomir Stoyanov <tz.stoyanov@gmail.com>,
        Stephane Eranian <eranian@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-trace-users.vger.kernel.org>
X-Mailing-List: linux-trace-users@vger.kernel.org

On Thu, Jun 10, 2021 at 7:39 AM Steven Rostedt <rostedt@goodmis.org> wrote:
>
> On Wed,  9 Jun 2021 23:06:43 -0700
> Ian Rogers <irogers@google.com> wrote:
>
> > libtraceevent has added more levels of debug printout and with changes
> > like:
> > https://lore.kernel.org/linux-trace-devel/20210507095022.1079364-3-tz.stoyanov@gmail.com
> > previously generated output like "registering plugin" is no longer
> > displayed. This change makes it so that if perf's verbose debug output
> > is enabled then the debug and info libtraceevent messages can be
> > displayed.
> > As this API isn't present in the deprecated tools version of
> > libtracevent I'm uploading this as an RFC.
>
> Thanks Ian,
>
> We need to start porting perf to using the upstream libtraceevent
> library. I think the best way to do that is what we did with trace-cmd.
> That is to have the make files check if the minimum version of
> libtraceevent is installed, and if so, use that instead of the local
> version. If it is not installed, produce a message encouraging the
> developer to install the upstream libtraceevent and warn that it will
> be using a deprecated older versino, then build the deprecated local
> version. After some time, we could simply remove it and make it a
> dependency, but I want to do that when all the main distros being used
> have it.
>
> Currently its in the latest Debian, Ubuntu, and Fedora. I also believe
> its in SUSE but have not checked. It's in Fedora 34, but it doesn't
> appear to be in Fedora 33. As that's not too old, I don't think we
> should make it a dependency as of yet.
>
> -- Steve

Thanks! Is there a way to do something like:

#if LIBTRACE_EVENT_API > 123
...
#endif

so that we can make sure perf is taking advantage of the improvements
in the libtraceevent API?

Ian
