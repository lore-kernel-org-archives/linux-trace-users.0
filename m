Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94ECF42AA5
	for <linux-trace-users@vger.kernel.org>; Tue, 30 Apr 2024 13:35:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714484114; cv=none; b=rRjOEV28sKtPgQxiG9tt8ECekqxKolHDkXb17iMogyupoIY9+BNSpDz2ULbtXaqYnsN7SdDnqzwSN4oxdjKwFppItQOiQcBpS8ydGPM8cD6KoMb2sL4ESClawW4p2dOtTY5U1bUV42mggJ0a3mOEDsWxBmSviSOsyqIaZ/Xn1oE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714484114; c=relaxed/simple;
	bh=qWEkJlbLibL3qpSMp2LE9PEG4KtstHifxBIaFTHZmyw=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dxqTMVe3XlKLsZNhYRAyhG37MLWVZnmV09wPFdKEmcZfSSyEDIEsf6675OQpftPV9SbaAV75mf60k1FetzWtIVAjuDkMCw28ZrQljybM0GKJAY39McmMn3rOqFYuKz3hjADxhwbIdy4/bJWrAoWbK7olYbWq/NPjF6rxU/PqPGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0AF9C2BBFC;
	Tue, 30 Apr 2024 13:35:13 +0000 (UTC)
Date: Tue, 30 Apr 2024 09:35:54 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: David Aldrich <david.aldrich.ntml@gmail.com>
Cc: linux-trace-users@vger.kernel.org
Subject: Re: Beginner question about KernelShark
Message-ID: <20240430093554.245330e8@gandalf.local.home>
In-Reply-To: <CAJK_ieh173hRECvw_hCzr4u2Qhq936S83mJv2YEnggZfN4dPgQ@mail.gmail.com>
References: <CAJK_ieg+yxDf9o=uGHPS-LoKr0B+XJ6UBrdMz5WinAzx3K-jDQ@mail.gmail.com>
	<CAJK_ieh173hRECvw_hCzr4u2Qhq936S83mJv2YEnggZfN4dPgQ@mail.gmail.com>
X-Mailer: Claws Mail 3.19.1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-trace-users@vger.kernel.org
List-Id: <linux-trace-users.vger.kernel.org>
List-Subscribe: <mailto:linux-trace-users+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-trace-users+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 30 Apr 2024 13:01:47 +0100
David Aldrich <david.aldrich.ntml@gmail.com> wrote:

> Hi, I am new to trace and KernelShark. We are developing a real-time
> application on Ubuntu 22.04. We see some jitter in some tasks and we
> need a tool to help us analyse what tasks are being scheduled on a
> specific cpu. I assume that trace and KernelShark can help us with
> this. Am I correct?

For jitter, I don't usually use kernelshark but just trace-cmd itself.
Although, if the jitter is caused by many applications, then kernelshark
can be useful.

> 
> A complication is that we are running the application on a server, not
> a desktop system. In fact we have no desktop Linux systems available.
> I am wondering if we could capture the trace data on the server and
> then analyse it offline using KernelShark running on Windows Subsystem
> for Linux (WSL) on a Windows laptop? Do you think that is feasible?

Yes, kernelshark reads the trace-cmd "trace.dat" file that it creates, and
if you have a Linux system (VM on Windows) then you can read that trace.dat
file from kernelshark there.

> 
> Is KernelShark available as a package, or must it be built by the user?

Yes, it's available as a package on Ubuntu (and other distros).

> 
> Any tips on how to capture the trace data and analyse it with
> KernelShark would be appreciated.

Well, I usually use just trace-cmd. I gave a talk about analyzing
cyclictest jitter with using trace-cmd as well as the libtracefs libraries.

 https://www.youtube.com/watch?v=m1IS3-l_22Y

-- Steve
