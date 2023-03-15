Return-Path: <linux-trace-users-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80F5DC6FD1D
	for <linux-trace-users@archiver.kernel.org>; Wed, 15 Mar 2023 19:41:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229584AbjCOTlG (ORCPT
        <rfc822;linux-trace-users@archiver.kernel.org>);
        Wed, 15 Mar 2023 15:41:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39746 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230106AbjCOTlF (ORCPT
        <rfc822;linux-trace-users@vger.kernel.org>);
        Wed, 15 Mar 2023 15:41:05 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB75E96F24
        for <linux-trace-users@vger.kernel.org>; Wed, 15 Mar 2023 12:39:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1678909187;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=/QxZwS3lrwuWJq5aFlBgEPkIuIFjTdlps03uhSrd4aA=;
        b=Kcl17swo9Uwb5ISuiYkOmQwSPJ/ldj/qqJhqTmSKbJ0ICdu5gXS6gDiXV7BEkpoCv6YPv5
        74/vu533qXWQfu7nxM2ZEcS0o1SE2tdBVKsOxQPfnxeO8R1nk+Z4AzxZvBofw8bKvGLNN0
        MXpHr0nYLqBC5gKAyAhx80jcnoS0QUw=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-593-5NwBfBzIPzu1cm6kriv3Qg-1; Wed, 15 Mar 2023 15:39:44 -0400
X-MC-Unique: 5NwBfBzIPzu1cm6kriv3Qg-1
Received: by mail-ed1-f70.google.com with SMTP id q13-20020a5085cd000000b004af50de0bcfso28856826edh.15
        for <linux-trace-users@vger.kernel.org>; Wed, 15 Mar 2023 12:39:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678909183;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/QxZwS3lrwuWJq5aFlBgEPkIuIFjTdlps03uhSrd4aA=;
        b=d34/cc+hYD6DMjXDP3swwjzX7KruKINNt++HpSUlh5O1EW+7fu4Pqx7D/jDiTROt7R
         UKdZ3FBKl1Kid/IqXm3kjn6oGlfK0baj6TN05ZI6SefPxV9+sKSWIIsdRti8rEhL5pJV
         M9brlnFnPAyot14EpJdhpAye67INbsEeyByMSppv8nUJgTUE2iPvSGCcUpDis1JLwrRH
         Y3aXmAVxBM8m44qo4ZlwlLHTghnlJ/R9wpy19FTzvINE6+H5GMjOm7I0iGcWEUVg+XRx
         XtBGsIrRi5AsyJikpdFV/rtzqQ6bB73odnZ1jZzLmJ23eNSyNs2sSKFh64Murf1G4UhN
         CNow==
X-Gm-Message-State: AO0yUKUQE50DDnPdZLjLF9h+BtTedrsX5E3ghIxmfM1PzjhIHQO70EMD
        GfWkkB88v/+eT2z5RxRp8Fw/ceVGY6D8kxwG9u76bUuPhO8E4YT9kBRtp33MfZUhYFgfp/lxvOQ
        g6922mOk27m8I3Qdb4rddEypbPy2zJIgCiWY/PVjseNUmDJg=
X-Received: by 2002:a50:9ec9:0:b0:4ad:738b:66ff with SMTP id a67-20020a509ec9000000b004ad738b66ffmr1487041edf.2.1678909183543;
        Wed, 15 Mar 2023 12:39:43 -0700 (PDT)
X-Google-Smtp-Source: AK7set9fCYJ6AFNeFn61+5or/+1RZv7gqB4nrUxXznspTVnqTFgQTG6rRuUSZEeHskv370mjDSFgYhWdOuTcOB485RI=
X-Received: by 2002:a50:9ec9:0:b0:4ad:738b:66ff with SMTP id
 a67-20020a509ec9000000b004ad738b66ffmr1487036edf.2.1678909183331; Wed, 15 Mar
 2023 12:39:43 -0700 (PDT)
MIME-Version: 1.0
References: <alpine.DEB.2.22.394.2303120805430.2865@hadrien>
 <20230313121528.5650068b@gandalf.local.home> <87b0589-28a5-1cb5-f3ee-4d5c2e817116@inria.fr>
 <20230313135332.075af0a9@gandalf.local.home> <606f40f1-a411-b688-9136-cbc6fa95541f@inria.fr>
 <20230313142424.26107bcb@gandalf.local.home>
In-Reply-To: <20230313142424.26107bcb@gandalf.local.home>
From:   Alexander Aring <aahringo@redhat.com>
Date:   Wed, 15 Mar 2023 15:39:32 -0400
Message-ID: <CAK-6q+jfqRPVXihH7OzGJgzyjtt3g0hHEcjtBWwQVi8LHzpNzg@mail.gmail.com>
Subject: Re: CSV output
To:     Steven Rostedt <rostedt@goodmis.org>
Cc:     Julia Lawall <julia.lawall@inria.fr>,
        linux-trace-users@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-trace-users.vger.kernel.org>
X-Mailing-List: linux-trace-users@vger.kernel.org

Hi,

On Mon, Mar 13, 2023 at 2:26=E2=80=AFPM Steven Rostedt <rostedt@goodmis.org=
> wrote:
>
> On Mon, 13 Mar 2023 18:59:50 +0100 (CET)
> Julia Lawall <julia.lawall@inria.fr> wrote:
>
> > > Better yet, I'm hoping to get some time to finish looking at the pyth=
on
> > > updates that were sent to me, and where it could be possible to just =
allow
> > > you to override the output with a python script.
> >
> > OK, no hurry.  I looked into the plugins, but they seem to control only
> > part of the output and it seems that one would be needed for every type=
 of
> > event.  I could try writing python, if there is an example.
>
> The python plugins are currently broken, and we started adding more
> features to the plugins to control the output a bit more.

what about the python bindings (under trace-cmd/python/) to parse
trace files and using the python csv module? I guess the python
bindings are something different than the python plugins and they are
still working?

- Alex

