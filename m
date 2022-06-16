Return-Path: <linux-trace-users-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75271C433EF
	for <linux-trace-users@archiver.kernel.org>; Thu, 16 Jun 2022 13:00:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233414AbiFPNAa (ORCPT
        <rfc822;linux-trace-users@archiver.kernel.org>);
        Thu, 16 Jun 2022 09:00:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36426 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229927AbiFPNA2 (ORCPT
        <rfc822;linux-trace-users@vger.kernel.org>);
        Thu, 16 Jun 2022 09:00:28 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 984943CFFE
        for <linux-trace-users@vger.kernel.org>; Thu, 16 Jun 2022 06:00:26 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 44DBFB823AB
        for <linux-trace-users@vger.kernel.org>; Thu, 16 Jun 2022 13:00:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 863B8C34114;
        Thu, 16 Jun 2022 13:00:23 +0000 (UTC)
Date:   Thu, 16 Jun 2022 09:00:22 -0400
From:   Steven Rostedt <rostedt@goodmis.org>
To:     Matteo Bertolino <matteo.bertolino@huawei.com>
Cc:     "linux-trace-users@vger.kernel.org" 
        <linux-trace-users@vger.kernel.org>
Subject: Re: Format of trace.dat flyrecord section
Message-ID: <20220616090022.7b60a7a3@gandalf.local.home>
In-Reply-To: <e3287c4e7ae2407f873bedf74df9651c@huawei.com>
References: <e3287c4e7ae2407f873bedf74df9651c@huawei.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-trace-users.vger.kernel.org>
X-Mailing-List: linux-trace-users@vger.kernel.org


[ Resending due to typo in mailing list address ]

On Wed, 15 Jun 2022 15:18:41 +0000
Matteo Bertolino <matteo.bertolino@huawei.com> wrote:

> Dear community,

Hi Matteo,

And welcome to our community!

> 
> [Goal] I am trying to understand more about tracing. In one of my experiments, I decided to try to write my own trace.dat file (with some dummy entries).
> To do that, I am following the documentation for a "version-7 .dat" provided in https://github.com/rostedt/trace-cmd/blob/master/Documentation/trace-cmd/trace-cmd.dat.v7.5.txt , 
> and trying to looking at the code of libtraceevent, trace-cmd and kernelshark. I use kernelshark to be sure I am writing a good trace.
> 
> [Context] I managed to write a complete header (I double-checked checking in strategical points in trace-cmd, kernelshark and libtraceevent code). In this header, I have three sections:
> - Section 0, with options 16 (header_infos), option 8 (in which I stated to have a single CPU), and option 3. The latter states that I have a cpu whose data starts at offset 4096 of the trace.
> - Section 16: in which I transfers the information of `header_page` and `header_event` files.
> - Section 3: the flyrecord section, whose header is followed by a padding to be one-page aligned. After the padding, there should be the CPU datas.
> Yet another check of the header's correctness are outputs of commands `trace-cmd dump --flyrecord -i mytrace.dat` and `trace-cmd dump --summary -i ../mytrace_v7.dat`.
> 
> [Problem] The problems occur there. I don't manage to get the format of flyrecords. 
> I understood that timestamps need to follow the structure of ringbuffers (those expressed in `header_event` file), so 5 bits for the type_len, 27 for the time_delta, and an u32 array[].

I guess you have most the meta data set up. Now the actual data is defined
by the Linux kernel, which you appear to have some idea about. The document
of the format is in the kernel here:

  https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/include/linux/ring_buffer.h#n22

And is broken up by the defined "page size" (which is really a misnomer,
because it should be the "buffer" size) in the BUFFER option.

  trace-cmd dump --options
[..]
                [Option BUFFER, 183 bytes]
1540361 [offset]
"" [name]
"local" [clock]
4096 [Page size, bytes]   <---
8 [CPUs]:


Thus the buffer is broken up by 4096 bytes, where the first page has the
timestamp information (defined in the kernel)

 # cat /sys/kernel/tracing/events/header_page
	field: u64 timestamp;	offset:0;	size:8;
 signed:0; field: local_t commit;	offset:8;	size:8;
 signed:1; field: int overwrite;	offset:8;	size:1;
 signed:1; field: char data;	offset:16;	size:4080;
 signed:1;

The timestamp is what the rest of the timestamps are based on.

The commit is the size of the data on the page (should be less than 4096 -
16)

"overwrite" means that the commit can hold flags that show that events were
missed.

"data" is where the payload of events exist.

Also stored in the trace.dat file:

  trace-cmd dump --head-page
	[Section 16 @ 37: "headers", flags 0x1, 263 bytes]
	[Header page, 205 bytes]
	field: u64 timestamp;	offset:0;	size:8;
  signed:0; field: local_t commit;	offset:8;	size:8;
  signed:1; field: int overwrite;	offset:8;	size:1;
  signed:1; field: char data;	offset:16;	size:4080;
  signed:1;


As described in ring_buffer.h, the events then have a header:

The type_len is 5 bits that are as follows:

0 - means that the length of the entire event is in the next 4 bytes,
   and the payload starts in the 4 bytes after that.
1-28 - means that the payload of the event starts in the next 4 bytes
  and is a multiple of 4 of this field.
  1 - the payload is 4 bytes
  28 - the payload is 112 bytes.
 For events bigger than 112 bytes, the size is defined by the 4 bytes,
  and this field is zero.

29 - padding
30 - time extend
31 - absolute timestamp.

The above is also stored in the trace.dat file:

  trace-cmd dump --head-event
        [Section 16 @ 37: "headers", flags 0x1, 263 bytes]
        [Header event, 205 bytes]
# compressed entry header
        type_len    :    5 bits
        time_delta  :   27 bits
        array       :   32 bits

        padding     : type == 29
        time_extend : type == 30
        time_stamp : type == 31
        data max type_len  == 28



Then the rest of the payload is defined by the events themselves, that is
stored in the trace.dat file:

 trace-cmd dump --events
[..]
        [Section 18 @ 1734: "events format", flags 0x1, 116488 bytes]
        [Events format, 110 systems]
name: xhci_urb_giveback
ID: 1425
format:
        field:unsigned short common_type;       offset:0;       size:2;
 signed:0; field:unsigned char common_flags;       offset:2;       size:1;
 signed:0; field:unsigned char common_preempt_count;       offset:3;
 size:1; signed:0; field:int common_pid;   offset:4;       size:4; signed:1;

        field:void * urb;       offset:8;       size:8; signed:0;
        field:unsigned int pipe;        offset:16;      size:4; signed:0;
        field:unsigned int stream;      offset:20;      size:4; signed:0;
        field:int status;       offset:24;      size:4; signed:1;
        field:unsigned int flags;       offset:28;      size:4; signed:0;
        field:int num_mapped_sgs;       offset:32;      size:4; signed:1;
        field:int num_sgs;      offset:36;      size:4; signed:1;
        field:int length;       offset:40;      size:4; signed:1;
        field:int actual;       offset:44;      size:4; signed:1;
        field:int epnum;        offset:48;      size:4; signed:1;
        field:int dir_in;       offset:52;      size:4; signed:1;
        field:int type; offset:56;      size:4; signed:1;
        field:int slot_id;      offset:60;      size:4; signed:1;

print fmt: "ep%d%s-%s: urb %p pipe %u slot %d length %d/%d sgs %d/%d stream
%d flags %08x", REC->epnum, REC->dir_in ? "in" : "out",
__print_symbolic(REC->type, { 3, "intr" }, { 0, "control" }, { 2, "bulk" },
{ 1, "isoc" }), REC->urb, REC->pipe, REC->slot_id, REC->actual,
REC->length, REC->num_mapped_sgs, REC->num_sgs, REC->stream, REC->flags

[..]

This defines the payload that sits in the event.


> But, kernelshark entries contains also: timestamp, CPUs, PID, EVENT, TASK, LATENCY and "INFO". 
> 
> Through flybuffer schema, I can only provide TIMESTAMP divided by CPUs, but where do I take other fields?
> In addition to this, I didn't understand how I can provide multiple entries.
> 


Hope the above helps.

-- Steve
