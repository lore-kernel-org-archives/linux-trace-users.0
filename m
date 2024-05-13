Received: from smtp-out.orange.com (smtp-out.orange.com [80.12.126.239])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4068221342
	for <linux-trace-users@vger.kernel.org>; Mon, 13 May 2024 18:26:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.126.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715624773; cv=none; b=JGDVBSDxJPCCxo/H98ZXWc49dKtv6MsVoM/A3rKWRxY8ObaU5e/XxFz11Rta19M2vOtRFsFljIJAyOAiv2a2H5a8e1r6idxNgS/Rc9HjeaN+IWyth8RpJk7QUo/zIwI6OwthKi9W0tkeZkrRSnR4Se6EplKgLDj9FnOMh69lTio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715624773; c=relaxed/simple;
	bh=XAgMRd5fW594AmqBKJJ1oebJWfxzSEfFeRbkYbRENaU=;
	h=From:Message-ID:Date:MIME-Version:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=lxFC+94y4FcCsUM5w/RrUwr2AFUIJz1oWUmS1ZFS6aPlZQsSw+WTti3BWj0UASPepmqaEcyORD46hLhyk+IsHlsbo+TEhtD2bNXQt+xIlcUiMuf2u88zkdX3gtpli/S0RQ6AMIltLoyno23Rut0SFnZKKxN/KN4PK/H6VNWs7BI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=orange.com; spf=pass smtp.mailfrom=orange.com; dkim=pass (2048-bit key) header.d=orange.com header.i=@orange.com header.b=LXH6FBAm; arc=none smtp.client-ip=80.12.126.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=orange.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=orange.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=orange.com header.i=@orange.com header.b="LXH6FBAm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=orange.com; i=@orange.com; q=dns/txt; s=orange002;
  t=1715624771; x=1747160771;
  h=message-id:date:mime-version:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:from;
  bh=XAgMRd5fW594AmqBKJJ1oebJWfxzSEfFeRbkYbRENaU=;
  b=LXH6FBAm9I2To3gOCYOElmMf4oFlqFM8xxLCUTRy3E9oU38vArDSlpkv
   S/8hrJcp7IpNshKLFHPQo7h4kOl/D6l72IMLPXakEGyCGBigKuzHOH+79
   qvkEXLSJQhfS8NFMBk6kFbI8yM8TgpjIOORfwCB0VA0suRSGePdPEH9pP
   oEV52CIAz0/xEY8nm73YGZzsiu5QCPm5wuSLPqRydUM8+xHN+N9+uVz57
   PEtpXWexzdAV7TFs5ftRVwAuyqd9gy4dOd4GV0Ls2jK08cVCBoztqCVYJ
   R+Fx1xXrn/CcskUTtQ8Wq0Mybj9MLcyihG2l3qApmcgLZt3xsWABeYMcf
   Q==;
Received: from unknown (HELO opfedv3rlp0d.nor.fr.ftgroup) ([x.x.x.x]) by
 smtp-out.orange.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2024 20:26:03 +0200
Received: from mailhost.rd.francetelecom.fr (HELO l-mail-int) ([x.x.x.x]) by
 opfedv3rlp0d.nor.fr.ftgroup with ESMTP; 13 May 2024 20:26:02 +0200
Received: from lat6466.rd.francetelecom.fr ([x.x.x.x])	by l-mail-int with esmtp (Exim
 4.94.2)	(envelope-from <alexandre.ferrieux@orange.com>)	id 1s6aMx-00HaQK-Qz;
 Mon, 13 May 2024 20:26:01 +0200
From: alexandre.ferrieux@orange.com
X-IronPort-AV: E=Sophos;i="6.08,159,1712613600"; 
   d="scan'208";a="144003692"
Message-ID: <c6bc4ca5-0ead-4954-89ce-55a44ac766f8@orange.com>
Date: Mon, 13 May 2024 20:26:01 +0200
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
 <738bfcbf-3f46-4ef4-8f10-057000bf07f6@orange.com>
 <20240513122522.5c80ab0f@rorschach.local.home>
Content-Language: fr, en-US
In-Reply-To: <20240513122522.5c80ab0f@rorschach.local.home>
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: base64

CgpPbiAxMy8wNS8yMDI0IDE4OjI1LCBTdGV2ZW4gUm9zdGVkdCB3cm90ZToKPiAKPiBBaCwgc28g
eW91IGFyZSBydW5uaW5nIGdkYiBvbiB0aGUgbGl2ZSBrZXJuZWwuCgpZZXAgLSBzb3JyeSBJIGRp
ZG4ndCBtYWtlIGl0IGNsZWFyIGluIHRoZSBmaXJzdCBwbGFjZSA6KQoKPj4gU28sIGlzIHRoZXJl
IGN1cnJlbnRseSBhbm90aGVyIG1ldGhvZCB0byByZWFjaCB0aGUgc2FtZSBlZmZlY3QgPwo+IAo+
IEJlc2lkZXMga2dkYiAodXN1YWxseSBhbm90aGVyIG1hY2hpbmUgY29ubmVjdGVkIHRvIHRoZSBs
aXZlIGtlcm5lbCksCj4gdGhpcyBpcyBwcm9iYWJseSB0aGUgb25seSB3YXkgdG8gZG8gd2hhdCB5
b3Ugd2FudC4KT2ssIHRoYW5rIHlvdSBmb3IgdGhlIGluZm8uCgpPbmUgcmVhc29uIEknbSBub3Qg
dXNpbmcga2dkYiwgYmVzaWRlIHRoZSBvYnZpb3VzIHBhaW4gaXQgaXMgdG8gc2V0IHVwIGEgc2Vj
b25kIAptYWNoaW5lIHdpdGggdGhlIGFwcHJvcHJpYXRlIGxpbmsuLi4gaXMgdGhlIHNwaXJpdCBv
ZiBmdHJhY2UgaXRzZWxmOiBubyBuZWVkIGZvciAKYnJlYWtwb2ludHMgd2hlbiB5b3UgaGF2ZSBh
IG5lYXJseS16ZXJvLW92ZXJoZWFkLCBmbGV4aWJsZSBsb2dnZXIuCgpBbmQgbGVhcm5pbmcgZnJv
bSB0aGUgImxpdmUgYmVhc3QiIGlzIGEgMTAwMHggc3BlZWR1cCB3cnQgcmVhZGluZyB0aGUgc291
cmNlLiAKTGVhcm5pbmcgdGhlIExpbnV4IEtlcm5lbCwgYXMgb3BlbiBhcyBpdHMgc291cmNlIG1h
eSBiZSwgbGFyZ2VseSByZW1haW5zIGEgCnJldmVyc2UtZW5naW5lZXJpbmcgb3BlcmF0aW9uLiBX
aXRoIEZ0cmFjZSwgUGFob2xlLCBhbmQgR2RiLCBvbmUgY2FuIGRpZyAKKmFueXdoZXJlKi4gTXkg
cmVhc3NlcnRlZCBrdWRvcyBmb3IgbWFraW5nIHRoaXMgcG9zc2libGUgIQoKLUFsZXgKCgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fDQpDZSBtZXNz
YWdlIGV0IHNlcyBwaWVjZXMgam9pbnRlcyBwZXV2ZW50IGNvbnRlbmlyIGRlcyBpbmZvcm1hdGlv
bnMgY29uZmlkZW50aWVsbGVzIG91IHByaXZpbGVnaWVlcyBldCBuZSBkb2l2ZW50IGRvbmMNCnBh
cyBldHJlIGRpZmZ1c2VzLCBleHBsb2l0ZXMgb3UgY29waWVzIHNhbnMgYXV0b3Jpc2F0aW9uLiBT
aSB2b3VzIGF2ZXogcmVjdSBjZSBtZXNzYWdlIHBhciBlcnJldXIsIHZldWlsbGV6IGxlIHNpZ25h
bGVyDQphIGwnZXhwZWRpdGV1ciBldCBsZSBkZXRydWlyZSBhaW5zaSBxdWUgbGVzIHBpZWNlcyBq
b2ludGVzLiBMZXMgbWVzc2FnZXMgZWxlY3Ryb25pcXVlcyBldGFudCBzdXNjZXB0aWJsZXMgZCdh
bHRlcmF0aW9uLA0KT3JhbmdlIGRlY2xpbmUgdG91dGUgcmVzcG9uc2FiaWxpdGUgc2kgY2UgbWVz
c2FnZSBhIGV0ZSBhbHRlcmUsIGRlZm9ybWUgb3UgZmFsc2lmaWUuIE1lcmNpLg0KDQpUaGlzIG1l
c3NhZ2UgYW5kIGl0cyBhdHRhY2htZW50cyBtYXkgY29udGFpbiBjb25maWRlbnRpYWwgb3IgcHJp
dmlsZWdlZCBpbmZvcm1hdGlvbiB0aGF0IG1heSBiZSBwcm90ZWN0ZWQgYnkgbGF3Ow0KdGhleSBz
aG91bGQgbm90IGJlIGRpc3RyaWJ1dGVkLCB1c2VkIG9yIGNvcGllZCB3aXRob3V0IGF1dGhvcmlz
YXRpb24uDQpJZiB5b3UgaGF2ZSByZWNlaXZlZCB0aGlzIGVtYWlsIGluIGVycm9yLCBwbGVhc2Ug
bm90aWZ5IHRoZSBzZW5kZXIgYW5kIGRlbGV0ZSB0aGlzIG1lc3NhZ2UgYW5kIGl0cyBhdHRhY2ht
ZW50cy4NCkFzIGVtYWlscyBtYXkgYmUgYWx0ZXJlZCwgT3JhbmdlIGlzIG5vdCBsaWFibGUgZm9y
IG1lc3NhZ2VzIHRoYXQgaGF2ZSBiZWVuIG1vZGlmaWVkLCBjaGFuZ2VkIG9yIGZhbHNpZmllZC4N
ClRoYW5rIHlvdS4K

