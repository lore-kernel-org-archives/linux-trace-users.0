Return-Path: <SRS0=L3+l=5K=vger.kernel.org=linux-trace-users-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E5DEC2D0E5
	for <linux-trace-users@archiver.kernel.org>; Wed, 25 Mar 2020 19:29:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 54BA12076F
	for <linux-trace-users@archiver.kernel.org>; Wed, 25 Mar 2020 19:29:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="baNeTPHH"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727703AbgCYT3K (ORCPT
        <rfc822;linux-trace-users@archiver.kernel.org>);
        Wed, 25 Mar 2020 15:29:10 -0400
Received: from us-smtp-delivery-74.mimecast.com ([63.128.21.74]:27567 "EHLO
        us-smtp-delivery-74.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727736AbgCYT3J (ORCPT
        <rfc822;linux-trace-users@vger.kernel.org>);
        Wed, 25 Mar 2020 15:29:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1585164547;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=JikuSo5SvHHpVUzah7msPuaj/eiFgGy2YZdRyMF15ZI=;
        b=baNeTPHHvyFzTtAqqe8iKHl3ChiebaAC8KX2ZM7llSPU/ttPyZ9RD/kNwBAdo3+wKFhdxs
        ChEwcdSLMQU82C//qKZuDhkDphbTYUDFDqBWPa7fhgd9QZx0jtqyqW44YAWegQsRSm/Frh
        AKGwhas+qXXuR5IN5FwMuQTQ3dxEw58=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-242-4jjvu4h4OXyCvzZXy4nb3g-1; Wed, 25 Mar 2020 15:29:04 -0400
X-MC-Unique: 4jjvu4h4OXyCvzZXy4nb3g-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 191BB13FD;
        Wed, 25 Mar 2020 19:29:03 +0000 (UTC)
Received: from sandy.ghostprotocols.net (unknown [10.3.128.8])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id 374E35C1D4;
        Wed, 25 Mar 2020 19:29:02 +0000 (UTC)
Received: by sandy.ghostprotocols.net (Postfix, from userid 1000)
        id 0C180160; Wed, 25 Mar 2020 16:28:59 -0300 (BRT)
Date:   Wed, 25 Mar 2020 16:28:58 -0300
From:   Arnaldo Carvalho de Melo <acme@redhat.com>
To:     ahmadkhorrami <ahmadkhorrami@ut.ac.ir>
Cc:     Jiri Olsa <jolsa@redhat.com>, Steven Rostedt <rostedt@goodmis.org>,
        Linux-trace Users <linux-trace-users@vger.kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        linux-trace-users-owner@vger.kernel.org,
        Jin Yao <yao.jin@linux.intel.com>
Subject: Re: Wrong Perf Backtraces
Message-ID: <20200325192858.GC19495@redhat.com>
References: <157597d74ff17f781d9de7e7e3defd13@ut.ac.ir>
 <bd85fc28dfb5dcf7fc10507c3c86a56d@ut.ac.ir>
 <20200322203421.715b32d8@oasis.local.home>
 <21b3df4080709f193d62b159887e2a83@ut.ac.ir>
 <20200323084942.GA1534489@krava>
 <ee43289d91fcae1c9ef5cc2429dc916b@ut.ac.ir>
 <8645d3626b4714690925328ab00373d6@ut.ac.ir>
 <20200325154643.GA1934048@krava>
 <20200325185831.GB19495@redhat.com>
 <9551c616b045299482fc9e26281c1062@ut.ac.ir>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9551c616b045299482fc9e26281c1062@ut.ac.ir>
X-Url:  http://acmel.wordpress.com
User-Agent: Mutt/1.5.20 (2009-12-10)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Sender: linux-trace-users-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-trace-users.vger.kernel.org>
X-Mailing-List: linux-trace-users@vger.kernel.org

Em Wed, Mar 25, 2020 at 11:40:36PM +0430, ahmadkhorrami escreveu:
> Thanks. But should I attach the files to the e-mail?

Which files?

I want just that you run the commands and send us the output from them,
like I'll do here:

[acme@seventh perf]$ perf -vv
perf version 5.6.rc6.g0d33b3435253
                 dwarf: [ on  ]  # HAVE_DWARF_SUPPORT
    dwarf_getlocations: [ on  ]  # HAVE_DWARF_GETLOCATIONS_SUPPORT
                 glibc: [ on  ]  # HAVE_GLIBC_SUPPORT
                  gtk2: [ on  ]  # HAVE_GTK2_SUPPORT
         syscall_table: [ on  ]  # HAVE_SYSCALL_TABLE_SUPPORT
                libbfd: [ on  ]  # HAVE_LIBBFD_SUPPORT
                libelf: [ on  ]  # HAVE_LIBELF_SUPPORT
               libnuma: [ on  ]  # HAVE_LIBNUMA_SUPPORT
numa_num_possible_cpus: [ on  ]  # HAVE_LIBNUMA_SUPPORT
               libperl: [ on  ]  # HAVE_LIBPERL_SUPPORT
             libpython: [ on  ]  # HAVE_LIBPYTHON_SUPPORT
              libslang: [ on  ]  # HAVE_SLANG_SUPPORT
             libcrypto: [ on  ]  # HAVE_LIBCRYPTO_SUPPORT
             libunwind: [ on  ]  # HAVE_LIBUNWIND_SUPPORT
    libdw-dwarf-unwind: [ on  ]  # HAVE_DWARF_SUPPORT
                  zlib: [ on  ]  # HAVE_ZLIB_SUPPORT
                  lzma: [ on  ]  # HAVE_LZMA_SUPPORT
             get_cpuid: [ on  ]  # HAVE_AUXTRACE_SUPPORT
                   bpf: [ on  ]  # HAVE_LIBBPF_SUPPORT
                   aio: [ on  ]  # HAVE_AIO_SUPPORT
                  zstd: [ on  ]  # HAVE_ZSTD_SUPPORT
[acme@seventh perf]$ ldd ~/bin/perf
	linux-vdso.so.1 (0x00007fffcb9cc000)
	libunwind-x86_64.so.8 => /lib64/libunwind-x86_64.so.8 (0x00007f7c58d94000)
	libunwind.so.8 => /lib64/libunwind.so.8 (0x00007f7c58d7a000)
	liblzma.so.5 => /lib64/liblzma.so.5 (0x00007f7c58d51000)
	libpthread.so.0 => /lib64/libpthread.so.0 (0x00007f7c58d30000)
	librt.so.1 => /lib64/librt.so.1 (0x00007f7c58d26000)
	libm.so.6 => /lib64/libm.so.6 (0x00007f7c58be0000)
	libdl.so.2 => /lib64/libdl.so.2 (0x00007f7c58bd8000)
	libelf.so.1 => /lib64/libelf.so.1 (0x00007f7c58bbd000)
	libdw.so.1 => /lib64/libdw.so.1 (0x00007f7c58b1e000)
	libslang.so.2 => /lib64/libslang.so.2 (0x00007f7c58846000)
	libperl.so.5.28 => /lib64/libperl.so.5.28 (0x00007f7c5851e000)
	libc.so.6 => /lib64/libc.so.6 (0x00007f7c58358000)
	libpython2.7.so.1.0 => /lib64/libpython2.7.so.1.0 (0x00007f7c580ee000)
	libz.so.1 => /lib64/libz.so.1 (0x00007f7c580d4000)
	libzstd.so.1 => /lib64/libzstd.so.1 (0x00007f7c58029000)
	libcap.so.2 => /lib64/libcap.so.2 (0x00007f7c58022000)
	libnuma.so.1 => /lib64/libnuma.so.1 (0x00007f7c58014000)
	libbabeltrace-ctf.so.1 => /lib64/libbabeltrace-ctf.so.1 (0x00007f7c57fbe000)
	libgcc_s.so.1 => /lib64/libgcc_s.so.1 (0x00007f7c57fa2000)
	/lib64/ld-linux-x86-64.so.2 (0x00007f7c58dd3000)
	libbz2.so.1 => /lib64/libbz2.so.1 (0x00007f7c57f8e000)
	libcrypt.so.2 => /lib64/libcrypt.so.2 (0x00007f7c57f53000)
	libutil.so.1 => /lib64/libutil.so.1 (0x00007f7c57f4e000)
	libbabeltrace.so.1 => /lib64/libbabeltrace.so.1 (0x00007f7c57f3e000)
	libpopt.so.0 => /lib64/libpopt.so.0 (0x00007f7c57f2e000)
	libuuid.so.1 => /lib64/libuuid.so.1 (0x00007f7c57f24000)
	libgmodule-2.0.so.0 => /lib64/libgmodule-2.0.so.0 (0x00007f7c57f1e000)
	libglib-2.0.so.0 => /lib64/libglib-2.0.so.0 (0x00007f7c57dfa000)
	libpcre.so.1 => /lib64/libpcre.so.1 (0x00007f7c57d86000)
[acme@seventh perf]$

Just like a did, no attachments please.

- Arnaldo
 
> On 2020-03-25 23:28, Arnaldo Carvalho de Melo wrote:
> 
> >Em Wed, Mar 25, 2020 at 04:46:43PM +0100, Jiri Olsa escreveu: On
> >Wed, Mar 25, 2020 at 07:48:39PM +0430, ahmadkhorrami wrote: Hi,
> >
> >Could you give me some hints about where the actual problem takes
> >place? Is
> >the problem with "Perf" or the hardware part (i.e., "Hardware
> >Performance
> >Counters")? Can I revise the problem by simply modifying the code?
> >How much
> >work is needed?
> >heya,
> >might be some callchain processing bug, but I can't reproduce it
> >on my setup..
> >would you have/make some simple example that would reproduce the issue?
> >
> >Another option is that you'd send perf.data together with 'perf
> >archive' data.
> >
> >Also.. we support 2 dwarf unwinders (libunwind/libdw).. not sure
> >which one you
> >have compiled in, but would be helpful to see if the other shows
> >the same.
> 
> perf -vv
> 
> +
> 
> ldd `which perf`
> 
> Output will help us find out which unwinder is being used, as well as
> the version of perf being used.
> 
> - Arnaldo

