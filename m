Received: from smtp-out.orange.com (smtp-out.orange.com [80.12.210.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90F3F1F5F6
	for <linux-trace-users@vger.kernel.org>; Sat, 11 May 2024 22:44:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.210.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715467478; cv=none; b=atBq6phvAQ7L4RWPliXP29j4yqldVqKHG57/0vTocM9yoQXqHmIkrFlitVjkXulMrhe0SIslujSfgYGGDNermEr06sflOStsAR4BD0WBY3y59i7KylivFs4d7EBJxU+Cms+gInejT4yXjoPeEaaFmF6bELMbZI68QaCK3uN4XlI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715467478; c=relaxed/simple;
	bh=VRkR8MhN7JNmDdst0rYDeGBKKr0alfjjllJWsYo5Kyo=;
	h=From:Message-ID:Date:MIME-Version:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=AyTtp/ehohomGSExriVVs7eiRBaN4Oy69AElc56z4Epo1zRTE/RcpVFk9YxvPWTiVMLDxfd2wYXrjhFj9AR/KUOC+OPAjVlNCkTgR8nzQohNF/P6ouyND77C62r0GEzIOG1iBTzLpeGzHTv+w5qLpDl/oxPf/EKX9SGKyJPngcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=orange.com; spf=pass smtp.mailfrom=orange.com; dkim=pass (2048-bit key) header.d=orange.com header.i=@orange.com header.b=iGWiNJfZ; arc=none smtp.client-ip=80.12.210.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=orange.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=orange.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=orange.com header.i=@orange.com header.b="iGWiNJfZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=orange.com; i=@orange.com; q=dns/txt; s=orange002;
  t=1715467476; x=1747003476;
  h=message-id:date:mime-version:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:from;
  bh=VRkR8MhN7JNmDdst0rYDeGBKKr0alfjjllJWsYo5Kyo=;
  b=iGWiNJfZJR3E5BHMXqcpN2j4fJI6Pd4X6KsdHQgfVuSNeVJMfMoswcVz
   eqZf0SDCD12L+dQ6HBCMdRjyHdNBZIacReKznjr5lua38vfpprg2wurde
   cIlxIDr1wjKCfhDpolUC9DIf4OUV7sxUqq9kBSHBre9u7n29qbybxgRTh
   5x686IHvriwi8NKV27PonoY+qe37TJZOU8iKdI9/2bs7uVJkpeA9pSVmN
   0rf20LnN97WKGPsV8oM/eqaKtI0kOY5nUXyKSiDEtR3EPZakhh4SqxZ1D
   U9MFc2273QBledafLpRjvkQu+Psxxc9/Pe/LZx1SM5AmbPD40ExBfCIOj
   w==;
Received: from unknown (HELO opfedv1rlp0a.nor.fr.ftgroup) ([x.x.x.x]) by
 smtp-out.orange.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2024 00:44:28 +0200
Received: from l-mail-int.rd.francetelecom.fr (HELO l-mail-int) ([x.x.x.x]) by
 opfedv1rlp0a.nor.fr.ftgroup with ESMTP; 12 May 2024 00:44:28 +0200
Received: from lat6466.rd.francetelecom.fr ([x.x.x.x])	by l-mail-int with esmtp (Exim
 4.94.2)	(envelope-from <alexandre.ferrieux@orange.com>)	id 1s5vRx-00CeJv-Rw;
 Sun, 12 May 2024 00:44:27 +0200
From: alexandre.ferrieux@orange.com
X-IronPort-AV: E=Sophos;i="6.08,155,1712613600"; 
   d="scan'208";a="141255864"
Message-ID: <738bfcbf-3f46-4ef4-8f10-057000bf07f6@orange.com>
Date: Sun, 12 May 2024 00:44:27 +0200
Precedence: bulk
X-Mailing-List: linux-trace-users@vger.kernel.org
List-Id: <linux-trace-users.vger.kernel.org>
List-Subscribe: <mailto:linux-trace-users+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-trace-users+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Betterbird (Linux)
Subject: Re: Ftrace, KASLR and gdb
To: Steven Rostedt <rostedt@goodmis.org>
Cc: linux-trace-users@vger.kernel.org
References: <b3a8fb9f-7746-421e-81c7-c890d676a871@orange.com>
 <20240510141229.5518eb2b@rorschach.local.home>
Content-Language: fr, en-US
In-Reply-To: <20240510141229.5518eb2b@rorschach.local.home>
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: base64

T24gMTAvMDUvMjAyNCAyMDoxMiwgU3RldmVuIFJvc3RlZHQgd3JvdGU6Cj4gCgpIaSBTdGV2ZW4u
IEhvbm91cmVkIHRvIGJlIHRhbGtpbmcgdG8gdGhlIGNyZWF0b3Igb2YgbXkgcHJlZmVycmVkIHRv
eSAhCgo+PiBGdHJhY2UgaXMgYSBqZXdlbCB0byBkaWcgaW50byB0aGUga2VybmVsLCBiZSBpdCBm
b3IgdHJvdWJsZXNob290aW5nLCBwZXJmIHR1bmluZyAKPj4gb3IganVzdCB1bmRlcnN0YW5kaW5n
Lgo+PiBCdXQgd2hlbiBvbmUgbmVlZHMgdG8gZGlzYXNzZW1ibGUgdGhlIHJ1bm5pbmcga2VybmVs
IChlZyB0byBtb3ZlIGtwcm9iZXMgYXJvdW5kIAo+PiBpbiBhIGZ1bmN0aW9uLCBpbiBvcmRlciB0
byB1bmRlcnN0YW5kIGEgZ2l2ZW4gY29kZSBwYXRoKSwgS0FTTFIgbWFrZXMgaXQgCj4+IGltcG9z
c2libGUgZm9yIGdkYiB0byBnZXQgdXNlZnVsIHN5bWJvbCBhZGRyZXNzZXMsIGV2ZW4gd2l0aCBh
IGRlYnVnIGltYWdlLgo+IAo+IFJlYWxseT8gQ2FuJ3QgeW91IGp1c3QgdXNlIGEgZnVuY3Rpb24g
bmFtZSBwbHVzIG9mZnNldD8gRm9yIGluc3RhbmNlLCBJCj4gZG8gdGhpcyBhbGwgdGhlIHRpbWU6
CgpZZXMsIG9uIHRoZSBmdHJhY2Ugc2lkZSwgb2J2aW91c2x5IG5hbWUrb2Zmc2V0IGFyZSBzdWZm
aWNpZW50LiBJIHVzZSB0aGVtIGFsbCAKdGhlIHRpbWUsIGFuZCBhbSBkZWxpZ2h0ZWQgd2l0aCBm
ZXRjaGFyZ3MuCgpUaGUgcHJvYmxlbSBpcyByYXRoZXIsIG9uIHRoZSBnZGIgc2lkZSwgd2l0aCBh
IHByb2R1Y3Rpb24ga2VybmVsIChub3QgdGhlIG9uZSAKeW91J3ZlIGp1c3QgY29tcGlsZWQpLCBv
biBhIHJhbmRvbSBtYWNoaW5lIHlvdSBoYXZlIGEgcGFzc2luZyBhY2Nlc3MgdG8uIEZpcnN0LCAK
dGhlIGtlcm5lbCBpdHNlbGYgaXMgY29tcHJlc3NlZCAodm1saW51eiksIGFuZCBpbiBtYW55IGNh
c2VzIGdldHRpbmcgdGhlIHZtbGludXggCmlzIGEgcGFpbi4gU28sIHdoYXQgRUxGIGJpbmFyeSBk
byB5b3UgcGFzcyB0byBnZGIgPwoKSW4gbXkgY2FzZToKCiAgIHN5bTJlbGYgL3Byb2Mva2FsbHN5
bXMgPiAvdG1wL2thbGxzeW1zLmVsZgogICBnZGIgL3RtcC9rYWxsc3ltcy5lbGYgL3Byb2Mva2Nv
cmUKICAgKGdkYikgZGlzYXNzIHZmc193cml0ZQogICAuLi4KCkFzIGFuIGFkZGVkIGJvbnVzLCBJ
IHNlZSAoYSBzbmFwc2hvdCBvZikgZ2xvYmFsczoKCiAgIChnZGIpIHAgKihpbnQgKilqaWZmaWVz
CiAgICQxID0gOTIyOTk5MjgKCkFuZCBhbHNvIEkgc2VlIGZ0cmFjZSdzIHN1cmdpY2FsIGNoYW5n
ZXMgaWYgYnkgYWNjaWRlbnQgSSBkaXNhc3NlbWJsZSBhIGZ1bmN0aW9uIApJIGN1cnJlbnRseSBh
bSBzbmlmZmluZyA7LSkKCiAgICBlY2hvICJwOmtwcm9iZV90cGFja2V0X3JjdiB0cGFja2V0X3Jj
disyNiBza2I9JWRpOng2NCIgPj4ga3Byb2JlX2V2ZW50cwogICAgKGdkYikgZGlzYXNzIHRjcGFr
ZXRfcmN2CiAgICBEdW1wIG9mIGFzc2VtYmxlciBjb2RlIGZvciBmdW5jdGlvbiB0cGFja2V0X3Jj
djoKICAgICAgMHhmZmZmZmZmZmI5ZDc5ZTEwIDwrMD46ICAgICBlbmRicjY0CiAgICAgIC4uLgog
ICAgICAweGZmZmZmZmZmYjlkNzllMmEgPCsyNj46ICAgIGptcCAgICAweGZmZmZmZmZmYzEzODkw
MDAgPGtwcm9iZV9vcHRpbnNuX3BhZ2U+CgpPZiBjb3Vyc2UgdGhlIGxhdHRlciBvbmx5IHNlcnZl
cyBteSBjdXJpb3NpdHk7IGJ1dCBpdCBzaG93cyBJJ20gbG9va2luZyBhdCB0aGUgCiJsaXZlIiBj
b2RlLiBJdCBtYXR0ZXJzIGluIG90aGVyIGNhc2VzIG9mIGR5bmFtaWMgY29kZSwgbGlrZSBzdGF0
aWMgYnJhbmNoZXMuCgpTbywgaXMgdGhlcmUgY3VycmVudGx5IGFub3RoZXIgbWV0aG9kIHRvIHJl
YWNoIHRoZSBzYW1lIGVmZmVjdCA/CgotQWxleApfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18NCkNlIG1lc3NhZ2UgZXQgc2VzIHBpZWNlcyBqb2ludGVz
IHBldXZlbnQgY29udGVuaXIgZGVzIGluZm9ybWF0aW9ucyBjb25maWRlbnRpZWxsZXMgb3UgcHJp
dmlsZWdpZWVzIGV0IG5lIGRvaXZlbnQgZG9uYw0KcGFzIGV0cmUgZGlmZnVzZXMsIGV4cGxvaXRl
cyBvdSBjb3BpZXMgc2FucyBhdXRvcmlzYXRpb24uIFNpIHZvdXMgYXZleiByZWN1IGNlIG1lc3Nh
Z2UgcGFyIGVycmV1ciwgdmV1aWxsZXogbGUgc2lnbmFsZXINCmEgbCdleHBlZGl0ZXVyIGV0IGxl
IGRldHJ1aXJlIGFpbnNpIHF1ZSBsZXMgcGllY2VzIGpvaW50ZXMuIExlcyBtZXNzYWdlcyBlbGVj
dHJvbmlxdWVzIGV0YW50IHN1c2NlcHRpYmxlcyBkJ2FsdGVyYXRpb24sDQpPcmFuZ2UgZGVjbGlu
ZSB0b3V0ZSByZXNwb25zYWJpbGl0ZSBzaSBjZSBtZXNzYWdlIGEgZXRlIGFsdGVyZSwgZGVmb3Jt
ZSBvdSBmYWxzaWZpZS4gTWVyY2kuDQoNClRoaXMgbWVzc2FnZSBhbmQgaXRzIGF0dGFjaG1lbnRz
IG1heSBjb250YWluIGNvbmZpZGVudGlhbCBvciBwcml2aWxlZ2VkIGluZm9ybWF0aW9uIHRoYXQg
bWF5IGJlIHByb3RlY3RlZCBieSBsYXc7DQp0aGV5IHNob3VsZCBub3QgYmUgZGlzdHJpYnV0ZWQs
IHVzZWQgb3IgY29waWVkIHdpdGhvdXQgYXV0aG9yaXNhdGlvbi4NCklmIHlvdSBoYXZlIHJlY2Vp
dmVkIHRoaXMgZW1haWwgaW4gZXJyb3IsIHBsZWFzZSBub3RpZnkgdGhlIHNlbmRlciBhbmQgZGVs
ZXRlIHRoaXMgbWVzc2FnZSBhbmQgaXRzIGF0dGFjaG1lbnRzLg0KQXMgZW1haWxzIG1heSBiZSBh
bHRlcmVkLCBPcmFuZ2UgaXMgbm90IGxpYWJsZSBmb3IgbWVzc2FnZXMgdGhhdCBoYXZlIGJlZW4g
bW9kaWZpZWQsIGNoYW5nZWQgb3IgZmFsc2lmaWVkLg0KVGhhbmsgeW91Lgo=

