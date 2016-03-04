Return-Path: linux-trace-users-owner@vger.kernel.org
Received: from smtprelay0204.hostedemail.com ([216.40.44.204]:43426 "EHLO
	smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1750976AbcCDNca (ORCPT
	<rfc822;linux-trace-users@vger.kernel.org>);
	Fri, 4 Mar 2016 08:32:30 -0500
Date: Fri, 4 Mar 2016 08:23:11 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: Stefan Hajnoczi <stefanha@gmail.com>
Cc: Luiz Capitulino <lcapitulino@redhat.com>, kvm@vger.kernel.org,
	yoshihiro.yunomae.ez@hitachi.com, mtosatti@redhat.com,
	qemu-devel@nongnu.org, linux-trace-users@vger.kernel.org,
	peterx@redhat.com, stefanha@redhat.com, pbonzini@redhat.com
Subject: Re: [Qemu-devel] [RFC] host and guest kernel trace merging
Message-ID: <20160304082311.5ccd1a33@gandalf.local.home>
In-Reply-To: <20160304111933.GB626@stefanha-x1.localdomain>
References: <20160303143501.0edf21a2@redhat.com>
	<20160304111933.GB626@stefanha-x1.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-trace-users-owner@vger.kernel.org
List-ID: <linux-trace-users.vger.kernel.org>

On Fri, 4 Mar 2016 11:19:33 +0000
Stefan Hajnoczi <stefanha@gmail.com> wrote:


> >  2. Build a trace-cmd-server
> > 
> >     Which does the following:
> > 
> >       1. Receive trace-cmd record commands from a guest,
> >          to be performed in the host  
> 
> Sometimes the opposite is desirable: the host controls tracing inside
> the guest.  Any thoughts on this use case?

My idea for a trace-cmd server, is to have a --client operation, for
running on the guest.

 trace-cmd server --client <connection>

The connection will be some socket, either network or something
directly attached to the host.

Then on the host, we can have

  trace-cmd server --connect <guest>

Where the server will create a connection to the guest.

And then, you could run on the host:

  trace-cmd record <host-events> --connect <guest> <guest-events>

And this will start recording host events, and then connect to the
local server that connects to the guest(s) and that will start tracing
on the guest as well.

Then events on the guest will be passed to the host server.

Something like this is my idea. We can work out the details on the best
way to get things working. We may be able to eliminate the host server
middle man. But I envision that we need a trace-cmd server running on
the guest to start off the commands.

The problem I have with the guest server, and something that we may be
able to fix later on, but should always keep it in the back of our
minds, is the security issue. For this to work, the guest server needs
to run as root. It will have an open socket (network or to host), that
will enable tracing on the guest. There needs to be some sort of
verification on that connection to prevent anyone from connecting to it.

In the protocol for the connection between guest and host, I'll
currently add a "security" feature, that will allow the guest to tell
whomever is connecting to it, what type of security feature it wants.
For now it will be TRACE_CMD_NO_SECURITY. But that will have to change
in the future.

-- Steve


> 
> >       2. Read the TSC offset for vCPUs being traced
> > 
> >       3. Read the CPU frequency for --ts2secs
> > 
> >       4. Receive the guest.dat from the guest and store it together
> >          with the host's
> > 
> >     I'd suggest the default communication between guest and
> >     host be via networking. Then we add vsock support when it's
> >     available.  

