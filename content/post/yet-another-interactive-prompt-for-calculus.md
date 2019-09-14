+++
title = "Yet another interactive shell for numerical computing: Numeric Lua"
date = 2011-01-31T21:39:58+01:00
draft = false
tags = ["apple"]
categories = ["2011"]
+++

Here is a brief overview of how to manually install [Numeric Lua](http://numlua.luaforge.net/) on OS X.

<!--more-->

I compiled [Lua](http://www.lua.org/) 5.1 some months ago. My header files are in `/usr/local`:

```
$ find /usr/local/include/ -name "*lua*"
/usr/local/include//lua.h
/usr/local/include//lua.hpp
/usr/local/include//luaconf.h
/usr/local/include//lualib.h
```

There exists a [binary version](http://luabinaries.luaforge.net/) of Lua, but also a [Framework version](http://www.frykholm.se/luaframework.html).

Installation of `num-lua` went file after "some" modifications for OS X.

The very basic instructions are

```
cd lib
make
cd ..
make
sudo make install
```

This doesn't work on OS X. The standard installation instruction for a linux architecture won't work because of a number of separate issues; the main critical fixes are:

- we need to replace `f77` by `gfortran`;
- the `-lg2c` flag is not appropriate with `gfortran` (because it only works with `f77`).;
- the target directory is not correctly specified.

The last trick is to link to the BLAS and LAPACK routines, which on OS X means to link against the [Accelerate framework](http://developer.apple.com/performance/accelerateframework.html).[^1]

The main steps are thus to correct the Fortran and BLAS/LAPACK stuff in the `lib/` directory. In particular, we ask not to generate `libblas.a` and `liblapack.a`, although I suspect using `make noblas` would work. I was inspired by the patches available for the Macports version of num-lua. Here are my own patch files: <i class="fa fa-file-code-o fa-1x"></i> [num-lua_patch.tar.gz](http://www.aliquote.org/pub/num-lua_patch.tar.gz).

The problem was then that lua was not able to find `luarng.so`, which got installed in `/usr/local/lib` while default search path was `/usr/local/lib/lua/5.1/`. This is because the path were not correct in the `Makefile`. Let's go with the quick and dirty way (I shall correct the `Makefile` later):

```
$ sudo mv /usr/local/lib/lua*.so /usr/local/lib/lua/5.1/
```

Then, another problem emerged: I have a 64-bit `lua`, but I compiled `num-lua` as 32-bits only. So, I recompiled everything, removing the `-m32` flag when calling `gcc`.

Ok, then I ran again in trouble with `luaspfun`:

```
require "numlua"
```

gives me

```
dlopen(/usr/local/lib/lua/5.1/luaspfun.so, 2): Symbol not found: _cdfbet_
```

However, 

```
require "luarng"
```

works. Way cool, it seems that it likely comes from the Fortran code... On closer inspection, it looks like there's a problem with `lib/dcdflib/cdfbet.f` because `cdfbet.o` appears as `Mach-O object i386`. So the problem is that `gfortran` compiled everything in 32-bit mode! I added the `-m64` switch to get a `Mach-O 64-bit object x86_64`.

Now it works, except for `spfun`:

```
$ lua
Lua 5.1.4  Copyright (C) 1994-2008 Lua.org, PUC-Rio
> require "numlua"
> r = rng(os.time())
> for i=1,5 do print(r:unif()) end
0.51236621534918
0.88872763200197
0.64311104791705
0.82556333125103
0.79785071557853
> require "numlua.spfun"
> print(spfun.log1p(1e-16), math.log(1 + 1e-16))
 ***MESSAGE FROM ROUTINE INITDS IN LIBRARY SLATEC.
 ***POTENTIALLY RECOVERABLE ERROR, PROG ABORTED, TRACEBACK REQUESTED
 *  Chebyshev series too short for specified accuracy
 *  ERROR NUMBER = 1
 *   
 ***END OF MESSAGE

 ***JOB ABORT DUE TO UNRECOVERED ERROR.
0          ERROR MESSAGE SUMMARY
 LIBRARY    SUBROUTINE MESSAGE START             NERR     LEVEL     COUNT
 SLATEC     INITDS     Chebyshev series too         1         1         1
```

Well, I have no idea of what's going on. My best bet is that there still is a problem with the fortran code.

Other pieces of code seems to work, so I will investigate this later (I already spent one hour to get compilation and installation to work...).

```
$ lua
Lua 5.1.4  Copyright (C) 1994-2008 Lua.org, PUC-Rio
> require "numlua"
> = math.log(1+1e-16)
0
> = spfun.isinf(1/0)
true
> = spfun.qnorm(0.025, 0, 1)
-1.9599639845401
> x = 0.025; print(spfun.pnorm(spfun.qnorm(x, 0, 1), 0, 1) == x)
false
```

The last command should return `true`.

[^1]: I seem to remember that Apple optimized BLAS (`vecLib`) does not work with 64-bit `gfortran`, but I didn't check.

