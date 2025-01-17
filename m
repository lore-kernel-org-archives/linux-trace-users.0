Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E869C18B495;
	Fri, 17 Jan 2025 15:28:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737127717; cv=none; b=FIhopJe8/Q4beIOaYuIs3T7YjL6CAeg0ntHQ4Np+AGMleYZI4toNKjJXw3K3H6/imNtOnn1/hChrNpVnKrvnh6ohxBrkkQD2C0JuAV1Rm9Pd5XviVt7/pzwif7E6l7NxNWNCoHMQtznL5KsMLVYQa08B8ddoNpkKeIk/DLMf/Hw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737127717; c=relaxed/simple;
	bh=YYJ01nJ/fXzL9VBpQSaiEba0hCgRS3UaaERDZE64ufM=;
	h=From:Message-ID:Date:MIME-Version:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=UY0UepQZ0Rq/FXI9lyA1bU6EkiSTuqMmIJ/r7e8Yl8j8I02PScvVwuIXBtm6AoKqzOKSpGJUY7NtciJjWI80ePtw8dfFf49lpw7Pni7/PJcUwVIG8Mf1YzCHVuBE2s9Vmhzgmyvkp9cQG2X4cg+dOf64ZucP3s6lL7ddjCIuHDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VuOm7vY2; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VuOm7vY2"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-aaf60d85238so378376366b.0;
        Fri, 17 Jan 2025 07:28:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737127714; x=1737732514; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=iefpm1tWscYznjmxr/TrjFDcJponHmThuJ5fxeIBtQ4=;
        b=VuOm7vY21GkHl6+88LRYbZEr0Yean54HJpb37hKGhZjcCm1vqGszdj4lTC48OotVTT
         HqN/c5wp8dpWs6ZxQJQzPm1iIT29dk1r/SWwzn/ZbJeoEna3u3mGhp/B8XZFL+2AiEKL
         f/QQ8URoGo3KvxuroeI21u3q6Hn4gtt++PP7Cy0ySwmmQphth3C5cRCFEaR8I9wuuLnX
         Gk84cBFYMNEszM8JtH7jLp6Z1OsMsL3D4g7lGm9Zx92rKqr3D5Mkd7e8sXZsQAQgEHiw
         dvomPwEi5cYULs6mjgAhlO4nlhuJDfKjK0RF18ztgZpq8N4CttkU1QSpVkkdnLphixkI
         XJUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737127714; x=1737732514;
        h=content-transfer-encoding:in-reply-to:organization:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iefpm1tWscYznjmxr/TrjFDcJponHmThuJ5fxeIBtQ4=;
        b=q59P5StH372Q1HH0c7Iq4tFUh1K+s7kmFENbgnDkj7rL+9+KKErTTZENxVbPwjptcg
         HmMoCBGin2rdeWHPTsTV1Mh7YACiyKlAWcBtDrOeYAzW4ZWWcDgZDxdThPaC2Wx01Og0
         ZXStfhyp2AMJb3F0l2Ur7i8RPPugD8GlIug/1XeSgC8vpS+orzUP5kQvWBGo2OZqwUd/
         NOPQkzruZW7KZGK9WWmwwQPir1xVtUkoOs3UaYUSBJkEPkyko5R2w8TK203qH62ArkA9
         F1ijxwx/4hjrKLagLlYa9H3P8/rvq0sJQUB1Yvf1zQYwn5VZiciFBX2NT2MlrKEzoN1E
         9GUg==
X-Forwarded-Encrypted: i=1; AJvYcCU3P23gwulbaiBn6cJm6C0Krhx8F5ojAarJtg5ZpSAlGEFriHneh9hfmAhatIrMnhRdq5UDrwQMTi/tJG4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxw9IB3xAQbVLGDkssveMaptxzNe2lomsIdA8+OjzqZLI3Hw7ac
	SvKZHA10FkManyLgkbYpC/PjLI12vYCdRkPskWTTtxBA6KPyI3BS
X-Gm-Gg: ASbGncuslt5HgSG4E1/G61MUD2zSOe3ZirDTTOvyeUMV0dLvn5gwOLvGhC4DiLlMydI
	D8Xka/9eUiXMxEHtcAulbtlFoRQ/Rftx+c5CivY3GUu/NITJbfdEw6imiWZH0z7439/2voZVS3i
	anp4pj+W1GsKcmui8vMuGbKbd1gYxIUJPHg0LD0oE75/biHHAYe6+CRQ9ucBDk9qW0ZvayxXZzc
	ta5nFV3KzvRrwr1STShBXNGXKeCwwSXlSU5ixw/Mdvzu7JLAb+7sPm0wUTXFDuLt3yW
X-Google-Smtp-Source: AGHT+IFvDqQ3MnMlQU4wRKoEsDKrZcCgzf7yFd94JCm7WM557HmLRON2auih42IkHmPLGrBOu6M4TA==
X-Received: by 2002:a17:906:f58d:b0:aa6:79fa:b486 with SMTP id a640c23a62f3a-ab38b4c6ae5mr352886966b.49.1737127713967;
        Fri, 17 Jan 2025 07:28:33 -0800 (PST)
Received: from [127.0.0.1] ([193.252.113.11])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab384c60772sm187435166b.33.2025.01.17.07.28.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Jan 2025 07:28:33 -0800 (PST)
From: Alexandre Ferrieux <alexandre.ferrieux@gmail.com>
X-Google-Original-From: Alexandre Ferrieux <alexandre.ferrieux@orange.com>
Message-ID: <ef3f7784-7129-436a-a5f7-1630b278b101@orange.com>
Date: Fri, 17 Jan 2025 16:28:32 +0100
Precedence: bulk
X-Mailing-List: linux-trace-users@vger.kernel.org
List-Id: <linux-trace-users.vger.kernel.org>
List-Subscribe: <mailto:linux-trace-users+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-trace-users+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Bug: broken /proc/kcore in 6.13
To: Alexandre Ferrieux <alexandre.ferrieux@gmail.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Steven Rostedt <rostedt@goodmis.org>
Cc: linux-trace-users@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 linux-mm@kvack.org
References: <05ea473e-d7e9-4ca5-ad91-ba8c00618fb4@orange.com>
 <20250117084038.79f40307@gandalf.local.home>
 <4fd7e1a3-f7ff-4b9d-9a53-fb73795b5b3d@lucifer.local>
 <789848f7-680c-41a0-8edd-64e8af1f2f4b@orange.com>
Content-Language: fr, en-US
Organization: Orange
In-Reply-To: <789848f7-680c-41a0-8edd-64e8af1f2f4b@orange.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 17/01/2025 16:19, Alexandre Ferrieux wrote:
> On 17/01/2025 15:44, Lorenzo Stoakes wrote:
>>> Alexandre Ferrieux <alexandre.ferrieux@gmail.com> wrote:
>>>
>>>> Hi,
>>>>
>>>> Somewhere in the 6.13 branch (not bisected yet, sorry), it stopped being
>>>> possible to disassemble the running kernel from gdb through /proc/kcore.
>> Thanks for the report! Much appreciated.
>>
>> I may try to bisect here also unless you're close to finding the commit that
>> broke this?
>
> I'm currently homing in on copy_page_to_iter_nofault(), will report shortly :)

Hmm, actually, that baby ain't cooperative:

  [Fri Jan 17 15:23:05 2025] trace_kprobe: Could not probe notrace function
  copy_page_to_iter_nofault

... if I cannot insert kprobes to sniff around, I'm a bit stuck :}
So I think you'll reach the goal faster than me !

PS: For your bisection: the last working kernel I know of is Debian's 6.12 final:

  ii  linux-image-6.12.9-amd64         6.12.9-1                         amd64
    Linux 6.12 for 64-bit PCs (signed)


