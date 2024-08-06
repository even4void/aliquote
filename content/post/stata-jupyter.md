---
title: "Stata, Emacs and Jupyter"
date: 2020-03-31T16:59:18+02:00
draft: false
tags: ["emacs", "stata"]
categories: ["2020"]
---

Emacs is such a piece of artwork when it comes to interacting with live buffers that it is hard to beat. I've stopped using RStudio a while back now, and to be honest I only used it for teaching purpose. I have been relying on [ESS](https://ess.r-project.org) for the last 15 years now, and I even learned that it is possible to [connect to a remote server](https://www.dcalacci.net/2018/remote-ess/) running, e.g., R. You can also [run code on remote ipython kernels](https://vxlabs.com/2017/11/30/run-code-on-remote-ipython-kernels-with-emacs-and-orgmode/) with Emacs and orgmode. My only regret here is that they dropped support for [LispStat](http://homepage.divms.uiowa.edu/~luke/xls/xlsinfo/xlsinfo.html) at some point. That being said, I will rather be talking about Emacs and Stata in this post.

Usually I edit my do files in Emacs because the Stata built-in editor is just so weird and useless that only the auto-correction mode of TextEdit makes the latter even worse for editing do/ado files. The best thing I've seen in a while is [Atom and the Hydrogen package](/post/atom-stata/), that allows to use Jupyter kernels in the background. Here is what is possible using Emacs instead of Atom.

Of course, Emacs works very well with Stata files. You have two options there for Stata files: [ESS](https://ess.r-project.org) or the [ado-mode](https://github.com/louabill/ado-mode) package, written by Bill Rising. With ESS, all you have to do is to specify the program you want to use, in case you have different versions of Stata installed on your OS, or simply to be sure that everything is working when weaving Stata block in Org Babel. The variable to customize is `inferior-STA-program-name` (formerly `inferior-STA-program`), and you can pass additional parameters to the main program with `inferior-STA-start-args`. A typical example would be to add the flag `-q` to suppress the initialization messages. (The same flag is available for R, and I use this alias in Fish: `alias R 'R -q --no-save --no-restore`.)

In my experience, the Stata module in ESS is not as advanced as its R counterpart. It lacks syntax highlighting ("font-locking") for a lot of built-in commands, for instance. This is easily fixed using Bill Rising's `ado-mode`, which is greater for highlighting Stata, whether command are written in full or abbreviated. The [ado-font-lock.el](https://github.com/louabill/ado-mode/blob/master/lisp/ado-font-lock.el) is just under 10,000 LOC but it is worth a look if you want to know how many commands --- and their 1 to 5 abbreviations --- are available in Stata. However, this package is intended to be used as a frontend to a running GUI version of Stata in the background. So, you are not sending commands to an Emacs buffer with a live REPL, rather you're automagically executing do files in your Stata program. That may be convenient or not, depending on how you like to interact with Stata. Personally, I don't really need the GUI version of Stata (except when I was showcasing to students or when I need to display data into a spreadsheet-like browser that others understand), and this is why I prefer ESS in general. The same applies for R or Python.

[Jupyter](https://jupyter.org) is another piece of artwork, IMHO. However, I only use it in a Terminal as I don't really like the HTML notebook experience. There are a lot of kernels available to download or install from Python directly. Here is what I have on my machine: (Some kernels are probably outdated as this was for testing purpose only.)

```shell
$ jupyter kernelspec list
Available kernels:
  clojure                        /Users/chl/Library/Jupyter/kernels/clojure
  coffeescript                   /Users/chl/Library/Jupyter/kernels/coffeescript
  ir                             /Users/chl/Library/Jupyter/kernels/ir
  racket                         /Users/chl/Library/Jupyter/kernels/racket
  stata                          /Users/chl/Library/Jupyter/kernels/stata
  jupyter-swift-kernel-master    /usr/local/share/jupyter/kernels/jupyter-swift-kernel-master
  python2                        /usr/local/share/jupyter/kernels/python2
  python3                        /usr/local/share/jupyter/kernels/python3

```

That being said, the usual thing to do is to run Jupyter in your preferred terminal, like we did for years with IPython (which still works fine by the way), using, e.g., `jupyter console` (which is equivalent to `jupyter-console)` or `jupyter qtconsole` if you want a more capable console, which allows among other things to display graphics inside the terminal. You can specify a different kernel using `jupyter console --kernel stata` (or `--kernel ir` for [R](https://irkernel.github.io/running/)), provided you installed the [Stata kernel](https://kylebarron.dev/stata_kernel/). Here is a little illustration when a Qt console is launched as `jupyter qtconsole --kernel stata --no-banner`:

{{< figure src="/img/2020-04-01-10-06-49.png" >}}

Autocompletion is available for some optional command arguments, which is pretty nice, as shown on the left in the above screenshots. There are also some ["magic" commands](https://kylebarron.dev/stata_kernel/using_stata_kernel/magics/) (e.g., `%help` or `%locals`), but not everything is actually working in the QT console. Of note, you will need Stata 14+ to display graphics in the QT console as there's no PNG or SVG backend in earlier versions of Stata.

Regarding Jupyter in standard console mode, you don't really need a colorized prompt, so let's go for a [simple prompt](https://github.com/jupyter/jupyter_console/issues/156).[^1] In the end, our incanting command should look like this:

```shell
$ jupyter console --simple-prompt --kernel stata
```

To use Jupyter as a backend in ESS, you just need to customize the variables mentioned above, either in your init file or directly in an iELM buffer:

```emacs-lisp
ELISP> (setq inferior-STA-start-args "--simple-prompt --kernel=stata")
"--simple-prompt --kernel=stata"
ELISP> (setq inferior-STA-program-name "/usr/local/bin/jupyter-console")
"/usr/local/bin/jupyter-console"
```

And that's almost all you have to do! Now, when you `C-c C-c` on a line or block of lines, this will be sent as usual to the REPL attached to your session, except that it will be a Jupyter kernel:

{{< figure src="/img/2020-03-31-19-49-22.png" >}}

Finally, I should note that there's also a [Jupyter mode](https://github.com/dzop/emacs-jupyter) for Emacs (and [another one](https://github.com/tmurph/jupyter-mode)) that can be used as a replacement for the above two approaches. The idea is just to connect to a Jupyter server using a specific kernel, and then send whatever command you want to this running instance of Jupyter. Again, in my experience, it works (more or less) but I found it easier to rely on ESS alone.

[^1]: For IPython, it is easy to customize the whole stuff; in particular, in `~/.ipython/profile_default/ipython_config.py`, you can change the default values for `Token.Prompt`, `Token.PromptNum`, `Token.OutPrompt` and `Token.OutPromptNum`, as well as some other settings.
