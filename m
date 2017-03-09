Return-Path: linux-trace-users-owner@vger.kernel.org
Received: from mail.kernel.org ([198.145.29.136]:35426 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1753690AbdCIPrM (ORCPT
        <rfc822;linux-trace-users@vger.kernel.org>);
        Thu, 9 Mar 2017 10:47:12 -0500
Date: Thu, 9 Mar 2017 10:38:14 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: "Dorau, Lukasz" <lukasz.dorau@intel.com>
Cc: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
        Ananth N Mavinakayanahalli <ananth@linux.vnet.ibm.com>,
        "Keshavamurthy, Anil S" <anil.s.keshavamurthy@intel.com>,
        "David S. Miller" <davem@davemloft.net>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        linux-trace-users <linux-trace-users@vger.kernel.org>,
        "Slusarz, Marcin" <marcin.slusarz@intel.com>,
        "Jelinek, Sarah" <sarah.jelinek@intel.com>,
        "Chernookyi, Vitalii" <vitalii.chernookyi@intel.com>,
        "Buella, Gabor" <gabor.buella@intel.com>
Subject: Re: Why return probes of some syscalls sometimes are not called?
Message-ID: <20170309103814.015d3662@gandalf.local.home>
In-Reply-To: <D9FFE20C522965449E182ACE73889AEB486818F2@irsmsx105.ger.corp.intel.com>
References: <D9FFE20C522965449E182ACE73889AEB4868177B@irsmsx105.ger.corp.intel.com>
        <253263641.1274.1489067909121.JavaMail.zimbra@efficios.com>
        <20170309094455.53c8026c@gandalf.local.home>
        <1231722663.1343.1489071698914.JavaMail.zimbra@efficios.com>
        <20170309102057.4183c684@gandalf.local.home>
        <D9FFE20C522965449E182ACE73889AEB486818F2@irsmsx105.ger.corp.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-trace-users-owner@vger.kernel.org
List-ID: <linux-trace-users.vger.kernel.org>

On Thu, 9 Mar 2017 15:30:42 +0000
"Dorau, Lukasz" <lukasz.dorau@intel.com> wrote:

> On Thursday, March 9, 2017 4:21 PM Steven Rostedt wrote:
> > On Thu, 9 Mar 2017 15:01:38 +0000 (UTC)
> > Mathieu Desnoyers <mathieu.desnoyers@efficios.com> wrote:
> > 
> >   
> > > Another more likely scenario is if a multithreaded process
> > > has many threads blocked (e.g. on a futex), and one of the threads
> > > exits cleanly or forks. I suspect the kernel will just tear down the
> > > other threads without hitting syscall exit.  
> > 
> > Maybe, if this happens multiple times, it could cause those kinds of
> > numbers. A fork was done zero times according to the numbers. Maybe
> > exit should be measured too.
> >   
> 
> I have run the test again with exit:
> 
> Results (60 sec):
> futex:       p 2968     r 401      (86% did not return (2567))
> poll:        p 13251    r 3957     (70% did not return (9294))
> epoll_wait:  p 1485     r 556      (62% did not return (929))
> select:      p 8063     r 8066     (OK)
> fork:        p 0        r 0        (OK)
> vfork:       p 4        r 4        (OK)
> clone:       p 6962     r 6962     (OK)
> exit:        p 3        r 0        (100% did not return (3))

I expected exit not to have a return, that's the property of exit. But
it shows that the above poll and friends is not because of exit and
fork.

Can you change your script to use syscall tracepoints instead of
retprobes?

-- Steve

> mmap:        p 71740    r 71740    (OK)
> open:        p 43822    r 43825    (OK)
> close:       p 79805    r 79806    (OK)
> write:       p 31080    r 31078    (0% did not return (2))
> read:        p 108456   r 108449   (0% did not return (7))
> 
> Lukasz

