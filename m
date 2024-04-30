Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com [209.85.161.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30F4F13D26E
	for <linux-trace-users@vger.kernel.org>; Tue, 30 Apr 2024 12:01:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714478521; cv=none; b=hI7+NouvRmSeCqSar+WCrrnLAfaJzDa76DZhMqE5WJqKO9ekGLkvLgvqxXefaXqntzf71Sks/TZ+Gex+iA3v7C+Afi9R7Rtq6b2o0FzAdyBlfSXxGl5/Laifb5XhmVlgCajMWuJOMu48QBo/muKM8xQXTKzTav5rq++COXhyDNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714478521; c=relaxed/simple;
	bh=ey1Doo0DjpYq6a0ItbfWqC//ODLOKgxO8YGd20aOSog=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=myvTRQCh7h3fsYYdhzwfn/rqjH8gZh4BjHBylpLfSrLD+hy+LzTsRoVnZoty9CHAwDgvupR88fbOwIdHjEcdWs+kQs82JLpYtOih3M226yoC/pgB4Ejeuy8+W4+oU/pj5OR7O8IXMeq+beeOdTH3LCqgzBZmRExZcsP0FRNZPbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GQ+TeE5/; arc=none smtp.client-ip=209.85.161.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GQ+TeE5/"
Received: by mail-oo1-f53.google.com with SMTP id 006d021491bc7-5afbd1c3ffeso679655eaf.2
        for <linux-trace-users@vger.kernel.org>; Tue, 30 Apr 2024 05:01:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714478519; x=1715083319; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ey1Doo0DjpYq6a0ItbfWqC//ODLOKgxO8YGd20aOSog=;
        b=GQ+TeE5/Rx73TNpwKOCBCOVM6jIjOW7OR3teQLbCQfzFOS1IN+Sqnl313b/+weRiX2
         kkaz+EL32FXPHDkxYQNxC1p6tF6jBhsWzyD7DdDEMtNfR+fMU1Chcm4wh53dDc6tDfYv
         /i9PRJZ+NSrfIxvnt3eRctynARQ5U5YNFTnFD3IS0sUC100O1NX7CA26UJ0ingWChbAA
         UttZo+D8VFuNJ+U4yXcFRe65pMC1hfTnsLqzS6EgAVNc4DzX0Bg4DP8MeDtF8uo0y3GK
         4PCRI1KCd1WK2A9vAV7h1hlTU/clrJ7P7QKLXzC/qa+VSe+A+xrocS5ICAIZMXq0IgPD
         +YvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714478519; x=1715083319;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ey1Doo0DjpYq6a0ItbfWqC//ODLOKgxO8YGd20aOSog=;
        b=B3EzvoNoOfiFtIQMXkTbQ3rQ1Z0SmGjuXG9XC4L3UaV/DjaazrqVXuJXqLOdddTu2M
         T7+t7hXErnF/SG+rjaS0VtS7KajMdxQ+eROUsjaFeq5mwzRp/iMvBY8ZJ2dPtZPZa/06
         vUz++MbRICsL8oxl55qFCkFG9VaTvKE3ULeqTcDZXvkm+cZ/wQOg1e/+ii9i5Oh4vCgy
         W6EUnohWck1+T5b02hSBxYWoEIWsJsO1yKTeeqF1PPZmkcf75I3RM1RKZ4EEQBVxqeoz
         tenW4q7MitlldS5LSuukM/nox8ku9yUc834OEFldNl/GpU6STuFHwgPH8q1/rcCBG3jI
         WuSQ==
X-Gm-Message-State: AOJu0YwINd4rMydJtlkDxUfXGquf0QAzRNmeWNJ+sZRAtvIsUtT6Zm4n
	MPs0bdiOmHliEYJgg2hywhntkd2V4UR3BdvBI5DxQuARBhA+Smgjr5fGUrZbwUpYiqyvmSz+aLx
	8DYL4azMkP9WYjRvA5rvzCWnhpEXS1A==
X-Google-Smtp-Source: AGHT+IH7ez532+vPyEbIirb8NwotL5EmLXaIaBZe99+5l3Ygru3YLp1zI9dOTjaFVZthcDxJj7jeWohYvP/dlJYNKsQ=
X-Received: by 2002:a4a:aa01:0:b0:5aa:538a:ed60 with SMTP id
 x1-20020a4aaa01000000b005aa538aed60mr2438535oom.3.1714478517618; Tue, 30 Apr
 2024 05:01:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-trace-users@vger.kernel.org
List-Id: <linux-trace-users.vger.kernel.org>
List-Subscribe: <mailto:linux-trace-users+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-trace-users+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAJK_ieg+yxDf9o=uGHPS-LoKr0B+XJ6UBrdMz5WinAzx3K-jDQ@mail.gmail.com>
In-Reply-To: <CAJK_ieg+yxDf9o=uGHPS-LoKr0B+XJ6UBrdMz5WinAzx3K-jDQ@mail.gmail.com>
From: David Aldrich <david.aldrich.ntml@gmail.com>
Date: Tue, 30 Apr 2024 13:01:47 +0100
Message-ID: <CAJK_ieh173hRECvw_hCzr4u2Qhq936S83mJv2YEnggZfN4dPgQ@mail.gmail.com>
Subject: Fwd: Beginner question about KernelShark
To: linux-trace-users@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi, I am new to trace and KernelShark. We are developing a real-time
application on Ubuntu 22.04. We see some jitter in some tasks and we
need a tool to help us analyse what tasks are being scheduled on a
specific cpu. I assume that trace and KernelShark can help us with
this. Am I correct?

A complication is that we are running the application on a server, not
a desktop system. In fact we have no desktop Linux systems available.
I am wondering if we could capture the trace data on the server and
then analyse it offline using KernelShark running on Windows Subsystem
for Linux (WSL) on a Windows laptop? Do you think that is feasible?

Is KernelShark available as a package, or must it be built by the user?

Any tips on how to capture the trace data and analyse it with
KernelShark would be appreciated.
