Return-Path: linux-trace-users-owner@vger.kernel.org
Received: from mail.kernel.org ([198.145.29.136]:50794 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S932290AbdCIOpK (ORCPT
        <rfc822;linux-trace-users@vger.kernel.org>);
        Thu, 9 Mar 2017 09:45:10 -0500
Date: Thu, 9 Mar 2017 09:44:55 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc: "Dorau, Lukasz" <lukasz.dorau@intel.com>,
        Ananth N Mavinakayanahalli <ananth@linux.vnet.ibm.com>,
        "Keshavamurthy, Anil S" <anil.s.keshavamurthy@intel.com>,
        "David S. Miller" <davem@davemloft.net>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        linux-trace-users@vger.kernel.org,
        "Slusarz, Marcin" <marcin.slusarz@intel.com>,
        "Jelinek, Sarah" <sarah.jelinek@intel.com>,
        "Chernookyi, Vitalii" <vitalii.chernookyi@intel.com>,
        "Buella, Gabor" <gabor.buella@intel.com>
Subject: Re: Why return probes of some syscalls sometimes are not called?
Message-ID: <20170309094455.53c8026c@gandalf.local.home>
In-Reply-To: <253263641.1274.1489067909121.JavaMail.zimbra@efficios.com>
References: <D9FFE20C522965449E182ACE73889AEB4868177B@irsmsx105.ger.corp.intel.com>
        <253263641.1274.1489067909121.JavaMail.zimbra@efficios.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-trace-users-owner@vger.kernel.org
List-ID: <linux-trace-users.vger.kernel.org>

On Thu, 9 Mar 2017 13:58:29 +0000 (UTC)
Mathieu Desnoyers <mathieu.desnoyers@efficios.com> wrote:

> ----- On Mar 9, 2017, at 8:44 AM, Dorau, Lukasz lukasz.dorau@intel.com wrote:
> 
> > Hi,
> > 
> > Could someone explain me why return probes of some syscalls (for example: futex,
> > poll, epoll_wait) sometimes are not called?
> > 
> > It can be reproduced using the following bash script:
> > https://gist.github.com/ldorau/c439d9ec7635409a5016c42e3a9121ec
> > 
> > Here are results gathered from 60 seconds test run on kernel 4.9.12 (Fedora 24):
> > 
> > futex:       p 56904    r 5489     (90% did not return (51415))
> > poll:        p 43466    r 7703     (82% did not return (35763))
> > epoll_wait:  p 73366    r 23551    (67% did not return (49815))  
> 
> Most likely scenario: those processes are still blocked on those
> system calls when your tracing ends.

This is very common but those numbers are very high. I doubt there's 51
thousand threads blocked on a futex when tracing ended.

> 
> AFAIU, another possible (less frequent) scenario: a process gets
> killed with SIGKILL while blocked on the signal.
> 

This could be.

> > 
> > Results (60 sec):
> > futex:       p 56904    r 5489     (90% did not return (51415))
> > poll:        p 43466    r 7703     (82% did not return (35763))
> > epoll_wait:  p 73366    r 23551    (67% did not return (49815))
> > select:      p 13355    r 13351    (0% did not return (4))

All these are common system calls that tasks simply sleep on. But it
would take a nasty kill to have them not return back to the program to
clean up nicely. Another possibility is that these actually have another
way out from the kernel that isn't caught by tracing. I'll take a look.

-- Steve



> > fork:        p 0        r 0        (OK)
> > vfork:       p 0        r 0        (OK)
> > mmap:        p 4328     r 4328     (OK)
> > open:        p 4579     r 4579     (OK)
> > close:       p 7163     r 7163     (OK)
> > write:       p 22769    r 22769    (OK)
> > read:        p 40014    r 40014    (OK)
> > 
> > --
> > To unsubscribe from this list: send the line "unsubscribe linux-trace-users" in
> > the body of a message to majordomo@vger.kernel.org
> > More majordomo info at  http://vger.kernel.org/majordomo-info.html  
> 

