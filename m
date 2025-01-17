Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DC071FE473;
	Fri, 17 Jan 2025 13:40:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737121232; cv=none; b=ks+jAlTgo9Fhq4h09y6DKX4maRHjNoZ3J1MbdJB7NioJXus7ZFM2uheI2jYOVOFDxYAhZ7I/QkZl3XI5wTagZB7UGtbAIg0gFyZLU5u2T38jcCKHqBZs5Xy2KWoA/vl+6qBeXFomjpFPO+AILnDiCE2R0EZNRDB/WKCYEYArpy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737121232; c=relaxed/simple;
	bh=XowuiOm1cDN/J6f/CAhxTwHePcTWG6lrFibX0HdpnoM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RkNE0rK0UqkuP14yH5TWsjS4IAgm5bUXVbYiwPWepwIK2NUXM7qAQD8sW93EFsF0Bdq7KhSNe1VVeXAcUwmpnSZDpTaz/XHn5i3PeppHHKEnA6/GiFZrTbiiYJ6CTx2zHDKkMUAmaPufYAa2hkj2UqsraOGrBofi8lAzHiiJZUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2266AC4CEE1;
	Fri, 17 Jan 2025 13:40:31 +0000 (UTC)
Date: Fri, 17 Jan 2025 08:40:38 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: Alexandre Ferrieux <alexandre.ferrieux@gmail.com>
Cc: linux-trace-users@vger.kernel.org, Lorenzo Stoakes
 <lorenzo.stoakes@oracle.com>, LKML <linux-kernel@vger.kernel.org>,
 linux-mm@kvack.org
Subject: Re: Bug: broken /proc/kcore in 6.13
Message-ID: <20250117084038.79f40307@gandalf.local.home>
In-Reply-To: <05ea473e-d7e9-4ca5-ad91-ba8c00618fb4@orange.com>
References: <05ea473e-d7e9-4ca5-ad91-ba8c00618fb4@orange.com>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-trace-users@vger.kernel.org
List-Id: <linux-trace-users.vger.kernel.org>
List-Subscribe: <mailto:linux-trace-users+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-trace-users+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit


[ Cc'ing the proper folks ]

-- Steve


On Fri, 17 Jan 2025 11:36:05 +0100
Alexandre Ferrieux <alexandre.ferrieux@gmail.com> wrote:

> Hi,
> 
> Somewhere in the 6.13 branch (not bisected yet, sorry), it stopped being
> possible to disassemble the running kernel from gdb through /proc/kcore.
> 
> More precisely:
> 
>  - look up a function in /proc/kallsyms => 0xADDRESS
>  - tell gdb to "core /proc/kcore"
>  - tell gdb to "disass 0xADDRESS,+LENGTH" (no need for a symbol table)
> 
>  * if the function is within the main kernel text, it is okay
>  * if the function is within a module's text, an infinite loop happens:
> 
> 
> Example:
> 
>  # egrep -w ice_process_skb_fields\|ksys_write /proc/kallsyms
>  ffffffffaf296c80 T ksys_write
>  ffffffffc0b67180 t ice_process_skb_fields       [ice]
> 
>  # gdb -ex "core /proc/kcore" -ex "disass 0xffffffffaf296c80,+256" -ex quit
>  ...
>  Dump of assembler code from 0xffffffffaf296c80 to 0xffffffffaf296d80:
>    ...
>  End of assembler dump.
> 
>  # gdb -ex "core /proc/kcore" -ex "disass 0xffffffffc0b67180,+256" -ex quit
>  ...
>  Dump of assembler code from 0xffffffffc0b67180 to 0xffffffffc0b67280:
>  (***NOTHING***)
>  ^C <= inefficient, need kill -9
> 
> 
> Ftrace (see below) shows in this case read_kcore_iter() calls vread_iter() in an
> infinite loop:
> 
>         while (true) {
>                 read += vread_iter(iter, src, left);
>                 if (read == tsz)
>                         break;
> 
>                 src += read;
>                 left -= read;
> 
>                 if (fault_in_iov_iter_writeable(iter, left)) {
>                         ret = -EFAULT;
>                         goto out;
>                 }
>         }
> 
> As it turns out, in the offending situation, vread_iter() keeps returning 0,
> with "read" staying at its initial value of 0, and "tsz" nonzero. As a
> consequence, "src" stays stuck in a place where vread_iter() fails.
> 
> A cursory "git blame" shows that this interplay (vread_iter() legitimately
> returning zero, and read_kcore_iter() *not* testing it) has been there from
> quite some time. So, while this is arguably fragile, possibly the new situation
> lies in the actual memory layout that triggers the failing path.
> 
> Thanks for any insight, as this completely breaks debugging the running kernel
> in 6.13.
> 
> -Alex
> 
> 
> ------------
> # tracer: nop
> #
> # entries-in-buffer/entries-written: 0/0   #P:48
> #
> #           TASK-PID     CPU#     TIMESTAMP  FUNCTION
> #              | |         |         |         |
>            <...>-3304    [045]    487.295283: kprobe_read_kcore_iter:
> (read_kcore_iter+0x4/0xae0) pos=0x7fffc0b6b000
>            <...>-3304    [045]    487.295298: kprobe_vread_iter:
> (vread_iter+0x4/0x4e0) addr=0xffffffffc0b67000 len=384
>            <...>-3304    [045]    487.295326: kretprobe_vread_iter:
> (read_kcore_iter+0x3e6/0xae0 <- vread_iter) arg1=0
>            <...>-3304    [045]    487.295329: kprobe_vread_iter:
> (vread_iter+0x4/0x4e0) addr=0xffffffffc0b67000 len=384
>            <...>-3304    [045]    487.295338: kretprobe_vread_iter:
> (read_kcore_iter+0x3e6/0xae0 <- vread_iter) arg1=0
>            <...>-3304    [045]    487.295339: kprobe_vread_iter:
> (vread_iter+0x4/0x4e0) addr=0xffffffffc0b67000 len=384
>            <...>-3304    [045]    487.295345: kretprobe_vread_iter:
> (read_kcore_iter+0x3e6/0xae0 <- vread_iter) arg1=0
>            <...>-3304    [045]    487.295347: kprobe_vread_iter:
> (vread_iter+0x4/0x4e0) addr=0xffffffffc0b67000 len=384
>            <...>-3304    [045]    487.295352: kretprobe_vread_iter:
> (read_kcore_iter+0x3e6/0xae0 <- vread_iter) arg1=0
>            <...>-3304    [045]    487.295353: kprobe_vread_iter:
> (vread_iter+0x4/0x4e0) addr=0xffffffffc0b67000 len=384
> ...
> 

