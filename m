Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B687012F5B3
	for <linux-trace-users@vger.kernel.org>; Tue, 16 Apr 2024 14:41:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713278497; cv=none; b=mQt5Lut0X06FsUTAjDRVArREmbJiMybgq+bh8nk4qS83AoTndCpE92ZfusZJqdZVsq2Clch6x0Fs1/0HQYLss3IfT25uRLBr+LhkmShGLADLdIGesMwF2uLg+T+ZlqdrU8Dcl00vlI7BO/ekTaADc8d6pJR3er92yvZJjmVUUTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713278497; c=relaxed/simple;
	bh=KPlmTj8D8u/6aSu5DWevXIF4WbM/cj3N2JIizJv6/Gc=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=CwVZ2C+FG3TejUh8TcYVEv7Cs9NfuowFOcoA86H/tUahIrmZLJR2Y/D3CwdYyMGOCGQduFI547+wPf4K0I+k/jXvi6S/J/Y8FOmqlViPQBuaHVzkkqk/cEsahS+AlRgwTOGgQCsOGL9wcCmRDc44egQhKipLf/YydqhAtf+Go7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=RRtrJ9cv; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="RRtrJ9cv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1713278494;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=KPlmTj8D8u/6aSu5DWevXIF4WbM/cj3N2JIizJv6/Gc=;
	b=RRtrJ9cvNth+nWZye0g+X/i77LKjQ+Nkon1sgJopxu/gO95U6M51fYsirYA4vVwDIMqiba
	c62WYvQuRDCsM5FZvaBEaPyqlMAF8LH6Ebcizipl1MjMPqwm2tkUyJJl+ooxLHNO7jR7NO
	UwM4Ykp0ZYdGgf5Quj/h+lzxdsNVkkY=
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com
 [209.85.208.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-279-e3iSMrJKNVeQ5OY9NeX1UQ-1; Tue, 16 Apr 2024 10:41:33 -0400
X-MC-Unique: e3iSMrJKNVeQ5OY9NeX1UQ-1
Received: by mail-lj1-f197.google.com with SMTP id 38308e7fff4ca-2d6fcb884bbso38220281fa.1
        for <linux-trace-users@vger.kernel.org>; Tue, 16 Apr 2024 07:41:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713278491; x=1713883291;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KPlmTj8D8u/6aSu5DWevXIF4WbM/cj3N2JIizJv6/Gc=;
        b=ZHGxAt0JB1AnRozfCUxMzJnyUi1T42x5ZkPGEhny1aaPebqK5jjo6qJEzsiLihbrMy
         9y1kFnSIYfczCNgJH1NyMOZVGLqijr0RURB/3LRHOKPViS9cOweRzG61gxGvcvzPoTRl
         2s+tXkzcQzsauqRDxpLH6xhozeZuXmNkBxg6MClFgU8qF233+UggGY+afg9KsRkCHVSj
         GHDT3be09kP76fwtF1Tu0QoYVn/b8uyzZD17NODVULxU/IL7hiMIWhaok++VKsAdnhZ7
         d3tDt9HIF0ICd2z4HUC7Sqsi8hJjMYEBWd5Cvlw+C9VbnGtenA/6k82Sh55+SXNaMBWA
         Xeug==
X-Gm-Message-State: AOJu0YwuiK8ZKCOrFKYaY4UZdAE845lR4qIEwPhwzhK4xTYEJ0mWvrCO
	IExK8zWq7+c4mYwy7wi5Tf/+J2yZMbsK5Xv0qRGN9tAP/jHxpUswBQqWlsS4xyn4DG28DLnhfld
	9wTx2WseH0/1L/c2IrOCHUsDHnGLNH1O+uUnDwqHi/7wxEuh49TQsw8cL+jTJo3mR6m0OJBkxm4
	f4dqvo5bLTIoXJiU1dn/XqDc8xGhVG6OCUUah16R2Qo4Q=
X-Received: by 2002:a2e:9b4b:0:b0:2da:7944:9547 with SMTP id o11-20020a2e9b4b000000b002da79449547mr5308583ljj.5.1713278491538;
        Tue, 16 Apr 2024 07:41:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGyxP0DNMh6WiePBkdNLTDpTMBi4WRMKxwXqQdn/ZqOjKuE6/DgNgXO6To9loqlBsWH+qn9Kii9j686lzw15yw=
X-Received: by 2002:a2e:9b4b:0:b0:2da:7944:9547 with SMTP id
 o11-20020a2e9b4b000000b002da79449547mr5308574ljj.5.1713278491189; Tue, 16 Apr
 2024 07:41:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-trace-users@vger.kernel.org
List-Id: <linux-trace-users.vger.kernel.org>
List-Subscribe: <mailto:linux-trace-users+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-trace-users+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Alexander Aring <aahringo@redhat.com>
Date: Tue, 16 Apr 2024 10:41:20 -0400
Message-ID: <CAK-6q+iAuLM35C1kZbDpS4E_61vC9A1mTpJb+nzhfX5DPUQkGg@mail.gmail.com>
Subject: RFC: using NIC DMA ring as tracing buffer?
To: linux-trace-devel@vger.kernel.org
Cc: linux-trace-users@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi all,

I have an idea about using the DMA rings of a networking card as a
tracing buffer. Hereby I want to thank the Linux community for the
discussions about how =E2=80=9Cbasically=E2=80=9D tracing buffers in Linux =
currently
works. In my minds I currently have two possible use-cases why doing
this:

1. A generic tracing buffer filtering and matching offloading engine
2. Directly transmit the tracing buffer to a remote tracer application

For example, my tracing use case DLM viewer [0], can use 1 to easily
=E2=80=9Ctag=E2=80=9D each event according to specific trace event field ke=
y/values
pairs to completely offload this handling from the CPU. The use-case 2
can be used for distributed networking tracing e.g. my tracer is on a
remote machine running and expecting time synchronized traces. There
are probably more ideas around that can be taken from the networking
subsystem. Receiving the tracing buffer (after processed through the
NIC ASIC) AF_XDP could be used to get directly the data from the NIC
DMA. Bouncing buffers should be avoided as possible. I don=E2=80=99t want t=
o
go more into the details but a NIC ASIC can be programmed, e.g.
matching is only a shift,mask and compare operation followed by an
action e.g. drop. How it will look in detail I am not sure yet, but I
hope the idea is clear so far. :)

I would simply start with trying introducing a tracing networking
interface (as my current software NIC), put trace events into skb,
loopback them into my tracing networking interface and run wireshark
on it. Then try to use software parts of the networking subsystem to
filter trace events out and see if it works in theory. Bringing it to
real hardware, doing it on real NIC DMA rings and offloading the
filter/matching operations is another future step. For my remote
tracer application and time synchronized tracing, I am sure. I can get
more metadata involved into my trace events that are coming from time
sensitive networking equipment - this is definitely something I would
like to look into.

So that's it about the idea that I have and I am asking for any comments.

Does this sound like a useful thing?

Can something already be done with splice(), etc. and direct the
tracing buffer to the NIC DMA over user space (without bouncing
buffers)?

Somebody already had a similar idea?

- Alex

[0] https://lwn.net/Articles/897257/

