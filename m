Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEB9025541
	for <linux-trace-users@vger.kernel.org>; Thu, 18 Jan 2024 13:32:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705584737; cv=none; b=hQrULlBllVxO6UaTvIVYW+9+8G31FTLFHhCMxe76Pa0THWATkQVPMhA8dGe7/5IN4y2C92L4PJC3Oq94VdrLVBzQ2Ty3wHpL3PE8c3nvbLqpv+GSO8nVZhxID0neaG5Au2ctovotLZNKV6hdA+lETAB6hl/MrT9Aj1+9E/FFcKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705584737; c=relaxed/simple;
	bh=ZHk8uFJXRRuVJnIzDFLaEXy2X2nj3MPJwQrd41zWxvc=;
	h=Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Google-Smtp-Source:X-Received:MIME-Version:
	 From:Date:Message-ID:Subject:To:Content-Type; b=qE4mmsPTv2zSVWT9u4eAGkGLqSB7sWKmOkQE87S7fYOblObriR2IS+EHoCaZ0aNCjnLii9xtNBkgdw6vSft1idW31ZJpFQYQ9FYJBPGl+r6IYn6CLlTS7KhSMUogU7wbrVOuUMHk6OMmtgEL6q8XCaA9xGSaMU8xvinfqRsEqxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=sidebranch.com; spf=fail smtp.mailfrom=sidebranch.com; dkim=pass (2048-bit key) header.d=sidebranch-com.20230601.gappssmtp.com header.i=@sidebranch-com.20230601.gappssmtp.com header.b=ShoCLsiC; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=sidebranch.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=sidebranch.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sidebranch-com.20230601.gappssmtp.com header.i=@sidebranch-com.20230601.gappssmtp.com header.b="ShoCLsiC"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-53fbf2c42bfso8751341a12.3
        for <linux-trace-users@vger.kernel.org>; Thu, 18 Jan 2024 05:32:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sidebranch-com.20230601.gappssmtp.com; s=20230601; t=1705584732; x=1706189532; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ZHk8uFJXRRuVJnIzDFLaEXy2X2nj3MPJwQrd41zWxvc=;
        b=ShoCLsiCXG9ywx0JXJzL6/Lj7IgtUYdwkSuDwqk7RGKcUFAUKYwLW6qEuu/EjxK0lE
         x7Ky3FPDdrF4SQ1T8KyeeBHcUcM2vsmEpWjYc7xJmRCFRbysTHPCsVP3hC/BrtV1aE26
         NKEZCIfsQeDELCPZrymJ3e5eRRaYayH5XFmngz+OqVI4cj2W6t1WbTPvEr9BR8y0UrR/
         u7ElNn67yqCcDV9tKdJoEp4MPCadq5P0iAWSU6JfvyPyL55ZpVWOmbgEr8Dh7WCX+lsp
         yLPJNTE6frTqeoxSeNLg6HlLhTQmci/mr/8eSiq/pCIz/hVs//OcR/ivegkwFe7WKpgs
         tQ7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705584732; x=1706189532;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZHk8uFJXRRuVJnIzDFLaEXy2X2nj3MPJwQrd41zWxvc=;
        b=cCY6jt1Ywo1dEBXZMgGTTYPHOQCbF7xcrmrYj6va+kyDTHo9ZA8nn/zaX9PeToyo9y
         D8UsE+YSSfHu5RD6mMYz8pivnoJn5aqbjdRc/H9scxkTkOAeUbR74ywPwi9uuzIPX7Jd
         qfaoodwxMBlo5Nmm8gQ9BO37gQKDh7pAeuqry955JINJDmJPOH0nTdgW+KHWVHCvKlHd
         vm+55VawDyBG7HstAHWilplJ2mDX/jmZAXhZgXZlaDYfszJ+Rqe99E0vY3+0z6B7V7ao
         ZAplkR4J9eF3veRhGbXUAtdA54Xjzxt3/ocnvmnW9WACudn7jEq/s3LXeasA3tluXiiw
         SzTQ==
X-Gm-Message-State: AOJu0Yxi9LJEWcb5cDDCQ87LipyxbS7xFoalb4uFVNforsyYNl4seuHT
	YrmBDst3ebXxuiyrmtVSYV44kWwaToMbYER0NLHCriHmyAG7qKnDShlb08xm2OizqqUwaxfxRRL
	CpKsd6NXtAjMJ+vBoC5HokbQaKkAClZiZe25buxrDl9ROZizKODlUeg==
X-Google-Smtp-Source: AGHT+IFBHe7lB0TWsCCocD7NieEBYcubJpoarZqnKca5+Hgz+LqVt8/AWqHT+rmEJSdvZXvmCiKP8kJkTxWwfMSeVH0=
X-Received: by 2002:a05:6a20:158d:b0:19b:4435:e425 with SMTP id
 h13-20020a056a20158d00b0019b4435e425mr944103pzj.30.1705584732744; Thu, 18 Jan
 2024 05:32:12 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-trace-users@vger.kernel.org
List-Id: <linux-trace-users.vger.kernel.org>
List-Subscribe: <mailto:linux-trace-users+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-trace-users+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Leon Woestenberg <leon@sidebranch.com>
Date: Thu, 18 Jan 2024 14:32:01 +0100
Message-ID: <CAMjhiJi9dMoUb5XUbPDm1LLVMidbaRaVws-K0hPCwCftgXOZMQ@mail.gmail.com>
Subject: user-space rtla vs kernel tracing dependency?
To: linux-trace-users@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello all,

To what extent can we run the latest version of the kernel source tree
user-space tool(set) tools/trace/rtla against an older (say 6.1 LTS)
kernel version?

Regards,

Leon.
