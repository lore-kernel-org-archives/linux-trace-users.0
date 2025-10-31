Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 807692877ED
	for <linux-trace-users@vger.kernel.org>; Fri, 31 Oct 2025 14:53:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761922391; cv=none; b=YKfYQ0gQJWEnLJEuDC2yGuiUl0hCzX+goYY4v6e4YTiO7pTC+/nEpEl1nqdGs8SDxT/pXjq7Fbit8PPvVdt9GuF2foeasWJIVXFn0m4RSOcvtGyj3BMjECS+bEmELjxqMTTzkgLrI7j+ccEOXKCDU4v3+ttWhRZQK0YAaLI9NN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761922391; c=relaxed/simple;
	bh=zE8ZGcml5S2NL61NzE+PBp7H/khpNLrUzhoS96jU8RQ=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Content-Type; b=ZKk0B44LYbk7NINxoDeEXprxQ/wFpsMS8DKwgYXuAg3syoJL9h28BIsamp5HLk296DvRmtvjY7DfH2QdbB77IrFsluSsxvCL9/5fQ1Y+L+K4M2Tv2m2t/yxwn+hOnp0tk0B24J2fv7D3Joj5JAitc6xV87EJDiqKcv9vSOJtn2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b=NUOV/XEX; arc=none smtp.client-ip=185.125.188.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b="NUOV/XEX"
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 12FA73F4BE
	for <linux-trace-users@vger.kernel.org>; Fri, 31 Oct 2025 14:53:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1761922384;
	bh=UUiil3e3yn7wxI6g4C6w3EfBgf3W5imJFOGlCeOAvQY=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Content-Type;
	b=NUOV/XEXSGE3mxqUsqsfrtzlSCJcyx+7lU85HPMSFri8IfVm4JWKpsF6C+1vZ8TII
	 KjaouwiwjOJTpIfI/lTYJpvyRQotiZRwm5cFHFeFWZPOVM78SAlsVBbZ6QYvozJo/C
	 Qu+CuG5DAzIsWax/Ae1mO55Nq8nsCpQzeQHdK7zmUYdulvj/Nu/QS4hm97RN/XgGnA
	 HB9+d/Emqu2GCzGLeq7s1zeHSfuMbLX0xlI/2zar/8gh0qYdyRlpumRHdWe19Qu+2W
	 2psOjkLAcnuY9Bpmbv7eUWHiSHtKxwpxhNr3r+zNdVEYUTXnUP/03m79nt4PMeOgNd
	 Ozmx3te/n26ySUfWkBk1nbyNsjOVw+Hwl2iWN1fNGk/j4hr+xSNVl0Kuav/PpKq+UP
	 c1CXclx2wB8S1dzIhWWTuCiOWGSwq/JOLyjPKq0WQ01bP3Q+QqQxtE8cy7meH1N924
	 qhp/jrGHFvAWREbUyKudMHw9lF6sFoC73ITJK2pmzYyAucH0p0xPwxfr4YWyonDJ89
	 rhR3+Sqwr4oEPCjQhmtUPpx2Rf/EAs4v7+qKVlSVC900ripasHCeDDxNLukvllmNoF
	 aEeMEEBjMtjkxd6PRfGlZ9u/N6LtCPyJVyloPOOK7hPIE6VZGJDsiFk/jA02MMjmG8
	 k8gZjmfv/J32qRKatTRND3Y4=
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-294ecd3fdd4so24297965ad.3
        for <linux-trace-users@vger.kernel.org>; Fri, 31 Oct 2025 07:53:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761922382; x=1762527182;
        h=content-transfer-encoding:content-language:to:subject:from
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=UUiil3e3yn7wxI6g4C6w3EfBgf3W5imJFOGlCeOAvQY=;
        b=P7yADSySWorbiNJWCbhbV3zkS5j7AOVGt7oAbr0cTwWAZnavabIYhHQkWg//MnIzxI
         gAJySP33YjidZr6Gm+DXzpv3zTnX0Vo5zEaX7yTTQTm61Vx+MYlFK/ZirQKuFg7Qbms7
         JbFiy1JagML8th82EpIJVGqvnWz0jrGU/yKWizWKc5M0yXyx23MmOmCHLWgj9UPrg8k5
         QGXVhy54cQT+6QFPwTeKhgCA0y4aE+VCPzMA2uX+FEY+4tXiidXhTLsTczlm39uIdjC/
         sKxKG9tOE12woQO5J5N+ZrIbAkZdVD8oIBi2CcI541odj49qxah2Qba5vyiDXF1z39f7
         WnsA==
X-Gm-Message-State: AOJu0YymBraHvRNvTFMkDqRxcpElHbNlj9Uv1tL+mK05JxuVR0qL5mAh
	6eVFYXabk6qmNOyp//qAu5qVlyOXb3M6BdkrcokbFHIcwOim+ggcukscYz3VAyE9dzEGlREUSJW
	zKgJbjBRzKUxGjQ5T2GEmDuu8ITxI3yyLjAfHIDJE5di/HO8bIAQWXhGDpsc6OZRAJYAjuzFD8n
	aZNJPtMrAl2MYnfXeomSZ9
X-Gm-Gg: ASbGnctEbBtLiaFztbXSE7lEfGs9bZbYAygObvl04HHUqZrOCy4+OPLmTLlprakaCUO
	CtNgmPoYp9K+E8kkzuwC6h6yVOIBlImq4qp7vNPHV0BKkk8XDiwCDajCUg2PNDui0ngL3S91kDZ
	xPOYWSKK70NBf7McV3esdHY8cc7AIAQDebhznQhB7hzL+eC/u691pLjuM3nYUGsZJ5LEx+p96DE
	06sKYfyJQhJgC2ipgIQiuQMZCd7lv8o3T4bfgiMil/dbAQdyTTbe6Zui6SvHSziFVH/B/bzULQn
	Ps+MnF1nNgeT47nkf1ZidstWGxXMT9wfBlSow/UMwzdI++wlcvgbLsFem8KcwKM9w/VEG0w/xSR
	acwlXNYSV
X-Received: by 2002:a17:903:9ce:b0:294:98c4:41c8 with SMTP id d9443c01a7336-2951a4397a4mr53882385ad.34.1761922381820;
        Fri, 31 Oct 2025 07:53:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFULeZQaDI3/iLYto6HuYiZ8QBWz+3cP54dr+1EH7FhHC1vDMK5U/GwH1y2LGSBjIaWi9ENcw==
X-Received: by 2002:a17:903:9ce:b0:294:98c4:41c8 with SMTP id d9443c01a7336-2951a4397a4mr53882035ad.34.1761922381364;
        Fri, 31 Oct 2025 07:53:01 -0700 (PDT)
Received: from [172.17.2.13] ([179.26.9.217])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29528635db8sm24255735ad.69.2025.10.31.07.53.00
        for <linux-trace-users@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Oct 2025 07:53:01 -0700 (PDT)
Message-ID: <fe35c5eb-7132-4203-9d6f-0a8272b114fa@canonical.com>
Date: Fri, 31 Oct 2025 11:52:59 -0300
Precedence: bulk
X-Mailing-List: linux-trace-users@vger.kernel.org
List-Id: <linux-trace-users.vger.kernel.org>
List-Subscribe: <mailto:linux-trace-users+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-trace-users+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jorge Merlino <jorge.merlino@canonical.com>
Subject: Kernelshark latency field
To: linux-trace-users@vger.kernel.org
Content-Language: en-US, es-UY
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi folks,

I've been using kernelshark 2.2.1 and have noticed that the latency 
field on the grid has five chars in it. The documentation [1] only 
mention 4 fields. Anyone knows what the fifth is for?

Thanks
	Jorge

[1] https://www.kernelshark.org/Documentation.html
