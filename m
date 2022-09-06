Return-Path: <linux-trace-users-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A684DECAAD5
	for <linux-trace-users@archiver.kernel.org>; Tue,  6 Sep 2022 11:57:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233942AbiIFL5n (ORCPT
        <rfc822;linux-trace-users@archiver.kernel.org>);
        Tue, 6 Sep 2022 07:57:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52166 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233433AbiIFL5f (ORCPT
        <rfc822;linux-trace-users@vger.kernel.org>);
        Tue, 6 Sep 2022 07:57:35 -0400
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9533275492
        for <linux-trace-users@vger.kernel.org>; Tue,  6 Sep 2022 04:57:31 -0700 (PDT)
Received: from fraeml735-chm.china.huawei.com (unknown [172.18.147.200])
        by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4MMP4H6Kckz67Lkw
        for <linux-trace-users@vger.kernel.org>; Tue,  6 Sep 2022 19:56:31 +0800 (CST)
Received: from lhrpeml500004.china.huawei.com (7.191.163.9) by
 fraeml735-chm.china.huawei.com (10.206.15.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 6 Sep 2022 13:57:28 +0200
Received: from lhrpeml500003.china.huawei.com (7.191.162.67) by
 lhrpeml500004.china.huawei.com (7.191.163.9) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 6 Sep 2022 12:57:28 +0100
Received: from lhrpeml500003.china.huawei.com ([7.191.162.67]) by
 lhrpeml500003.china.huawei.com ([7.191.162.67]) with mapi id 15.01.2375.031;
 Tue, 6 Sep 2022 12:57:28 +0100
From:   Matteo Bertolino <matteo.bertolino@huawei.com>
To:     Yordan Karadzhov <y.karadz@gmail.com>,
        "linux-trace-users@vger.kernel.org" 
        <linux-trace-users@vger.kernel.org>
Subject: RE: Kernelshark: funcgraph_exit events don't seem to exit?
Thread-Topic: Kernelshark: funcgraph_exit events don't seem to exit?
Thread-Index: AdjB0vgZiTKOLdjrR7qANsLEu7G47AAAmpGAAAQc5jA=
Date:   Tue, 6 Sep 2022 11:57:28 +0000
Message-ID: <f2feee0c5a6b49f3949eba9ded500842@huawei.com>
References: <97aca26a196b4c72aaf2141b5a0c12c9@huawei.com>
 <9252a7a4-f36c-356a-f069-9b17367ffff1@gmail.com>
In-Reply-To: <9252a7a4-f36c-356a-f069-9b17367ffff1@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.123.160.159]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-trace-users.vger.kernel.org>
X-Mailing-List: linux-trace-users@vger.kernel.org

RGVhciBZb3JkYW4sDQpUaGFua3MgZm9yIHlvdXIgcmVwbHkhDQoNCkkgd291bGQgbGlrZSB0byBk
byBhIGRvdWJsZSBjaGVjayB0byBiZSBzdXJlIHRoYXQgd2UncmUgb24gdGhlIHNhbWUgcmFpbC4g
DQpDYW4geW91IHBsZWFzZSB0YWtlIG15IHNjcmVlbnNob3QgYWdhaW4/IEJldHdlZW4gOC4wOTAw
MDAgYW5kIDguMTMwMDAwIHRoZSB0cmFjZSBkb2Vzbid0IHByb3ZpZGUgYW55IGluZm9ybWF0aW9u
Lg0KDQpXZSBkb24ndCBrbm93IHdoZXRoZXI6DQpBKSB0YXNrMSBjb250aW51ZXMgYWZ0ZXIgdGhl
IGVuZCBvZiBmb28xIHJ1bm5pbmcgc29tZXRoaW5nIGVsc2UgdGhhdCBpcyBub3QgdHJhY2VkDQpP
cg0KQikgVGhlIENQVSBpcyBpZGxlL2Egbm9uLXRyYWNlZCB0YXNrIGlzIHJ1bm5pbmcuDQoNClRv
ZGF5LCB0aGUgZGVmYXVsdCBiZWhhdmlvciBvZiBrZXJuZWxzaGFyayBpcyBBKS4gSW5kZWVkLCBp
biBteSBzY3JlZW5zaG90LCB0aGUgYmFyIGluZGljYXRlZCBieSB0aGUgbGlnaHQtYmx1ZSBhcnJv
dyBpcyByZWQuDQoNCkluc3RlYWQsIEkgd2lzaCB0byBjb2RlIGEgcGx1Z2luIHdpdGggYSB0aGly
ZCBvcHRpb246DQpDKSB3aGVuIHdlIGRvIG5vdCBrbm93IHdoYXQgaGFwcGVucywganVzdCBjb2xv
ciB3aXRoIGdyYXkuDQoNCkRvIHlvdXIgaW5zdHJ1Y3Rpb25zIGNvdmVyIHRoaXMgY2FzZT8gDQpJ
ZiBzbywgSSB3b3VsZCBsaWtlIHRvIGhhdmUgc29tZSBoaW50cyBhbmQgSSB3aWxsIHRyeSB0byBp
bXBsZW1lbnQgaXQgOi0pDQoNCkJlc3QgUmVnYXJkcywNCk1hdHRlbw0KDQotLS0tLU9yaWdpbmFs
IE1lc3NhZ2UtLS0tLQ0KRnJvbTogWW9yZGFuIEthcmFkemhvdiBbbWFpbHRvOnkua2FyYWR6QGdt
YWlsLmNvbV0gDQpTZW50OiBUdWVzZGF5LCBTZXB0ZW1iZXIgNiwgMjAyMiAxMjo0NSBQTQ0KVG86
IE1hdHRlbyBCZXJ0b2xpbm8gPG1hdHRlby5iZXJ0b2xpbm9AaHVhd2VpLmNvbT47IGxpbnV4LXRy
YWNlLXVzZXJzQHZnZXIua2VybmVsLm9yZw0KU3ViamVjdDogUmU6IEtlcm5lbHNoYXJrOiBmdW5j
Z3JhcGhfZXhpdCBldmVudHMgZG9uJ3Qgc2VlbSB0byBleGl0Pw0KDQpIaSBNYXR0ZW8sDQpUaGFu
a3MgZm9yIHJlcG9ydGluZyB0aGlzIGlzc3VlIQ0KDQpJIHVuZGVyc3RhbmQgd2hhdCB5b3Ugd291
bGQgbGlrZSB0byBzZWUgYmVpbmcgdmlzdWFsaXplZCwgYnV0IA0KdW5mb3J0dW5hdGVseSB0aGlz
IGlzIGRpZmZlcmVudCBmcm9tIHRoZSBpbXBsZW1lbnRlZCBnZW5lcmljIGxvZ2ljIG9mIA0KdGhl
IHZpc3VhbGl6YXRpb24gbW9kZWwgdGhhdCBjaGFuZ2VzIHRoZSBjb2xvciBhdCB0aGUgcGxhY2Ug
b2YgdGhlIGZpcnN0IA0KZXZlbnQgdGhhdCBiZWxvbmdzIHRvIHRoZSBuZXcgdGFzay4gTm90ZSB0
aGF0IHRoaXMgZ2VuZXJpYyBsb2dpYyBpcyANCmV4cGVjdGVkIHRvIHByb3ZpZGUgYWRlcXVhdGUg
dmlzdWFsaXphdGlvbiBmb3IgYWxsIHR5cGVzIG9mIGV2ZW50cywgDQp3aGlsZSB0aGUgYmVoYXZp
b3IgdGhhdCB5b3Ugd291bGQgbGlrZSB0byBzZWUgbWFrZXMgc2Vuc2Ugb25seSBmb3IgdmVyeSAN
CnNwZWNpZmljIGV2ZW50cy4NCg0KSG93ZXZlciwgd2hhdCB5b3Ugd2FudCBpcyBhY3R1YWxseSB2
ZXJ5IGVhc3kgdG8gYWNoaWV2ZS4gWW91IGp1c3QgaGF2ZSANCnRvIHdyaXRlIGEga2VybmVsc2hh
cmsgcGx1Z2luIGZvciBmdW5jZ3JhcGhfZXhpdCBldmVudHMuIElmIHlvdSBhcmUgDQppbnRlcmVz
dGVkIGluIGNvbnRyaWJ1dGluZyBzdWNoIHBsdWdpbiB0byBrZXJuZWxzaGFyaywgSSBjYW4gc2Vu
ZCB5b3UgDQppbnN0cnVjdGlvbnMgd2hhdCBoYXMgdG8gYmUgZG9uZS4gSXQgd2lsbCBiZSByZWFs
bHkgdHJpdmlhbCB3b3JrLg0KDQpjaGVlcnMsDQpZb3JkYW4NCg0KDQpPbiA5LzYvMjIgMTI6Mjks
IE1hdHRlbyBCZXJ0b2xpbm8gd3JvdGU6DQo+IERlYXIgY29tbXVuaXR5LA0KPiBJbiBvcmRlciB0
byBleHBsYWluIG15IHByb2JsZW0sIEkgbmVlZCB0byBhc2sgeW91IHRvIGhhdmUgYSBsb29rIHRv
IHRoZSB2aXN1YWwgdHJhY2UgaW4gbXkgZ2l0aHViIChJIGNhbm5vdCBhdHRhY2ggaXQgdG8gdGhl
IG1haWwgbm9yIHVzaW5nIGFuIGltYWdlIHVwbG9hZGluZyBzZXJ2aWNlKTogaHR0cHM6Ly9naXRo
dWIuY29tL3RoZS1yZWQtcm9iaW4vdHJhY2UtY21kLWV4cGVyaW1lbnRzL2Jsb2IvbWFpbi9SRUFE
TUUubWQNCj4gDQo+IEluIHRoZSB0cmFjZSwgd2UgaGF2ZSBvbmUgQ1BVLCBDUFUwLiBPbiBpdDoN
Cj4gLSBgVGFzazNgIHJ1bnMgYGZvbzUoKWAgYXQgdGltZSA4LjAwMDAwMCBjeWNsZXMNCj4gLSBg
VGFzazJgIHRha2VzIHBsYWNlIHJ1bm5pbmcgYGZvbzMoKWAgYXQgdGltZSA4LjAxMDAwMCBjeWNs
ZXMuDQo+IC0gYFRhc2sxYCB0YWtlcyBwbGFjZSBydW5uaW5nIGBmb28xKClgIGF0IHRpbWUgOC4w
NjAwMDAgY3ljbGVzLg0KPiBGb3Igbm93LCBldmVyeXRoaW5nIE9LLg0KPiBUaGVuLCBJIHdpc2gg
dG8gYGV4aXRgIHRoZSB0aHJlZSB0YXNrcy4NCj4gDQo+IC0gYFRhc2sxYCBleGl0cyBhdCA4LjA5
MDAwMCBjeWNsZXMuIEhlcmUgdGhlIHRyYWNlIGRvZXMgbm90IHNob3cgd2hhdCBJIGV4cGVjdCwg
bmFtZWx5IGBUYXNrMWAgKGluIHJlZCkgc2hhbGwgZW5kIGF0IDguMDkwMDAwIGN5Y2xlcy4gSW5z
dGVhZCwgdGhlcmUgaXMgYSByZWQgdHJhY2UgdW50aWwgdGhlIGJlZ2lubmluZyBvZiB0aGUgbmV4
dCBleGl0IGV2ZW50LCBgVGFzazJgIGF0IDguMTMwMDAwLg0KPiANCj4gVGhpcyBkb2Vzbid0IHNl
ZW0gYW4gYGV4aXRgIGV2ZW50LiBEbyB5b3UgaGF2ZSBhbnkgc3VnZ2VzdGlvbnMgdG8gc2hvdyB3
aGF0IEkgd2lzaCBvbiBLZXJuZWxzaGFyaz8NCj4gDQo+IEJlc3QgUmVnYXJkcywNCj4gTWF0dGVv
DQo=
