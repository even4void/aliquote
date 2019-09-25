---
title: "Send email via Postfix"
date: 2010-12-20T20:15:19+01:00
draft: false
tags: ["apple"]
categories: ["2010"]
---

I like sending brief email via the command line, because it really sucks to open a web browser just for writing 2 lines of text. On my old computer, I configured postfix to work with my gmail account. Now, I tried to replicate my config on my Airbook, but the SSL certificates used by Gmail have changed in the meantime, and although my configuration still works I end up with unwanted warnings in my `/var/log/mail.log`.

When I first configure postfix, I used the [Thawtee certificates](http://www.verisign.com/support/roots). Basically, you should get a copy of `Thawte_Premium_Server_CA.pem`. Now, Gmail has changed this and you should use Equifax, `Equifax_Secure_CA.pem`, which can be found on <http://www.geotrust.com/resources/root-certificates/>.

Everything went fine by following these basic steps:

1. Create `relay_password` in `/etc/postfix` and edit as `smtp.gmail.com login@gmail.com:password`, then `$ sudo postmap /etc/postfix/relay_password` to update Postfix lookup table.
2. Add the certificates in `/etc/postfix/certs`, or any folder you like, then `$ sudo c_rehash /etc/postfix/certs/` (i.e., rehash the certificates with Openssl).
3. Edit	`/etc/postfix/main.cf` so that it includes the following lines:

    ```
    relayhost = smtp.me.com:587
    smtp_sasl_auth_enable = yes
    smtp_sasl_password_maps = hash:/etc/postfix/relay_password
    smtp_sasl_security_options = noanonymous
    # tls
    smtp_tls_security_level = may
    smtp_tls_CApath = /etc/postfix/certs
    smtp_tls_session_cache_database = btree:/etc/postfix/smtp_scache
    smtp_tls_session_cache_timeout = 3600s
    smtp_tls_loglevel = 1
    tls_random_source = dev:/dev/urandom
    ```

4. Then, just reload the Postfix process, with e.g. `$ sudo postfix reload` (a combination of `start/stop` works too).

Now, we can test that everything is working properly:

```
$ echo "Test 123" | mail -s "Test" user`domain.com
```

Look into `/var/log/mail.log`, or better use `$ tail -f /var/log/mail.log` in a different window while you send your email. If you see something like what follows, then you succeeded:

```
Dec 15 16:44:30 aliquote postfix/smtp[20674]: setting up TLS connection to smtp.gmail.com[209.85.227.109]:587
Dec 15 16:44:30 aliquote postfix/smtp[20674]: Trusted TLS connection established to smtp.gmail.com[209.85.227.109]:587: TLSv1 with cipher RC4-MD5 (128/128 bits)
```

### Sidenote

You can choose a different port for the SMTP, e.g. 465. It's still possible to use [SASL](http://en.wikipedia.org/wiki/Simple_Authentication_and_Security_Layer) without [TLS](http://en.wikipedia.org/wiki/Transport_Layer_Security) (the above steps are basically the same), but in both case the main problem is that your login informations are available in a plan text file. Also, should you want to use your MobileMe account, just replace the Gmail SMTP server by `smtp.me.com`.
