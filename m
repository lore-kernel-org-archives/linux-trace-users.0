Return-Path: linux-trace-users-owner@vger.kernel.org
Received: from mail.kernel.org ([198.145.29.136]:54038 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1754747AbdCIO6A (ORCPT
        <rfc822;linux-trace-users@vger.kernel.org>);
        Thu, 9 Mar 2017 09:58:00 -0500
Date: Thu, 9 Mar 2017 09:57:29 -0500
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
Message-ID: <20170309095729.5467078c@gandalf.local.home>
In-Reply-To: <20170309094455.53c8026c@gandalf.local.home>
References: <D9FFE20C522965449E182ACE73889AEB4868177B@irsmsx105.ger.corp.intel.com>
        <253263641.1274.1489067909121.JavaMail.zimbra@efficios.com>
        <20170309094455.53c8026c@gandalf.local.home>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-trace-users-owner@vger.kernel.org
List-ID: <linux-trace-users.vger.kernel.org>

On Thu, 9 Mar 2017 09:44:55 -0500
Steven Rostedt <rostedt@goodmis.org> wrote:

> On Thu, 9 Mar 2017 13:58:29 +0000 (UTC)
> Mathieu Desnoyers <mathieu.desnoyers@efficios.com> wrote:
> 
> > ----- On Mar 9, 2017, at 8:44 AM, Dorau, Lukasz lukasz.dorau@intel.com wrote:
> >   
> > > Hi,
> > > 
> > > Could someone explain me why return probes of some syscalls (for example: futex,
> > > poll, epoll_wait) sometimes are not called?
> > > 
> > > It can be reproduced using the following bash script:
> > > https://gist.github.com/ldorau/c439d9ec7635409a5016c42e3a9121ec
> > > 
> > > Here are results gathered from 60 seconds test run on kernel 4.9.12 (Fedora 24):
> > > 
> > > futex:       p 56904    r 5489     (90% did not return (51415))
> > > poll:        p 43466    r 7703     (82% did not return (35763))
> > > epoll_wait:  p 73366    r 23551    (67% did not return (49815))    
> > 
> > Most likely scenario: those processes are still blocked on those
> > system calls when your tracing ends.  
> 
> This is very common but those numbers are very high. I doubt there's 51
> thousand threads blocked on a futex when tracing ended.
> 
> > 
> > AFAIU, another possible (less frequent) scenario: a process gets
> > killed with SIGKILL while blocked on the signal.
> >   
> 
> This could be.
> 
> > > 
> > > Results (60 sec):
> > > futex:       p 56904    r 5489     (90% did not return (51415))
> > > poll:        p 43466    r 7703     (82% did not return (35763))
> > > epoll_wait:  p 73366    r 23551    (67% did not return (49815))
> > > select:      p 13355    r 13351    (0% did not return (4))  
> 
> All these are common system calls that tasks simply sleep on. But it
> would take a nasty kill to have them not return back to the program to
> clean up nicely. Another possibility is that these actually have another
> way out from the kernel that isn't caught by tracing. I'll take a look.
> 

BTW, what happens if you change your script to use the syscall
tracepoints instead? As syscalls have an entry and exit tracepoint. Do
the results change?

-- Steve
