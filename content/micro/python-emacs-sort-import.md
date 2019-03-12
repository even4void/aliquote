---
title: "Python and Emacs sort imports"
date: 2019-03-11T19:38:00+01:00
draft: false
type: "tweet"
---

TIL. There's a nice option when you edit Python code under Emacs which consists in sorting automagically all `import` statement. In most cases, it works great, however there are some edge cases. E.g., it is common in Flask applications to have `import` defined after initializing the app itself, because of cicular imports. Hopefully, it is possible to override the default settings and to add a local directory variable, as recommended on Spacemacs website (`SPC f v d`). `#emacs`
