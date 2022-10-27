---
title: "Quick Bash script templates"
date: 2022-09-12T10:44:58+02:00
draft: false
tags: ["unix"]
categories: ["2022"]
---

Over the years, I wrote a lot of little helper Bash scripts to automate things on macOS or Ubuntu. Most of the times it was simply a matter of putting a series of variables and commands, some `echo` and the like, after a shebang line. In the end, this was messy but it worked as intended.

Here are two templates that may simplify the process of writing small shell scripts. They both share the same principles: the use of "subcommand" and the display of a short help message in case argument `$1` is empty (since there seems to be so much a lack of convention that I never remember if we need to pass `help`, `--help` or `-help` after program name to get some help).

The first template is minimalist. There's no error checking, and it is assumed that instructions can be grouped logically into independent main options like this:

```shell
#!/usr/bin/env bash

case "$1" in
fizz)
	echo -e "\033[0;32m[+] Process first option\033[0m"
	;;
buzz)
	echo -e "\033[0;32m[+] Do some banana\033[0m"
	;;
help)
	echo -e "Usage: $0 {fizz|buzz}"
	;;
*)
	echo -e "Usage: $0 {fizz|buzz}"
	;;
esac
```

As can be seen, this is pretty basic stuff, and everything is handled via the first argument to the shell script (recall that `$0` is the program name, `$1` its first argument, etc.). Of course, feel free to add all sort of guards (`set -e`, `set -u`, `set -o pipefail`) at the top of your script. My default Vim template for shell scripts include most of them, and I delete unnecessary ones depending on my needs.

{{% alert note %}}
<small>[2022-10-27]</small><br>
See also [Shell Script Best Practices](https://sharats.me/posts/shell-script-best-practices/) to learn a lot more tips and tricks. It also features a nice Bash template.
{{% /alert %}}

The second template is a little more involved as it exemplifies the use of proper subcommands, as in Hugo or Git for instance. The following script is a real script that I use to update a changelog with Git revisions in specific Git repositories on my hard drive (my website and all Git projects that are in the same directory, `$HOME/cwd`). Here's the gist of it:

```shell
#!/usr/bin/env bash

whos=$(basename "$0")
tmpdir="$HOME"/tmp

_help() {
    echo "Usage: $whos <subcommand> [options]"
    echo "Subcommands:"
    echo "    update   Update log entries"
    echo "    show     Show log entries"
    echo ""
    echo "For help with each subcommand run:"
    echo "$whos <subcommand> -h|--help"
    echo ""
}

_update() {
    cd "$HOME"/Sites/aliquote || return
    git log --author=chl --pretty=format:"* %as %an <%ae> - [${PWD/*\//}/%h] %s" >"$tmpdir"/home-chl-sites-aliquote.log

    for d in $(find "$HOME"/cwd -maxdepth 1 -type d ! -name "cwd"); do
        WD=${d##*/}
        if [[ -d "$HOME/cwd/$WD/.git" ]]; then
            cd "$HOME"/cwd/"$WD" || return
            git log --author=chl --pretty=format:"* %as %an <%ae> - [${WD}/%h] %s" >"$tmpdir"/home-chl-cwd-"$WD".log
        fi
    done

    cat "$tmpdir"/home-chl-*.log >"$tmpdir"/logger
    sort -k2 -r "$tmpdir"/logger >"$HOME"/Documents/logs/changelog
    rm "$tmpdir"/home-chl-*.log "$tmpdir"/logger
}

_show() {
    less "$HOME"/Documents/logs/changelog | rg "[0-9]+-[0-9]+-[0-9]+"
}

subcommand=$1
case $subcommand in
"" | "-h" | "--help")
    _help
    ;;
*)
    shift
    _${subcommand} "$@"
    if [ $? = 127 ]; then
        echo "Error: '$subcommand' is not a known subcommand." >&2
        echo "       Run '$whos --help' for a list of known subcommands." >&2
        exit 1
    fi
    ;;
esac
```

In this case, each subcommand is implemented as its own function, and they are processed at the command line using a simple variable interpolation. If you need more flexibility to handle your subcommand, I think this is better suited than the preceding sample script. I came across a similar approach in a Gist a while ago but I forgot to bookmark it and I can't credit the author unfortunately.

{{% music %}}Gilad Hekselman • _Flower_{{% /music %}}
