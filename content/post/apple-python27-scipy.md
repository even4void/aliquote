---
title: "Installing numpy+scipy on OS X Lion"
date: 2011-07-24T22:45:48+01:00
draft: false
tags: ["python", "apple"]
categories: ["2011"]
---

After a fresh upgrade of my Macbook Air with OS X Lion, I'm left with the default system Python, and nothing of my old stuff in the System Library path.


## First attempt 

I first tried to install [numpy](http://www.numpy.org/). The default installed version is 1.5.0, I want the latest version. This was quite simple

```
$ sudo easy_install numpy
$ python
>>> import numpy
>>> print numpy.__version__
1.6.1
```

Other easy install steps: [scikit-learn](http://scikit-learn.sourceforge.net/) (no dependency, except the above), [nose](http://pypi.python.org/pypi/nose), [dexy](http://www.dexy.it/), [ipython](http://pypi.python.org/pypi/ipython).

Actually, I wasn't able to install [scipy](http://www.scipy.org/), neither with `setuptools`, nor with a fresh `tar.gz` archive. To my surprise, however, the installation of [Matplotlib](http://matplotlib.sourceforge.net/) went fine! (I remember having to clean a lot of post-install stuff during my previous install on OS X SL.)

## Revised approach (that worked for me)

About [scipy](http://www.scipy.org/), a little googling suggests that the problem may be related to a broken [numpy](http://www.numpy.org/) install (through either `pip` or `easy_install`), where some files are simply missing (e.g., `npymath.ini` that scipy complains not to found). So, I tried to compile everything the usual way. First, I cleaned up my fresh numpy install:

    $ cd /Library/Python/2.7/site-packages
    $ sudo easy_install -m numpy
    $ sudo rm -rf numpy-1.6.1-py2.7-macosx-10.7-intel.egg/

(Likewise, I had to remove `matplotlib` and `scikit-learn`.)

Then,

1. Download the latest `numpy 1.6.1` from [SourceForge.net](http://sourceforge.net)
2. Build it,
 
       ```
       $ python setup.py build --fcompiler=gfortran
       $ sudo python setup.py install
       ```
       
3. Check that we now have `npymath.ini`

Now, let's try installing `scipy` again. Using `pip`, I still get an error (about some C code). So, I used the `tar.gz` source files directly, and:

```
$ sudo python setup.py install
```

and everything seems to go fine up to the `sparse/*` stuff where I got error with compilation of `veclib_cabi_c.c`. This strongly resembles what was described in one of the [scipy tickets](http://projects.scipy.org/scipy/ticket/1476). It is suggested to just add at the top of `scipy/sparse/linalg/eigen/arpack/ARPACK/FWRAPPERS/veclib_cabi_c.c`:

```
#include <complex.h>
```

Now, there is a new error with `scipy/linalg/src/fblaswrap_veclib_c.c` that I fixed in the same way. And, *ô miracle*, everything compiled fine till this end where I could read:

```
Writing /Library/Python/2.7/site-packages/scipy-0.9.0-py2.7.egg-info
running install_clib
```

I didn't run the test suite, though.

To sum up, to get a working installation of numpy, scipy, matplotlib, and all scientific libraries you want,

- Install `nose` via `easy_install`
- Install `numpy` from source
- Install `scipy` from source (you'll need to patch `veclib_cabi_c.c` and `fblaswrap_veclib_c.c`)
- Install `matplotlib` via `easy_install`

While we are in, let's install [cython](http://cython.org/): it went smoothly with `easy_install`. Finally, I was able to install the [scikit-statsmodels](http://scikits.appspot.com/statsmodels) which depends on numpy and scipy, but from the [pypi tarball](http://pypi.python.org/pypi/scikits.statsmodels) only (the automated install via `easy_install` seems to hang on a broken `git` revision). I used:

```
$ python setup.py install --with-cython
```

Below is a little check, using `%run example_predict.py` in IPython 0.10.2:

![scikit](/img/20110724221626.png)

and an illustration with the [mean shift algorithm](http://scikit-learn.sourceforge.net/stable/auto_examples/cluster/plot_mean_shift.html), from the `scikit.learn`:

![scikit2](/img/20110724222033.png)

Welcome OS X Lion again: How fortunate!



