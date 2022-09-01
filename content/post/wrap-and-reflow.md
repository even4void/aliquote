---
title: "On wrapping and reflowing text"
date: 2022-09-01T13:47:34+02:00
draft: false
tags: ["vim", "misc"]
categories: ["2022"]
---

I stopped hard wrapping my plain text documents a long time ago, when I was primarily using Emacs for all-things related to text. I believe soft wrapping is better, but when you really need hard wraps it is no longer a solution. We hardly know when things get soft- or hard-wrapped unless we have some indication about the formatting option in our Emacs or Vim statusline. For the latter, this is easy fixed as suggested on [ezyang’s blog].[^1] That's when you write for yourself, though.

Two things always bothered me. On the one hand, while it is easy to unwrap text in Emacs (or Vim), it is a pity to do that on more basic text editors (and, sometimes, even advanced ones). You can use awk, of course, but my colleagues on Windows won't understand why they would need to install yet another program for that very specific purpose. On the other hand, there's a netiquette and RFC 2022, which states:

> There are two limits that this standard places on the number of characters in a line. Each line of characters MUST be no more than 998 characters, and SHOULD be no more than 78 characters, excluding the CRLF.<br>
> The 998 character limit is due to limitations in many implementations which send, receive, or store Internet Message Format messages that simply cannot handle more than 998 characters on a line. Receiving implementations would do well to handle an arbitrarily large number of characters in a line for robustness sake. However, there are so many implementations which (in compliance with the transport requirements of [RFC2821]) do not accept messages containing more than 1000 character including the CR and LF per line, it is important for implementations not to create such messages.<br>
> The more conservative 78 character recommendation is to accommodate the many implementations of user interfaces that display these messages which may truncate, or disastrously wrap, the display of more than 78 characters per line, in spite of the fact that such implementations are non-conformant to the intent of this specification (and that of [RFC2821] if they actually cause information to be lost). Again, even though this limitation is put on messages, it is encumbant upon implementations which display messages.<br>

In other words, when writing emails, do hard-wrap your message (and don't put your signature on top when group-replying in a mailing-list!). The same applies to Git [commit messages], although we may wrap differently the header (or summary) and body of a commit message. Regarding the header line limiation, this is not an absolute rule and it is often not respected, as far as I can tell, especially when introducing Git leaders (feat, fix, docs or doc, etc.). I keep seeing people setting the number of max characters allowed on a line (`textwidth` in Vim parlance) below this limit, when composing email, probably to accomodate the quoted messages included in a group-reply. The OpenBSD even recommends [Plain text, 72 characters per line]. There's another Git-related justification for the 72 vs. 78 char limit.[^2]

The other option is to let the text "flow", which leads to using the [text-flowed] format. There's even an option for that in (Neo)mutt. However, there are some caveats with those conventions for ordinary emails in the 21th century: many mail readers, including Gmail[^3] or Outlook, don't honor this setting apparently. Here's how Gmail renders an email when we enforce a textwidth of 68 chars, despite asking for `text-flowed` content:

```
--8<--------
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
--8<--------
Hello,

I'm writing to myself to test my new Neovim settings for writing
mail according to the netiquette. This should end up being wrapped
correctly (but flowed for most mail reader, hopefully), with
signature at bottom to not bother people when group-replying.

--8<--------
```

That's lame. The header does indicate that the text should be reflowed.

This also seems to cause trouble with [quoted messages and on GitHub]. There's [one solution] to annoy those programs, but there may be a better alternative: don't hard wrap for casual emails, but enforce 72 chars max (or whatever) for group-reply, which is what I ended up doing recently. Since I don't know how to manage alternative settings in `ftplugin/mail.vim` depending on Neomutt reply action (`message-reply` or `group-reply`), I defined a shortcut to change the format options when I am writing to a list rather than a single person:

```vim
set spell spelllang=fr,en

set formatoptions+=wq

function! Reflow() abort
  setlocal tw=72 et colorcolumn=73
  setlocal list
endfunction

map <buffer> g= <Esc>:call Reflow()<CR>vipgq

iabbrev <buffer> =s --chl
```

Now, when I group-reply, whenever I press `g=` (this is a mapping I use for formatting in LSP as well) the text gets correctly hard-wrapped to the desired hard limit (72 chars).

Better looking email or not? To be honest, I don't really know since I quite like plain old good hard-wrapped text. But given that my editor and my terminal support so called wrap-margin, unlike Edward Z. Yang I do not mind writing long-lines as long as I know that I can soft- or hard-wrap them at any time withing a single key press.

{{% music %}}Jasmine Myra • _New Beginnings_{{% /music %}}

[^1]: I use a different setting and I only display `tw`, `cc` and `et`: `"[tw:%{&tw} %{&cc?'cc:&cc':''} %{&et?'»':''}] "`.
[^2]: On an 80 column terminal, if we subtract 4 columns for the indent on the left and 4 more for symmetry on the right, we’re left with 72 columns.
[^3]: I stopped writing email in Gmail UI so long time ago that I have vague memory that it was just plain crap, but see [Dear Google, please fix plain text emails in Gmail].

[ezyang’s blog]: http://blog.ezyang.com/2010/03/vim-textwidth/
[commit messages]: https://tbaggery.com/2008/04/19/a-note-about-git-commit-messages.html
[plain text, 72 characters per line]: https://www.openbsd.org/mail.html
[dear google, please fix plain text emails in gmail]: https://mathiasbynens.be/notes/gmail-plain-text
[quoted messages and on github]: https://nullprogram.com/blog/2017/06/15/
[text-flowed]: https://brianbuccola.com/line-breaks-in-mutt-and-vim/
[one solution]: https://vxlabs.com/2019/08/25/format-flowed-with-long-lines/
