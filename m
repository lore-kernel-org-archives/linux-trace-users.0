Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6128198845;
	Fri, 17 Jan 2025 15:19:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737127166; cv=none; b=Axw7+920qVtdNSlRl58r4Ug2aGmGURfsHnwF69XznSEr4aVlPDroYQrFXJ5ySjhFwKHOl9nPf+laCDdeeN1KajkFPANhhMT9q/UXH+qaBCDnHIoyWjR99n4+EqFJRybEHWXGmx+ByJwq7i6Pid+4oZLTtPhFOPmd3SZWLJjozdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737127166; c=relaxed/simple;
	bh=ggM+hBMMSH9ancFlHxvfjF9iFI/etxT38WdCRQ8mXOk=;
	h=From:Message-ID:Date:MIME-Version:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=XwVMUQ9aSa0yjItK8gjM7U94Pyh/0pncn7UFjU3SZJfLT9h4LU63RJub58wGdIVw+qCL+AifX3rR3Su2Qka6ibMzs2k6mE+5LGntUglze5BBxXeJWdZiOeVkYhWsYmWKrDWnPOwpygGjL7gSTfcI/GRtgLYPEC67OJiJEchCS2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CgbvRlmY; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CgbvRlmY"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5d3e9a88793so3723388a12.1;
        Fri, 17 Jan 2025 07:19:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737127163; x=1737731963; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=b2Iyh5CkCJ/iMDR9UC1Tk3RYBAf9B7HyAwuM83UZHao=;
        b=CgbvRlmYieUjsh7oUH/ePoCf7z5Ro1HfHupSZAxdhjZbyktWPp3sN9qMVtLStmmRok
         zL/m0/zyV3Fhp/t46hPgVNHFt/EsYv1Zxpt8ubQSsQdrmoAf4IC92dhpx4uSJ4AijgBA
         cYsKGZsGBnASeci53hQvm+pm/oiH5pgBFLo2kerL4d4HLmLU38B8CjkDNL2+xVK2AFIW
         dtu3HTb0u1n40YGjlKw/nhSpLxNjT7fdaOTZnwDiyEZduNrBerOsdV+rbwrO1RhUin2a
         KQBF3Y8njP2fyjUg/H8cLotBJMLhN7o76DOKR0LaYb67loRHirCkSr29xdrmntTgwhz4
         OR0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737127163; x=1737731963;
        h=content-transfer-encoding:in-reply-to:organization:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=b2Iyh5CkCJ/iMDR9UC1Tk3RYBAf9B7HyAwuM83UZHao=;
        b=R7CPGm6nmhrRLw7FTDdwSXfS4zGWoAhrBVDkKVO0YX+MleWK8ZfWCRSe1g4N9g9t82
         /BJ3ldiiuOlZ3oBdG7cbEmzAQawolw3JF/Bj4+X+M0cGqsDYe42gfURTg0+x+vbYj3oF
         Kf4H2V2tbKNX5WfXod/pev7TDxfJOLhP0qt0nml1/yTQANendcyGHPIWZW1dZYA5TMvC
         e7zUe1WF31AZBpdGq4sHAtxJ6sP5xTTkelDiCCKV7+piKcSTUr1Mw+LTt5UH7LbGNbSh
         0KEVU5cStWkszwS9/k83Ju0I65Gz5i3lT3IRfKrW+sWXMms4mvaHehPVWcCCpYZL+zJe
         Rwow==
X-Forwarded-Encrypted: i=1; AJvYcCVVR/9tJ86K581ajQizBUntNgGmx1SpMK/XG0xg/+B0AH9tu3tRtO6QDZ9t7NgIm7Fxp/qQhn4EjOWPJpmbsM4jNBE=@vger.kernel.org, AJvYcCWACgGcbrG6ybH0oHBfuYm8CcH8+y4oHnvj+QeDF7rkz53tDDaDPJW31tRdGoifDgufQy3qeQcJ1khf1Uk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxd0KkAb1dKPeWyBXU7RWjjckDIxJRn/YwH2fBGlSgR5dH0TC95
	HIe2+67HwQ71VlhaH8YoseY6vkgk2WpUiLtRtft+ACa3ZQYzWJyV
X-Gm-Gg: ASbGncs8jCNo32BavveLWh5bhhDUJ8Qpy5mB7C0VhXlOe2jXh9S3eYKQMnxG4bweZPH
	axMVX6sLzDMy+b7gbpQJgRLiftWOeyPp9aIZ1ld947za25mMbo1z0ccX4d1jRKdeSQe80oFo0Xl
	zMWiyG4rXvwgyJnJikoXkFDcpu4KyqlSmLJ/sLTD1OAZ7gghEUX1Zn17zqz7KbfPX9J0UYjcKIy
	tMKEzM5eTATQjPX3Ixl8EpMrAjf6WOJsQut42Awno3wSy7BebAxznq5l+CHlrtb9DD278ST8c0t
	RI5tTA==
X-Google-Smtp-Source: AGHT+IEp+hR1eFHuS1J921on24IXVij12VpkwyiNGDzOQet38LODlcpk+R4Y/VOPH8aWsPkOaUMCFQ==
X-Received: by 2002:a05:6402:4308:b0:5d3:d917:dd90 with SMTP id 4fb4d7f45d1cf-5db7d2ec11fmr3337794a12.6.1737127162772;
        Fri, 17 Jan 2025 07:19:22 -0800 (PST)
Received: from [127.0.0.1] ([193.252.113.11])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5db736716d6sm1631091a12.31.2025.01.17.07.19.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Jan 2025 07:19:21 -0800 (PST)
From: Alexandre Ferrieux <alexandre.ferrieux@gmail.com>
X-Google-Original-From: Alexandre Ferrieux <alexandre.ferrieux@orange.com>
Message-ID: <789848f7-680c-41a0-8edd-64e8af1f2f4b@orange.com>
Date: Fri, 17 Jan 2025 16:19:19 +0100
Precedence: bulk
X-Mailing-List: linux-trace-users@vger.kernel.org
List-Id: <linux-trace-users.vger.kernel.org>
List-Subscribe: <mailto:linux-trace-users+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-trace-users+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Bug: broken /proc/kcore in 6.13
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Steven Rostedt <rostedt@goodmis.org>
Cc: Alexandre Ferrieux <alexandre.ferrieux@gmail.com>,
 linux-trace-users@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 linux-mm@kvack.org
References: <05ea473e-d7e9-4ca5-ad91-ba8c00618fb4@orange.com>
 <20250117084038.79f40307@gandalf.local.home>
 <4fd7e1a3-f7ff-4b9d-9a53-fb73795b5b3d@lucifer.local>
Content-Language: fr, en-US
Organization: Orange
In-Reply-To: <4fd7e1a3-f7ff-4b9d-9a53-fb73795b5b3d@lucifer.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 17/01/2025 15:44, Lorenzo Stoakes wrote:
> 
>> Alexandre Ferrieux <alexandre.ferrieux@gmail.com> wrote:
>>
>> > Hi,
>> >
>> > Somewhere in the 6.13 branch (not bisected yet, sorry), it stopped being
>> > possible to disassemble the running kernel from gdb through /proc/kcore.
> 
> Thanks for the report! Much appreciated.
> 
> I may try to bisect here also unless you're close to finding the commit that
> broke this?

I'm currently homing in on copy_page_to_iter_nofault(), will report shortly :)

> Yikes, this is my fault. Sorry about that!

Wow. I'm so happy we connected, no problem :)

> There was some discussion at the time about the infinite loop, obviously with
> the understanding that vread_iter() should never return 0 in this scenario
> (where we had identified the _category_ of kernel memory being accessed), which
> is obviously now rendered false.
> 
> The fact that it can is (obviously) rather problematic... obviously we need to
> patch this, if this were possible in real scenarios in the past we would
> probably also want to backport a fix.
> 
> In any case I think we need an explicit check here no matter the cause so we can
> never loop like this. This was just an oversight at the time given this is a
> documented behaviour.
> 
> My instinct is to error out if this returns 0, because that would indicate that
> the address is not part of the vmalloc area.

Yes, I did the naive patch below; it does the job, breaking out of the loop, but
does not cure the access problem, so gdb just sees zeroes :(

diff --git a/fs/proc/kcore.c b/fs/proc/kcore.c
index e376f48c4b8b..8c5f29240542 100644
--- a/fs/proc/kcore.c
+++ b/fs/proc/kcore.c
@@ -531,7 +531,13 @@ static ssize_t read_kcore_iter(struct kiocb *iocb, struct
iov_iter *iter)
                         * again until we are done.
                         */
                        while (true) {
-                               read += vread_iter(iter, src, left);
+                               long res;
+                               res = vread_iter(iter, src, left);
+                               if (!res) {
+                                       ret = -EFAULT;
+                                       goto out;
+                               }
+                               read += res;
                                if (read == tsz)
                                        break;

> But then it seems add_modules_range() is just adding the module range under
> category KCORE_VMALLOC despite it not being in the vmalloc range :/ which is
> really odd. This was added a long time ago so clearly not what triggered this
> but odd.
> 
> In any case, let me go have a look at this...

Ok, staying eagerly tuned !

Best regards,

-Alex
