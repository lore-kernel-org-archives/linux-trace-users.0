Return-Path: linux-trace-users-owner@vger.kernel.org
Received: from mail.kernel.org ([198.145.29.136]:60302 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1754933AbdCIPbr (ORCPT
        <rfc822;linux-trace-users@vger.kernel.org>);
        Thu, 9 Mar 2017 10:31:47 -0500
Date: Thu, 9 Mar 2017 10:20:57 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc: Lukasz Dorau <lukasz.dorau@intel.com>,
        Ananth N Mavinakayanahalli <ananth@linux.vnet.ibm.com>,
        Anil S Keshavamurthy <anil.s.keshavamurthy@intel.com>,
        "David S. Miller" <davem@davemloft.net>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        linux-trace-users <linux-trace-users@vger.kernel.org>,
        Marcin Slusarz <marcin.slusarz@intel.com>,
        Sarah Jelinek <sarah.jelinek@intel.com>,
        Vitalii Chernookyi <vitalii.chernookyi@intel.com>,
        Gabor Buella <gabor.buella@intel.com>
Subject: Re: Why return probes of some syscalls sometimes are not called?
Message-ID: <20170309102057.4183c684@gandalf.local.home>
In-Reply-To: <1231722663.1343.1489071698914.JavaMail.zimbra@efficios.com>
References: <D9FFE20C522965449E182ACE73889AEB4868177B@irsmsx105.ger.corp.intel.com>
        <253263641.1274.1489067909121.JavaMail.zimbra@efficios.com>
        <20170309094455.53c8026c@gandalf.local.home>
        <1231722663.1343.1489071698914.JavaMail.zimbra@efficios.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-trace-users-owner@vger.kernel.org
List-ID: <linux-trace-users.vger.kernel.org>

On Thu, 9 Mar 2017 15:01:38 +0000 (UTC)
Mathieu Desnoyers <mathieu.desnoyers@efficios.com> wrote:

 
> Another more likely scenario is if a multithreaded process
> has many threads blocked (e.g. on a futex), and one of the threads
> exits cleanly or forks. I suspect the kernel will just tear down the
> other threads without hitting syscall exit.

Maybe, if this happens multiple times, it could cause those kinds of
numbers. A fork was done zero times according to the numbers. Maybe
exit should be measured too.

-- Steve
