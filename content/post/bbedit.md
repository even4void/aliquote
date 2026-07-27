---
title: "BBEdit on steroids"
date: 2026-07-26T22:49:52+02:00
draft: false
tags: ["app", "apple"]
categories: ["2026"]
---

It was a long time since I last used [BBEdit][1]. I don't remember exactly when
it was, but it was before I get fully into Vim and then Neovim. It's funny
because this wonderful text editor reminds me of [Textmate][2], but I was not
aware of BBEdit at that time despite the fact that it is a native macOS app,
that really fits the macOS design (more than some other Apple apps).

Recent versions of BBEdit got LSP support, a project drawer, a note toolkit, and
many other additions.

> BBEdit is the leading professional HTML and text editor for macOS. This
> award-winning product has been crafted to serve the needs of writers, Web
> authors and software developers, and provides an abundance of features for
> editing, searching, and manipulation of prose, source code, and textual data.

It really is more than capable at editing source code other than markup
languages like HTML or XML. Text filters and the regex playground are delightful
additions. The fact that you can feed some text or a whole buffer to shell
scripts of yours is really what makes this editor appealing, as was the case
with Textmate. You get a reliable and snappy editor and you tweak your text with
Unix tools and custom pipelines. See this [blog post][3] for a more thorough and
educated review.

LSP support is okay, I mean you get go to definition and references, sometimes
code action (e.g., Rust), but no hover information or inlay hints. Hover
information is provided by external providers (Google search or Dash if
installed). Again, this is fine if you're looking for a text editor, and not a
fully fledged IDE. Plus, my Neovim setup provides all of this for me already. I
should note that it is quite easy to add new LSP servers (some are configured by
default) if they are already available on your HD, and it works flawlessly once
configured in the Preferences pane.

What you really get, however, is a truly macOS app, which includes the "share"
functionality, access to common macOS utilities (dictionary, address book, and
so on), and all the default keybindings you are used to -- except that I use the
Vi emulation mode instead of the default Emacs ones. I would say that, compared
to Zed, you get a reliable and fast text editor with perfect text rendering
which perfectly integrates into the macOS ecosystem. This is not to say that Zed
is bad; to be honest, this is the first text editor I've seen in the last 15
years that provides so many bounties while feeling so native to the OS. The
developers have taken such care over every detail that it's frustrating to think
that far less satisfactory alternatives are being used instead. But Zed focus on
collaborative programming and agentic coding, and I'm not into that.

I should note that BBEdit also includes some AI capabilities, in the form of a
dedicated worksheet to interact with ChatGPT, Claude or Ollama. Again, I'm not
interested in AI chat or assistive coding, for many reasons. Above all, I prefer
my 100% human stupidity, to quote someone's else sayings,[^1] and coding
haphazardly sometimes. Drew Devault has [some thoughts][5] about the use of
generative AI in software development, like Brian "Beej" Hall does, but go read
[On Making][6]. Honorable mention to Bozhidar Batsov as well (see [Emacs and Vim
in the Age of AI][7]). Anyway, this post is not about AI.

All that to say that BBEdit looks like a well-crafted product, which has proven
its worth over the last 30 years, and I'm proud to support the work of a
developer who cares about their users so much. When you think about it, it's
fascinating to successfully adapt such a piece of artwork to the successive
versions of OS X and macOS.

[1]: https://www.barebones.com/products/bbedit/
[2]: /post/textmate2
[3]: https://jpawel.com/posts/why-bbedit-is-my-text-editor-of-choice.html
[4]: https://www.barebones.com/support/technotes/AIWorksheetModels.html
[5]: https://drewdevault.com/blog/Forking-vim/
[6]: https://beej.us/blog/data/ai-making/
[7]: https://batsov.com/articles/2026/03/09/emacs-and-vim-in-the-age-of-ai/

[^1]: I've lost the reference unfortunately.

{{% music %}}Camper Van Beethoven • *Think About Me*{{% /music %}}
