---
title: "Dash App"
date: 2018-04-25T9:14:06+02:00
draft: false
tags: ["app", "review"]
categories: []
---

Next in the series of Mac applications, here is a brief review of a fantastic native browser for online and offline documentation: [Dash](various). It is available for iOS and OS X, with a [long relation with AppStore](https://blog.kapeli.com), and although you have to pay for it, it is worth the bill.

<!--more-->

> Dash gives your Mac instant offline access to 200+ API documentation sets.

In case you don't know what Dash is, I invite you to consult the [website](https://kapeli.com/dash) where you will find the list of supported languages. Not only the core languages that you can access via standard docsets, but also the extended packages available as user-contributed or 3rd party toolsets. You can even read [The Racket Guide](https://docs.racket-lang.org/guide/index.html) in Dash as shown below. (Actually, I read the entire manual this way.)

![](/img/2018-04-24-19-13-33.png)

I use Dash a lot for Scheme, Clojure and Javascript, even if I have extensive built-in documentation in Emacs via, e.g., [Cider](https://cider.readthedocs.io/en/latest/) in the case of Clojure. I know how to browse online documentation or offline HTML pages in an Emacs buffer (I use eww for that), but I find native app like Dash, with Dark mode eventually, to be really pleasant. In any case, if you are an Emacs user, there are also two other options: the [dash-at-point](https://github.com/stanaka/dash-at-point) package allows to lookup a keyword and open the corresponding help page in Dash app directly; [helm-dash](https://github.com/areina/helm-dash/) (or [counsel-dash](https://github.com/nathankot/counsel-dash) if you prefer Ivy, but this just a wrapper around helm-dash, so you still need Helm even if you don't use it) is a replacement for the application itself. The later let you download docset directly from Emacs. In this case, you need to take care to use a common folder for Emacs and Dash. Personally, I use the first option and I am quite happy with the settings.

Two functionalities are noteworthy:

1. It is possible to annotate any docset (you will need to create an account, though), bookmark page or record [code snippet](https://kapeli.com/dash_guide#introductionToSnippets) along the documentation. And, of course, you can share anything you read via standard Apple sharing options. Together with [Quiver](https://github.com/HappenApps/Quiver), you can write code, access documentation and write using literate programming very easily.
2. Custom docsets [can be built from various sources](https://kapeli.com/docsets) and added to the main panel. I should really take some time to build one for the [Common Lisp HyperSpec](http://www.lispworks.com/documentation/HyperSpec/Front/index.htm).

I should also note that there are some free alternatives, including the online [devdocs.io](https://devdocs.io) (it can work [offline](https://devdocs.io/offline) too) and an optional [Chrome plugin](https://chrome.google.com/webstore/detail/devdocs/mnfehgbmkapmjnhcnbodoamcioleeooe) or [zeal](https://zealdocs.org) (no Mac version).

{{% music %}}Joy Division • _Unknown Pleasures_{{% /music %}}
