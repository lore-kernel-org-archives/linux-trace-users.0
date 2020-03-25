Return-Path: <SRS0=L3+l=5K=vger.kernel.org=linux-trace-users-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B36FC2D0E5
	for <linux-trace-users@archiver.kernel.org>; Wed, 25 Mar 2020 20:39:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 570E820719
	for <linux-trace-users@archiver.kernel.org>; Wed, 25 Mar 2020 20:39:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Cq9hdcgW"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727328AbgCYUjg (ORCPT
        <rfc822;linux-trace-users@archiver.kernel.org>);
        Wed, 25 Mar 2020 16:39:36 -0400
Received: from us-smtp-delivery-74.mimecast.com ([216.205.24.74]:49607 "EHLO
        us-smtp-delivery-74.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727316AbgCYUjf (ORCPT
        <rfc822;linux-trace-users@vger.kernel.org>);
        Wed, 25 Mar 2020 16:39:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1585168774;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=R8ohNkJzGE0QZVHhw03jUfAuB8MXp2xArmenBd4tpgY=;
        b=Cq9hdcgWa0aaRGvNj+iclvvTBI+dqKI1rqP9mSkHwMJ0tXvCghd9gCnH5dpWnIbAQziE9c
        gVEBrAoM2TTeqhE73Tf5iO+41BQwKul2xsdAIB1s401Ex+VwWFcJY1/70tey6OhhrrPx+C
        6xJ7mCj7uIHxtAIBcabiO13UvOXlwNA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-341-8Kcn_jq4OAGq68er1hrMyA-1; Wed, 25 Mar 2020 16:39:29 -0400
X-MC-Unique: 8Kcn_jq4OAGq68er1hrMyA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BE795107ACCC;
        Wed, 25 Mar 2020 20:39:27 +0000 (UTC)
Received: from krava (unknown [10.40.192.119])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id 021DB5C1B0;
        Wed, 25 Mar 2020 20:39:25 +0000 (UTC)
Date:   Wed, 25 Mar 2020 21:39:21 +0100
From:   Jiri Olsa <jolsa@redhat.com>
To:     ahmadkhorrami <ahmadkhorrami@ut.ac.ir>
Cc:     Arnaldo Carvalho de Melo <acme@redhat.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Linux-trace Users <linux-trace-users@vger.kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        linux-trace-users-owner@vger.kernel.org,
        Jin Yao <yao.jin@linux.intel.com>
Subject: Re: Wrong Perf Backtraces
Message-ID: <20200325203921.GB1947699@krava>
References: <20200322203421.715b32d8@oasis.local.home>
 <21b3df4080709f193d62b159887e2a83@ut.ac.ir>
 <20200323084942.GA1534489@krava>
 <ee43289d91fcae1c9ef5cc2429dc916b@ut.ac.ir>
 <8645d3626b4714690925328ab00373d6@ut.ac.ir>
 <20200325154643.GA1934048@krava>
 <20200325185831.GB19495@redhat.com>
 <9551c616b045299482fc9e26281c1062@ut.ac.ir>
 <20200325192858.GC19495@redhat.com>
 <4ffb7e2b6e272c20616fbf133a125fdf@ut.ac.ir>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4ffb7e2b6e272c20616fbf133a125fdf@ut.ac.ir>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Sender: linux-trace-users-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-trace-users.vger.kernel.org>
X-Mailing-List: linux-trace-users@vger.kernel.org

On Thu, Mar 26, 2020 at 12:31:32AM +0430, ahmadkhorrami wrote:
> Here you are:
> perf version 5.4.7
>                  dwarf: [ on  ]  # HAVE_DWARF_SUPPORT
>     dwarf_getlocations: [ on  ]  # HAVE_DWARF_GETLOCATIONS_SUPPORT
>                  glibc: [ on  ]  # HAVE_GLIBC_SUPPORT
>                   gtk2: [ on  ]  # HAVE_GTK2_SUPPORT
>          syscall_table: [ on  ]  # HAVE_SYSCALL_TABLE_SUPPORT
>                 libbfd: [ OFF ]  # HAVE_LIBBFD_SUPPORT
>                 libelf: [ on  ]  # HAVE_LIBELF_SUPPORT
>                libnuma: [ OFF ]  # HAVE_LIBNUMA_SUPPORT
> numa_num_possible_cpus: [ OFF ]  # HAVE_LIBNUMA_SUPPORT
>                libperl: [ on  ]  # HAVE_LIBPERL_SUPPORT
>              libpython: [ on  ]  # HAVE_LIBPYTHON_SUPPORT
>               libslang: [ on  ]  # HAVE_SLANG_SUPPORT
>              libcrypto: [ on  ]  # HAVE_LIBCRYPTO_SUPPORT
>              libunwind: [ on  ]  # HAVE_LIBUNWIND_SUPPORT
>     libdw-dwarf-unwind: [ on  ]  # HAVE_DWARF_SUPPORT
>                   zlib: [ on  ]  # HAVE_ZLIB_SUPPORT
>                   lzma: [ on  ]  # HAVE_LZMA_SUPPORT
>              get_cpuid: [ on  ]  # HAVE_AUXTRACE_SUPPORT
>                    bpf: [ on  ]  # HAVE_LIBBPF_SUPPORT
>                    aio: [ on  ]  # HAVE_AIO_SUPPORT
>                   zstd: [ on  ]  # HAVE_ZSTD_SUPPORT
> and
> 	linux-vdso.so.1 (0x00007ffe55fca000)
> 	libpthread.so.0 => /lib/x86_64-linux-gnu/libpthread.so.0
> (0x00007f82758f9000)
> 	librt.so.1 => /lib/x86_64-linux-gnu/librt.so.1 (0x00007f82756f1000)
> 	libm.so.6 => /lib/x86_64-linux-gnu/libm.so.6 (0x00007f8275353000)
> 	libdl.so.2 => /lib/x86_64-linux-gnu/libdl.so.2 (0x00007f827514f000)
> 	libelf.so.1 => /usr/lib/x86_64-linux-gnu/libelf.so.1 (0x00007f8274f35000)
> 	libdw.so.1 => /usr/lib/x86_64-linux-gnu/libdw.so.1 (0x00007f8274ce9000)
> 	libunwind-x86_64.so.8 => /usr/lib/x86_64-linux-gnu/libunwind-x86_64.so.8
> (0x00007f8274aca000)
> 	libunwind.so.8 => /usr/lib/x86_64-linux-gnu/libunwind.so.8

libunwind, ok

> (0x00007f82748af000)
> 	liblzma.so.5 => /lib/x86_64-linux-gnu/liblzma.so.5 (0x00007f8274689000)
> 	libslang.so.2 => /lib/x86_64-linux-gnu/libslang.so.2 (0x00007f82741a7000)
> 	libperl.so.5.26 => /usr/lib/x86_64-linux-gnu/libperl.so.5.26
> (0x00007f8273daa000)
> 	libc.so.6 => /lib/x86_64-linux-gnu/libc.so.6 (0x00007f82739b9000)
> 	libpython2.7.so.1.0 => /usr/lib/x86_64-linux-gnu/libpython2.7.so.1.0
> (0x00007f827343c000)
> 	libz.so.1 => /lib/x86_64-linux-gnu/libz.so.1 (0x00007f827321f000)
> 	libzstd.so.1 => /usr/lib/x86_64-linux-gnu/libzstd.so.1 (0x00007f8272fa4000)
> 	/lib64/ld-linux-x86-64.so.2 (0x00007f8276427000)
> 	libbz2.so.1.0 => /lib/x86_64-linux-gnu/libbz2.so.1.0 (0x00007f8272d94000)
> 	libcrypt.so.1 => /lib/x86_64-linux-gnu/libcrypt.so.1 (0x00007f8272b5c000)
> 	libutil.so.1 => /lib/x86_64-linux-gnu/libutil.so.1 (0x00007f8272959000)
> 
> Mr. Olsa said he needs the output of perf archive.

Mr Olsa did not actualy try to open/close pdf before as you described.. let me try and I'll let you know

thanks,
jirka

