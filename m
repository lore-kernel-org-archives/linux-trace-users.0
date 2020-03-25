Return-Path: <SRS0=L3+l=5K=vger.kernel.org=linux-trace-users-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71F3CC2D0E5
	for <linux-trace-users@archiver.kernel.org>; Wed, 25 Mar 2020 20:01:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 450222074D
	for <linux-trace-users@archiver.kernel.org>; Wed, 25 Mar 2020 20:01:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727275AbgCYUBj (ORCPT
        <rfc822;linux-trace-users@archiver.kernel.org>);
        Wed, 25 Mar 2020 16:01:39 -0400
Received: from mail.ut.ac.ir ([80.66.177.10]:32858 "EHLO mail.ut.ac.ir"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727236AbgCYUBi (ORCPT
        <rfc822;linux-trace-users@vger.kernel.org>);
        Wed, 25 Mar 2020 16:01:38 -0400
Received: from localhost (localhost [127.0.0.1])
        by mail.ut.ac.ir (Postfix) with ESMTP id 539291DAE6C;
        Thu, 26 Mar 2020 00:31:34 +0430 (+0430)
Received: from mail.ut.ac.ir ([127.0.0.1])
        by localhost (mail.ut.ac.ir [127.0.0.1]) (amavisd-new, port 10024)
        with LMTP id SXOLiMCHFFiQ; Thu, 26 Mar 2020 00:31:33 +0430 (+0430)
Received: from mail.ut.ac.ir (mail.ut.ac.ir [194.225.0.10])
        by mail.ut.ac.ir (Postfix) with ESMTP id 110271DAE31;
        Thu, 26 Mar 2020 00:31:32 +0430 (+0430)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Thu, 26 Mar 2020 00:31:32 +0430
From:   ahmadkhorrami <ahmadkhorrami@ut.ac.ir>
To:     Arnaldo Carvalho de Melo <acme@redhat.com>
Cc:     Jiri Olsa <jolsa@redhat.com>, Steven Rostedt <rostedt@goodmis.org>,
        Linux-trace Users <linux-trace-users@vger.kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        linux-trace-users-owner@vger.kernel.org,
        Jin Yao <yao.jin@linux.intel.com>
Subject: Re: Wrong Perf Backtraces
In-Reply-To: <20200325192858.GC19495@redhat.com>
References: <157597d74ff17f781d9de7e7e3defd13@ut.ac.ir>
 <bd85fc28dfb5dcf7fc10507c3c86a56d@ut.ac.ir>
 <20200322203421.715b32d8@oasis.local.home>
 <21b3df4080709f193d62b159887e2a83@ut.ac.ir> <20200323084942.GA1534489@krava>
 <ee43289d91fcae1c9ef5cc2429dc916b@ut.ac.ir>
 <8645d3626b4714690925328ab00373d6@ut.ac.ir> <20200325154643.GA1934048@krava>
 <20200325185831.GB19495@redhat.com>
 <9551c616b045299482fc9e26281c1062@ut.ac.ir>
 <20200325192858.GC19495@redhat.com>
Message-ID: <4ffb7e2b6e272c20616fbf133a125fdf@ut.ac.ir>
X-Sender: ahmadkhorrami@ut.ac.ir
User-Agent: Roundcube Webmail/1.3.6
Sender: linux-trace-users-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-trace-users.vger.kernel.org>
X-Mailing-List: linux-trace-users@vger.kernel.org

Here you are:
perf version 5.4.7
                  dwarf: [ on  ]  # HAVE_DWARF_SUPPORT
     dwarf_getlocations: [ on  ]  # HAVE_DWARF_GETLOCATIONS_SUPPORT
                  glibc: [ on  ]  # HAVE_GLIBC_SUPPORT
                   gtk2: [ on  ]  # HAVE_GTK2_SUPPORT
          syscall_table: [ on  ]  # HAVE_SYSCALL_TABLE_SUPPORT
                 libbfd: [ OFF ]  # HAVE_LIBBFD_SUPPORT
                 libelf: [ on  ]  # HAVE_LIBELF_SUPPORT
                libnuma: [ OFF ]  # HAVE_LIBNUMA_SUPPORT
numa_num_possible_cpus: [ OFF ]  # HAVE_LIBNUMA_SUPPORT
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
and
	linux-vdso.so.1 (0x00007ffe55fca000)
	libpthread.so.0 => /lib/x86_64-linux-gnu/libpthread.so.0 
(0x00007f82758f9000)
	librt.so.1 => /lib/x86_64-linux-gnu/librt.so.1 (0x00007f82756f1000)
	libm.so.6 => /lib/x86_64-linux-gnu/libm.so.6 (0x00007f8275353000)
	libdl.so.2 => /lib/x86_64-linux-gnu/libdl.so.2 (0x00007f827514f000)
	libelf.so.1 => /usr/lib/x86_64-linux-gnu/libelf.so.1 
(0x00007f8274f35000)
	libdw.so.1 => /usr/lib/x86_64-linux-gnu/libdw.so.1 (0x00007f8274ce9000)
	libunwind-x86_64.so.8 => 
/usr/lib/x86_64-linux-gnu/libunwind-x86_64.so.8 (0x00007f8274aca000)
	libunwind.so.8 => /usr/lib/x86_64-linux-gnu/libunwind.so.8 
(0x00007f82748af000)
	liblzma.so.5 => /lib/x86_64-linux-gnu/liblzma.so.5 (0x00007f8274689000)
	libslang.so.2 => /lib/x86_64-linux-gnu/libslang.so.2 
(0x00007f82741a7000)
	libperl.so.5.26 => /usr/lib/x86_64-linux-gnu/libperl.so.5.26 
(0x00007f8273daa000)
	libc.so.6 => /lib/x86_64-linux-gnu/libc.so.6 (0x00007f82739b9000)
	libpython2.7.so.1.0 => /usr/lib/x86_64-linux-gnu/libpython2.7.so.1.0 
(0x00007f827343c000)
	libz.so.1 => /lib/x86_64-linux-gnu/libz.so.1 (0x00007f827321f000)
	libzstd.so.1 => /usr/lib/x86_64-linux-gnu/libzstd.so.1 
(0x00007f8272fa4000)
	/lib64/ld-linux-x86-64.so.2 (0x00007f8276427000)
	libbz2.so.1.0 => /lib/x86_64-linux-gnu/libbz2.so.1.0 
(0x00007f8272d94000)
	libcrypt.so.1 => /lib/x86_64-linux-gnu/libcrypt.so.1 
(0x00007f8272b5c000)
	libutil.so.1 => /lib/x86_64-linux-gnu/libutil.so.1 (0x00007f8272959000)

Mr. Olsa said he needs the output of perf archive.
Regards.

On 2020-03-25 23:58, Arnaldo Carvalho de Melo wrote:

> Em Wed, Mar 25, 2020 at 11:40:36PM +0430, ahmadkhorrami escreveu:
> 
>> Thanks. But should I attach the files to the e-mail?
> 
> Which files?
> 
> I want just that you run the commands and send us the output from them,
> like I'll do here:
> 
> [acme@seventh perf]$ perf -vv
> perf version 5.6.rc6.g0d33b3435253
> dwarf: [ on  ]  # HAVE_DWARF_SUPPORT
> dwarf_getlocations: [ on  ]  # HAVE_DWARF_GETLOCATIONS_SUPPORT
> glibc: [ on  ]  # HAVE_GLIBC_SUPPORT
> gtk2: [ on  ]  # HAVE_GTK2_SUPPORT
> syscall_table: [ on  ]  # HAVE_SYSCALL_TABLE_SUPPORT
> libbfd: [ on  ]  # HAVE_LIBBFD_SUPPORT
> libelf: [ on  ]  # HAVE_LIBELF_SUPPORT
> libnuma: [ on  ]  # HAVE_LIBNUMA_SUPPORT
> numa_num_possible_cpus: [ on  ]  # HAVE_LIBNUMA_SUPPORT
> libperl: [ on  ]  # HAVE_LIBPERL_SUPPORT
> libpython: [ on  ]  # HAVE_LIBPYTHON_SUPPORT
> libslang: [ on  ]  # HAVE_SLANG_SUPPORT
> libcrypto: [ on  ]  # HAVE_LIBCRYPTO_SUPPORT
> libunwind: [ on  ]  # HAVE_LIBUNWIND_SUPPORT
> libdw-dwarf-unwind: [ on  ]  # HAVE_DWARF_SUPPORT
> zlib: [ on  ]  # HAVE_ZLIB_SUPPORT
> lzma: [ on  ]  # HAVE_LZMA_SUPPORT
> get_cpuid: [ on  ]  # HAVE_AUXTRACE_SUPPORT
> bpf: [ on  ]  # HAVE_LIBBPF_SUPPORT
> aio: [ on  ]  # HAVE_AIO_SUPPORT
> zstd: [ on  ]  # HAVE_ZSTD_SUPPORT
> [acme@seventh perf]$ ldd ~/bin/perf
> linux-vdso.so.1 (0x00007fffcb9cc000)
> libunwind-x86_64.so.8 => /lib64/libunwind-x86_64.so.8 
> (0x00007f7c58d94000)
> libunwind.so.8 => /lib64/libunwind.so.8 (0x00007f7c58d7a000)
> liblzma.so.5 => /lib64/liblzma.so.5 (0x00007f7c58d51000)
> libpthread.so.0 => /lib64/libpthread.so.0 (0x00007f7c58d30000)
> librt.so.1 => /lib64/librt.so.1 (0x00007f7c58d26000)
> libm.so.6 => /lib64/libm.so.6 (0x00007f7c58be0000)
> libdl.so.2 => /lib64/libdl.so.2 (0x00007f7c58bd8000)
> libelf.so.1 => /lib64/libelf.so.1 (0x00007f7c58bbd000)
> libdw.so.1 => /lib64/libdw.so.1 (0x00007f7c58b1e000)
> libslang.so.2 => /lib64/libslang.so.2 (0x00007f7c58846000)
> libperl.so.5.28 => /lib64/libperl.so.5.28 (0x00007f7c5851e000)
> libc.so.6 => /lib64/libc.so.6 (0x00007f7c58358000)
> libpython2.7.so.1.0 => /lib64/libpython2.7.so.1.0 (0x00007f7c580ee000)
> libz.so.1 => /lib64/libz.so.1 (0x00007f7c580d4000)
> libzstd.so.1 => /lib64/libzstd.so.1 (0x00007f7c58029000)
> libcap.so.2 => /lib64/libcap.so.2 (0x00007f7c58022000)
> libnuma.so.1 => /lib64/libnuma.so.1 (0x00007f7c58014000)
> libbabeltrace-ctf.so.1 => /lib64/libbabeltrace-ctf.so.1 
> (0x00007f7c57fbe000)
> libgcc_s.so.1 => /lib64/libgcc_s.so.1 (0x00007f7c57fa2000)
> /lib64/ld-linux-x86-64.so.2 (0x00007f7c58dd3000)
> libbz2.so.1 => /lib64/libbz2.so.1 (0x00007f7c57f8e000)
> libcrypt.so.2 => /lib64/libcrypt.so.2 (0x00007f7c57f53000)
> libutil.so.1 => /lib64/libutil.so.1 (0x00007f7c57f4e000)
> libbabeltrace.so.1 => /lib64/libbabeltrace.so.1 (0x00007f7c57f3e000)
> libpopt.so.0 => /lib64/libpopt.so.0 (0x00007f7c57f2e000)
> libuuid.so.1 => /lib64/libuuid.so.1 (0x00007f7c57f24000)
> libgmodule-2.0.so.0 => /lib64/libgmodule-2.0.so.0 (0x00007f7c57f1e000)
> libglib-2.0.so.0 => /lib64/libglib-2.0.so.0 (0x00007f7c57dfa000)
> libpcre.so.1 => /lib64/libpcre.so.1 (0x00007f7c57d86000)
> [acme@seventh perf]$
> 
> Just like a did, no attachments please.
> 
> - Arnaldo
> On 2020-03-25 23:28, Arnaldo Carvalho de Melo wrote:
> 
> Em Wed, Mar 25, 2020 at 04:46:43PM +0100, Jiri Olsa escreveu: On
> Wed, Mar 25, 2020 at 07:48:39PM +0430, ahmadkhorrami wrote: Hi,
> 
> Could you give me some hints about where the actual problem takes
> place? Is
> the problem with "Perf" or the hardware part (i.e., "Hardware
> Performance
> Counters")? Can I revise the problem by simply modifying the code?
> How much
> work is needed?
> heya,
> might be some callchain processing bug, but I can't reproduce it
> on my setup..
> would you have/make some simple example that would reproduce the issue?
> 
> Another option is that you'd send perf.data together with 'perf
> archive' data.
> 
> Also.. we support 2 dwarf unwinders (libunwind/libdw).. not sure
> which one you
> have compiled in, but would be helpful to see if the other shows
> the same.
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
