---
title: "Hex and Base64"
date: 2020-02-27T15:21:54+01:00
draft: false
tags: ["racket"]
categories: ["2020"]
---

In one of the [cryptopals crypto challenges](https://cryptopals.com) ask, we are tasked with writing a simple converter from Hex-encoded string to their base64 representation.

Recall that to convert Hex ASCII code, also known as Base16, to text, you'll need to convert each hex byte to its decimal counterpart and get the corresponding character from any [ASCII table](https://www.ascii-code.com). For instance, the hex code "61" yields the value 97 (61<sub>16</sub> = 6•16<sup>1</sup> + 1•16<sup>0</sup> = 96 + 1) which corresponds to letter "a", while "6C" (6•16<sup>1</sup> + 12•16<sup>0</sup> = 96 + 12) yields the value 108 ("l"). For instance, "alice" is `61 6c 69 63 65`. Here is a toy example on how to go the other way around, from [byte to text](https://www.reddit.com/r/Racket/comments/s7prm/formatting_hexadecimal_numbers/c4cm9qv/):

```racket
(define (byte->string byte)
  (string-upcase
    (string-append
      (number->string (quotient byte 16) 16)
      (number->string (remainder byte 16) 16))))
(byte->string 97) ; => 61
(byte->string 108) ; => 6C
```

Note that this is also available in [file/sha1](https://docs.racket-lang.org/file/sha1b.html) module (see `bytes->hex-string`).

Once we get a raw string, we can use bytes to base64 converter from Python (`binascii.b2a_base64`, see also this [blog post](https://out-of-cheese-error.netlify.com/cryptopals-set-1)) or Racket (`base64-encode` from [net/base64](https://docs.racket-lang.org/net/base64.html)). How do conversion to base64 works in practice? Compared to Hex encoding, [Base64](https://en.wikipedia.org/wiki/Base64) considers the following character set:

    ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/

Based on the binary representation of the raw string, we will group all bits in block of 6 bits (because 2<sup>6</sup> = 64, so that all characters above can be represented using only 6 bits), with 0-padding for the last block in case there are less than 6 bits left. Then, for each block we find the corresponding decimal value. Here is a more detailed [overview](https://www.lifewire.com/base64-encoding-overview-1166412).

The test (hex) string, grouped by byte, reads:

    49 27 6d 20 6b 69 6c 6c 69 6e 67
    20 79 6f 75 72 20 62 72 61 69 6e
    20 6c 69 6b 65 20 61 20 70 6f 69
    73 6f 6e 6f 75 73 20 6d 75 73 68
    72 6f 6f 6d

When translated to a raw string, we get "I'm killing your brain like a poisonous mushroom". Now, to go from Hex to Base64, we just need an intermediate binary representation and apply the corresponding back transformation. Of course, if you have a Linux or Mac terminal, you can easily check the above result:

    $ echo "I'm killing your brain like a poisonous mushroom" | base64
    SSdtIGtpbGxpbmcgeW91ciBicmFpbiBsaWtlIGEgcG9pc29ub3VzIG11c2hyb29tCg==

Here is a solution in Racket:

```racket
(require net/sha1)
(require net/base64)
(define s "49276d206b696c6c696e6720796f757220627261696e206c696b65206120706f69736f6e6f7573206d757368726f6f6d")
(base64-encode (hex-string->bytes s))
```
