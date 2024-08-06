---
title: "Typora"
date: 2019-11-07T14:56:45+01:00
draft: false
tags: ["app"]
categories: ["2019"]
---

It's been a long time since I have tested new applications for basic Markdown editing. Last time was probably Texts, one or two years ago, and more recently [Caret Beta](https://caret.io), which I [didn't like](/micro/2019-11-06-11-31-34/) at all. Likewise, I am not a big fan of [iA Writer](https://ia.net/writer), despite all the good things I've heard over time, nor of [Byword](https://bywordapp.com). I really love the design and UI of [Bear](https://bear.app), but I'm not looking for a complete note taking application, just a slick Markdown editor.

Let's take a closer look at [Typora](https://typora.io) instead.

I think I first heard of this app on one of Jack Baty's weblogs, but to be honest I just see a list of [several Markdown Apps](https://www.bettertechtips.com/mac/markdown-editor-mac/) a few days ago and tried the only one I didn't know for sure. I should note that my needs are very limited: I just need to be able to write plain text in a minimalist application, for the rare case where I am not writing in Emacs --- this happens very rarely, for Emacs has a very nice [Markdown mode](https://jblevins.org/projects/markdown-mode/), which far surpasses all the features I have encountered in various applications over time.

My first impression was that the UI is very clean, minimalist, and so much well thought: you get all the space for writing, with no status or menu bar, or even side bar full of icons for sharing, exporting, and the like. Take a look by yourselves:

{{< figure src="/img/2019-11-07-15-10-04.png" >}}

Other features I found very handy in Typora:

- Typora does not require an external previewer, since you get a live preview as you type. It's sort of a WYSIWYG, but way better than well-known commercial products.

- The conceal mode is really great, and far better that what I used to have when writing in Vim. Any hyperlinks remains editable as a plain Markdown link when your cursor is on it, but there's also a shortcut to insert inline links (<kbd>⌘K</kbd>) or named links (<kbd>⌥⌘L</kbd>). Moreover, you can select any word and enclose it using square bracket, parenthesis or whatever, and, of course, HTML tags are completed as soon as you start typing the closing tag `</`. The inline code is really pleasantly displayed as well.

- Although this is a distraction free UI, it does not mean you haven't access to extra functionalities. Outside the forty or so commands available in the menu bar, there's a small area that you can fly over in the top right corner of the application that gives you access to basic statistics (number of words or characters, estimated reading time), a table of contents and a project sidebar. The later provides a list or tree view of all the files in the current working directory, and again if your mouse hover the bottom of the sidebar, you get an additional actions menu.

     ![](/img/2019-11-07-15-32-46.png)

- What used to be annoying in a plain text editor (TextEdit in my case) or even Emacs is when you are in a middle of a list of items and you want to insert an image or a short quote: you'll have to add extra whitespace to get them at the right level of indentation. There is no need for that in Typora since it will keep the right level of indentation after a carriage return provided you delete the newly created bullet point.
- Note that images are displayed as is (i.e., sort of a conceal mode, but for images) if they can be found by Typora. Broken images --- or is my case, images with relative links that cannot be resolved before the site is published --- remain displayed using Markdown syntax.

Overall, this is the best application for Markdown editing I have been using so far. This is just a beta version, and while in beta it's free, so go take a look if feel so inclined.
