Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C339817C98
	for <linux-trace-users@vger.kernel.org>; Fri, 10 May 2024 18:12:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715364751; cv=none; b=XaQO+Ri8OYxXYqnweh5jed8NYONlExIUztBAlmgkmsPbG0GF00z5lPfEEjNJJmLsZHGl6VLN1d0tgQuySzniPHtm4Rbxfh7OwWdBQhI7WRg037+ksoTnBS6tmcWCU5xltV5Mqwc6268rQ5selfhxOIfrznHR07zBENWauApm1Dg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715364751; c=relaxed/simple;
	bh=fLyRZTSxhw6C6PnBlJDW+0bTNDMeeM3KjZ658ZLCRKo=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AvPRP1YNx8x0wklCeIcEZx/i10OnQ+X8bLa1tnu3yiX8jphDUvIO3TX2vo5enckkeJOCWeS/fJpe5DHbSpCj8YVJ1JfhzNHgQ3+etWAQm+rVxgm4oqMDd5llaKZtvaffndmOBbq0kqA/mjbqmw4zQQWoDBOb9Gbijgj2N+rL0e0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B797C2BBFC;
	Fri, 10 May 2024 18:12:31 +0000 (UTC)
Date: Fri, 10 May 2024 14:12:29 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: alexandre.ferrieux@orange.com
Cc: <linux-trace-users@vger.kernel.org>
Subject: Re: Ftrace, KASLR and gdb
Message-ID: <20240510141229.5518eb2b@rorschach.local.home>
In-Reply-To: <b3a8fb9f-7746-421e-81c7-c890d676a871@orange.com>
References: <b3a8fb9f-7746-421e-81c7-c890d676a871@orange.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-trace-users@vger.kernel.org
List-Id: <linux-trace-users.vger.kernel.org>
List-Subscribe: <mailto:linux-trace-users+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-trace-users+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 9 May 2024 14:44:22 +0200
alexandre.ferrieux@orange.com wrote:

> Hi,
> 
> Ftrace is a jewel to dig into the kernel, be it for troubleshooting, perf tuning 
> or just understanding.
> But when one needs to disassemble the running kernel (eg to move kprobes around 
> in a function, in order to understand a given code path), KASLR makes it 
> impossible for gdb to get useful symbol addresses, even with a debug image.

Really? Can't you just use a function name plus offset? For instance, I
do this all the time:

(gdb) li vfs_write+0xc3
0xffffffff812e2513 is in vfs_write (/work/git/linux-trace.git/fs/read_write.c:592).
587                     return ret;
588             if (count > MAX_RW_COUNT)
589                     count =  MAX_RW_COUNT;
590             file_start_write(file);
591             if (file->f_op->write)
592                     ret = file->f_op->write(file, buf, count, pos);
593             else if (file->f_op->write_iter)
594                     ret = new_sync_write(file, buf, count, pos);
595             else
596                     ret = -EINVAL;

(gdb) disass 0xffffffff812e2513
[..]
   0xffffffff812e250e <+190>:   call   0xffffffff82202bc0 <__x86_indirect_thunk_array>
   0xffffffff812e2513 <+195>:   mov    %rax,%r12
   0xffffffff812e2516 <+198>:   test   %r12,%r12
   0xffffffff812e2519 <+201>:   jg     0xffffffff812e257c <vfs_write+300>


And I can add a kprobe the same way:

 # cd /sys/kernel/tracing
 # echo 'p:write vfs_write+0xc3 a=%ax' > kprobe_events
 # trace-cmd start -e write
 # trace-cmd show
[..]
       trace-cmd-884     [006] d.Z..   563.447396: write: (vfs_write+0xc3/0x2b0) a=0x1
  NetworkManager-461     [000] d.Z..   564.791375: write: (vfs_write+0xc3/0x2b0) a=0x8
  NetworkManager-461     [000] d.Z..   564.791408: write: (vfs_write+0xc3/0x2b0) a=0x8


> That said, /proc/kallsyms always gives the accurate, present symbol addresses. 
> But, to my knowledge, gdb isn't able to import /proc/kallsyms as a symbol table.
> To circumvent this, I've written a small userland tool, usling libbfd, that 
> creates an ELF file out of /proc/kallsyms. Passing this ELF file to gdb instead 
> of "vmlinux", and /proc/kcore as core, then allows for a perfect gdb session on 
> the running kernel. Of course this ELF file is only valid until the next reboot, 
> but that's okay as its creation is fast.
> 
> Now, my question: did I miss an alternative ?
> 
> In other words, is there some kind of "kallsyms plug-in" for gdb somewhere ?
> Or, taking the problem from the other side, some kernel module exposing a 
> "/proc/kallsyms.elf" or similar, for direct consumption by gdb ?
> Or another method, that people routinely use for the same purpose ?
> 

Do you need the absolute address? Can't you just use the offset of functions?

-- Steve
