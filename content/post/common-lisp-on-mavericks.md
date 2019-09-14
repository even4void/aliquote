+++
title = "Common Lisp on Mavericks"
date = 2014-08-04T11:08:05+01:00
draft = false
tags = ["lisp", "apple"]
categories = ["2014"]
+++

Here are some notes I took when setting up Emacs to run [SBCL](http://www.sbcl.org) on a fresh Macbook Pro powered by Homebrew.

I was surprised to find no Info page for `sbcl`, and after looking for what was installed by Homebrew under `/usr/local`[^1], I just found the man page:

```
% ls /usr/local/Cellar/sbcl/1.2.1/share/man/man1
sbcl.1
```

So I decided to download SBCL from its homepage, <http://www.sbcl.org>, and compile it myself as I did on my previous Mac. This is rather simple and I just followed the instructions given in the `INSTALL` file. This took less than 4' on my new laptop:

```
% git clone git://git.code.sf.net/p/sbcl/sbcl
% sh make.sh --fancy --prefix=/Users/chl/local/sbcl
% push doc/manual && make && popd
% sh install.sh
```

And now I have Info files and the PDF manual:

```
% tree -L 3 .
.
├── bin
│   └── sbcl
├── lib
│   └── sbcl
│       ├── contrib
│       ├── sbcl.core
│       └── site-systems
└── share
    ├── doc
    │   └── sbcl
    ├── info
    │   ├── asdf.info
    │   ├── dir
    │   ├── sbcl.info
    │   ├── sbcl.info-1
    │   └── sbcl.info-2
    └── man
        └── man1

11 directories, 7 files
```

These Info files can easily be moved to `/usr/local/share/info` and added with a command like `install-info /usr/local/share/info/sbcl* /usr/local/share/info/dir`.


When I tried to install the [gsll](http://common-lisp.net/project/gsll) library using [Quicklisp](http://www.quicklisp.org), all dependencies compiled fine except `gsll` itself. Indeed, it complains about missing `libgsl` but this was only because it was looking at the wrong place

```
debugger invoked on a LOAD-FOREIGN-LIBRARY-ERROR in thread
#<THREAD "main thread" RUNNING {1002C3E7C3}>:
  Unable to load foreign library (LIBGSLCBLAS).
  Error opening shared object "/usr/local/Cellar/gsl/1.16/libgslcblas.dylib":
  dlopen(/usr/local/Cellar/gsl/1.16/libgslcblas.dylib, 10): image not found.
```

Homebrew installed header files under `gsl/1.16/include` and dynamic libraries under `gsl/1.16/lib`, but Quicklisp was looking at the root directory. This is something regrettable because it would be easy to look into `/usr/local/lib` directly because `libgsl*` files are symlinked there, although `gsl-config --prefix` actually returns `/usr/local/Cellar/gsl/1.16`. Anyway, following [some good advice](http://permalink.gmane.org/gmane.lisp.gsll/292), I was able to quickly fix the broken path by editing the file `init.el` located in gsll (`quicklisp/dists/quicklisp/software/gsll-20140211-git/init/`).

```lisp
(defun gsl-config-pathname (pn)
    ;; small patch to correct incorrect libgsl location with Homebrew
    (flet ((libpath ()
        (let ((s (gsl-config "--libs-without-cblas")))
            (pathname (format nil "~a/" (subseq s 2 (- (length s) 6)))))))
    (merge-pathnames pn (libpath)))))
```

The basic SBCL prompt is poorly functional, and it does not even include readline support. It is possible to get a more fancy REPL using the [following instructions](http://articulate-lisp.com/env:sbcl-setup.html):

```lisp
(progn
 (ql:quickload :linedit)
 (require :sb-aclrepl)
 (require :linedit)
 (funcall (intern "INSTALL-REPL" :linedit) :wrap-current t))
```

To make these changes permanent, the above series of instructions can be added to the init file, `~/.sbclrc`. Note that this won't play nice if you run SBCL through Slime in Emacs.

Other than what is listed on CL [plotting](http://cliki.net/plotting) or [graphics](http://www.cliki.net/graphics%20library) libraries, in particular [cl-plplot](http://common-lisp.net/project/cl-plplot/), I am still looking for a good plotting library. So far, I have found the following packages: [plot-window](https://github.com/bhyde/plot-window), and [gnuplotcl](https://github.com/maccallum/gnuplotcl).

So, there's not much to see, apparently. Most of the packages with a Gnuplot backend that I've seen so far are composed of few functions allowing to send commands to gnuplot in the background. No real comparison to Clojure [quil](https://github.com/quil/quil), [Incanter](http://incanter.org), or [LispStats](https://github.com/blindglobe/common-lisp-stat) (see below). I briefly tested `gnuplotcl` and it worked like a charm. This is an ASDF package so we have to customize our SBCL init file a bit by adding something like

```lisp
(pushnew '(merge-pathnames ".asdf/systems/"
           (user-homedir-pathname))
         asdf:*central-registry*
         :test #'equal)
(require 'asdf)
```

There is also some bindings to the R software, and I found that [rcl](http://common-lisp.net/project/rcl/) works pretty well. It is "quickloadable" and it allows to use R graphic system without much pain; see some [examples](http://common-lisp.net/project/rcl/examples.html).

![linedit](/img/2014-08-04-08-32-16.png)

It would be interesting to write something on top of [vecto](http://www.xach.com/lisp/vecto/) since it seems like a promising package, and it is currently maintained by the author of Quicklisp himself.

## Common Lisp Statistics

I am aware of [Common Lisp Statistics](https://github.com/blindglobe/common-lisp-stat) project. Last time I tried to install it, this was really a mess but I think I get to the point of being able to run most of the examples. Interestingly, it seems that it has been updated recently following [StatComp 2014](http://sysbio.uni-ulm.de/ocs/index.php/statcomp/statcomp14) (see <i class="fa fa-file-code-o fa-1x"></i> [example](https://github.com/blindglobe/common-lisp-stat/blob/master/examples/020-dataframeBuilding.lisp) and <i class="fa fa-file-code-o fa-1x"></i> [talk](https://github.com/blindglobe/common-lisp-stat/blob/master/Doc/talks/Rossini-Reisensburg-2014-StatComp.tex)). Anyway, I happened to install this quite easily by following the instructions found on GitHub:

    % cd ~/quicklisp/local-projects
    % git clone git://github.com/blindglobe/common-lisp-stat.git
    % git clone git://github.com/blindglobe/lisp-matrix.git
    % sbcl
    * (ql:register-local-projects)
    * (ql:quickload :antik)
    * (ql:quickload :cls)

Now, I just have to figure out how to run the examples again...

![Lispstat](/img/2014-08-04-13-48-10.png)


[^1]: Please note that if the `sbt` plugin is enabled via the `oh-my-zsh` shell manager, `sbcl` is in fact aliased to `sbt clean`.

