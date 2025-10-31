Received: from relay.hostedemail.com (smtprelay0011.hostedemail.com [216.40.44.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C00CF2D4B40
	for <linux-trace-users@vger.kernel.org>; Fri, 31 Oct 2025 15:44:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761925498; cv=none; b=H+xR7RN3PmshYPFdcSPx9SlQIXM9ip38rVn7z4ip0Yikf9i09ywQRWQga+QE0nNA//bph6BQ1GRR2GoCg+c0o51HPf3afuPKTVD5w+IeU5pvRjfLyL+91Cn60IjYXOMe2YRx2Loj8IojvHmeYvE3sIFRZxPSfjAh2i1Y4gJUcY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761925498; c=relaxed/simple;
	bh=DvrvPdCvNlHzVung0tVXT/Tl+IQ+bY4z0cCRnefKY+E=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZEwd25EnthEwmBwUYLnwDuX+kw3jGMVbtb58exASyVb6OTwMikNU1JyuHrLD7o6MqvH2ZTq+fB9pM9vNKd7yEwK/eW2ZuFqAofEa6APx0TwNtj83WxP+FlLN7s5wwvUL0wMS7dH3vuXkMxfH3NnHlzb+JIBTvFph4Ab2M3fjG+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org; spf=pass smtp.mailfrom=goodmis.org; arc=none smtp.client-ip=216.40.44.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goodmis.org
Received: from omf16.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay03.hostedemail.com (Postfix) with ESMTP id 2C3ABB9EFD;
	Fri, 31 Oct 2025 15:44:49 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf16.hostedemail.com (Postfix) with ESMTPA id B99742000E;
	Fri, 31 Oct 2025 15:44:47 +0000 (UTC)
Date: Fri, 31 Oct 2025 11:45:32 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Jorge Merlino <jorge.merlino@canonical.com>
Cc: linux-trace-users@vger.kernel.org
Subject: Re: Kernelshark latency field
Message-ID: <20251031114532.37f30c8a@gandalf.local.home>
In-Reply-To: <fe35c5eb-7132-4203-9d6f-0a8272b114fa@canonical.com>
References: <fe35c5eb-7132-4203-9d6f-0a8272b114fa@canonical.com>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-trace-users@vger.kernel.org
List-Id: <linux-trace-users.vger.kernel.org>
List-Subscribe: <mailto:linux-trace-users+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-trace-users+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Stat-Signature: eemb9tdzso74xcuwjk5e6nckxxy67oxe
X-Rspamd-Server: rspamout01
X-Rspamd-Queue-Id: B99742000E
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX18ZqnZW+SOU1mKkv5fcceEpe5Ma8ffjD1E=
X-HE-Tag: 1761925487-646980
X-HE-Meta: U2FsdGVkX193dud8TRaTqQjsYyPx1QuN9jzwFFKxc/RFVM411X8QYbKS1UtNTjPqLw8WdjdDel8mX4S05ElF9pBDM9NJaPvTX5ICozB5D7DFn7FZwLvDjXSEOpLBepdIhUxVKAxKHG2iOvc+kgfXYMzGtYVu6O4TJKYkchXEATvu+fOyJj1thMuGEl8W4aTD9VWvsDL0ZPERgZlH0PA5kAqJjo7TXDhpUij3JoN6mguJdLRdkPxrw7ofub+Vwk39V7EQenSPHvFejW29Tz3TccwWh6BBpVoYxIouKAURwqcEljPsOYFtNb7Vdqbfst8LDuK5jdPa/VzLxT/psZXGR3SqCbQDWhMT3cyOONOSqcXJHZbALFYiHMBxoIns+M5E

On Fri, 31 Oct 2025 11:52:59 -0300
Jorge Merlino <jorge.merlino@canonical.com> wrote:

> Hi folks,
> 
> I've been using kernelshark 2.2.1 and have noticed that the latency 
> field on the grid has five chars in it. The documentation [1] only 
> mention 4 fields. Anyone knows what the fifth is for?

Ah thanks for letting us know. I should update the documentation.

The fifth field is "migration disabled counter". It still allows the task
to be preempted by another task, but it will temporarily pin that task to
the CPU. It's a new feature to the Linux kernel and was introduced in 5.11.

-- Steve
