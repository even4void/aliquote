---
title: "Finding and tagging annotated PDF files"
date: 2019-03-17T17:18:13+01:00
draft: false
tags: ["apple"]
categories: []
---
I have never been a big fond of AppleScript or Automator, even if I may have a few scripts lurking around there, notably one that takes care of migrating all the screenshots I take from my Desktop to the "Pictures" folder, after they got renamed following a more usable convention (`yyyy-mm-dd-hh-mm-ss.png`). 

<!--more-->

Now I believe I really suck at using Automator for good since I wasn't able to build a simple script to automagically tag all PDF files that contain annotation (specifically, text highlight) in a specific folder. And so, here is my trying to get the work done using a Terminal instead.

The rationale is as follows: I keep all my PDF files in a dedicated folder, with an associated BibTeX file as well as an org file, `papers.org` where I put some notes using Emacs, mostly as [described here](/post/notes-taking-workflow/). Usually, I add a dedicated tag to each PDF file for which there exists some king of note in my org file. Thoses notes may be just links or snippets of code, or even single quotes, and they are not as rich as I would like them to be (think of [Reading for Programmers](https://codearsonist.com/reading-for-programmers)). The process is cumbersome since I have to review my latest additions and tag the files accordingly, and I would like to automate this process. Moreover, I need a way to adapt this workflow to also handle those papers where I only highlight some pieces of text without even storing anything in my org file. Ideally, I would like all PDF file to be tagged with a yellow sticker when they include some highlighted text, and I guess I can easily manage the rest of the process (auto-tagging the papers reviewed in my org file) from Emacs directly. 

Using Automator, I was able to query one or more PDF files to get the annotations, but I failed at using the results to tag the corresponding files. However, I know that we can exploit the file metadata, especially extended attributes like tags, directly from a shell using, e.g. `mdls` or `mdutil`. That's why `mdfind` is way better than `locate`, because it can use all kind of metadata and much more, see, e.g., *Learning Unix for OS X*, by Dave Taylor ([reviewed](/post/learning-unix-for-os-x/) by yours truly). In the case of tag-relate search, `mdfind "kMDItemUserTags == Red"` will return all files matching a red tag. 

By the way, a convenient function to add to your bash or zsh profile to always use the right tool is given below:

```zsh
function locate { mdfind "kMDItemDisplayName == '$@'wc"; }
```

When you highlight some text in Preview, this type of annotation is recorded using the keyword `/Highlight` in the PDF file. It is then easy to look for such pattern using simple command-line instructions. Here is a little test in a temporary directory full of PDFs and other files that I will have to sort out one day:

```shell
Trash  for f in *.pdf
do
  if strings $f | grep /Highlight &>/dev/null; then
    echo "$f has note" ① 
  fi
done
```

So far, so good. We just need a way to tag all hits using a custom badge, yellow in this case. Some [hand-on](https://stackoverflow.com/questions/2435580/tagging-files-with-colors-in-os-x-finder-from-shell-scripts) [solutions](https://stackoverflow.com/questions/19720376/how-can-i-add-os-x-tags-to-files-programmatically) were proposed on SO, and one can also find some [command-line utility](https://github.com/jdberry/tag) (available on Homebrew) as well. I want to avoid Python or AppleScript as far as possible, so here is a quick one-liner instead, which would obviously be inserted in place of ① above:

```shell
Trash  xattr -w com.apple.metadata:_kMDItemUserTags '<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd"><plist version="1.0"><array><string>Notes</string></array></plist>' 377.pdf
```

This assumes that you already defined the tag and its color (yellow, remember?). The key lies in using `xattr` of course, which happens to be way more complicated than I initially thought due to the fact that we need to pass a complete XML Plist, but hopefully this was all simplified when I read [Brett Terpstra](https://brettterpstra.com/2017/08/22/tagging-files-from-the-command-line/)'s post on the very same topic:

> (...) I sometimes implement more “down and dirty” techniques in scripts.

So do I, but less effectively, apparently.
