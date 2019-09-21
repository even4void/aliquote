---
title: "Python for interactive scientific data visualization"
date: 2013-05-15T11:17:42+01:00
draft: false
tags: ["python", "dataviz"]
categories: ["2013"]
---

Some random notes on my recent 'pythonic peregrinations' on my Airbook.

Python packages management is really painful. My `/Library/Python/2.7/site-packages` is just a mess. This is probably due in part to the fact that I switched from `easy_install` to `pip` two years ago, but anyway there's a lot of useless stuff in there.

![Python site-packages](/img/20130413214446.png)

I heard about [Bokeh](https://github.com/ContinuumIO/Bokeh), a new plotting library for Python. Basically, it ought to embed Wilkinson's Grammar of Graphics into the [d3js](http://d3js.org) framework. It is maintained by the same guys from Continuum Analytics who develop [Blaze](http://blaze.pydata.org) and [Anaconda](https://store.continuum.io/cshop/anaconda). In contrast to Enthought EPD,[^1] it is

> completely free enterprise-ready Python distribution for large-scale data processing, predictive analytics, and scientific computing.


## Anaconda

I followed the instructions to install Anaconda, and it is quite simple actually: You just have to `sh Anaconda-*.sh` and you should end up with something like:

```
installing: anaconda-1.4.0-np17py27_0 ...
Python 2.7.3 :: Continuum Analytics, Inc.
creating default environment...
installation finished.

You may wish to edit your .bashrc or prepend the Anaconda install location:

% export PATH=/Users/chl/anaconda/bin:$PATH

Thank you for installing Anaconda!

WARNING:
    You current have a PYTHONPATH environment variable set. This may cause
    unexpected behavior when running the Python interpreter in Anaconda.
    For best results, please verify that your PYTHONPATH only points to
    directories of packages that are compatible with the Python interpreter
    in Anaconda: /Users/chl/anaconda
```

Anaconda supports multiple versions of Python to live on your system, and it provides a virtual environment that allow to switch to different version of the same package without much difficulty. Package management is done via `conda`, a command-line utility that is used to fetch one or more specific versions of a package, display information on the system or environment locations, etc.

```
% conda search --all numpy
12 matches found:

Packages with available versions and build strings:

numpy                     1.5.1                    py26_0
                          1.5.1                    py27_0
                          1.6.2                    py26_0
                          1.6.2                    py27_0
                          1.7.0b2                  py26_0
                          1.7.0b2                  py27_0
                          1.7.0rc1                 py27_0
                          1.7.0rc1                 py33_0
                          1.7.0rc1                 py26_0
                          1.7.0                    py26_0
                          1.7.0                    py33_0
                          1.7.0                    py27_0
```

As can be seen, there is a version of `numpy 2.7` for Python 3. I haven't explore the full capabilities of this distribution, but at first sight it sounds more interesting than EPD. The default Python is 2.7.3, with numpy 1.5.1 (!) and scipy 0.11.0.

## Bokeh 

There are a few dependencies to resolve before using Bokeh. This includes [Chaco](http://code.enthought.com/chaco/) and [Traits](http://code.enthought.com/projects/traits/), as well as [Pandas](http://pandas.pydata.org) but this one always compiled fine on my Mac.

I tried to compile Chaco last year; I don't remember if it was from a manual install or through `pip`, but it failed. Today it just works (such packages usually go to my system-wide library, `/Library/Python/2.7/site-packages`):

```
% sudo pip install Chaco
```

I should note that several packages were installed or updated at the same time, including `pyface`, `traitsui`, `enable`, and `kiva`.

Exemples from the [Quickstart guide](http://docs.enthought.com/chaco/quickstart.html) seem to run smoothly. I had to replace `traits.ui` by `traitsui`, and of course remove every mention of `enthought.*`


![dataviz1](/img/20130404210418.png)

To install `Bokeh`, I just followed the [instructions on GitHub](https://github.com/ContinuumIO/Bokeh).

```
% git clone git://github.com/ContinuumIO/Bokeh.git
% cd Bokeh
% sudo python setup.py install
```

That worked just fine to generate static html on my disk (`local_example.py`). As I wanted to use the websockets backend, there're a couple of additional steps I had to follow. I already have [redis](http://redis.io) installed on my Mac.

```
% python startlocal.py
Traceback (most recent call last):
  File "startlocal.py", line 1, in <module>
    from bokeh.server import start
  File "/Users/chl/gitroot/Bokeh/bokeh/server/start.py", line 1, in <module>
    from geventwebsocket.handler import WebSocketHandler
ImportError: No module named geventwebsocket.handler
```

So, I had to install `gevent-websocket`, and then `flask`. Finally, following the instructions on GitHub, this is just a matter of starting the redis server, launch `python startlocal.py` in Bokeh main directory, and run `python pandas_example.py` in another terminal to get the following plot, live in my browser (`http://localhost:5006/bokeh`):

![dataviz2](/img/20130513212306.png)

Quite impressive so far!

## Numba and Blaze

Other projects I started to look at are <http://numba.pydata.org> and [Blaze](http://blaze.pydata.org/docs/overview.html) which is presented as a generalization of NumPy.

[^1]: I should note that Enthought just released [Canopy](https://www.enthought.com/products/canopy/) (or see [Introducing Enthought Canopy](http://blog.enthought.com/general/introducing-enthought-canopy/)), but this is probably another story, and I tend to keep away from multiple install of Python. I had some issues with EPD and IPython last year so I decided to only use the Python version that ships with my Mac. I know some folks recommend using an official Python package, but I never have had any problem with Apple Python.
