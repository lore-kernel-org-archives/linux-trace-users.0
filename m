Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB66F171E6E
	for <linux-trace-users@vger.kernel.org>; Tue, 30 Apr 2024 13:53:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714485232; cv=none; b=Pj30kPUvOYYrR/dnsgpZSrgLD36eSOl97Wk0+C0E0ZQrCUrw41bZDB8DoHvMItcrO5fzIMOItJVzhcwY2XlPf3iokl0Vdc/TAFLuEf2VvMNwNv8fKMiP+BE93xfROW36/GNOilbbl60+yFt7o9uHiiIgeV8FVi8ox7dD51T1ddE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714485232; c=relaxed/simple;
	bh=XWYldm9zyWlf1Ejru9JMmoekdfEZ7w3pMBMZVZb+8Sw=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=SEnGqpoyQfBrSl2k1NKfW02BdWbuYAeSlXRdgRNV4/fgIGROQFdSHOkmaicDYbadQ+0DfqpstpXBNHagbptF0Z53zMTMt7KO9gD1um/H8QA5uxGRDL15I2sRQSgQ9pMB3LQ3A8cqaj/To4wo/vaYXr6zwYo1V4cj2UjdOQNwlEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bDtYfjZH; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bDtYfjZH"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-34d7b0dac54so556042f8f.0
        for <linux-trace-users@vger.kernel.org>; Tue, 30 Apr 2024 06:53:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714485229; x=1715090029; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Rbv02Hs1oyRhqTWr98bTZ5DaIndw8CCurwDQlRxMcpI=;
        b=bDtYfjZH94Ez3kJ6ZF02rEfxoYnenxps5QdQP6NCyYAb/DU/OTZWmlGSr5UxZqEHQn
         fwSz9r7ptj9fVVzYoQjWQkRG9U2+H3b1wpEPDAOJFJMH03nJb8hVVItTNvkg+3QObMZ2
         XDMTHbHacgfSuYkF0xqJ5gNzgjPqffS9CCoNjgTDY2BCKmFPzqQ6cD7O520/vBIC0G/J
         aq2VpndGbgZBvN/2WG9UgslTZEYfn8UzsDHjZsC4GkJx+hWEAckmmVazzhsPBbtJDTNl
         nVrQsy7tlkGYVtukz6U36c5IpYzg9lzhr/YUED9Gi3qDb9W4q9/+uLJTDQkaIg4nw7GF
         hekQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714485229; x=1715090029;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Rbv02Hs1oyRhqTWr98bTZ5DaIndw8CCurwDQlRxMcpI=;
        b=ZEbJ0CNuy1YRZ7WA38i7Mcobh8IseQS/UdnkZE4T3uAsBJj9Y/YeFckifTxUV4nKAM
         P+a6OILE2b9hQBNjI7yvorOsdz7ex5ejryaywytoc4Spc2prQrSamDa2oyNqXbzUuRty
         d33pgGDL0TZN2tDvLWyV5zqJjz97E7r3E+S4cFVo0i4nIVWsY93pOPUIj2zZmO4Edreq
         ti+kBeohoi3tI+9QrwwNYNOe3yLCKhMFdJKHTOJZxvfVx5Uxj131pVlPPBWQL6Rs6vMB
         dog1NeHTAyR3b2r5tJ+S10qC6sX0Hsupe3yEvWB9gxoIviut1SkJdMYjigoeoxi/FkGt
         eumQ==
X-Forwarded-Encrypted: i=1; AJvYcCXL2NZjqAOZ0Tf0+le86SKoUEU7x+LvZ07z0/gWlhWnl+R1Lj1uIRJHZOwLJoNrWCGhQIxwPwxz2pP8k/KiWyuRFTvIv6ozuhvu2mbsaFJIFnU=
X-Gm-Message-State: AOJu0YykYDDRtFJwdbbp/m37QgC2EBMYX9tCkCOoCipnVC0kLHERmKUx
	PDXj7RWjqKUog/iPgZ8czHJjjtOgG/PVUlkB5962pgX+Vs9uePW4
X-Google-Smtp-Source: AGHT+IGGdQZHuu2/A/fu162bK6n2QX0CqeOjmX0aWeEmL+8zMiOGrB6WY6eWS5PaBO8W1IWYSRuGYA==
X-Received: by 2002:adf:cd89:0:b0:34c:bf22:73f9 with SMTP id q9-20020adfcd89000000b0034cbf2273f9mr2386209wrj.28.1714485228625;
        Tue, 30 Apr 2024 06:53:48 -0700 (PDT)
Received: from [192.168.0.107] (83-228-63-4.ip.btc-net.bg. [83.228.63.4])
        by smtp.gmail.com with ESMTPSA id u11-20020a5d434b000000b0034a2d0b9a4fsm30951748wrr.17.2024.04.30.06.53.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Apr 2024 06:53:48 -0700 (PDT)
Message-ID: <cbe25526-254b-b7b6-4ff2-26d4289cbfc3@gmail.com>
Date: Tue, 30 Apr 2024 16:53:47 +0300
Precedence: bulk
X-Mailing-List: linux-trace-users@vger.kernel.org
List-Id: <linux-trace-users.vger.kernel.org>
List-Subscribe: <mailto:linux-trace-users+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-trace-users+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: Cannot build KernelShark on Ubuntu 22.04
To: David Aldrich <david.aldrich.ntml@gmail.com>,
 linux-trace-users@vger.kernel.org
References: <CAJK_ieiBK5OSxAfXK=wuDpiuEBA0Oj++oRSW29SrrUkPpt6TtQ@mail.gmail.com>
Content-Language: en-US
From: Yordan Karadzhov <y.karadz@gmail.com>
In-Reply-To: <CAJK_ieiBK5OSxAfXK=wuDpiuEBA0Oj++oRSW29SrrUkPpt6TtQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi

Please try to build KernelShark following the instructions given in the 
README file in the git repository and let me know if you still run into 
issues.

Thanks!
Yordan

On 4/30/24 16:41, David Aldrich wrote:
> Hi
> 
> Working on WSL with Ubuntu 22.04 LTS, I am unable to build
> KernelShark. I will try installing it as a package, but perhaps my
> experience below will be useful for the project.
> 
> I cloned KernelShark:
> 
> git clone git://git.kernel.org/pub/scm/utils/trace-cmd/kernel-shark.git
> 
> I followed the instructions at:
> 
> https://kernelshark.org/build.html
> 
> which requires:
> 
> sudo apt-get install qtbase5-dev -y
> 
> When I attempt to build KernelShark with:
> 
> cmake ../
> 
> I see:
> 
> CMake Warning at CMakeLists.txt:76 (find_package):
>    Could not find a configuration file for package "Qt6Widgets" that is
>    compatible with requested version "6.3.0".
> 
>    The following configuration files were considered but not accepted:
> 
>      /usr/lib/x86_64-linux-gnu/cmake/Qt6Widgets/Qt6WidgetsConfig.cmake,
> version: 6.2.4
>      /lib/x86_64-linux-gnu/cmake/Qt6Widgets/Qt6WidgetsConfig.cmake,
> version: 6.2.4
> 
> -- Could NOT find XKB (missing: XKB_LIBRARY XKB_INCLUDE_DIR) (Required
> is at least version "0.5.0")
> -- Could NOT find Qt6StateMachine (missing: Qt6StateMachine_DIR)
> CMake Error at CMakeLists.txt:77 (find_package):
>    Found package configuration file:
> 
>      /usr/lib/x86_64-linux-gnu/cmake/Qt6/Qt6Config.cmake
> 
>    but it set Qt6_FOUND to FALSE so package "Qt6" is considered to be NOT
>    FOUND.  Reason given by package:
> 
>    Failed to find Qt component "StateMachine".
> 
>    Expected Config file at
>    "/usr/lib/x86_64-linux-gnu/cmake/Qt6StateMachine/Qt6StateMachineConfig.cmake"
>    does NOT exist
> 
> This was despite installing:
> 
> apt install qt6-base-dev
> 
