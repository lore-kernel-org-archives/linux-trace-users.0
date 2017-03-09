Return-Path: linux-trace-users-owner@vger.kernel.org
Received: from mga05.intel.com ([192.55.52.43]:33846 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S932291AbdCINom (ORCPT
        <rfc822;linux-trace-users@vger.kernel.org>);
        Thu, 9 Mar 2017 08:44:42 -0500
From: "Dorau, Lukasz" <lukasz.dorau@intel.com>
To: Ananth N Mavinakayanahalli <ananth@linux.vnet.ibm.com>,
        "Keshavamurthy, Anil S" <anil.s.keshavamurthy@intel.com>,
        "David S. Miller" <davem@davemloft.net>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        "linux-trace-users@vger.kernel.org"
        <linux-trace-users@vger.kernel.org>
CC: "Slusarz, Marcin" <marcin.slusarz@intel.com>,
        "Jelinek, Sarah" <sarah.jelinek@intel.com>,
        "Chernookyi, Vitalii" <vitalii.chernookyi@intel.com>,
        "Buella, Gabor" <gabor.buella@intel.com>
Subject: Why return probes of some syscalls sometimes are not called?
Date: Thu, 9 Mar 2017 13:44:38 +0000
Message-ID: <D9FFE20C522965449E182ACE73889AEB4868177B@irsmsx105.ger.corp.intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
MIME-Version: 1.0
Sender: linux-trace-users-owner@vger.kernel.org
List-ID: <linux-trace-users.vger.kernel.org>

Hi,

Could someone explain me why return probes of some syscalls (for example: futex, poll, epoll_wait) sometimes are not called?

It can be reproduced using the following bash script:
https://gist.github.com/ldorau/c439d9ec7635409a5016c42e3a9121ec

Here are results gathered from 60 seconds test run on kernel 4.9.12 (Fedora 24):

futex:       p 56904    r 5489     (90% did not return (51415))
poll:        p 43466    r 7703     (82% did not return (35763))
epoll_wait:  p 73366    r 23551    (67% did not return (49815))

The whole log is attached below.

Lukasz

---
# ./test_kprobes.sh 60

Will trace using following kprobe_events:
r:kprobes/r_futex sys_futex
p:kprobes/p_futex sys_futex
r:kprobes/r_poll sys_poll
p:kprobes/p_poll sys_poll
r:kprobes/r_epoll_wait sys_epoll_wait
p:kprobes/p_epoll_wait sys_epoll_wait
r:kprobes/r_select sys_select
p:kprobes/p_select sys_select
r:kprobes/r_fork sys_fork
p:kprobes/p_fork sys_fork
r:kprobes/r_vfork sys_vfork
p:kprobes/p_vfork sys_vfork
r:kprobes/r_mmap sys_mmap
p:kprobes/p_mmap sys_mmap
r:kprobes/r_open sys_open
p:kprobes/p_open sys_open
r:kprobes/r_close sys_close
p:kprobes/p_close sys_close
r:kprobes/r_write sys_write
p:kprobes/p_write sys_write
r:kprobes/r_read sys_read
p:kprobes/p_read sys_read

Results (60 sec):
futex:       p 56904    r 5489     (90% did not return (51415))
poll:        p 43466    r 7703     (82% did not return (35763))
epoll_wait:  p 73366    r 23551    (67% did not return (49815))
select:      p 13355    r 13351    (0% did not return (4))
fork:        p 0        r 0        (OK)
vfork:       p 0        r 0        (OK)
mmap:        p 4328     r 4328     (OK)
open:        p 4579     r 4579     (OK)
close:       p 7163     r 7163     (OK)
write:       p 22769    r 22769    (OK)
read:        p 40014    r 40014    (OK)

