---
title: "GPG on macOS"
date: 2026-03-19T17:08:41+01:00
draft: true
tags: ["apple"]
categories: ["2026"]
---

I've been a happy user of GPG on macOS and Linux for a while. On macOS, I use almost the same setup, except that I use pinentry for Mac (`pinentry-mac` installed with Homebrew) rather than Linux. I used to use the same GPG key for a while, which was generated using GPGTools back when I was working on OS X. When I was back on macOS, I use my Linux setup and it worked smoothly. Now that I use Apple Mail exclusively, I want to be able to send signed (more rarely encrypted) emails in some cases. It was pretty easy to do under Neomutt:

```
set crypt_autoencrypt = no
set crypt_autopgp = yes
set crypt_autosign = no
set crypt_replysign = yes
set crypt_replysignencrypted = yes
set crypt_use_gpgme = yes
set crypt_verify_sig = yes
set pgp_self_encrypt = yes
set pgp_sign_as = 152E3E3F7C4CCE44
set pgp_use_gpg_agent = yes
```

I know the recommended and preferred way to sign your outgoing email is to rely on S/MIME, see [here](https://hashbangwallop.com/smime-certs-for-apple-email.html) or [there](https://giuliomagnifico.blog/post/2021-01-13-ios-smime-and-pgp/). The benefit of this approach is that you can sign your email from your iPhone too. However, I find much simpler to reuse my current setup, and for that I had to install [GPG Suite](https://gpgtools.org) with Mail plugin. I used to use it in the past, so it's not really a problem to buy the upgraded version. After all, external certificates must also be bought from certified authorities.

Homebrew comes first in my `$PATH` so GnuPG is masking the `gpg` exec installed by the GPG Suite (in fact it is a symlink in `/usr/local/bin` to the `gpg2` exec from MacGPG2). This is pretty easy to fix.

{{% music %}}Amy Macdonald • _Crazy Shade of Blue_{{% /music %}}
