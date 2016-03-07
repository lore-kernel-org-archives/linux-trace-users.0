Return-Path: linux-trace-users-owner@vger.kernel.org
Received: from smtprelay0077.hostedemail.com ([216.40.44.77]:53359 "EHLO
	smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1752829AbcCGPt2 (ORCPT
	<rfc822;linux-trace-users@vger.kernel.org>);
	Mon, 7 Mar 2016 10:49:28 -0500
Date: Mon, 7 Mar 2016 10:49:24 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: Stefan Hajnoczi <stefanha@gmail.com>,
	Luiz Capitulino <lcapitulino@redhat.com>, kvm@vger.kernel.org,
	yoshihiro.yunomae.ez@hitachi.com, mtosatti@redhat.com,
	qemu-devel@nongnu.org, linux-trace-users@vger.kernel.org,
	peterx@redhat.com, pbonzini@redhat.com
Subject: Re: [Qemu-devel] [RFC] host and guest kernel trace merging
Message-ID: <20160307104924.1871dbdb@gandalf.local.home>
In-Reply-To: <20160307151705.GD20937@stefanha-x1.localdomain>
References: <20160303143501.0edf21a2@redhat.com>
	<20160304111933.GB626@stefanha-x1.localdomain>
	<20160304082311.5ccd1a33@gandalf.local.home>
	<20160307151705.GD20937@stefanha-x1.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-trace-users-owner@vger.kernel.org
List-ID: <linux-trace-users.vger.kernel.org>

On Mon, 7 Mar 2016 15:17:05 +0000
Stefan Hajnoczi <stefanha@redhat.com> wrote:


> qemu-guest-agent runs inside the guest and replies to RPC commands from
> the host.  It is used for backups, shutdown, network configuration, etc.
> From time to time people have wanted the ability to execute an arbitrary
> command inside the guest and return the output.  This functionality has
> never been merged, probably for the security reason.

How's the connection set up. That is, how does it know the commands are
coming from the host? And how does it know that the commands from the
host is from a trusted source? If the host is compromised, is there
anything keeping an intruder from controlling the guest?

> 
> A tracing server that runs inside the guest is comparable to
> qemu-guest-agent.  As long as the tracing server requires manual
> commands to start it and does not run by default, then I think the
> security issue can be kept at bay.  It's a powerful tool that requires
> explicit guest administrator action to enable.

This isn't something I would expect to be started by default. My worry
is that once it is started, then you open up a connection that can be
attached by pretty much anyone. We could make a network socket that
only communicates with the host, but even that worries me. I'm worried
that the host may have actors that might compromise the system.

-- Steve
