Return-Path: linux-trace-users-owner@vger.kernel.org
Received: from mga05.intel.com ([192.55.52.43]:52638 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1753499AbdCISUw (ORCPT
        <rfc822;linux-trace-users@vger.kernel.org>);
        Thu, 9 Mar 2017 13:20:52 -0500
From: "Chernookyi, Vitalii" <vitalii.chernookyi@intel.com>
To: Masami Hiramatsu <mhiramat@kernel.org>,
        "Dorau, Lukasz" <lukasz.dorau@intel.com>
CC: Ananth N Mavinakayanahalli <ananth@linux.vnet.ibm.com>,
        "Keshavamurthy, Anil S" <anil.s.keshavamurthy@intel.com>,
        "David S. Miller" <davem@davemloft.net>,
        "linux-trace-users@vger.kernel.org"
        <linux-trace-users@vger.kernel.org>,
        "Slusarz, Marcin" <marcin.slusarz@intel.com>,
        "Jelinek, Sarah" <sarah.jelinek@intel.com>,
        "Buella, Gabor" <gabor.buella@intel.com>
Subject: RE: Why return probes of some syscalls sometimes are not called?
Date: Thu, 9 Mar 2017 18:19:26 +0000
Message-ID: <E9E28102842A9C40869B8872F2AE82539C9035@IRSMSX101.ger.corp.intel.com>
References: <D9FFE20C522965449E182ACE73889AEB4868177B@irsmsx105.ger.corp.intel.com>
 <20170309180054.7a4ad1194807ddb3d422e3ff@kernel.org>
In-Reply-To: <20170309180054.7a4ad1194807ddb3d422e3ff@kernel.org>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 8BIT
Sender: linux-trace-users-owner@vger.kernel.org
List-ID: <linux-trace-users.vger.kernel.org>

Dear,

> Of course these events are collected in "different places" so
> it could be different. But yeah, it seems sys_* function itself
> dosen't return but jumps into ret_from_syscall etc.

In case of sys_futex and sys_poll there should be different reason of this issue, because most likely next calls could not have different return path:

/* test-futex.c */
Int main() {
    Return syscall(SYS_futex, 1, 2, 3, 4, 5, 6);
}

/* test-poll.c */
Int main() {
    Return syscall(SYS_poll, 0x102, 0x103, 0x104, 0x105, 0x106, 0x107);
}

With best regards,

Vitaly

-----Original Message-----
From: Masami Hiramatsu [mailto:mhiramat@kernel.org] 
Sent: Thursday, March 9, 2017 6:01 PM
To: Dorau, Lukasz <lukasz.dorau@intel.com>
Cc: Ananth N Mavinakayanahalli <ananth@linux.vnet.ibm.com>; Keshavamurthy, Anil S <anil.s.keshavamurthy@intel.com>; David S. Miller <davem@davemloft.net>; linux-trace-users@vger.kernel.org; Slusarz, Marcin <marcin.slusarz@intel.com>; Jelinek, Sarah <sarah.jelinek@intel.com>; Chernookyi, Vitalii <vitalii.chernookyi@intel.com>; Buella, Gabor <gabor.buella@intel.com>
Subject: Re: Why return probes of some syscalls sometimes are not called?

On Thu, 9 Mar 2017 13:44:38 +0000
"Dorau, Lukasz" <lukasz.dorau@intel.com> wrote:

> Hi,
> 
> Could someone explain me why return probes of some syscalls (for example: futex, poll, epoll_wait) sometimes are not called?
> 
> It can be reproduced using the following bash script:
> https://gist.github.com/ldorau/c439d9ec7635409a5016c42e3a9121ec
> 
> Here are results gathered from 60 seconds test run on kernel 4.9.12 (Fedora 24):
> 
> futex:       p 56904    r 5489     (90% did not return (51415))
> poll:        p 43466    r 7703     (82% did not return (35763))
> epoll_wait:  p 73366    r 23551    (67% did not return (49815))
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

OK, I just dumped kprobe_profile after the test,

futex:       p 7775     r 698      (91% did not return (7077))
poll:        p 18409    r 3523     (80% did not return (14886))
epoll_wait:  p 5122     r 2389     (53% did not return (2733))
select:      p 5411     r 5286     (2% did not return (125))
fork:        p 0        r 0        (OK)
vfork:       p 0        r 0        (OK)
mmap:        p 179      r 179      (OK)
open:        p 921      r 921      (OK)
close:       p 1005     r 1005     (OK)
write:       p 5632     r 5631     (0% did not return (1))
read:        p 10879    r 10878    (0% did not return (1))
  r_futex                                                 1091               0
  p_futex                                                 8986               0
  r_poll                                                  4276               0
  p_poll                                                 20610               0
  r_epoll_wait                                            2849               0
  p_epoll_wait                                            5905               0
  r_select                                               10172               0
  p_select                                               10312               0
  r_fork                                                     0               0
  p_fork                                                     0               0
  r_vfork                                                    0               0
  p_vfork                                                    0               0
  r_mmap                                                  2987               0
  p_mmap                                                  2884               0
  r_open                                                  4002               0
  p_open                                                  3855               0
  r_close                                                 4262               0
  p_close                                                 4122               0
  r_write                                                14281               0
  p_write                                                14276               0
  r_read                                                 41494               0
  p_read                                                 41363               0

OK, there are no miss-counted event. So at least kprobe and kretprobe working correctly.
I also tried to use static tracepoints for that.
https://gist.github.com/mhiramat/04d782deaf110a6b3391e2ecb923325e

----
$ sudo bash test_kprobes.sh 10
Disabling all current probes ...
Removing old probe points ...
Adding new probe points ...
Enabling new probe points ...
Clearing old trace log ...

Tracing for 10 seconds ... done
Saving trace log ... done

Results (10 sec):
futex:       p 9856     r 1258     (87% did not return (8598))
poll:        p 7531     r 4031     (46% did not return (3500))
epoll_wait:  p 1996     r 1617     (18% did not return (379))
select:      p 273      r 257      (5% did not return (16))
Results (10 sec):
futex:       p 9851     r 9851     (OK)
poll:        p 7531     r 7531     (OK)
epoll_wait:  p 1996     r 1996     (OK)
select:      p 273      r 273      (OK)
----
Of course these events are collected in "different places" so
it could be different. But yeah, it seems sys_* function itself
dosen't return but jumps into ret_from_syscall etc.

Thank you,

-- 
Masami Hiramatsu <mhiramat@kernel.org>
--------------------------------------------------------------------

Intel Technology Poland sp. z o.o.
ul. Slowackiego 173 | 80-298 Gdansk | Sad Rejonowy Gdansk Polnoc | VII Wydzial Gospodarczy Krajowego Rejestru Sadowego - KRS 101882 | NIP 957-07-52-316 | Kapital zakladowy 200.000 PLN.

Ta wiadomosc wraz z zalacznikami jest przeznaczona dla okreslonego adresata i moze zawierac informacje poufne. W razie przypadkowego otrzymania tej wiadomosci, prosimy o powiadomienie nadawcy oraz trwale jej usuniecie; jakiekolwiek
przegladanie lub rozpowszechnianie jest zabronione.
This e-mail and any attachments may contain confidential material for the sole use of the intended recipient(s). If you are not the intended recipient, please contact the sender and delete all copies; any review or distribution by
others is strictly prohibited.

