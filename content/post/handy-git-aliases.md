---
title: "Some handy Git aliases"
date: 2021-06-18T19:09:36+02:00
draft: false
tags: ["unix"]
categories: ["2021"]
---
I use few aliases for Git in my terminal (this also works when using Vim [fugitive](https://github.com/tpope/vim-fugitive)). I thought I would share some of them here, but you will likely find more useful aliases in [Mathias Bynens](https://github.com/mathiasbynens/dotfiles/) dot files.

The following should naturally go under the `[alias]` section of your Git config fail (mine is located in `~/.config/git/config`).

- `l = log --pretty=format:'%<|(16)%C(yellow)%h  %Cblue%ad  %Creset%s%Cgreen  [%cn] %Cred%d' --decorate --date=short --graph`: This is a customized version of `git log` to pretty print the history with minimal information. It can be used to print only the latest 5 commits using `git l -n 5`.
- `d = "!f() { git diff --patch-with-stat HEAD~$1; }; git diff-index --quiet HEAD -- || clear; f"`: This is a specific diffing tool, whereby you indicate the number of past commits you want to diff against HEAD, e.g., `git d 3` will shows what has changed during the last 3 commits.
- `ca = !git add -A && git commit -av`: `git ca` will simply add all modified files and prompt for a commit message using your preferred editor.
- `bo = "!f() { git checkout -b \"$1\" 2> /dev/null || git checkout \"$1\"; }; f"`: Useful to switch to a branch or to create one if it doesn't exist yet. Be careful with typo, though.
- `amend = commit --amend --reuse-message=HEAD`: `git amend` will simply reuse the last commit message for newly staged files. I often use it when I forgot to stage a file or for minor fix on already staged and commited files.
- `fixup = "!f() { git rebase -i HEAD~$1; }; f"`: Rebasing made easy, since you just have to say `git fixup 3` to interactively rebase using the last 3 commits. I use it mostly for squashing commits together.
- `fc = "!f() { git log --pretty=format:'%C(yellow)%h  %Cblue%ad  %Creset%s%Cgreen  [%cn] %Cred%d' --decorate --date=short -S$1; }; f"`: Handy grep utility to look up for specific pattern in past commited core files.
- `fm = "!f() { git log --pretty=format:'%C(yellow)%h  %Cblue%ad  %Creset%s%Cgreen  [%cn] %Cred%d' --decorate --date=short --grep=$1; }; f"`: Same but for searching in commit messages instead of files. This is quite useful when you leave FIXME or WIP instructions in your commit messages.
- `cleanup = "!git branch --merged | grep -v '\\*' | xargs -n 1 git branch -d"`: Cleanup branches that ar eno longer needed because they are already merged into the trunk.
- `catchup = !git fetch upstream && git rebase upstream/$(git symbolic-ref --short HEAD)`: Fetch the latest changes from a repository you track in your remote and merge it with yours local copy, assuming it is the same branch as the one you are currently onto (be it a master/main or gh-pages branch).
- `unstage = reset HEAD` and `unmerge = reset --hard HEAD`: Well, you get it, everybody makes mistakes, especially when using Git.
- `here = !git init && git add . && git commit -m \"Init repo\"`: Shorthand to initialize a barebone repository in the current working directory.

Hope you'll find it useful! And many thanks to all the cool guys on Github from whom I stole several of these ideas.

{{% music %}}Allison Miller & Carmen Staaf • _Science Fair_{{% /music %}}
