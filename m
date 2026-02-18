Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 359A7487BE
	for <linux-trace-users@vger.kernel.org>; Wed, 18 Feb 2026 05:34:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771392843; cv=none; b=OHWJMEDjpg7B33a3v6zVpw3Nc3y8BarvIfuN4/cfcz9csIZCyBWuoZbE5XS1yjtnTL7Gn0Q6yGDa1h3zdPHAJyHkO+Krz/ykR+qnHJ67ySe5umZCL8NxpTth3/6ozfsJDnvRtNU5pRdW3gK/pjNsNudAopPUVZ6WdGKekZ88emg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771392843; c=relaxed/simple;
	bh=keX+4jOq9lmpYby2qtBvjVF3CX+wymQsMq9Q/bm1+a8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BlQkJPoSzQCj6ce65XrgynCuxnJF574HyErs6A5DARq5EileXV1+spqsJvC7XTK2/VwFer0fTjiSNRB+LdIkn4fIdjbIhbUY7snNy0XYllzn50HE3a4qpBesORoixzmyEa9vzdBzrNA2Q6/+jvN2ZLTMTdP9vUibXoYGmvUx3R4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=gGCPxQp3; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="gGCPxQp3"
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61HJH77w3669543;
	Wed, 18 Feb 2026 05:33:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=4YHyxw
	IuOrPZTV9vrytVydrlzxZ/IPOjbmPEUciC71g=; b=gGCPxQp3hzdHz7dH0Mxv9U
	R26NkEqLh7ISzWHXKvOJA5yt1quNtY4arWHvrKdvq/X7IQmbBQyhezYTja4HKxsZ
	/MR9xzSIH13j81f0m6kHyXz7xfqSWnTrD22u+0ESySt2Ocsub2tTMjaRh/S2A3st
	8v6e+GGPhkDmDcPqUNP29gUR1LsERMvtBRYjuW3U0eNZoyy6ShNUa6191nrDdKTs
	SDipaCcHsW60kEYPXBQqsKjZnlxoJILyUlCwBWUv1K2QjZETZHjBI3L8vrYpOd+U
	wrRbwQyfY3H/idDNL7mg+BDgJj8dnwuq857VK67xzqZM4LMIYkd9tY/BXTJK4c6w
	==
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4caj646t7e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 18 Feb 2026 05:33:37 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 61I2MSMu017761;
	Wed, 18 Feb 2026 05:33:36 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4ccb28ekju-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 18 Feb 2026 05:33:36 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 61I5XYLl43713000
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 18 Feb 2026 05:33:34 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6F2FA20040;
	Wed, 18 Feb 2026 05:33:34 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BD75620043;
	Wed, 18 Feb 2026 05:33:32 +0000 (GMT)
Received: from [9.43.5.239] (unknown [9.43.5.239])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 18 Feb 2026 05:33:32 +0000 (GMT)
Message-ID: <b9ddf051-f6eb-489a-b199-6d47f5a21395@linux.ibm.com>
Date: Wed, 18 Feb 2026 11:03:31 +0530
Precedence: bulk
X-Mailing-List: linux-trace-users@vger.kernel.org
List-Id: <linux-trace-users.vger.kernel.org>
List-Subscribe: <mailto:linux-trace-users+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-trace-users+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PPC][Tracing] Missing syscalls:* ftrace/perf events on PowerPC
 vs x86
To: "Nassiri, Mohammad" <mnassiri@ciena.com>,
        "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Cc: "linux-trace-users@vger.kernel.org" <linux-trace-users@vger.kernel.org>,
        "michael@ellerman.id.au" <michael@ellerman.id.au>,
        "srostedt@redhat.com" <srostedt@redhat.com>,
        "masami.hiramatsu@linaro.org" <masami.hiramatsu@linaro.org>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Nicholas Piggin <npiggin@gmail.com>
References: <CH2PR04MB6821DAF7C6684BB990A0288BC56DA@CH2PR04MB6821.namprd04.prod.outlook.com>
Content-Language: en-US
From: Hari Bathini <hbathini@linux.ibm.com>
In-Reply-To: <CH2PR04MB6821DAF7C6684BB990A0288BC56DA@CH2PR04MB6821.namprd04.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-ORIG-GUID: ZcZRDNRchZ9o3YcEDqQjNzz-hhxhkouE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE4MDA0MyBTYWx0ZWRfX0O+nc+sVVCxe
 ml3mGq+pnBGxncjT8njk7nXP+aIx32hHPl75NYQbBLb9cAgO6WA5MC7IQ7acwKWGjSWK5NVlvU5
 ugvgupY3e9Rk/JLvGLNN9tD3Z+v7sTKEs1jZhm4QUn+eCdzflfs4g8VRqxQLoyQe1N6bQUIvfdW
 AWb55bqT0F2eB0JnAm+efmXGVGWeT0q5xd1S2OcO6txLw/Otkm4vqLrpQDzmwCBeq+AIA8gh/UY
 FUy8elwKr9XLGXcofX0hVF/OuS/QidSk2+R8Ifnm6jOIb9kwtJmXMoigYL5fzhlbHumvABBxYIP
 tHn0uc/JM7+fMlP70i4Z/gRF+elGMMRvv4AtFjwzijNzqrox6z2Y9r48aTGNYp23z6ovQK0vKTT
 202ed2MQfAybaXYqyPdVASBE+hVyOCt3p8JDZ8HytaEXyZxA9J4wlaqD7SY1nMiUThwoyVqeRTJ
 MMWAmEspBdhrOCzPFrQ==
X-Proofpoint-GUID: Kpmx5zUcTg_pbto6RNvR4YoiCD8Xu3uC
X-Authority-Analysis: v=2.4 cv=U+mfzOru c=1 sm=1 tr=0 ts=69954f31 cx=c_pps
 a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=VwQbUJbxAAAA:8
 a=5AoxzEp_LWBq4ObcYV0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-17_04,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 bulkscore=0 impostorscore=0 malwarescore=0 spamscore=0
 adultscore=0 phishscore=0 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602180043



On 18/02/26 1:40 am, Nassiri, Mohammad wrote:
> Hello,
> 
> On PPC64 with Yocto Kirkstone and Linux 5.10.x, `CONFIG_FTRACE_SYSCALLS=y` is enabled, but neither `perf list` nor ftrace show per‑syscall events under `/sys/kernel/debug/tracing/events/syscalls`. Only `raw_syscalls:sys_enter` / `raw_syscalls:sys_exit` are available.
> 
> On the same build and kernel version for x86_64, per‑syscall events are visible.
> 
> Configs on PPC include:
> CONFIG_TRACEPOINTS=y
> CONFIG_EVENT_TRACING=y
> CONFIG_FTRACE=y
> CONFIG_FTRACE_SYSCALLS=y
> CONFIG_HAVE_SYSCALL_TRACEPOINTS=y
> 
> Questions:
> 1. Is the absence of per‑syscall tracepoints on PPC in 5.10.x expected behaviour, or am I missing a config option required for these syscalls:* events to be available?
> 2. Or were these events only enabled for PPC after Michael Ellerman’s syscall tracing patch series in v6.1?
>     Link: https://lore.kernel.org/linuxppc-dev/166488988686.779920.13794870102696416283.b4-ty@ellerman.id.au/
> 3. If yes to (2), would a minimal backport of the PPC syscall tracepoint generation code from v6.1 allow 5.10.x to show syscalls:* events in perf/ftrace?

You should see syscall enter/exit tracepoints on v5.10.x without syscall
wrapper patchset referred above. Are you using v5.10.250 ?
Also, would help, if you can share the .config you used.

- Hari
