+++
title = "IPython 0.11, the new killer app"
date = 2011-08-01T21:21:45+01:00
draft = false

tags = ["python"]
categories = []

[header]
image = ""
caption = ""
preview = true

+++

[IPython](http://ipython.org/) 0.11 has just been released. It's amazing how many new features are now available in this Python "comprehensive environment for interactive and exploratory computing".

## Installing on Mac OS X Lion

The installation of IPython is simple if you use `easy_install`. However, to benefit from the new `qtconsole`, you'll need to have a working Qt framework and install either PyQt4 or PySide, as documented [here](http://stronginference.com/weblog/2011/7/15/innovations-in-ipython.html). Only the latter worked for me, at the moment. Of course, we also need to install the Qt SDK. This is quite straightforward as OS X packages are available from Nokia [download page](http://qt.nokia.com/downloads/). Be aware that the compilation is rather long (about 30' on my Macbook air 2010).

Here is how I did for the Python part:

```
$ sudo easy_install readline
$ sudo easy_install ipython
$ sudo easy_install pyzmq
```

Instead of building PySide myself, I donwloaded a package from [here](http://pyside.markus-ullmann.de/) (`pyside-1.0.5-qt47-py27apple.pkg`). We need to tell OS X where to find the Qt framework. I added the following line in my `.profile`:

```
export DYLD_FRAMEWORK_PATH="/Developer/QtSDK/Desktop/Qt/473/gcc/lib:${DYLD_FRAMEWORK_PATH}"
```

Note that it is `DYLD_FRAMEWORK_PATH`, and not `DYLD_LIBRARY_PATH`. 

Then, we can test that everything is working by trying

```
$ ipython qtconsole --pylab=inline
```

## What's new in IPython 0.11

No need to tell a long story because everything has been nicely summarized on Chris Fonnesbeck's nice post: [Innovations in iPython](http://stronginference.com/weblog/2011/7/15/innovations-in-ipython.html) <i class="fa fa-chain-broken fa-1x"></i>. However, just for the record, here are some of the new features:

- There is now a Qt console that allows to display [Matplotlib ](http://matplotlib.sourceforge.net/) figures directly inside the console, like in Mathematica, with copy/paste and export option. Also, the whole content of the console can be exported as HTML or XML and diplayed directly in the browser.
- Multiple instances of Python can be instantiated by IPython depending on the number of available cores on the machine.
- There's a `%run magic` command taht allows to run any python script and load all of its data directly into the interactive namespace. Take a look at the example provided by Chris Fonnesbeck: He is actually loading a Python script saved as a gist on Github.
- IPython is now able to strip input prompts (`>>>` and `...`).
- And a lot more ...


I didn't check whether the Emacs package was updated or not (I don't think so), but I know there's a [VIM plugin](http://pirsquared.org/blog/2011/07/28/vim-ipython/) now. I have to check how my old [ipython.el](http://ipython.scipy.org/dist/ipython.el) <i class="fa fa-chain-broken fa-1x"></i> is working with this new version of IPython.

## Sidenote

In order to build PyQt4, I grabbed the `PyQt-mac-gpl-4.8.4.tar.gz` archive from Riverbank [download page](http://www.riverbankcomputing.co.uk/software/pyqt/download). We also need [SIP](http://www.riverbankcomputing.co.uk/software/sip/download).

Then, I used the following commands.
For SIP,

```
$ python configure.py -d /Library/Python/2.7/site-packages/
$ make 
$ sudo make install
```

For PyQt,

```
$ python configure.py -k -d /Library/Python/2.7/site-packages/
$ make 
$ sudo make install
```

I got a lot of warnings sayung that Lion was currently not supported during the compilation.
