Return-Path: <SRS0=TLMB=NX=vger.kernel.org=linux-trace-users-owner@goodmis.org>
Received: from mail.kernel.org ([198.145.29.99]:48784 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727185AbeKMDNZ (ORCPT
        <rfc822;linux-trace-users@vger.kernel.org>);
        Mon, 12 Nov 2018 22:13:25 -0500
Date: Mon, 12 Nov 2018 12:19:14 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: wyang <w90p710@gmail.com>
Cc: linux-trace-users@vger.kernel.org
Subject: Re: Is it probably to trigger function graph via trace event?
Message-ID: <20181112121914.5ffeafe2@vmware.local.home>
In-Reply-To: <7faa2f1d-51ad-d524-d690-e284244fa58a@gmail.com>
References: <7faa2f1d-51ad-d524-d690-e284244fa58a@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-trace-users-owner@vger.kernel.org
List-ID: <linux-trace-users.vger.kernel.org>

On Mon, 12 Nov 2018 23:41:15 +0800
wyang <w90p710@gmail.com> wrote:

> Hi Steven,
> 
> The trace event has already supported filter functionality, so is ftrace 
> able to trigger function graph when trace event filter is matched?
> It is very useful for us to filter function graph. If the functionality 
> is not supported, how about to support it? If possible, I hope to do it.

It's not supported yet. If you want to take a crack at sending patches,
feel free.

-- Steve
