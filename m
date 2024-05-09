Received: from smtp-out.orange.com (smtp-out.orange.com [80.12.126.239])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0952213B7BD
	for <linux-trace-users@vger.kernel.org>; Thu,  9 May 2024 12:44:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.126.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715258674; cv=none; b=H3VgItuh0a8oM+DxtlzOp85YrWFH+WRc0hJIrvpGWLDUm6vriolzkYFjRtG0qTR1B4FQyxzgGdccidbHufKHyQAbVX/i634BGjbKSdTmsjl14uF8dgeTsTA5gyO5m7HNJzO8/3AUwk62bXuG0ibNaP3oUi5mItaqZ/Qdkwa2LM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715258674; c=relaxed/simple;
	bh=fr9glBXoTjXbmo4r8+WkgKgJcW6uK9xVuYzboNLENEg=;
	h=From:Message-ID:Date:MIME-Version:To:Subject:Content-Type; b=Iy+vmciCJA7U9BApbrKKu50DEg3SN+vuqQ37Hr6EtQHK38uXKJuX4pEalj955ki6/X67u2xo02USlxe1URlQnLCMlfBGaAPgto4KUzE0NmSh1JPxK2CgWapEShknD7Fr1F61yKe7IlGSc/oxMw6mdB37v6Zb1z/3Vm4M/k3KVfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=orange.com; spf=pass smtp.mailfrom=orange.com; dkim=pass (2048-bit key) header.d=orange.com header.i=@orange.com header.b=mSTV7JgB; arc=none smtp.client-ip=80.12.126.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=orange.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=orange.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=orange.com header.i=@orange.com header.b="mSTV7JgB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=orange.com; i=@orange.com; q=dns/txt; s=orange002;
  t=1715258672; x=1746794672;
  h=message-id:date:mime-version:to:subject:
   content-transfer-encoding:from;
  bh=fr9glBXoTjXbmo4r8+WkgKgJcW6uK9xVuYzboNLENEg=;
  b=mSTV7JgB0ElDHzD7JjKSdF8r1vMA83ThUieocodDqXq0fqAxrrZztsDf
   /+JwmmVPYN8HszpQlX1ffococwu3YXplFAmor7wnlCTw0EWgI76ZH5QtV
   5qAXSLP19tT+YdY35ystdfeFlBXyBUaZxkxNN51eQRHlcpHsycEsDu4Sf
   eRhuySfxabqtGPTwmNkSxxBNS7sjDaJVDWKORmDn4YLsqzSZauBw0RTgH
   w/nomG6OfskRX0Y5TEDnCvSrAXxYyHkfU01j7nsv4wOudKJj3NlV8tWrA
   PNZ0pk1OX4XeSbbKk4k7QMBGlN82VLi4e5Tw1UjNX3KQkbP/HgN0TLg00
   A==;
Received: from unknown (HELO opfedv1rlp0f.nor.fr.ftgroup) ([x.x.x.x]) by
 smtp-out.orange.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2024 14:44:29 +0200
Received: from unknown (HELO OPE16NORMBX104.corporate.adroot.infra.ftgroup)
 ([x.x.x.x]) by opfedv1rlp0f.nor.fr.ftgroup with
 ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 09 May 2024 14:44:29 +0200
Received: from [x.x.x.x] [x.x.x.x] by OPE16NORMBX104.corporate.adroot.infra.ftgroup
 [x.x.x.x] with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37;
 Thu, 9 May 2024 14:44:29 +0200
From: alexandre.ferrieux@orange.com
X-IronPort-AV: E=Sophos;i="6.08,147,1712613600"; 
   d="scan'208";a="138125701"
Message-ID: <b3a8fb9f-7746-421e-81c7-c890d676a871@orange.com>
Date: Thu, 9 May 2024 14:44:22 +0200
Precedence: bulk
X-Mailing-List: linux-trace-users@vger.kernel.org
List-Id: <linux-trace-users.vger.kernel.org>
List-Subscribe: <mailto:linux-trace-users+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-trace-users+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Betterbird (Linux)
To: <linux-trace-users@vger.kernel.org>
Content-Language: fr, en-US
Subject: Ftrace, KASLR and gdb
X-ClientProxiedBy: OPE16NORMBX408.corporate.adroot.infra.ftgroup
 (10.115.27.17) To OPE16NORMBX104.corporate.adroot.infra.ftgroup (10.115.26.5)
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: base64

SGksCgpGdHJhY2UgaXMgYSBqZXdlbCB0byBkaWcgaW50byB0aGUga2VybmVsLCBiZSBpdCBmb3Ig
dHJvdWJsZXNob290aW5nLCBwZXJmIHR1bmluZyAKb3IganVzdCB1bmRlcnN0YW5kaW5nLgpCdXQg
d2hlbiBvbmUgbmVlZHMgdG8gZGlzYXNzZW1ibGUgdGhlIHJ1bm5pbmcga2VybmVsIChlZyB0byBt
b3ZlIGtwcm9iZXMgYXJvdW5kIAppbiBhIGZ1bmN0aW9uLCBpbiBvcmRlciB0byB1bmRlcnN0YW5k
IGEgZ2l2ZW4gY29kZSBwYXRoKSwgS0FTTFIgbWFrZXMgaXQgCmltcG9zc2libGUgZm9yIGdkYiB0
byBnZXQgdXNlZnVsIHN5bWJvbCBhZGRyZXNzZXMsIGV2ZW4gd2l0aCBhIGRlYnVnIGltYWdlLgpU
aGF0IHNhaWQsIC9wcm9jL2thbGxzeW1zIGFsd2F5cyBnaXZlcyB0aGUgYWNjdXJhdGUsIHByZXNl
bnQgc3ltYm9sIGFkZHJlc3Nlcy4gCkJ1dCwgdG8gbXkga25vd2xlZGdlLCBnZGIgaXNuJ3QgYWJs
ZSB0byBpbXBvcnQgL3Byb2Mva2FsbHN5bXMgYXMgYSBzeW1ib2wgdGFibGUuClRvIGNpcmN1bXZl
bnQgdGhpcywgSSd2ZSB3cml0dGVuIGEgc21hbGwgdXNlcmxhbmQgdG9vbCwgdXNsaW5nIGxpYmJm
ZCwgdGhhdCAKY3JlYXRlcyBhbiBFTEYgZmlsZSBvdXQgb2YgL3Byb2Mva2FsbHN5bXMuIFBhc3Np
bmcgdGhpcyBFTEYgZmlsZSB0byBnZGIgaW5zdGVhZCAKb2YgInZtbGludXgiLCBhbmQgL3Byb2Mv
a2NvcmUgYXMgY29yZSwgdGhlbiBhbGxvd3MgZm9yIGEgcGVyZmVjdCBnZGIgc2Vzc2lvbiBvbiAK
dGhlIHJ1bm5pbmcga2VybmVsLiBPZiBjb3Vyc2UgdGhpcyBFTEYgZmlsZSBpcyBvbmx5IHZhbGlk
IHVudGlsIHRoZSBuZXh0IHJlYm9vdCwgCmJ1dCB0aGF0J3Mgb2theSBhcyBpdHMgY3JlYXRpb24g
aXMgZmFzdC4KCk5vdywgbXkgcXVlc3Rpb246IGRpZCBJIG1pc3MgYW4gYWx0ZXJuYXRpdmUgPwoK
SW4gb3RoZXIgd29yZHMsIGlzIHRoZXJlIHNvbWUga2luZCBvZiAia2FsbHN5bXMgcGx1Zy1pbiIg
Zm9yIGdkYiBzb21ld2hlcmUgPwpPciwgdGFraW5nIHRoZSBwcm9ibGVtIGZyb20gdGhlIG90aGVy
IHNpZGUsIHNvbWUga2VybmVsIG1vZHVsZSBleHBvc2luZyBhIAoiL3Byb2Mva2FsbHN5bXMuZWxm
IiBvciBzaW1pbGFyLCBmb3IgZGlyZWN0IGNvbnN1bXB0aW9uIGJ5IGdkYiA/Ck9yIGFub3RoZXIg
bWV0aG9kLCB0aGF0IHBlb3BsZSByb3V0aW5lbHkgdXNlIGZvciB0aGUgc2FtZSBwdXJwb3NlID8K
ClRoYW5rcyBpbiBhZHZhbmNlLAoKLUFsZXgKCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXw0KQ2UgbWVzc2FnZSBldCBzZXMgcGllY2VzIGpvaW50
ZXMgcGV1dmVudCBjb250ZW5pciBkZXMgaW5mb3JtYXRpb25zIGNvbmZpZGVudGllbGxlcyBvdSBw
cml2aWxlZ2llZXMgZXQgbmUgZG9pdmVudCBkb25jDQpwYXMgZXRyZSBkaWZmdXNlcywgZXhwbG9p
dGVzIG91IGNvcGllcyBzYW5zIGF1dG9yaXNhdGlvbi4gU2kgdm91cyBhdmV6IHJlY3UgY2UgbWVz
c2FnZSBwYXIgZXJyZXVyLCB2ZXVpbGxleiBsZSBzaWduYWxlcg0KYSBsJ2V4cGVkaXRldXIgZXQg
bGUgZGV0cnVpcmUgYWluc2kgcXVlIGxlcyBwaWVjZXMgam9pbnRlcy4gTGVzIG1lc3NhZ2VzIGVs
ZWN0cm9uaXF1ZXMgZXRhbnQgc3VzY2VwdGlibGVzIGQnYWx0ZXJhdGlvbiwNCk9yYW5nZSBkZWNs
aW5lIHRvdXRlIHJlc3BvbnNhYmlsaXRlIHNpIGNlIG1lc3NhZ2UgYSBldGUgYWx0ZXJlLCBkZWZv
cm1lIG91IGZhbHNpZmllLiBNZXJjaS4NCg0KVGhpcyBtZXNzYWdlIGFuZCBpdHMgYXR0YWNobWVu
dHMgbWF5IGNvbnRhaW4gY29uZmlkZW50aWFsIG9yIHByaXZpbGVnZWQgaW5mb3JtYXRpb24gdGhh
dCBtYXkgYmUgcHJvdGVjdGVkIGJ5IGxhdzsNCnRoZXkgc2hvdWxkIG5vdCBiZSBkaXN0cmlidXRl
ZCwgdXNlZCBvciBjb3BpZWQgd2l0aG91dCBhdXRob3Jpc2F0aW9uLg0KSWYgeW91IGhhdmUgcmVj
ZWl2ZWQgdGhpcyBlbWFpbCBpbiBlcnJvciwgcGxlYXNlIG5vdGlmeSB0aGUgc2VuZGVyIGFuZCBk
ZWxldGUgdGhpcyBtZXNzYWdlIGFuZCBpdHMgYXR0YWNobWVudHMuDQpBcyBlbWFpbHMgbWF5IGJl
IGFsdGVyZWQsIE9yYW5nZSBpcyBub3QgbGlhYmxlIGZvciBtZXNzYWdlcyB0aGF0IGhhdmUgYmVl
biBtb2RpZmllZCwgY2hhbmdlZCBvciBmYWxzaWZpZWQuDQpUaGFuayB5b3UuCg==

