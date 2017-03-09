Return-Path: linux-trace-users-owner@vger.kernel.org
Received: from mail.efficios.com ([167.114.142.141]:38351 "EHLO
        mail.efficios.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753753AbdCIN64 (ORCPT
        <rfc822;linux-trace-users@vger.kernel.org>);
        Thu, 9 Mar 2017 08:58:56 -0500
Date: Thu, 9 Mar 2017 13:58:29 +0000 (UTC)
From: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
To: "Dorau, Lukasz" <lukasz.dorau@intel.com>
Cc: Ananth N Mavinakayanahalli <ananth@linux.vnet.ibm.com>,
        "Keshavamurthy, Anil S" <anil.s.keshavamurthy@intel.com>,
        "David S. Miller" <davem@davemloft.net>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        linux-trace-users@vger.kernel.org,
        "Slusarz, Marcin" <marcin.slusarz@intel.com>,
        "Jelinek, Sarah" <sarah.jelinek@intel.com>,
        "Chernookyi, Vitalii" <vitalii.chernookyi@intel.com>,
        "Buella, Gabor" <gabor.buella@intel.com>
Message-ID: <253263641.1274.1489067909121.JavaMail.zimbra@efficios.com>
In-Reply-To: <D9FFE20C522965449E182ACE73889AEB4868177B@irsmsx105.ger.corp.intel.com>
References: <D9FFE20C522965449E182ACE73889AEB4868177B@irsmsx105.ger.corp.intel.com>
Subject: Re: Why return probes of some syscalls sometimes are not called?
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Sender: linux-trace-users-owner@vger.kernel.org
List-ID: <linux-trace-users.vger.kernel.org>

----- On Mar 9, 2017, at 8:44 AM, Dorau, Lukasz lukasz.dorau@intel.com wrote:

> Hi,
> 
> Could someone explain me why return probes of some syscalls (for example: futex,
> poll, epoll_wait) sometimes are not called?
> 
> It can be reproduced using the following bash script:
> https://gist.github.com/ldorau/c439d9ec7635409a5016c42e3a9121ec
> 
> Here are results gathered from 60 seconds test run on kernel 4.9.12 (Fedora 24):
> 
> futex:       p 56904    r 5489     (90% did not return (51415))
> poll:        p 43466    r 7703     (82% did not return (35763))
> epoll_wait:  p 73366    r 23551    (67% did not return (49815))

Most likely scenario: those processes are still blocked on those
system calls when your tracing ends.

AFAIU, another possible (less frequent) scenario: a process gets
killed with SIGKILL while blocked on the signal.

Thanks,

Mathieu

> 
> The whole log is attached below.
> 
> Lukasz
> 
> ---
> # ./test_kprobes.sh 60
> 
> Will trace using following kprobe_events:
> r:kprobes/r_futex sys_futex
> p:kprobes/p_futex sys_futex
> r:kprobes/r_poll sys_poll
> p:kprobes/p_poll sys_poll
> r:kprobes/r_epoll_wait sys_epoll_wait
> p:kprobes/p_epoll_wait sys_epoll_wait
> r:kprobes/r_select sys_select
> p:kprobes/p_select sys_select
> r:kprobes/r_fork sys_fork
> p:kprobes/p_fork sys_fork
> r:kprobes/r_vfork sys_vfork
> p:kprobes/p_vfork sys_vfork
> r:kprobes/r_mmap sys_mmap
> p:kprobes/p_mmap sys_mmap
> r:kprobes/r_open sys_open
> p:kprobes/p_open sys_open
> r:kprobes/r_close sys_close
> p:kprobes/p_close sys_close
> r:kprobes/r_write sys_write
> p:kprobes/p_write sys_write
> r:kprobes/r_read sys_read
> p:kprobes/p_read sys_read
> 
> Results (60 sec):
> futex:       p 56904    r 5489     (90% did not return (51415))
> poll:        p 43466    r 7703     (82% did not return (35763))
> epoll_wait:  p 73366    r 23551    (67% did not return (49815))
> select:      p 13355    r 13351    (0% did not return (4))
> fork:        p 0        r 0        (OK)
> vfork:       p 0        r 0        (OK)
> mmap:        p 4328     r 4328     (OK)
> open:        p 4579     r 4579     (OK)
> close:       p 7163     r 7163     (OK)
> write:       p 22769    r 22769    (OK)
> read:        p 40014    r 40014    (OK)
> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-trace-users" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

-- 
Mathieu Desnoyers
EfficiOS Inc.
http://www.efficios.com
