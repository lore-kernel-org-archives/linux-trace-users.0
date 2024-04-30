Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B1AA174EC5
	for <linux-trace-users@vger.kernel.org>; Tue, 30 Apr 2024 14:59:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714489146; cv=none; b=nX07BZPdnZbmM6q0XXck3FkUmHRWjqni9uBukoVmRFhXLTv2xWO3yD/ACEWRUnqCxdx2LPJozMm+/uoowPWpdM5xvhvVwAIjRLGObJ5nnzPZRyUg2EHSNmZmE10QAu/r0pXrRTxJ0T+g+YvBO7hUEuDkAZZhJrBU8fitSyvtB3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714489146; c=relaxed/simple;
	bh=G1dcgsv6HCD8VOyvzmC6pr9vHftGJkJHmf6gH3u6O+o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=paogHBfbc/KO+zn+41D6EUYLcoq4aZNchLq0R3YtW3MBdNPHN3nNDusMDQHExoX9rCEP/avbkcrfCl9hsh0lYYCXmu+dwP2zmkxL4Iwr5gHiKcbhLsNsM3jJWXqP5gyF6zh/5fuY0+C5vZwA3iI1J1jE6cp1mFYlW5iL3fNwhpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aksl/XMQ; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aksl/XMQ"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-34d7d04808bso467688f8f.0
        for <linux-trace-users@vger.kernel.org>; Tue, 30 Apr 2024 07:59:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714489142; x=1715093942; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=B+ZWgoGGgVvjwFSJcl29PEUcmvLv/aXrjHGzS4jaHvs=;
        b=aksl/XMQD9iUNFAUCb6uIMtmacP0lrUywqCWfXQjo+tdZs8KAoiBKFL5zz5pSa4+Gm
         V2HR75T5eJn5D0mt3LYWU8B0jWnf+shPHpR8lKEaNXofDGU8uv7KMZFkgWvOdIHZmxFb
         A9WN2Yi4v7upAsFjPeWLFu9G2itjOTBv6ul3KDKHHVOr0egn2v/JX4+TntsFRoXEdoZ0
         COORAGT78j1W4Z89Z54CbqKFEksr9wGmVtpAYwJzM95Z+aowzjlTtYGOyWvtkjA0/bn7
         LIN5eo40WUb/xJKBj/zOtAWOAuaBSi+FIIKR05QzttYeNFdWFR9iMe17u7wWPCY4TcMM
         S5Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714489142; x=1715093942;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=B+ZWgoGGgVvjwFSJcl29PEUcmvLv/aXrjHGzS4jaHvs=;
        b=nt8JSZ8C/otd777S4QD/p/D1LWFMP6Jxw7zP34ojd4i1pfBEvlQoaB6T4XxKrSurlu
         8XTJu/EyulN2LMwAgqk82+o4ysARDV35k3Yfk6pea97NeiBMkp11ZKCufxtoEMG36TGZ
         3XTOQT4PQeb4TIr4nKu8uJCDUp3bDmYvwv4ga2f8o2T3tI+7MR5isYrDasP74sNGDwHI
         tqwa/uzTymaOJ7bpSJNIysa368dL0SswclmpwOb4E+Yrl8Xvr3zNPBCpOPbKD6LXrnVz
         BGp4gwgkHbSARYH3uWAIh7WrLLCYqeb3YqSSyVBOBFa42NtYRw4Q4cVaV9prcSqgsWfT
         C1zA==
X-Gm-Message-State: AOJu0YyItKjG9G31Bo5/HaAx0/or8511KmBGI6Ftmh9nQEBnGS2lJqLA
	eKFubbv4zuAl/QS59xjSlilV3G9zjPsq6+oDHyaZx7ogeVnLzc3SFOgg/g==
X-Google-Smtp-Source: AGHT+IH9NLAMa9j+eR6DmQ+1rGqGESJaynZiuUFekqI628rx7PzIg8eXe6E6mSwgknyGhN9jI1/DBw==
X-Received: by 2002:a5d:658d:0:b0:34d:b265:6401 with SMTP id q13-20020a5d658d000000b0034db2656401mr495255wru.46.1714489142276;
        Tue, 30 Apr 2024 07:59:02 -0700 (PDT)
Received: from [192.168.0.107] (83-228-63-4.ip.btc-net.bg. [83.228.63.4])
        by smtp.gmail.com with ESMTPSA id b10-20020a5d4d8a000000b0034cf989dbf5sm6132192wru.44.2024.04.30.07.59.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Apr 2024 07:59:01 -0700 (PDT)
Message-ID: <a4390fe3-1442-0e1a-a6e9-26b96840b7bc@gmail.com>
Date: Tue, 30 Apr 2024 17:59:00 +0300
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
To: David Aldrich <david.aldrich.ntml@gmail.com>
Cc: linux-trace-users@vger.kernel.org
References: <CAJK_ieiBK5OSxAfXK=wuDpiuEBA0Oj++oRSW29SrrUkPpt6TtQ@mail.gmail.com>
 <cbe25526-254b-b7b6-4ff2-26d4289cbfc3@gmail.com>
 <CAJK_ieinnyDq3_jW+T7OPWWYf3rHaVB-PzPH-A0OcJbYmW6+kg@mail.gmail.com>
From: Yordan Karadzhov <y.karadz@gmail.com>
In-Reply-To: <CAJK_ieinnyDq3_jW+T7OPWWYf3rHaVB-PzPH-A0OcJbYmW6+kg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

I just tested building on Ubuntu 22.04 and everything was fine. My guess 
would be that in the build instructions you haven't done the first step, 
namely:

cd kernel-shark/build

Note that it is important that you are in the 'build' directory before 
doing the following steps.

Thanks!
Yordan

On 4/30/24 17:08, David Aldrich wrote:
> Thanks Yordan
> 
> I am now using the instructions at GitHub:
> 
> https://github.com/yordan-karadzhov/kernel-shark/tree/kernelshark
> 
> I installed:
> 
> sudo apt-get install qt6-base-dev qt6-scxml-dev
> sudo apt-get install libtraceevent-dev libtracefs-dev libtracecmd-dev trace-cmd
> 
> but I see:
> 
> $ cmake ../
> 
>   project: Kernel Shark: (version: 2.3.1)
> 
> CMake Error at CMakeLists.txt:48 (find_package):
>    By not providing "FindTraceEvent.cmake" in CMAKE_MODULE_PATH this project
>    has asked CMake to find a package configuration file provided by
>    "TraceEvent", but CMake did not find one.
> 
>    Could not find a package configuration file provided by "TraceEvent" with
>    any of the following names:
> 
>      TraceEventConfig.cmake
>      traceevent-config.cmake
> 
>    Add the installation prefix of "TraceEvent" to CMAKE_PREFIX_PATH or set
>    "TraceEvent_DIR" to a directory containing one of the above files.  If
>    "TraceEvent" provides a separate development package or SDK, be sure it has
>    been installed.
> 
> On Tue, Apr 30, 2024 at 2:53 PM Yordan Karadzhov <y.karadz@gmail.com> wrote:
>>
>> Hi
>>
>> Please try to build KernelShark following the instructions given in the
>> README file in the git repository and let me know if you still run into
>> issues.
>>
>> Thanks!
>> Yordan
>>
>> On 4/30/24 16:41, David Aldrich wrote:
>>> Hi
>>>
>>> Working on WSL with Ubuntu 22.04 LTS, I am unable to build
>>> KernelShark. I will try installing it as a package, but perhaps my
>>> experience below will be useful for the project.
>>>
>>> I cloned KernelShark:
>>>
>>> git clone git://git.kernel.org/pub/scm/utils/trace-cmd/kernel-shark.git
>>>
>>> I followed the instructions at:
>>>
>>> https://kernelshark.org/build.html
>>>
>>> which requires:
>>>
>>> sudo apt-get install qtbase5-dev -y
>>>
>>> When I attempt to build KernelShark with:
>>>
>>> cmake ../
>>>
>>> I see:
>>>
>>> CMake Warning at CMakeLists.txt:76 (find_package):
>>>     Could not find a configuration file for package "Qt6Widgets" that is
>>>     compatible with requested version "6.3.0".
>>>
>>>     The following configuration files were considered but not accepted:
>>>
>>>       /usr/lib/x86_64-linux-gnu/cmake/Qt6Widgets/Qt6WidgetsConfig.cmake,
>>> version: 6.2.4
>>>       /lib/x86_64-linux-gnu/cmake/Qt6Widgets/Qt6WidgetsConfig.cmake,
>>> version: 6.2.4
>>>
>>> -- Could NOT find XKB (missing: XKB_LIBRARY XKB_INCLUDE_DIR) (Required
>>> is at least version "0.5.0")
>>> -- Could NOT find Qt6StateMachine (missing: Qt6StateMachine_DIR)
>>> CMake Error at CMakeLists.txt:77 (find_package):
>>>     Found package configuration file:
>>>
>>>       /usr/lib/x86_64-linux-gnu/cmake/Qt6/Qt6Config.cmake
>>>
>>>     but it set Qt6_FOUND to FALSE so package "Qt6" is considered to be NOT
>>>     FOUND.  Reason given by package:
>>>
>>>     Failed to find Qt component "StateMachine".
>>>
>>>     Expected Config file at
>>>     "/usr/lib/x86_64-linux-gnu/cmake/Qt6StateMachine/Qt6StateMachineConfig.cmake"
>>>     does NOT exist
>>>
>>> This was despite installing:
>>>
>>> apt install qt6-base-dev
>>>
