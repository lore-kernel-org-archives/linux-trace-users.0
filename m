Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38236220F33
	for <linux-trace-users@vger.kernel.org>; Thu, 26 Jun 2025 15:09:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750950596; cv=fail; b=dUWdOjIp+6o30IX63RUe3VuH6Z0CnWnoB/ogPntnvdcD9OKRprO2DPovDALH1M8wUNtuxb7Kmi/wJzDCrXO6lS3RjJIW8BTUyQG76vNl278rp3scDVEm1GveGEycwWf3AR8O10kTXXtINd0zoPr0MN5m7FxmAMo5G9tBtKcGqp8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750950596; c=relaxed/simple;
	bh=4yLDJueMUp7K3qRRFk9xbrnvrX6SGOEbZermpDFKvfU=;
	h=Date:To:From:Subject:Content-Type:Message-ID:MIME-Version; b=QVEFEw5h8iDmMQQLSgASTyrvQxvKvu4U2eFKY8/LHIjPMlTaVOjbxAeAFyaV8SIfPe8PBs2omDF/RrS9/4xJHZb8iyy5AcNMK6EHM7Nvp7G11ft9cMbN/Cn3fZ6fS4OJpn+5SBFMZnmXMe3k+c3zxSs5oJg524Hba70NCT2kHh8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=nj+wURoq; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=aFw++bMK; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="nj+wURoq";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="aFw++bMK"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55QF7CHe023570
	for <linux-trace-users@vger.kernel.org>; Thu, 26 Jun 2025 15:09:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=mft1beeUgxyhGe5RsfPenP8bL9FnjpzcG9pzUHYDAxk=; b=
	nj+wURoqWyEvs4WomfkNt0JJMSsCcwMki9lQAULzieohTLnkGWE5g0+ESuWTtCke
	okhjG3xtkrhh7sMYcxo7eC9+9tvlDbF5fj3MVGa4NXj9brsw1jEqP9hNqGkhE5GI
	pagHwJcqxCTOjIKdfFiblMGSy0bk4grsEQdx83XD/xiy6Gnqmd/wIm5gE7FgBkOE
	5w8/w9QHjtirOPDYr2XWwQyElZtb/2qAi9avFeyL4DuyR6iypMHmWYIBhyWCrZ3b
	1e0vEhJuwsPWFkHpaOLA4wGV91lkxEw1afv6rvfI4Pdxofuzw6DNKAJAO6UPEAH3
	Q5P/N23Iq6wVfCw9XAdkwQ==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47ds882490-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <linux-trace-users@vger.kernel.org>; Thu, 26 Jun 2025 15:09:54 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55QEK836002627
	for <linux-trace-users@vger.kernel.org>; Thu, 26 Jun 2025 15:09:53 GMT
Received: from nam02-sn1-obe.outbound.protection.outlook.com (mail-sn1nam02on2078.outbound.protection.outlook.com [40.107.96.78])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 47h0gv2hwr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <linux-trace-users@vger.kernel.org>; Thu, 26 Jun 2025 15:09:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WdZQBUHOB6oLTMgvLFfflgbYANKKclcO51+o8x0cMKbDcMO6fFEhzaJA4dqAr2clFWsxd/hmt3qfRVqYtJRpH0WeLkg4LuU2Gsdm4ES4JFAOkZMpjJQhqoqP6+K0b7WAAaAm6VcK0XX3nvPqYzrypA+jZ/+10WqEfN6DuH25D2FltrPlIALoCyDAcQOx8p7PJ5O+zsPFvzjr2gYtwS2ZrLFDTTDmqDQHr/fJZxtjT7MMEDBIiJNfAZiGJB4GBLx/N2Nz6/F63UGt137eyltcM8Jch8tzhWCLZn9XEPlpy3Rx0eAcoj/nWwC3ruERqBjc4GOfIGWbFmdhtg226yqcGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mft1beeUgxyhGe5RsfPenP8bL9FnjpzcG9pzUHYDAxk=;
 b=ynIMXtQJqc0hKdnhLaJ6SYn6V1GpqSYEjh407+SWxSj0Psg3lGbO7FuZeHhQA/wM86ejJiAthHXHLyk8gsKh/K3BK5Legi5Qx67bQZ4omyEc57D0/YHFsCOWsYxQY5w3fjYks5r867UA9maqnRJXJn5ozoC2+gwki41V7eJBMBMawM7FxF54388T/+NMpfRLkZsSn+ARsA41qM3z93XgZc7Y1GFOka2rf5bSppbHyGVcgzK4oA+aeSWM/ASGlgzb/5BpZVmH77uGevn+wxmMN15GeuCTB6F2ZPYVqx7kwPl92mKRewT/astt0KM1E9Mt3HvJ5gob/HpCyhwlWleUVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mft1beeUgxyhGe5RsfPenP8bL9FnjpzcG9pzUHYDAxk=;
 b=aFw++bMKvXYlps9owXho18P+Oqeho3Fv8quU1KRl81baQQ6ZJxTaZopEpKNh7/QFGRzSo7mQW75UnFqGmBEDe/zFeqdCji6vaP++KrJFN9Tbs3Anw8S27SdJOCE2aEgkEgeNtVMzCb823bWP2xwS6aMv7NjVmBYHsEi8kpFz2gg=
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com (2603:10b6:a03:3ef::21)
 by BN0PR10MB4968.namprd10.prod.outlook.com (2603:10b6:408:12c::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.21; Thu, 26 Jun
 2025 15:09:50 +0000
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b]) by SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b%6]) with mapi id 15.20.8857.026; Thu, 26 Jun 2025
 15:09:50 +0000
Date: Thu, 26 Jun 2025 11:09:49 -0400
To: linux-trace-users@vger.kernel.org
From: Kris Van Hees <kris.van.hees@oracle.com>
Subject: [RELEASE] DTrace 2.0.3
Content-Type: text/plain
X-ClientProxiedBy: BLAPR05CA0001.namprd05.prod.outlook.com
 (2603:10b6:208:36e::6) To SJ0PR10MB5672.namprd10.prod.outlook.com
 (2603:10b6:a03:3ef::21)
Message-ID:
 <SJ0PR10MB56729960F59DDBB9347CE9B6C27AA@SJ0PR10MB5672.namprd10.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-trace-users@vger.kernel.org
List-Id: <linux-trace-users.vger.kernel.org>
List-Subscribe: <mailto:linux-trace-users+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-trace-users+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5672:EE_|BN0PR10MB4968:EE_
X-MS-Office365-Filtering-Correlation-Id: a3d3b929-68e0-45ad-b3cb-08ddb4c37f92
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?zgLBgykJmdoxdz4QpPVRm3LrqqOw7bYjfP975CzW2EFv4AQVcQrpNTVu0wVZ?=
 =?us-ascii?Q?xALtNdQfuHrZ9WimYmA9DqmnW/X968BZyBsy64nvYk+Hhzejvzo79mjK/nqj?=
 =?us-ascii?Q?aHVIzBR25lBHUAruV5HmMXSHRub6wG1AXnJAym69gDTqaQJjUf/6m7yzZ1ee?=
 =?us-ascii?Q?41YRhHhzU1i224/NP6S2DsC1ruSfhxKrb0Wy3+PWJgIgwlMgpyhYcn+Gpv+n?=
 =?us-ascii?Q?it4jGd7G4ug64KUNjEwFQtDaIqik3WEPuhJVrHANPQ18b0sTVpvc57izIo25?=
 =?us-ascii?Q?Ut0ASLq5CwIzbSWA+T0SOc4ZjtPQf4NeS3Be4wDZdwy6UH87JM2mTl3gEmH9?=
 =?us-ascii?Q?WzjP/BGxxqmUC5b9tQdv61JnNmECkaELD7ejKAYIkw0+FbBYzFteBE+PYyyj?=
 =?us-ascii?Q?48/wPTWfx112oeMrWg2DGFRaK8FQnnfaoBo597obtcz+uFPXUMiRrEXS+43c?=
 =?us-ascii?Q?i3dUnpwqQ+2aQq+6QOnPCzzwn03aJgtqBsMUT1YcmOBct7Dyz9jWSwXeXuHi?=
 =?us-ascii?Q?uP2dei6zLJDnwoRLxRZzzkoAMCG1eJeTgnM9c8E/wZXRZaZTTccsbn9F7Ybc?=
 =?us-ascii?Q?GZJPWW5aTpqwT6SiSlTZRlS7L7mDijTxlBLMaUFJoFrJu3mMDO0ppptMXoKN?=
 =?us-ascii?Q?IBttGqNAUptksZD7HxsrNjiWRpNjKv73V2RmfGULbVNYNccKTr1Qc5IwMvMI?=
 =?us-ascii?Q?iZOTMx4Do2zSq7fKClZih091RcGJdVuSwiimZF5bSj6pzPxbOPfk1xvY/JsZ?=
 =?us-ascii?Q?HeWYNSHOWK4HYZdT53Kc6c2ZjMRNpRaYYtsBtJZY5gSbsVG/H4hevhRHNQlP?=
 =?us-ascii?Q?q65Gh4+508ueIXX2O3tLNRFUkvHI7kpnzTD7VufDae09DhJZo498QGltdZbl?=
 =?us-ascii?Q?mXQlm8saLPIKLA7+lgZwfVmMtarJJKDAhx+du7XNy93NgXCw3YPeQKQbeOpn?=
 =?us-ascii?Q?SzqqdIzLlHzuNYqwCYMqETGkrHoEu48S+K8exGiPsmYi6eILACm5/z9NAuIM?=
 =?us-ascii?Q?LaxC5z13OdZhDJD2wHRg+/8Cp5/OIbE/Zyd0IV4kpsxJWvkWXzntIR6IxaHx?=
 =?us-ascii?Q?cpgBuWqzmknxeBu/uDmzAvYsSzOyzKVElViNS6CLddKVIOxRO/4Ou6x06YDf?=
 =?us-ascii?Q?9wEUmKsq7xUDT/5+mtkdo8xOTLZmwyMj4ikptjVKJz8gWnJk+B+m/S0ob+MY?=
 =?us-ascii?Q?yiLDwbYoO3ghmLaWaC1rVA4mTGxAtw1Tq8aNjKvn+nxhHSw5uX5sSDWbpdU/?=
 =?us-ascii?Q?YFx81VwQMpUX1P0jIcAyL0GQgT6OiFk7xXAwEZwiNKsruB12ww9tzRCVNTaD?=
 =?us-ascii?Q?dLEDdAXnLABmX8rVx7Zka6OfsPL/P3IuPmL7o3Cuo8ksMJa92ky1aeQbMcNh?=
 =?us-ascii?Q?yChInclgTw+X4v0A5nTYZT6U9tKb4+wp8r6aj3kcfcPzUKIPsyDZcrz+eloR?=
 =?us-ascii?Q?pT21CDOkLYA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5672.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?hKmN1G1Kg3RVuGcDozg3ABsZhEDaEQ4aWYJKnESMFYxDGTQkEG0or4rHcKTw?=
 =?us-ascii?Q?QeDSex2Y9rSTLFwp9y+wCA2zogTVN+1N0kY3eMgDhQeyU5r1PU9GpW1ETTNH?=
 =?us-ascii?Q?5BHEWxW6N7P/SCvCVrYMS5J7KfSPoZgkI0iTubBaS9DZi9ylWxYCrseIzo9+?=
 =?us-ascii?Q?nE4GTwPqKcKAA2+GvwnttzszGg7oTSPpnWI0O3M4yc/F/BXnawsZc1wZfEse?=
 =?us-ascii?Q?uFRFgLCTmX7SR7p6E8REl+9K8UQWxJ/na4gZj7wpcZxHV35IM1mnMmxhb+k0?=
 =?us-ascii?Q?NjLkQLm6wVCIzN5thkw+rpuk3q8AG+ChApjCn+O7hqx15BQwDZoUMr/91HW6?=
 =?us-ascii?Q?bShyzx+QM4NI9DTSDEMTaD1f7Oz8OXcq98BnDPm+E3EAbm/ABhpG8BU17XXr?=
 =?us-ascii?Q?7TmHa/gJGLnysOHDPt+Q78rx0uHPHEeDLoluGlZrO/oQJ+p2km0EpMljKLZg?=
 =?us-ascii?Q?JpSwZ1R3Jm29ojUGz2lMpqzgoNxLM6KlVueDzsE09AmdSaMDcXFCl9UzbPTq?=
 =?us-ascii?Q?kD95o8fDVyzkHmF5C9l3Z6udtkENDYqQDAPAJ/+0hLdk4Omg3lnJ1F0X2A6R?=
 =?us-ascii?Q?cjP93N6uXOtC1fnlK0x3f3Abd6841W9gCrZF4YBkG9IRCKJM0M6QrsEfM4iv?=
 =?us-ascii?Q?3emDaN545kRAhEYKMvcJYMGbwBujlehk7utFpsaYaUEVVZNjgkth9ohTd/gt?=
 =?us-ascii?Q?i2mXTrZ7UrJYA7i1JBpNmd7+0AkyH9jBNETjjBK2eM+K7f4lOldIKNbNK7GV?=
 =?us-ascii?Q?vfpR/a7vF1bL71TooDHpR8Fufzvtvrtxw02lLgv5WUl/JX5ImDM3lvhHRECr?=
 =?us-ascii?Q?cPs5K6Ng5eZ4vI/r0hE/g0Jjxrd6S+pTEl2MnGT3Wrkb2w99rrXlY3K89kr3?=
 =?us-ascii?Q?9Iq+L2jYOU5IwYQ7F6AYZcGTUifufFXTV9S5mUzm0BialIlcelpT4LeMihFo?=
 =?us-ascii?Q?QjeH0yKj+yRJ9wDy1nZA41NRYuP0npRmN9PEmWEsL/HETkfI6/97s3kdmJxV?=
 =?us-ascii?Q?zO1EwsfoOS399x0wSA9Tb67l45u8HBE13wJnT5+8KbSBnvdURVtHd3Qih+D3?=
 =?us-ascii?Q?R3FghgcxC83ERteaMegtJYBx2qy8qnTTLWcdjOu/20mHi4GMTpmE0TlpAxlL?=
 =?us-ascii?Q?z9z+jwF+tnPBY9okEsmhmTDfnQl7YKT5PSxStsaM6k7t3Xc1Ym2lGXN2sYVp?=
 =?us-ascii?Q?QmWzHg+L+mzcqy0Lqh3Oyx4tuOKsV2iRnSGkOXcYrau/xdzldBwrP8LKB/rd?=
 =?us-ascii?Q?IHBGLGBJzUhr1LnJ+QvXvTqQw5fxkwMyoGHfAZKFzCwVbR6wWR09+l+69Fxd?=
 =?us-ascii?Q?Waetu65cWiubmN0TTX0Z4tCN4HoTQdBdi5kGBiOG+ISMeB9Cuz4ITmTyZ3kU?=
 =?us-ascii?Q?hUjSglLmbJfKyvR9QMmtcSJVO/ea86eSFcp0iEj2J1IkluXi5WXeXCPoXE6U?=
 =?us-ascii?Q?pn551TzskxZ+y/qETyO06AMrJy8wLbVf4gPDqB6GrYTCGHhqtuijYJZ6A3NW?=
 =?us-ascii?Q?BZQoBRphOKL1I7fAC3P8b/HSgTvkFfXtLL8S/HjywZvu4ky3F6lTEEI2eL42?=
 =?us-ascii?Q?qdB5iEozA9HueCzDOWqV2stpCVCIA9OuBAiLlgcjSxutv94hWJk3o3Df6jj6?=
 =?us-ascii?Q?ig=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	L2I1z5zWLIVpdicrb7xmRd6OlJAtbASNQt9dTASIM0Tee6rtoHyI4A1ujV38YJpJOpgEejlOB6cbsqouE500BFTTfbrFtxL9ONDVLtvcWMrnvt1QcI0XaPEvZQaOX4W369eOSh0FXg5ZFRlfqvqtTu4aqgv67jE2Ui4bX0/LEjcaYHR3+tm/xOOdH0j5N/tr6FjbzAOhWOAcZ4HVw/reItD4EYDsUlVER+TKPDnDlvjUTAjtLIAxruAv6L3qydeoP6pQ6TfL/ZAlMBhofq5CTuUQ0XKxDslQTrOxdTsYReDt1dh0he6o/wiCtuUYWbMLkZZNehfykSxpbIq543RLxL7XYolW2+5Vn0rff0xL4kFoJDgrJzaTfg3veBcEUQ1WUmSG2I2qCjdbEJdH3CWEs/tZDnCGxP8uefHwV33Hto5sGd0g2K2aX4P+x9aIwn5TDGK9V23bFWcaB9g0hU+GZIvBgW49nZEXxqIZ8ZmqCcpm7z8edt3JrGX6F7R+KgduHGtu0jO4Aa2qel0EuPluDnhLMICmyuhhDfup15NDYcIOuzKK7617uGUeyIw/nQ9xp0dQYEJNdJxTe8G1ZyGFeFXPFW1414utBj7N7YJJCKU=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a3d3b929-68e0-45ad-b3cb-08ddb4c37f92
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5672.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2025 15:09:50.9118
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: py3kiI/1xQHoj3nnLVlfTASfibQbIm4mq9goAZ4uxMrvT7EfJ3CjSEzspLMmFUdAy0YH7fGnM+jxLddwWHVlO9W9FOE9yI5kKlAEhY7EMd4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB4968
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-26_06,2025-06-26_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 mlxlogscore=999
 suspectscore=0 adultscore=0 mlxscore=0 malwarescore=0 phishscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2506260128
X-Authority-Analysis: v=2.4 cv=a8gw9VSF c=1 sm=1 tr=0 ts=685d62c2 b=1 cx=c_pps a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=NEAV23lmAAAA:8 a=0yZI2SAtThSntCeVz88A:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI2MDEyNyBTYWx0ZWRfXyfhlDaFLYKaH 0M8b3TOU6VCnv9hhxGy6m60oLAdQ3D7ask/B+aq6LYpvP5wz5m6gZO4TObLynEzxC/NUy9BKzA0 xtL004jfAplUnqAA5MVM5rpMS7LWNzAp/kguHQ1jTbYKXi+EVDxrqWk5x8p89QfZS6cWoEfmK+g
 S3DckFQAiLQwhrmR/qmVzmjJXwybL6K4Dt9u86zBGqcuuiJNmr6GwXnwPcRvw3sBt0e4Bg7iqXe hBSufbtw06InXEHhlWRbCHaKTEs2gOPR6zVTXyJS5OKjEyMXLI42XruUuLhb1wvciQzrLNzQY8K cd9096aLSWxOCQ96cJdVNiRN6mPVpeRR3FwujWDKJit0H0xFu5E4GLlAYxLkP6picPQwC0Cn1KG
 CP8yFn/YIKXYGarpUx+BB02lEl9cVcG56cFove7e/6jVszmrF1oCxeTrSrrqgtUjvfCjk7C2
X-Proofpoint-GUID: cXL5tncXPCKnyvBjF_XOQcC_4h05m4zt
X-Proofpoint-ORIG-GUID: cXL5tncXPCKnyvBjF_XOQcC_4h05m4zt

We are happy to announce the availability of DTrace for Linux 2.0.3!

This new version is based on BPF and other Linux kernel tracing features and
is implemented entirely as a userspace application.  It can be used for tracing
on any Linux kernel that provides BPF based tracing and BTF type data, although
(as mentioned below) improved functionality depends on two (optional) kernel
patches.

The functionality is close to being feature-complete in comparison with the
kernel module based version of DTrace for Linux (version 1.2.1-1). Development
continues in an incremental fashion to make the full feature set of DTrace
available using existing kernel features.

WHERE TO FIND IT?

The new version of DTrace for Linux is available at:

    https://github.com/oracle/dtrace-utils/tree/2.0-branch-dev

The main development branch for DTrace for Linux is at:

    https://github.com/oracle/dtrace-utils/tree/devel

The most recent release tag is 2.0.3.

FEATURES

  - Providers:
      + cpc: CPU Performacne Counter probes
      + dtrace: BEGIN, END, and ERROR probes
      + fbt: Function Boundary Tracing (FBT) probes
             (Using fentry/fexit probes where available)
      + lockstat: Locking realted probes
      + pid: Userspace function boundary tracing and offset-based instruction
             probes
      + proc: Process lifecycle related probes
      + profile: Timer-based profile-* and tick-* probes
      + rawfbt: Function BOundary Tracing style provider that always
                uses kprobes - it can be used to trace <func>.<suffix> symbols
                that are generated by compiler optimizations
      + rawtp: SDT-style probes for kernel tracepoints with access to raw
               (untranslated) tracepoint arguments
      + sched: CPU scheduling probes [partial implementation]
      + sdt: Statically Defined Tracing (SDT) probes for kernel tracepoints
      + sycall: System call entry and exit probes
      + usdt: Userspace Statically Defined Tracing (USDT) probes

      + [NEW] usdt: probes definitions are now stored in ELF note data, to
              ensure compilation with LTO retains this data
      + [NEW] Command line arguments to the current task can now be accessed
              using the psinfo->pr_psargs translator member.
      + [NEW] Dynamic kprobe/fprobe selection for FBT has been corrected.
      + [NEW] pid: Support for absolute offset probes (using "-" as function
              name).
      + [NEW] fbt/rawfbt: Significant performance improvements to reduce the
              dtrace startup time during probe discovery.

  - Aggregations:
      + Regular and indexed aggregations
      + Aggregation functions: avg, count, llquantize, lquantize, max, min,
                               quantize, stddev, and sum.
      + Aggregation actions: clear, normalize, normalize, printa

  - Speculative tracing:
      + Functions: speculation, speculate, commit, and discard

  - Variables:
      + Global variables
      + Thread-Local Storage (TLS) variables
      + Clause-local variables
      + Associative arrays for global and TLS variables
      + Full support for NULL-strings
      + Built-in: arg0 - arg9, args[], caller, curcpu, curthread, epid, errno,
        execname, gid, id, pid, ppid, probefunc, probemod, probename,
        probeprov, stackdepth, tid, timestamp, ucaller, uid, uregs[],
        ustackdepth, walltimestamp

  - Actions:
      + exit, freopen, ftruncate, mod, print, printa, printf, raise, setopt,
        stack, sym, system, trace, tracemem, uaddr, umod, ustack, usym

  - Subroutines:
      + alloca, basename, bcopy, cleanpath, copyin, copyinstr, copyinto,
        copyout, copyoutstr, dirname, d_path [dummy], getmajor, getminor,
        htonl, htonll, htons, index, inet_ntoa, link_ntop, lltostr,
        mutex_owned, mutex_owner, mutex_type_adaptive, mutex_type_spin, ntohl,
        ntohll, ntohs, progenyof, rand, rindex, rw_iswriter, rw_read_held,
        rw_write_held, strchr, strjoin, strlen, strrchr, strstr, strtok, substr

  - Runtime features:
      + Reporting of drop-counters for trace data that could not be recorded
        for the principal buffer, aggregation buffers, and speculation buffers.
      + Pre-generated translator files to support kernels from 5.2 to current.

  - BPF support:
      + Direct compilation of D source code into BPF programs.
      + Efficient use of pre-compiled BPF functions for library functions.
      + A bpflog option to request the BPF verifier log for loaded programs.
      + BPF program linking of dynamically generated code and pre-compiled
        code to facilitate code sharing and code re-use.
      + Improved integrated disassembler for generated BPF code at the clause
        and program level (-S in combination with the new -xdisasm=# option).
      + Improved trace data buffer handling based on memory mapped perf event
        ring-buffers.
      + BTF type data support.

      + [NEW] Precompiled BPF code is more granular to reduce BPF program size
              in generated tracing programs.

  - Development and debugging:
      + Support to run dtrace under valgrind.
      + Configure script based building is supported.
      + Improved support for building and using DTrace on upstream kernels.
      + Installation paths for all components are configurable.
      + Header files for USDT (sdt.h, etc) have been moved to avoid conflicts
        with projects that supply files with the same name.

DEPENDENCIES

DTrace for Linux depends on libctf (part of newer binutils) -or-
libdtrace-ctf. While libctf is preferred, building against libdtrace-ctf is
still possible. It can be found at:

    https://github.com/oracle/libdtrace-ctf

DTrace for Linux makes use of BPF library functions that are compiled at 
build time. It depends on BPF support in GCC and binutils to generate the
pre-compiled BPF function library.

DTrace for Linux benefits from 2 optional kernel features that are not commonly
available in Linux kernels:

  - CTF data generation at compile time: this provides important datatype
    information for kernel and kernel module symbols.

  - Module symbol address range data: this adds address range data about any
    built-in modules to allow for consistent ways to refer to probes by module
    and function (or probe) name.

DTrace for Linux can be used for tracing without these patches, albeit with
some limitations.

These additional support features for tracing are available at:

    https://github.com/oracle/dtrace-linux-kernel/tree/v2/6.7

Please consider joining our development list: dtrace at lists.linux.dev
and/or our IRC channel: #linux-dtrace at libera.chat

    Enjoy!

