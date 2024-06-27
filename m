Received: from smtpout.efficios.com (smtpout.efficios.com [167.114.26.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27E0A360
	for <linux-trace-users@vger.kernel.org>; Thu, 27 Jun 2024 19:36:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=167.114.26.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719517005; cv=none; b=Lq/t+tgAjfuK7Do6Q2vfHRMZWx1p7WADjfsYnMs8+u7Gwns5ZsdFJSQQ2ukIkoQWufkt1HmnmUXxNQvmhwBE31wuFGozprUjGFTBeTyHWwf8PRCOfnj4+Y1aC92/5+5P/Yer7ok5rpA2YaocuDZ2vYpIlzu0jmn1NlFctQK2qTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719517005; c=relaxed/simple;
	bh=Cd4YfZeNOPoWKHDS3QMYA0R/F9JHxG1QYUuf2VpgTPo=;
	h=Message-ID:Date:MIME-Version:From:To:Cc:Subject:Content-Type; b=eMONpair6BI3OCn9LZWhg+fehgPRtJ3LnWOfxjVqUfE9eKP1QFZmpbT0gBIQ78NMui6w4FZdc8T+ruoes01I82n631S5YVGyk+FhQKEVEt+IcJrT+IBOQ0cJHXlZuPhS8E79dhqvu3QXNFtgLUCc+GkSrk3QGDiruUmaSxdXDIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=efficios.com; spf=pass smtp.mailfrom=efficios.com; dkim=pass (2048-bit key) header.d=efficios.com header.i=@efficios.com header.b=mSqUR7v3; arc=none smtp.client-ip=167.114.26.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=efficios.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=efficios.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=efficios.com header.i=@efficios.com header.b="mSqUR7v3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=efficios.com;
	s=smtpout1; t=1719516996;
	bh=Cd4YfZeNOPoWKHDS3QMYA0R/F9JHxG1QYUuf2VpgTPo=;
	h=Date:From:To:Cc:Subject:From;
	b=mSqUR7v37f2wLpPPgCkbwcZx4yIBM18+qCsjjLeyLxiPcl8Aa2LBodzXmA+cnaDCp
	 3//KI2SkWUe4rhsHLUqGrQWjoL7y/T52WY0YbziGRoLCGXd54kCCmAwBf9Zu+rCt+L
	 Sm8bTsJxMayrM3ZBrWSyJg5efU9bPDAGqzu5JmPLY7//Y0STtC5B/pkLvjRAt7eJl1
	 e9DSuIT09mm4Ec2381tJFoSCUutdh87f1Cl+AhDl+PVj11JvuSjqjN9LV6kjrMMESw
	 os1bQmNuwhc+vSDx/IPIdTA3lJJenMmKIWVlSRIxXXBpIxCOSw6K5KqGoObK0/NNZ4
	 78ZyMSrBesu9w==
Received: from [172.16.0.134] (192-222-143-198.qc.cable.ebox.net [192.222.143.198])
	by smtpout.efficios.com (Postfix) with ESMTPSA id 4W982X1wtpz180c;
	Thu, 27 Jun 2024 15:36:36 -0400 (EDT)
Message-ID: <13eebb98-ddec-404d-81e6-452915b1b819@efficios.com>
Date: Thu, 27 Jun 2024 15:37:09 -0400
Precedence: bulk
X-Mailing-List: linux-trace-users@vger.kernel.org
List-Id: <linux-trace-users.vger.kernel.org>
List-Subscribe: <mailto:linux-trace-users+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-trace-users+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
From: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
To: Beau Belgrave <beaub@linux.microsoft.com>
Cc: Philippe Proulx <pproulx@efficios.com>,
 Doug Cook <dcook@linux.microsoft.com>,
 Diamon discuss <diamon-discuss@lists.linuxfoundation.org>,
 lttng-dev <lttng-dev@lists.lttng.org>,
 Matthew Khouzam <matthew.khouzam@ericsson.com>,
 linux-trace-users <linux-trace-users@vger.kernel.org>,
 tracecompass-dev@eclipse.org
Subject: Common Trace Format 2 (CTF2) specification and sub-specs
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

Here is the status of the specification and sub-specifications:

- "CTF2‑SPEC‑2.0: Common Trace Format version 2"
   https://diamon.org/ctf/files/CTF2-SPEC-2.0.html

This is the official CTF 2.0 spec. The URL https://diamon.org/ctf
points to the latest version of the Common Trace Format spec.

- "CTF2‑DOCID‑2.0: CTF 2 document identifier format"
   https://diamon.org/ctf/files/CTF2-DOCID-2.0.html

The CTF 2 specification refers to it.

- "CTF2-FS-1.0: Layout of a CTF 2 trace stored on a file system"
   https://diamon.org/ctf/files/CTF2-FS-1.0.html

This document covers how Babeltrace and Trace Compass
will expect the CTF2 files on the filesystem, and how
Babeltrace and LTTng plan to produce them. This is by
all means an "optional" specification, which means it
is up to the implementation to decide whether they want
to abide by it or not.

Philippe plans to soon release a CTF2-FS-2.0 document with
pretty much the same content as version 1.0, but formatted
following the CTF2‑DOCID‑2.0 specification.

We are planning to add an index of those relevant "optional"
specifications within the CTF2 specification so they can easily
be found.

If we end up having a new storage pattern that end up being
commonly used by implementations, e.g. storing a CTF2 trace
within a binary blob in OpenTelemetry [1], we can always create
a new sub-specification similar to CTF2-FS to cover this.

The following specification files were deprecated by the
time the CTF2 specification was finalized:

- https://diamon.org/ctf/files/CTF2-BASICATTRS-1.0.html
- https://diamon.org/ctf/files/CTF2-PMETA-1.0.html

As always, feedback is welcome!

Thanks,

Mathieu

[1] https://github.com/open-telemetry/opentelemetry-specification/issues/3979

-- 
Mathieu Desnoyers
EfficiOS Inc.
https://www.efficios.com
