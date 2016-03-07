Return-Path: linux-trace-users-owner@vger.kernel.org
Received: from smtprelay0077.hostedemail.com ([216.40.44.77]:33478 "EHLO
	smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1752697AbcCGQ0b (ORCPT
	<rfc822;linux-trace-users@vger.kernel.org>);
	Mon, 7 Mar 2016 11:26:31 -0500
Date: Mon, 7 Mar 2016 11:26:27 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: Eric Blake <eblake@redhat.com>
Cc: Stefan Hajnoczi <stefanha@redhat.com>, kvm@vger.kernel.org,
	Stefan Hajnoczi <stefanha@gmail.com>,
	yoshihiro.yunomae.ez@hitachi.com, mtosatti@redhat.com,
	qemu-devel@nongnu.org, peterx@redhat.com,
	Luiz Capitulino <lcapitulino@redhat.com>,
	linux-trace-users@vger.kernel.org, pbonzini@redhat.com
Subject: Re: [Qemu-devel] [RFC] host and guest kernel trace merging
Message-ID: <20160307112627.3b94c671@gandalf.local.home>
In-Reply-To: <56DDA7E2.3050506@redhat.com>
References: <20160303143501.0edf21a2@redhat.com>
	<20160304111933.GB626@stefanha-x1.localdomain>
	<20160304082311.5ccd1a33@gandalf.local.home>
	<20160307151705.GD20937@stefanha-x1.localdomain>
	<20160307104924.1871dbdb@gandalf.local.home>
	<56DDA7E2.3050506@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-trace-users-owner@vger.kernel.org
List-ID: <linux-trace-users.vger.kernel.org>

On Mon, 7 Mar 2016 09:10:10 -0700
Eric Blake <eblake@redhat.com> wrote:

> On 03/07/2016 08:49 AM, Steven Rostedt wrote:
> > On Mon, 7 Mar 2016 15:17:05 +0000
> > Stefan Hajnoczi <stefanha@redhat.com> wrote:
> > 
> >   
> >> qemu-guest-agent runs inside the guest and replies to RPC commands from
> >> the host.  It is used for backups, shutdown, network configuration, etc.
> >> From time to time people have wanted the ability to execute an arbitrary
> >> command inside the guest and return the output.  This functionality has
> >> never been merged, probably for the security reason.  
> > 
> > How's the connection set up. That is, how does it know the commands are
> > coming from the host? And how does it know that the commands from the
> > host is from a trusted source? If the host is compromised, is there
> > anything keeping an intruder from controlling the guest?  
> 
> qemu-guest-agent uses a virtio channel, so only the host can be driving
> that channel.  But how can a guest know that it trusts the host? It
> can't.  A compromised host implicitly compromises all guests, and that's
> always been the case.  At least qemu-guest-agent doesn't make the window
> any larger.
> 

I should have been a bit more clear about what I meant by "host is
compromised". I should have asked, what about untrusted tasks on the
host. Is the channel protected where only admin users can access it?

Of course, one of my concerns with the trace-cmd server is that it may
require a network connection, because doesn't a virtio channel require
to be initialized at boot up? Where the host must have an active
listener when the guest starts? Or am I thinking about something else.

-- Steve
