Return-Path: <SRS0=ls0D=5M=vger.kernel.org=linux-trace-users-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6559EC43331
	for <linux-trace-users@archiver.kernel.org>; Fri, 27 Mar 2020 13:25:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 278872082E
	for <linux-trace-users@archiver.kernel.org>; Fri, 27 Mar 2020 13:25:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=kdab.com header.i=@kdab.com header.b="qbIJU9Bo"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726959AbgC0NZZ (ORCPT
        <rfc822;linux-trace-users@archiver.kernel.org>);
        Fri, 27 Mar 2020 09:25:25 -0400
Received: from mail.kdab.com ([176.9.126.58]:18195 "EHLO mail.kdab.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726275AbgC0NZZ (ORCPT
        <rfc822;linux-trace-users@vger.kernel.org>);
        Fri, 27 Mar 2020 09:25:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kdab.com; h=
 content-type:content-type:mime-version:references:in-reply-to
 :organization:message-id:date:date:subject:subject:from:from; s=
 dkim; t=1585315519; x=1586179520; bh=xXGAhpk1oDUyJVx+uYIvcBpTNxK
 LmTA+2ucf9peCaog=; b=qbIJU9BondyQdhpo8DW8VIctRj7Qx2yZDxGbbczxG+o
 KyrSgHX55WxUxsH30txmqtMds4cFC9x+tbF90TDegDyoS5mIkOz451obiGBtZteS
 txiPmsdLo6tjML0fPJf/maaN5QVEur+hgqQvVdw05XjI56nx+PAmYbozQNsxlzfo
 =
X-Virus-Scanned: amavisd-new at kdab.com
From:   Milian Wolff <milian.wolff@kdab.com>
To:     ahmadkhorrami <ahmadkhorrami@ut.ac.ir>
Cc:     Jiri Olsa <jolsa@redhat.com>, Steven Rostedt <rostedt@goodmis.org>,
        Arnaldo Carvalho de Melo <acme@redhat.com>,
        Linux-trace Users <linux-trace-users@vger.kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        linux-trace-users-owner@vger.kernel.org,
        Jin Yao <yao.jin@linux.intel.com>,
        Namhyung Kim <namhyung@kernel.org>,
        Changbin Du <changbin.du@intel.com>,
        Andi Kleen <ak@linux.intel.com>
Subject: Re: Wrong Perf Backtraces
Date:   Fri, 27 Mar 2020 14:25:18 +0100
Message-ID: <3332248.LM0AJKV5NW@agathebauer>
Organization: KDAB
In-Reply-To: <ca0cb1410a799267a2e1e23b6e8f7535@ut.ac.ir>
References: <20200325210252.GC1947699@krava> <2478802.X9hSmTKtgW@agathebauer>
 <ca0cb1410a799267a2e1e23b6e8f7535@ut.ac.ir>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart15544063.geO5KgaWL5";
 micalg="sha256"; protocol="application/pkcs7-signature"
Sender: linux-trace-users-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-trace-users.vger.kernel.org>
X-Mailing-List: linux-trace-users@vger.kernel.org

--nextPart15544063.geO5KgaWL5
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

On Freitag, 27. M=E4rz 2020 13:58:33 CET ahmadkhorrami wrote:
> Hi,
> Thanks Milian. So if I am right, I should do the following:
> 1) Run "perf buildid-list" and catch all the <file path, build-ids>
> pairs.
> 2) First check for the existence of the file path.
> 3) If failed, concatenate "~/.debug", file path, "/" and buildid and use
> it as the alternative.

you missed the trailing "/elf" but otherwise yes :)

> I thought that GDB is smart enough to detect these situations in the
> same way that it detects debug info files.
> Should I check any directory other than ~/.debug?

Hmm good point, GDB should indeed do that by default but maybe it doesn't d=
o=20
it for the `file` command for some reason? I cannot answer this, sorry.

Cheers

> On 2020-03-27 16:40, Milian Wolff wrote:
> > On Freitag, 27. M=E4rz 2020 12:04:20 CET ahmadkhorrami wrote:
> >> I do the following:
> >> If this line is in the perf script backtrace:
> >> 7f21ffe256db g_main_context_iteration+0x2b
> >> (/usr/lib/x86_64-linux-gnu/libglib-2.0.so.0.5600.4)
> >> I run the following command:
> >> gdb -batch -ex 'file
> >> /usr/lib/x86_64-linux-gnu/libglib-2.0.so.0.5600.4'
> >> -ex 'disass g_main_context_iteration'.
> >=20
> > You can try to parse the output of `perf buildid-list` to get a mapping
> > that
> > can be used to run this on another person's machine. E.g.
> >=20
> > ```
> > $ perf buildid-list
> > 5837b1e7495db791f9a3a56fb6ca29958da75b0c [kernel.kallsyms]
> > 845f98f6a3019620c37a2f611b2f20c27de83d5b
> > /home/milian/projects/kdab/rnd/
> > hotspot/build/tests/test-clients/cpp-parallel/cpp-parallel
> > f6ca5853dae87d9f0503a9ef230f6d1fa15a832d /usr/lib/ld-2.30.so
> > 92883b06055e8e21ded8eb0cd5a61f5704531152 [vdso]
> > 8b04d1825b63d9a600e3d57ac71058935e7ad757 /usr/lib/libpthread-2.30.so
> > 09639b80a8fad179004f2484608764d2b336dd4a /usr/lib/libstdc++.so.6.0.27
> > 33d1f350f13728651d74dd2a56bad1e4e4648f5e /usr/lib/libc-2.30.so
> > $ file
> > ~/.debug/usr/lib/ld-2.30.so/f6ca5853dae87d9f0503a9ef230f6d1fa15a832d/
> > elf
> > /home/milian/.debug/usr/lib/ld-2.30.so/
> > f6ca5853dae87d9f0503a9ef230f6d1fa15a832d/elf: ELF 64-bit LSB shared
> > object,
> > x86-64, version 1 (SYSV), statically linked,
> > BuildID[sha1]=3Df6ca5853dae87d9f0503a9ef230f6d1fa15a832d, not stripped
> > ```
> >=20
> > I'm afraid to say that I currently don't have the time required to be
> > of more
> > help in debugging this issue in general.
> >=20
> > Good luck!


=2D-=20
Milian Wolff | milian.wolff@kdab.com | Senior Software Engineer
KDAB (Deutschland) GmbH, a KDAB Group company
Tel: +49-30-521325470
KDAB - The Qt, C++ and OpenGL Experts
--nextPart15544063.geO5KgaWL5
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Disposition: attachment; filename="smime.p7s"
Content-Transfer-Encoding: base64

MIAGCSqGSIb3DQEHAqCAMIACAQExDzANBglghkgBZQMEAgEFADCABgkqhkiG9w0BBwEAAKCCDEIw
ggXmMIIDzqADAgECAhBqm+E4O/8ra58B1dm4p1JWMA0GCSqGSIb3DQEBDAUAMIGFMQswCQYDVQQG
EwJHQjEbMBkGA1UECBMSR3JlYXRlciBNYW5jaGVzdGVyMRAwDgYDVQQHEwdTYWxmb3JkMRowGAYD
VQQKExFDT01PRE8gQ0EgTGltaXRlZDErMCkGA1UEAxMiQ09NT0RPIFJTQSBDZXJ0aWZpY2F0aW9u
IEF1dGhvcml0eTAeFw0xMzAxMTAwMDAwMDBaFw0yODAxMDkyMzU5NTlaMIGXMQswCQYDVQQGEwJH
QjEbMBkGA1UECBMSR3JlYXRlciBNYW5jaGVzdGVyMRAwDgYDVQQHEwdTYWxmb3JkMRowGAYDVQQK
ExFDT01PRE8gQ0EgTGltaXRlZDE9MDsGA1UEAxM0Q09NT0RPIFJTQSBDbGllbnQgQXV0aGVudGlj
YXRpb24gYW5kIFNlY3VyZSBFbWFpbCBDQTCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEB
AL6znlesKHZ1QBbHOAOY08YYdiFQ8yV5C0y1oNF9Olg+nKcxLqf2NHbZhGra0D00SOTq9bus3/mx
gUsg/Wh/eXQ0pnp8tZ8XZWAnlyKMpjL+qUByRjXCA6RQyDMqVaVUkbIr5SU0RDX/kSsKwer3H1pT
/HUrBN0X8sKtPTdGX8XAWt/VdMLBrZBlgvnkCos+KQWWCo63OTTqRvaq8aWccm+KOMjTcE6s2mj6
RkalweyDI7X+7U5lNo6jzC8RTXtVV4/Vwdax720YpMPJQaDaElmOupyTf1Qib+cpukNJnQmwygjD
8m046DQkLnpXNCAGjuJy1F5NATksUsbfJAr7FLUCAwEAAaOCATwwggE4MB8GA1UdIwQYMBaAFLuv
fgI9+qbxPISOre44mOzZMjLUMB0GA1UdDgQWBBSCr2yM+MX+lmF86B89K3FIXsSLwDAOBgNVHQ8B
Af8EBAMCAYYwEgYDVR0TAQH/BAgwBgEB/wIBADARBgNVHSAECjAIMAYGBFUdIAAwTAYDVR0fBEUw
QzBBoD+gPYY7aHR0cDovL2NybC5jb21vZG9jYS5jb20vQ09NT0RPUlNBQ2VydGlmaWNhdGlvbkF1
dGhvcml0eS5jcmwwcQYIKwYBBQUHAQEEZTBjMDsGCCsGAQUFBzAChi9odHRwOi8vY3J0LmNvbW9k
b2NhLmNvbS9DT01PRE9SU0FBZGRUcnVzdENBLmNydDAkBggrBgEFBQcwAYYYaHR0cDovL29jc3Au
Y29tb2RvY2EuY29tMA0GCSqGSIb3DQEBDAUAA4ICAQB4XLKBKDRPPO5fVs6fl1bsj6JrF/bz9kkI
BtTYLzXN30D+03Hj6OxCDBEaIeNmsBhrJmuubvyE7HtoSmR809AgcYboW+rcTNZ/8u/Hv+GTrNI/
AhqX2/kiQNxmgUPt/eJPs92Qclj0HnVyy9TnSvGkSDU7I5Px+TbO+88G4zipA2psZaWeEykgzClZ
lPz1FjTCkk77ZXp5cQYYexE6zeeN4/0OqqoAloFrjAF4o50YJafX8mnahjp3I2Y2mkjhk0xQfhNq
bzlLWPoT3m7j7U26u7zg6swjOq8hITYc3/np5tM5aVyu6t99p17bTbY7+1RTWBviN9YJzK8HxzOb
XYWBf/L+VGOYNsQDTxAk0Hbvb1j6KjUhg7fO294F29QIhhmiNOr84JHoy+fNLpfvYc/Q9EtFOI5I
SYgOxLk3nD/whbUe9rmEQXLp8MB933Ij474gwwCPUpwv9mj2PMnXoc7mbrS22XUSeTwxCTP9bcmU
dp4jmIoWfhQm7X9w/Zgddg+JZ/YnIHOwsGsaTUgj7fIvxqith7DoJC91WJ8Lce3CVJqb1XWeKIJ8
4F7YLXZN0oa7TktYgDdmQVxYkZo1c5noaDKH9Oq9cbm/vOYRUM1cWcef20Wkyk5S/GFyyPJwG0fR
1nRas3DqAf4cXxMiEKcff7PNa4M3RGTqH0pWR8p6EjCCBlQwggU8oAMCAQICEAf6KCF9+1doL2oE
OTPysLwwDQYJKoZIhvcNAQELBQAwgZcxCzAJBgNVBAYTAkdCMRswGQYDVQQIExJHcmVhdGVyIE1h
bmNoZXN0ZXIxEDAOBgNVBAcTB1NhbGZvcmQxGjAYBgNVBAoTEUNPTU9ETyBDQSBMaW1pdGVkMT0w
OwYDVQQDEzRDT01PRE8gUlNBIENsaWVudCBBdXRoZW50aWNhdGlvbiBhbmQgU2VjdXJlIEVtYWls
IENBMB4XDTE3MDUyMzAwMDAwMFoXDTIwMDUyMjIzNTk1OVowggFZMQswCQYDVQQGEwJTRTEPMA0G
A1UEERMGNjgzIDMxMRIwEAYDVQQIEwlWYWVybWxhbmQxEDAOBgNVBAcTB0hhZ2ZvcnMxGDAWBgNV
BAkTD05vcnJpbmdzIHZhZWcgMjEPMA0GA1UEEhMGQm94IDMwMSYwJAYDVQQKDB1LbGFyw6RsdmRh
bGVucyBEYXRha29uc3VsdCBBQjEdMBsGA1UECxMUQSBLREFCIEdyb3VwIENvbXBhbnkxQzBBBgNV
BAsMOklzc3VlZCB0aHJvdWdoIEtsYXLDpGx2ZGFsZW5zIERhdGFrb25zdWx0IEFCIEUtUEtJIE1h
bmFnZXIxHzAdBgNVBAsTFkNvcnBvcmF0ZSBTZWN1cmUgRW1haWwxFTATBgNVBAMTDE1pbGlhbiBX
b2xmZjEkMCIGCSqGSIb3DQEJARYVbWlsaWFuLndvbGZmQGtkYWIuY29tMIIBIjANBgkqhkiG9w0B
AQEFAAOCAQ8AMIIBCgKCAQEAxrzfNBVvRbiAknuTBXuQnNm9sLIFLo0vbPB6kswk78A3tA++Zn5c
lQUHhGlQq1cdYxagnUpqwvG3Sod15mPSOLkAPf/mabLN7p+lFbRaUP+97ZkTZtvb4BCC3osIEFI4
G393OSFWqc2qmIPE/SwSASbAA20Fcaa2M6P1lhOk/ttUh2jIurTPF0wUycIA7lBddrOgaOA8e2m6
iLTNHtlrfRbBaUX91D5ebY+UWmIjXSQ9+CtutMzBkwnF0rZKririvOkklg9VzEGNQVHrQfDF2s/U
pOtmtuVSwElauGT/KALyCFuIrYC1pmaKH8S1xODJqiRaf6jH8E+KQzKjyM/ErwIDAQABo4IB1TCC
AdEwHwYDVR0jBBgwFoAUgq9sjPjF/pZhfOgfPStxSF7Ei8AwHQYDVR0OBBYEFN+m99RtIuA1bSdw
6b1brOX7X3AJMA4GA1UdDwEB/wQEAwIFoDAMBgNVHRMBAf8EAjAAMB0GA1UdJQQWMBQGCCsGAQUF
BwMEBggrBgEFBQcDAjBGBgNVHSAEPzA9MDsGDCsGAQQBsjEBAgEDBTArMCkGCCsGAQUFBwIBFh1o
dHRwczovL3NlY3VyZS5jb21vZG8ubmV0L0NQUzBaBgNVHR8EUzBRME+gTaBLhklodHRwOi8vY3Js
LmNvbW9kb2NhLmNvbS9DT01PRE9SU0FDbGllbnRBdXRoZW50aWNhdGlvbmFuZFNlY3VyZUVtYWls
Q0EuY3JsMIGLBggrBgEFBQcBAQR/MH0wVQYIKwYBBQUHMAKGSWh0dHA6Ly9jcnQuY29tb2RvY2Eu
Y29tL0NPTU9ET1JTQUNsaWVudEF1dGhlbnRpY2F0aW9uYW5kU2VjdXJlRW1haWxDQS5jcnQwJAYI
KwYBBQUHMAGGGGh0dHA6Ly9vY3NwLmNvbW9kb2NhLmNvbTAgBgNVHREEGTAXgRVtaWxpYW4ud29s
ZmZAa2RhYi5jb20wDQYJKoZIhvcNAQELBQADggEBABf47LSJADqH+ow9INv3QM1NC/qq2bjxGvsZ
68iD11VEUAFlsYfsVTgQqUirwPVTYenXtwVBELHZyywsui1JxL7HKQetLQegDDP/RyfjReVaWxhy
3OpuItsgLVbru9QVgPifnoBFPtfZcwjeJDmeSbLT8oj4Rd0KYBOIve7WKvsfNPsNwfbLwY2zILkE
LjxZcVi2AwZHDyab+dzL/3YcLuJj1lSawBGn7ilpcdZydlv4aye51pD/MemLIYLcylt+ImrmjnTV
y+QlAHRF3s5FE8yAr+W1MBD/1bKZCSgFt8VQoAlz3hiQh8QqZp4Zl8WuVL4+mP/mT6VDEWgq/0Bo
cukxggJuMIICagIBATCBrDCBlzELMAkGA1UEBhMCR0IxGzAZBgNVBAgTEkdyZWF0ZXIgTWFuY2hl
c3RlcjEQMA4GA1UEBxMHU2FsZm9yZDEaMBgGA1UEChMRQ09NT0RPIENBIExpbWl0ZWQxPTA7BgNV
BAMTNENPTU9ETyBSU0EgQ2xpZW50IEF1dGhlbnRpY2F0aW9uIGFuZCBTZWN1cmUgRW1haWwgQ0EC
EAf6KCF9+1doL2oEOTPysLwwDQYJYIZIAWUDBAIBBQCggZMwGAYJKoZIhvcNAQkDMQsGCSqGSIb3
DQEHATAcBgkqhkiG9w0BCQUxDxcNMjAwMzI3MTMyNTE4WjAoBgkqhkiG9w0BCQ8xGzAZMAsGCWCG
SAFlAwQBAjAKBggqhkiG9w0DBzAvBgkqhkiG9w0BCQQxIgQgeumVRPonIlfLOSllKhxGUWlzUK6h
aIalpckVpqscPDMwDQYJKoZIhvcNAQEBBQAEggEAmRhB519BImlYZ65+GxbB5rot6dTvHNhdCwNn
vztpM5+v4Hyow/1gSwegFxxrM1ZbtWAn3bhJpRCpTgA41NusN4faP+LYUP0TpWo4BzQ/DCgw2Vx0
8ZmZ9SOUeENfuVmOj9O69E+ym7Njss/uUuaA+evVCe+8/pQzVrbr/mHCrufIFzrdYahk+hxmkBL1
9OI26qEmQz4APv50eVlGgjssafmKmeDHWY5WKLx2+ERy0AI9IAPKTVX1uN/JF05LqIRMsBtbGcIu
lhrE2LtZnl/uJ0zYbSjS3euE+GMdB9iBQS+oEGBX3UXa8KxOglBAKxR0VZ03pgd24KCdttCsZ3hT
pAAAAAAAAA==


--nextPart15544063.geO5KgaWL5--


