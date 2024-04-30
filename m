Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CF04152799
	for <linux-trace-users@vger.kernel.org>; Tue, 30 Apr 2024 15:17:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714490254; cv=none; b=mUd2VVKi/Nx7G6SQyUvfyM3cEyL+pqe+04thGMsZoWmdeISSKapekktgcRn1Wa1vqcE99gHYDvLJ+ll/+oIuoYJiwoQpycskrjw4QdCe/aZUugohlnfUyTeFCTGjicJuc24cLWwqLsxMLcGB2VFtIreVyri7xl8rDiNqXbkeBZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714490254; c=relaxed/simple;
	bh=6xcg50pM3Ve+0YEYix2nn7KOMFA7gpSWoR5qm+2fp/Y=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=W0bX6VrqfDeM3UjV4rNwr6hqdy2T+qiDkzv7gFvTDZzVDsrGPK55Cx90HIdrpQCYpRp/RiE11MbHfLwQNyq3Ny2lp1oQj7YswVBqONDqldr3La0Pq/Cg9jk9i/kBx1AZaFbWVvyoxmf8PX2MdkCQPMV3/HZdCL1PY2qZIqq3Y7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D/35I/6j; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D/35I/6j"
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2dd041acff1so67579891fa.1
        for <linux-trace-users@vger.kernel.org>; Tue, 30 Apr 2024 08:17:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714490251; x=1715095051; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JdH66kl39d/Ett7Z66AoLgRO2kjz9dBPBfPC5X5c7io=;
        b=D/35I/6jCx/wvkcF+8AXTycGZfxG1aQA8zZfPIe+EQOlfL/Yn6mU2XdbB1fbuD01ut
         M/F1ntKUUSlvqgRGxvyc1S2wqlvgF7kyGHNR/tvh9g5n9zHzyDZuPuoNt5B9im8VMO+b
         TE8Jf2Jj9uZ3JtMSIhLKC7e23k0AP6YK78PrhOXUB2QG1ZzUUf24TJPqsyRNwdsrm7lH
         td0XFotR+hDFWQEZ+JPASOENzCHNGum4YMV+Y9rroDDdgHs9ZFdAya4VmrHvKdJpXrxR
         NyjsnnnE99V9wDpFHpd/sKnROH4C4nx8LXh+zG7l6qigGpASJbUfccWNbdtS8tJLG7kK
         KgrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714490251; x=1715095051;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JdH66kl39d/Ett7Z66AoLgRO2kjz9dBPBfPC5X5c7io=;
        b=mdMN05W6k2yFp3ArwVC17NPRmCn1NlYqmFl/GEzQTYkukwHPpsQeLTg6lRZAZjFw3d
         y0o4qzIDIdjdSd73X//a4pVkv6bBx2FO84UjCOa5uA4fbtyjzcnlpeIAe51UfUgBYL8c
         L7B5pr3kKzB10CDQxZZ59tuBD0rg6uce8h7hhHSbfVgtUEdtj6kpANjoIYX2unkiT8BA
         UjVc5oUIiQ5FOdz9I05s1XrsXL2xFuxOSP8AiaZHV5MVIqlOGwdRF3Bri4+K1CMIp++l
         iqWXlnUdCNe+IWACm8b+LFjTtHi1PyVMe3jbgtodc1X7H61dPEFRgBYPonoxoKRM2ZsT
         xAAQ==
X-Gm-Message-State: AOJu0YyJz2DMmazrP16DTi6KZYOOoTnLrqlDv38DEkfGJzKSJFRZDCMR
	Jdf2NsZk4O/ubGc7TsGWYSjeMzMFn9CxNMn36GrU71+3wnVywrJy
X-Google-Smtp-Source: AGHT+IHXzOwkxwRbyzZGU8AfYgPT6lajH0JyEC9mlKfQM7F18PWxsKWuL7qh5nynaysCZ6AZz0g7+w==
X-Received: by 2002:a2e:878b:0:b0:2da:49f2:d059 with SMTP id n11-20020a2e878b000000b002da49f2d059mr18910lji.27.1714490249073;
        Tue, 30 Apr 2024 08:17:29 -0700 (PDT)
Received: from [192.168.0.107] (83-228-63-4.ip.btc-net.bg. [83.228.63.4])
        by smtp.gmail.com with ESMTPSA id k6-20020a5d6d46000000b003434f526cb5sm32117221wri.95.2024.04.30.08.17.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Apr 2024 08:17:28 -0700 (PDT)
Message-ID: <4f177173-e78a-503b-3fa6-5e6e8ad4c2e6@gmail.com>
Date: Tue, 30 Apr 2024 18:17:27 +0300
Precedence: bulk
X-Mailing-List: linux-trace-users@vger.kernel.org
List-Id: <linux-trace-users.vger.kernel.org>
List-Subscribe: <mailto:linux-trace-users+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-trace-users+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: Cannot build KernelShark on Ubuntu 22.04
Content-Language: en-US
From: Yordan Karadzhov <y.karadz@gmail.com>
To: David Aldrich <david.aldrich.ntml@gmail.com>
Cc: linux-trace-users@vger.kernel.org
References: <CAJK_ieiBK5OSxAfXK=wuDpiuEBA0Oj++oRSW29SrrUkPpt6TtQ@mail.gmail.com>
 <cbe25526-254b-b7b6-4ff2-26d4289cbfc3@gmail.com>
 <CAJK_ieinnyDq3_jW+T7OPWWYf3rHaVB-PzPH-A0OcJbYmW6+kg@mail.gmail.com>
 <a4390fe3-1442-0e1a-a6e9-26b96840b7bc@gmail.com>
In-Reply-To: <a4390fe3-1442-0e1a-a6e9-26b96840b7bc@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 4/30/24 17:59, Yordan Karadzhov wrote:
> My guess would be that in the build instructions you haven't done the 
> first step, namely:
> 
> cd kernel-shark/build

Just ignore this. It should work even if you are not inside 'build'.
I guess you have some other problem. Nevertheless, I still confirm
that it builds fine (only some cmake warnings about QT package
versions) on Ubuntu 22.04.

Thanks!
Y.
