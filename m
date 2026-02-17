Received: from relay.hostedemail.com (smtprelay0012.hostedemail.com [216.40.44.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9917317993
	for <linux-trace-users@vger.kernel.org>; Tue, 17 Feb 2026 20:31:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771360278; cv=none; b=m76YbA9Cy3dTNe0NtnQoclNQ89VYoFeKmy2diUzLSg7Bc7QpNpeSGASknQkzYsHQ9pbqRgTY3zSe5+gJNPNW3YOErfMb6Wz9lZ4TW3tGNrVY0V0huJREVQtPgVYFv/JB2Gs0AIZEqngOz1qkDYYVCSRw6fTW4HM4W2tm2cVaZSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771360278; c=relaxed/simple;
	bh=hO+8buJ08IDWxDqOqTeICTICo3lXnW7cHkPzxqGAG9I=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Mivk9WirLJ/4MfAtRALAKCQo4zi706n6hyECbz1LlJr1ZrjxUsbwGuclFK0/EoOPNrpq78Df1Iw5EFob/pas/8BviGCf0qzCLLfqqbKA05IYPGVj++rl0In3J7MdVZyjkwCl/uWkg+ekmzarg7IAQe7iyy1Rg1e6y3fC4UcyDP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org; spf=pass smtp.mailfrom=goodmis.org; arc=none smtp.client-ip=216.40.44.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goodmis.org
Received: from omf12.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay03.hostedemail.com (Postfix) with ESMTP id 2F2D6B8160;
	Tue, 17 Feb 2026 20:23:17 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf12.hostedemail.com (Postfix) with ESMTPA id 26A1617;
	Tue, 17 Feb 2026 20:23:15 +0000 (UTC)
Date: Tue, 17 Feb 2026 15:23:16 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: "Nassiri, Mohammad" <mnassiri@ciena.com>
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-trace-users@vger.kernel.org" <linux-trace-users@vger.kernel.org>,
 "michael@ellerman.id.au" <michael@ellerman.id.au>, "srostedt@redhat.com"
 <srostedt@redhat.com>, "masami.hiramatsu@linaro.org"
 <masami.hiramatsu@linaro.org>, Christophe Leroy
 <christophe.leroy@csgroup.eu>, Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PPC][Tracing] Missing syscalls:* ftrace/perf events on PowerPC
 vs x86
Message-ID: <20260217152316.78d2dca8@gandalf.local.home>
In-Reply-To: <CH2PR04MB6821DAF7C6684BB990A0288BC56DA@CH2PR04MB6821.namprd04.prod.outlook.com>
References: <CH2PR04MB6821DAF7C6684BB990A0288BC56DA@CH2PR04MB6821.namprd04.prod.outlook.com>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-trace-users@vger.kernel.org
List-Id: <linux-trace-users.vger.kernel.org>
List-Subscribe: <mailto:linux-trace-users+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-trace-users+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: rspamout07
X-Rspamd-Queue-Id: 26A1617
X-Stat-Signature: 1xdoguaa1ixyckddak7mc6mjxxqgww1c
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX1/8QjY5lPcZmBYn+nIlhLI5IN77rpkBj2w=
X-HE-Tag: 1771359795-761203
X-HE-Meta: U2FsdGVkX19dJW83xGOaCcQd1buhUTb0h2SypQSEZN3KTbh8n3AEMA8DD3jKvJA0BOusb1BY3RiNOtnfXIlsczA1MrPsCJ7xio/FF/M97Gg+Nry0/TUlICOJ5bCAukcaEPMoKyTmZx8HxNCkSz5H/tQ/ZECc6OqkuuDLPi2Brk1WcqgSfPq5lWXwhHmpAvib0V0u4P7tjWsu55b1v0h3xZx8nPozTmG/99uSRCAzpb3SY9ObEPchQWZqg14a+jTx1LKhv/ZWZK8fl0gOVMT91nKxTsXPuBI58s0yO1ocVrHPw0a5f/v/tSWVTJFF16ER2WsrSnH96vmIePVCBqcjFiB0Ch8zF9kY3Xohp+Z7zDI9cRNWePQfiQ==

On Tue, 17 Feb 2026 20:10:39 +0000
"Nassiri, Mohammad" <mnassiri@ciena.com> wrote:

> Hello,
> 
> On PPC64 with Yocto Kirkstone and Linux 5.10.x,

5.10 is ancient and nobody working upstream is going to bother looking at
this.

If it works on a more recent kernel, then maybe something needs to be
backported.

-- Steve
