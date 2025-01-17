Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB89F25A62F;
	Fri, 17 Jan 2025 19:27:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737142081; cv=none; b=fZ2Y8jWUX8LuNdLG5PHmHN3SUbXIUdHE6Bw+tAvk2FPzkqkJ4inrlix+re/5KlR4C3ROx26CFo9+GiZDWBlLfQ7QvjzUXwmmqgpqRJdcVZT4z0E7U0e2AyAdW67vIHgzzrnWqnTvGgLVs9OZHLD1Av392BTwq125qHmCtYG8VWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737142081; c=relaxed/simple;
	bh=lN2hipzbvVNzLm4QZmEoSRACDjyhlAsFCpHGlPHUQEo=;
	h=From:Message-ID:Date:MIME-Version:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=LIFejBPfhtg3G3O8qYpr89SW1Lu1gi30wnKTF049awv9P6XXfx/w0dVyI+n9C21aEgg7EPPza5gC3wGsw3nNhH1Mw9z3l7GL0Tcgyb4FgkM6v/wSLD8BfKfor6xrklmxIDqrtn2KyC0qLCBRFoQ+K7Lufe4OwG+gnAh7DOK5MaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ttk54P6H; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ttk54P6H"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5d4e2aa7ea9so4584832a12.2;
        Fri, 17 Jan 2025 11:27:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737142078; x=1737746878; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Wna99veZOddpD4P9HHCQ1WPzICJq02lQI4A/sbPYpXg=;
        b=Ttk54P6HyYgr+pJjCxmdCgMSphfPbyuTYkCOwED7tJYrj9cv9mCBmLqlldVTv4FH3M
         TZ16F48/bn8fpDq2/aTWcpRO1QCrwJZ82N1whhetmzcVUZbIjPs+wnm4jsu1TJEGgEQX
         aASe8yHXR+DYy+Th0s37tvihpr8aE17zC7cRz9QJvbf1XrPmqU7cXDyUAShjHYDfbTJX
         S+K1tCvBOSEMaluJk2SM3vYNtK9PRti7j1j4YywDSt5tVVK/1F1Th8seo0Zmsh4Gg8bg
         ideX/0MjT9JgRC0WE1YyeW82/YzN8yueplDuqXtsN/JmhxcDRtMxrhDEAmnFySUGwKTB
         P6MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737142078; x=1737746878;
        h=content-transfer-encoding:in-reply-to:organization:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Wna99veZOddpD4P9HHCQ1WPzICJq02lQI4A/sbPYpXg=;
        b=YcJCCaX1x0Y/3yBH8txiyuT3pxzS5oaXcMiRzVzyGUyU9fASOaQym0f668QNf1BJGu
         ieGzxg918UJtFJoPvqIG33ibyZ+0N4GCnZw15PQ3d0b2K7xTU84X2EzLPYfjnyUVttSf
         87UHnx90uXn+S4CeQDOeElIWe06TqR2Iqz1/CWDHst5ATt/nOlgBqRaNSdk3yUo73tDL
         hXllVUC57emZKXme5/eoTD3N/JDQOSPqKP1qJ937wiRSKxkuayFprIu9VNb2NQJJHMBC
         HDzFaTQ4vKmQDBgyBU5jVDeoXauc8rcyuq4i1z5DthOvNHMSugev2NAbIk0tiUsCCYi4
         LFfg==
X-Forwarded-Encrypted: i=1; AJvYcCU5PC1ktUHD4SC2JlrWPaF4JopReqornivem0K70UthASy5LQOc9K5djmNH9f9pWu5ox1sWbFEqAE3Amlo=@vger.kernel.org, AJvYcCW9fNOdThlI2qKX/PmkDmkSKMK/6lB4sUu5HCPAK7LahWYaVKAs5XxQvDGJOp1870iPtOnL8mZoEV4jCepnlrfgXSM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxatcAF0gafXQ6X4hpjNElF4DeyOIyEL3ejhEbGS6cMpZ4h7ouk
	jOAyKAODqhBLotrWaq6gAz4AXOSmXVzsLo8p9ta94aY/OPH/lZze
X-Gm-Gg: ASbGnctp9KMyBD7RidJnRc+yxKMLYKhg0nr6Ac9An094/1Yq6Gtp1WO84Homljnax3q
	Iqy9NHAYZxxUvCrUplfI71PWT+anyiSiecaBEmEiWlx7xRbTI2qX5olH6ORxl+51wURBelfc/3k
	DY09GTRQHvPzAc3pRfXGtG+r+Xx0jteYR0N/ze2k8KTbUqWn2z0IRVBjOT6ks+4ZBEjveQP+Pdv
	03oezSxuMY29+O31AiQtmfTjaUgrGCBDd2rsMNQV08S4pASf5jOpdcvkHyt/LrXq32P
X-Google-Smtp-Source: AGHT+IEQiG5+FsjnLTk8QzCW8J8+a4rFaPHJCmvISpj48YKJ2kHkvb48yNx7cChoIyHXyfU+GDrAsw==
X-Received: by 2002:a17:907:9711:b0:aaf:c27e:12e8 with SMTP id a640c23a62f3a-ab38b44d493mr385782166b.37.1737142077823;
        Fri, 17 Jan 2025 11:27:57 -0800 (PST)
Received: from [127.0.0.1] ([193.252.113.11])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab384fcda2asm216615366b.176.2025.01.17.11.27.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Jan 2025 11:27:57 -0800 (PST)
From: Alexandre Ferrieux <alexandre.ferrieux@gmail.com>
X-Google-Original-From: Alexandre Ferrieux <alexandre.ferrieux@orange.com>
Message-ID: <3719ee8a-38ef-4aaa-aca4-b6d82df51661@orange.com>
Date: Fri, 17 Jan 2025 20:27:56 +0100
Precedence: bulk
X-Mailing-List: linux-trace-users@vger.kernel.org
List-Id: <linux-trace-users.vger.kernel.org>
List-Subscribe: <mailto:linux-trace-users+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-trace-users+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Bug: broken /proc/kcore in 6.13
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Alexandre Ferrieux <alexandre.ferrieux@gmail.com>
Cc: Steven Rostedt <rostedt@goodmis.org>, linux-trace-users@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>, linux-mm@kvack.org,
 Mike Rapoport <rppt@kernel.org>
References: <05ea473e-d7e9-4ca5-ad91-ba8c00618fb4@orange.com>
 <20250117084038.79f40307@gandalf.local.home>
 <4fd7e1a3-f7ff-4b9d-9a53-fb73795b5b3d@lucifer.local>
 <789848f7-680c-41a0-8edd-64e8af1f2f4b@orange.com>
 <ef3f7784-7129-436a-a5f7-1630b278b101@orange.com>
 <9f3ba47b-e0ce-4d7a-b60f-e5b8d96b0f2b@lucifer.local>
 <ecb22f03-ca7f-4212-9f02-cceafb9cfb7f@lucifer.local>
Content-Language: fr, en-US
Organization: Orange
In-Reply-To: <ecb22f03-ca7f-4212-9f02-cceafb9cfb7f@lucifer.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 17/01/2025 19:13, Lorenzo Stoakes wrote:
> 
> +cc Mike
> 
> OK so nothing to worry about here - the feature that causes this problem
> has been completely disabled. This may not be in Linus's tree yet but will
> be for 6.13 release [0].
> 
> I think the vread_iter() check for 0 can wait for 6.14, as once the area of
> memory is identified this should never happen, but we do want to pick up on
> it, with a WARN_ON_ONCE() to catch stuff like this right away.
> 
> Thanks so much for the repro, though I observed the 'core /proc/kcore'
> command freezing up before any 'disass' in my qemu setup, interestingly!
> 
> [0]:https://lore.kernel.org/all/20250113112934.GA8385@noisy.programming.kicks-ass.net/

Thank you for the fast fix, I'm back on track :)

 Dump of assembler code for function ice_process_skb_fields:
    0xffffffffc0fc1eb0 <+0>:     nopw   (%rax)
    0xffffffffc0fc1eb4 <+4>:     nopl   0x0(%rax,%rax,1)
    0xffffffffc0fc1eb9 <+9>:     push   %r14
    0xffffffffc0fc1ebb <+11>:    push   %r13

-Alex

