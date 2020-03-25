Return-Path: <SRS0=L3+l=5K=vger.kernel.org=linux-trace-users-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C658DC2D0E6
	for <linux-trace-users@archiver.kernel.org>; Wed, 25 Mar 2020 21:03:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9D1C9207FC
	for <linux-trace-users@archiver.kernel.org>; Wed, 25 Mar 2020 21:03:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="K9Ens6qd"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727389AbgCYVDS (ORCPT
        <rfc822;linux-trace-users@archiver.kernel.org>);
        Wed, 25 Mar 2020 17:03:18 -0400
Received: from us-smtp-delivery-74.mimecast.com ([216.205.24.74]:40757 "EHLO
        us-smtp-delivery-74.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727280AbgCYVDS (ORCPT
        <rfc822;linux-trace-users@vger.kernel.org>);
        Wed, 25 Mar 2020 17:03:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1585170196;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=3h0FLSm5u4il0rhBkBm8p6NAu5Ogm2X3aFiQmbHBoQo=;
        b=K9Ens6qdZ1awLSvkGMkG5Ik4D+e5RUNGa42Bd6f7c+rtoGFFV6D2xdieQnTW1McfQgwiGR
        NPHYGbaQwJPK/CGp8ZR03l2+oNcVPkuSiURXFj7fNc4FMc+c5KaXyfJXTrMgpp+uuK8HQQ
        bY7V9WvKijiajk/Ydto51AECdsI39HM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-41-RrygxUd7OuiO3syGfQVjvg-1; Wed, 25 Mar 2020 17:03:00 -0400
X-MC-Unique: RrygxUd7OuiO3syGfQVjvg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 825C88017DF;
        Wed, 25 Mar 2020 21:02:58 +0000 (UTC)
Received: from krava (unknown [10.40.192.119])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id B738A953AF;
        Wed, 25 Mar 2020 21:02:56 +0000 (UTC)
Date:   Wed, 25 Mar 2020 22:02:52 +0100
From:   Jiri Olsa <jolsa@redhat.com>
To:     ahmadkhorrami <ahmadkhorrami@ut.ac.ir>
Cc:     Arnaldo Carvalho de Melo <acme@redhat.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Linux-trace Users <linux-trace-users@vger.kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        linux-trace-users-owner@vger.kernel.org,
        Jin Yao <yao.jin@linux.intel.com>
Subject: Re: Wrong Perf Backtraces
Message-ID: <20200325210252.GC1947699@krava>
References: <21b3df4080709f193d62b159887e2a83@ut.ac.ir>
 <20200323084942.GA1534489@krava>
 <ee43289d91fcae1c9ef5cc2429dc916b@ut.ac.ir>
 <8645d3626b4714690925328ab00373d6@ut.ac.ir>
 <20200325154643.GA1934048@krava>
 <20200325185831.GB19495@redhat.com>
 <9551c616b045299482fc9e26281c1062@ut.ac.ir>
 <20200325192858.GC19495@redhat.com>
 <4ffb7e2b6e272c20616fbf133a125fdf@ut.ac.ir>
 <20200325203921.GB1947699@krava>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200325203921.GB1947699@krava>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Sender: linux-trace-users-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-trace-users.vger.kernel.org>
X-Mailing-List: linux-trace-users@vger.kernel.org

On Wed, Mar 25, 2020 at 09:39:27PM +0100, Jiri Olsa wrote:
> On Thu, Mar 26, 2020 at 12:31:32AM +0430, ahmadkhorrami wrote:
> > Here you are:
> > perf version 5.4.7
> >                  dwarf: [ on  ]  # HAVE_DWARF_SUPPORT
> >     dwarf_getlocations: [ on  ]  # HAVE_DWARF_GETLOCATIONS_SUPPORT
> >                  glibc: [ on  ]  # HAVE_GLIBC_SUPPORT
> >                   gtk2: [ on  ]  # HAVE_GTK2_SUPPORT
> >          syscall_table: [ on  ]  # HAVE_SYSCALL_TABLE_SUPPORT
> >                 libbfd: [ OFF ]  # HAVE_LIBBFD_SUPPORT
> >                 libelf: [ on  ]  # HAVE_LIBELF_SUPPORT
> >                libnuma: [ OFF ]  # HAVE_LIBNUMA_SUPPORT
> > numa_num_possible_cpus: [ OFF ]  # HAVE_LIBNUMA_SUPPORT
> >                libperl: [ on  ]  # HAVE_LIBPERL_SUPPORT
> >              libpython: [ on  ]  # HAVE_LIBPYTHON_SUPPORT
> >               libslang: [ on  ]  # HAVE_SLANG_SUPPORT
> >              libcrypto: [ on  ]  # HAVE_LIBCRYPTO_SUPPORT
> >              libunwind: [ on  ]  # HAVE_LIBUNWIND_SUPPORT
> >     libdw-dwarf-unwind: [ on  ]  # HAVE_DWARF_SUPPORT
> >                   zlib: [ on  ]  # HAVE_ZLIB_SUPPORT
> >                   lzma: [ on  ]  # HAVE_LZMA_SUPPORT
> >              get_cpuid: [ on  ]  # HAVE_AUXTRACE_SUPPORT
> >                    bpf: [ on  ]  # HAVE_LIBBPF_SUPPORT
> >                    aio: [ on  ]  # HAVE_AIO_SUPPORT
> >                   zstd: [ on  ]  # HAVE_ZSTD_SUPPORT
> > and
> > 	linux-vdso.so.1 (0x00007ffe55fca000)
> > 	libpthread.so.0 => /lib/x86_64-linux-gnu/libpthread.so.0
> > (0x00007f82758f9000)
> > 	librt.so.1 => /lib/x86_64-linux-gnu/librt.so.1 (0x00007f82756f1000)
> > 	libm.so.6 => /lib/x86_64-linux-gnu/libm.so.6 (0x00007f8275353000)
> > 	libdl.so.2 => /lib/x86_64-linux-gnu/libdl.so.2 (0x00007f827514f000)
> > 	libelf.so.1 => /usr/lib/x86_64-linux-gnu/libelf.so.1 (0x00007f8274f35000)
> > 	libdw.so.1 => /usr/lib/x86_64-linux-gnu/libdw.so.1 (0x00007f8274ce9000)
> > 	libunwind-x86_64.so.8 => /usr/lib/x86_64-linux-gnu/libunwind-x86_64.so.8
> > (0x00007f8274aca000)
> > 	libunwind.so.8 => /usr/lib/x86_64-linux-gnu/libunwind.so.8
> 
> libunwind, ok
> 
> > (0x00007f82748af000)
> > 	liblzma.so.5 => /lib/x86_64-linux-gnu/liblzma.so.5 (0x00007f8274689000)
> > 	libslang.so.2 => /lib/x86_64-linux-gnu/libslang.so.2 (0x00007f82741a7000)
> > 	libperl.so.5.26 => /usr/lib/x86_64-linux-gnu/libperl.so.5.26
> > (0x00007f8273daa000)
> > 	libc.so.6 => /lib/x86_64-linux-gnu/libc.so.6 (0x00007f82739b9000)
> > 	libpython2.7.so.1.0 => /usr/lib/x86_64-linux-gnu/libpython2.7.so.1.0
> > (0x00007f827343c000)
> > 	libz.so.1 => /lib/x86_64-linux-gnu/libz.so.1 (0x00007f827321f000)
> > 	libzstd.so.1 => /usr/lib/x86_64-linux-gnu/libzstd.so.1 (0x00007f8272fa4000)
> > 	/lib64/ld-linux-x86-64.so.2 (0x00007f8276427000)
> > 	libbz2.so.1.0 => /lib/x86_64-linux-gnu/libbz2.so.1.0 (0x00007f8272d94000)
> > 	libcrypt.so.1 => /lib/x86_64-linux-gnu/libcrypt.so.1 (0x00007f8272b5c000)
> > 	libutil.so.1 => /lib/x86_64-linux-gnu/libutil.so.1 (0x00007f8272959000)
> > 
> > Mr. Olsa said he needs the output of perf archive.
> 
> Mr Olsa did not actualy try to open/close pdf before as you described.. let me try and I'll let you know

yea, no luck.. so if you could generate some reasonable small perf.data that
shows the issue and send it over together with 'perf archive' data privately
to me and to whoever else ask for it, so we don't polute the list..

or if you could put it somewhere on the web/ftp.. that'd be best

thanks,
jirka

