Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A297A23CB
	for <linux-trace-users@vger.kernel.org>; Mon, 13 May 2024 16:25:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715617525; cv=none; b=kxOUqDZj0rdz5yDgrWxEJlx5rVhmNj/Kgt8+Wt1s2Vf62fSizD25g2+KxfF22PT7M3BMibXGrlqQkRLo6AzawdFkEaFkbIyVE1InSiX1hvdhQgelqiblUqoQkHMEipJJFJkXC4Oy4kHoEUMnytPFhOztAHWxmGOe9vqUQCyvjwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715617525; c=relaxed/simple;
	bh=3l6ZsO7Do0xub9bMawc4zcRZDVxsnRPG3P9lztJ6Oko=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Mvn1pXFvN48lD5Sv6FpEul2tFIy+0QvX/DirL1mmDYNIBCzssQKBzL37bZailCeZ8Ser5GuLej4o/CLbGOqsTTitbC5JbiSpGroE4MEreGn8jQ9F+2m2guSlxUSWwfGbnDe4uELbtCb1nvCTbdkX8duaXkjxxkNJ5NOM1VtyOgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E20DC113CC;
	Mon, 13 May 2024 16:25:25 +0000 (UTC)
Date: Mon, 13 May 2024 12:25:22 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: alexandre.ferrieux@orange.com
Cc: linux-trace-users@vger.kernel.org
Subject: Re: Ftrace, KASLR and gdb
Message-ID: <20240513122522.5c80ab0f@rorschach.local.home>
In-Reply-To: <738bfcbf-3f46-4ef4-8f10-057000bf07f6@orange.com>
References: <b3a8fb9f-7746-421e-81c7-c890d676a871@orange.com>
	<20240510141229.5518eb2b@rorschach.local.home>
	<738bfcbf-3f46-4ef4-8f10-057000bf07f6@orange.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-trace-users@vger.kernel.org
List-Id: <linux-trace-users.vger.kernel.org>
List-Subscribe: <mailto:linux-trace-users+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-trace-users+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sun, 12 May 2024 00:44:27 +0200
alexandre.ferrieux@orange.com wrote:

> 
> The problem is rather, on the gdb side, with a production kernel (not the one 
> you've just compiled), on a random machine you have a passing access to. First, 
> the kernel itself is compressed (vmlinuz), and in many cases getting the vmlinux 
> is a pain. So, what ELF binary do you pass to gdb ?
> 
> In my case:
> 
>    sym2elf /proc/kallsyms > /tmp/kallsyms.elf
>    gdb /tmp/kallsyms.elf /proc/kcore
>    (gdb) disass vfs_write

Ah, so you are running gdb on the live kernel.

>    ...
> 
> As an added bonus, I see (a snapshot of) globals:
> 
>    (gdb) p *(int *)jiffies
>    $1 = 92299928
> 
> And also I see ftrace's surgical changes if by accident I disassemble a function 
> I currently am sniffing ;-)
> 
>     echo "p:kprobe_tpacket_rcv tpacket_rcv+26 skb=%di:x64" >> kprobe_events
>     (gdb) disass tcpaket_rcv
>     Dump of assembler code for function tpacket_rcv:
>       0xffffffffb9d79e10 <+0>:     endbr64
>       ...
>       0xffffffffb9d79e2a <+26>:    jmp    0xffffffffc1389000 <kprobe_optinsn_page>
> 
> Of course the latter only serves my curiosity; but it shows I'm looking at the 
> "live" code. It matters in other cases of dynamic code, like static branches.

Yep.

> 
> So, is there currently another method to reach the same effect ?

Besides kgdb (usually another machine connected to the live kernel),
this is probably the only way to do what you want.

-- Steve
