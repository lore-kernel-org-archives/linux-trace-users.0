Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B7941F9F72
	for <linux-trace-users@vger.kernel.org>; Fri, 17 Jan 2025 10:36:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737110183; cv=none; b=uS+SPdiAxjUfmAN/3v8bRR1wOB0IURSz93jvPWWkvkPu6uqeTI8sNqGIa3WAH2x7s1sZ9OE7E76Tb1T8zE8OHmk3wt3lQY8ZLyJHis9eiaXGJSTFU/ruaU2CQj07cZo8MnTXVsa/bQK0sBlq9Fsa6i3Oo3XJOutglHUDtM5PM2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737110183; c=relaxed/simple;
	bh=55vMtvGlqBStv/co4PmKNeaqZv04UHZz2LDrR/Ong+s=;
	h=From:Message-ID:Date:MIME-Version:To:Subject:Content-Type; b=pj/yHpKqBHg1yCcUy96zxqDTrAXJow1DJ48WR2gVWMeILrWGYDYJLUK/8RXK2e3mq6Ty5Rs9H0N6z0UI8yIV0KbgumFQMaZqN033fp4XSZy7qjUKeK71isRZX5bPDcLCy7OYX8luZzASxpPVyeu6xyFIEnqvlxRL0cCngPOXypo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Qr4QD01Y; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Qr4QD01Y"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5da12292b67so3296075a12.3
        for <linux-trace-users@vger.kernel.org>; Fri, 17 Jan 2025 02:36:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737110179; x=1737714979; darn=vger.kernel.org;
        h=content-transfer-encoding:organization:subject:to:content-language
         :user-agent:mime-version:date:message-id:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=3vcUGC5FDmFwCdvVpy3586vz21z9mJiYJHaD31yGWck=;
        b=Qr4QD01YnZYs6DNRuV6DoLTGmpFxzdJRgv4BiMR7XOmf9DR/MPQj2W90wHYt1luJNe
         NewY1dSpueOW7vGH2Zu2L+l39Ac7rAPZWblAjCdXVYb/+NqZQZm92UczHnPWa3oOVEsK
         WycjztaILuRnelXMVKdj04BkSDoWrS/vBSJzfYr4EZVzQDu6JZaVRV7HASLBVElH+Xt1
         01VIOybt64NqXstrHheALQDtGqmsDmtnlF1Fxft7fJm5Fj6ujhZUzsWORUYVlAVCfPXZ
         BdHYeYQyVlw/2efAes/+WQ7dLXKkNubO7XeeNqrBHgWGf3u0gHTaOGWg/Q7n2ozMZbaC
         dUDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737110179; x=1737714979;
        h=content-transfer-encoding:organization:subject:to:content-language
         :user-agent:mime-version:date:message-id:from:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3vcUGC5FDmFwCdvVpy3586vz21z9mJiYJHaD31yGWck=;
        b=QPGgpCh1Ma1EWRDU1AElpVczdbh2l+BJr/yxtdGsXvoo5Zpwmt7w1R5fRvP1lnbpe0
         j6JZuhbQTl3xzcRzxMHNOu/oo1N4njeB3QzgqUcYq/QdDg57OEIId8DiSSurqwmj+yRX
         AUWdqYEIQ1sIVzMIqlXFkSu/1aeERf69e096PKrAO1M15aKn6JqxwEqpPuu2ZkBNljoH
         kMWbi05PQ7Br5ZgRWApKZ7isyV4l4XsoM92q72Z+K9T1v/+b3kaWymahtZebuvNvcVm3
         qZCP6u9V9/tTgYtA7+B9ZNy1TWRhifEgw/4MjEDJwAS0iM6JGVYvhVGENUXJ0zXgr9M0
         OYjA==
X-Gm-Message-State: AOJu0YxYk8Wt38N+w+nRKgB2sOw9kXfSyI07cMvbg7lb05NzHkcMAsli
	5IYY3xj2g1Aqqnvus2pLu3+h1UzwdHN38X3iebLAEoZCjgxS1liJR1u87g==
X-Gm-Gg: ASbGncsU/UXdU2+uR59fp0xZQ4jsvGWwGS5fCQNE/QsLunoAVg4qCQh2sOE9hfyaNTr
	y4r/VTfBgIPwPxOGfvkuNdn+zBx3pwXOWIxxLJOF8OiKAn//2CMUjBohb1LFCy6OXB168Coh+KS
	8hyboNzUL2yrExtGp+h8UGA7QOw2xtvAUYNBlIcJuX1OPvah7MJX0ZyiU3APOAzb1zBAMZNYzlq
	Yqez+bdA9+WDG1QR7MgWMHbqOPImlVHopGcXXIm/m3Nt+U4Rfkf+cBvhLMWE9nk2F54kN+hq9sQ
	FTLBrg==
X-Google-Smtp-Source: AGHT+IFx6AckOGiamO6C1fRZ2/xk2DBQSesP1Wo6kszfj9PCpFRfjcPots28NTbUN4BqJWigmqGoCg==
X-Received: by 2002:a05:6402:2101:b0:5d1:2377:5af3 with SMTP id 4fb4d7f45d1cf-5db7d2dc12amr4725160a12.5.1737110179228;
        Fri, 17 Jan 2025 02:36:19 -0800 (PST)
Received: from [127.0.0.1] ([193.252.113.11])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5db73642597sm1272270a12.11.2025.01.17.02.36.17
        for <linux-trace-users@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Jan 2025 02:36:17 -0800 (PST)
From: Alexandre Ferrieux <alexandre.ferrieux@gmail.com>
X-Google-Original-From: Alexandre Ferrieux <alexandre.ferrieux@orange.com>
Message-ID: <05ea473e-d7e9-4ca5-ad91-ba8c00618fb4@orange.com>
Date: Fri, 17 Jan 2025 11:36:05 +0100
Precedence: bulk
X-Mailing-List: linux-trace-users@vger.kernel.org
List-Id: <linux-trace-users.vger.kernel.org>
List-Subscribe: <mailto:linux-trace-users+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-trace-users+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
X-Mozilla-News-Host: news://127.0.0.1:1119
Content-Language: fr, en-US
To: linux-trace-users@vger.kernel.org
Subject: Bug: broken /proc/kcore in 6.13
Organization: Orange
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

Somewhere in the 6.13 branch (not bisected yet, sorry), it stopped being
possible to disassemble the running kernel from gdb through /proc/kcore.

More precisely:

 - look up a function in /proc/kallsyms => 0xADDRESS
 - tell gdb to "core /proc/kcore"
 - tell gdb to "disass 0xADDRESS,+LENGTH" (no need for a symbol table)

 * if the function is within the main kernel text, it is okay
 * if the function is within a module's text, an infinite loop happens:


Example:

 # egrep -w ice_process_skb_fields\|ksys_write /proc/kallsyms
 ffffffffaf296c80 T ksys_write
 ffffffffc0b67180 t ice_process_skb_fields       [ice]

 # gdb -ex "core /proc/kcore" -ex "disass 0xffffffffaf296c80,+256" -ex quit
 ...
 Dump of assembler code from 0xffffffffaf296c80 to 0xffffffffaf296d80:
   ...
 End of assembler dump.

 # gdb -ex "core /proc/kcore" -ex "disass 0xffffffffc0b67180,+256" -ex quit
 ...
 Dump of assembler code from 0xffffffffc0b67180 to 0xffffffffc0b67280:
 (***NOTHING***)
 ^C <= inefficient, need kill -9


Ftrace (see below) shows in this case read_kcore_iter() calls vread_iter() in an
infinite loop:

        while (true) {
                read += vread_iter(iter, src, left);
                if (read == tsz)
                        break;

                src += read;
                left -= read;

                if (fault_in_iov_iter_writeable(iter, left)) {
                        ret = -EFAULT;
                        goto out;
                }
        }

As it turns out, in the offending situation, vread_iter() keeps returning 0,
with "read" staying at its initial value of 0, and "tsz" nonzero. As a
consequence, "src" stays stuck in a place where vread_iter() fails.

A cursory "git blame" shows that this interplay (vread_iter() legitimately
returning zero, and read_kcore_iter() *not* testing it) has been there from
quite some time. So, while this is arguably fragile, possibly the new situation
lies in the actual memory layout that triggers the failing path.

Thanks for any insight, as this completely breaks debugging the running kernel
in 6.13.

-Alex


------------
# tracer: nop
#
# entries-in-buffer/entries-written: 0/0   #P:48
#
#           TASK-PID     CPU#     TIMESTAMP  FUNCTION
#              | |         |         |         |
           <...>-3304    [045]    487.295283: kprobe_read_kcore_iter:
(read_kcore_iter+0x4/0xae0) pos=0x7fffc0b6b000
           <...>-3304    [045]    487.295298: kprobe_vread_iter:
(vread_iter+0x4/0x4e0) addr=0xffffffffc0b67000 len=384
           <...>-3304    [045]    487.295326: kretprobe_vread_iter:
(read_kcore_iter+0x3e6/0xae0 <- vread_iter) arg1=0
           <...>-3304    [045]    487.295329: kprobe_vread_iter:
(vread_iter+0x4/0x4e0) addr=0xffffffffc0b67000 len=384
           <...>-3304    [045]    487.295338: kretprobe_vread_iter:
(read_kcore_iter+0x3e6/0xae0 <- vread_iter) arg1=0
           <...>-3304    [045]    487.295339: kprobe_vread_iter:
(vread_iter+0x4/0x4e0) addr=0xffffffffc0b67000 len=384
           <...>-3304    [045]    487.295345: kretprobe_vread_iter:
(read_kcore_iter+0x3e6/0xae0 <- vread_iter) arg1=0
           <...>-3304    [045]    487.295347: kprobe_vread_iter:
(vread_iter+0x4/0x4e0) addr=0xffffffffc0b67000 len=384
           <...>-3304    [045]    487.295352: kretprobe_vread_iter:
(read_kcore_iter+0x3e6/0xae0 <- vread_iter) arg1=0
           <...>-3304    [045]    487.295353: kprobe_vread_iter:
(vread_iter+0x4/0x4e0) addr=0xffffffffc0b67000 len=384
...

