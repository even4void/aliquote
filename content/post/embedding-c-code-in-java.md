---
title: "Embedding C code in a Java app"
date: 2008-07-13T18:50:36+01:00
draft: false
tags: ["clang"]
categories: ["2008"]
---

Suppose your employer ask you to develop a small application that has to be deployed to a wide range of researchers in the near future. Obviously, you're working in a Micro$oft environment (Yes, what else?) and you don't want to spend your time reading MS SDK, looking for a decent 32 bits compiler with a minimalist but useable EDI. Further, as you probably have other things to do during your daily job, this job will probably become your homework and, of course, as you're a well educated people, you work at home on a Mac or a Linux workstation. It's time to learn how to wrap C and Java together in a small cross-platform application.

There is a [Sun tutorial][Sun tutorial], and other can be found on the internet. We will focus on a very primitive example, namely the computation of the first decimals of Pi with the Machin's formula which is given by the relation

$$ \frac{\pi}{4}=4\text{arctg}\left(\frac{1}{5}\right)-\text{arctg}\left(\frac{1}{239}\right) $$

For those who are interested in π computation, I recommend the following book: [J.-P. Delahaye][J.-P. Delahaye], *Le fascinant nombre Pi* (Pour la Science, 1997), but you could start with the Wikipedia article: [Computing Pi][Computing Pi]. There is also a Javascript [online calculator][online calculator].

## Starting with Java

For now, we shall begin with an even more simplistic example: The famous Hello World! The code in `Hello.java` might look a bit strange at first sight, but it only contains a single class with static main method, and the method `sayHello()` has been declared as `native`:


```java
class Hello {
  public native void sayHello(); 
    static {
      System.loadLibrary("hello");
    }

  public static void main(String[] args) {
    Hello h = new Hello();
    h.sayHello ();
  }
}
```

Next, all we have to do is to call `javah` which will generate the C headers
for us. In fact, the `*.h` file includes the C declarations for the methods
that were declared native in our file `*.java`:

``` 
$ javah -jni Hello
$ ls
Hello.class	Hello.h		Hello.java
```

## The C side

We now have three files and we can create a C file with the following code:

```c
#include <jni.h>
#include <stdio.h>
#include "Hello.h"
JNIEXPORT void JNICALL Java_Hello_sayHello (JNIEnv *env, jobject obj) 
{
  printf("Hello world!\n");
  return;
}  
```

It can be seen that we are passing the same parameters to the method as in the `*.h` file, but now with names specified. Now, we have to compile our (dynamic) library; thus, we don't link the program, and just compile it with the appropriate libraries. Depending on your platform, the java SDK might be installed in `/usr/share/` or `/opt/` (Linux users) or `/System/Library/Frameworks/JavaVM.framework/Versions/1.5.0/Headers/` (Mac users):

```
$ gcc -c -I/System/Library/Frameworks/JavaVM.framework/Versions/1.5.0/Headers/ \
  -o hello.o Hello.c
```

If all went file, you should get the file `hello.o`.

## Assembling the different pieces of code

Now, we just have to create a definition file, ending with `*.def`. It is used to specify the name of the functions that are to be exported, or in other words the visible functions. It looks like this:

```
EXPORTS Java_Hello_sayHello
```

Note that it is not a mandatory file for our example. To produce the library, we just call `gcc` with the `-shared` argument. This is for Windows and Linux users:

```
$ gcc -shared -o hello.dll hello.o hello.def
```

For Mac users, however, we must adapt this linking phase because the `-shared` option is not supported on Mac OS X. All is explained in [Core Java APIs on Mac OS X][Core Java APIs on Mac OS X]. Instead, we have to use the `-dynamiclib` flag. If we look at the `gcc` documentation, e.g. `man gcc`, we can check that:

```
-dynamiclib
When passed this option, GCC will produce a dynamic library 
instead of an executable when linking, using the Darwin 
libtool command.
```

Thus, here is how to end up correctly:

```
$ gcc -dynamiclib -o libhello.jnilib hello.o -framework JavaVM
```

This should create the file `libhello.jnilib`. Then, we can test our example by issuing:

```
$ java Hello
Hello world!
```

The complete source code is available here: [032_JNI.zip][032_JNI.zip].

## Sidenote

Here are two technical notes from Apple Dev Center that can be useful for the Java Mac beginner:

- [Important Java Directories on Mac OS X][Important Java Directories on Mac OS X]
- [Java on Intel-based Macs][Java on Intel-based Macs]


[Sun tutorial]: http://java.sun.com/developer/onlineTraining/Programming/JDCBook/jni.html
[J.-P. Delahaye]: http://www2.lifl.fr/~delahaye/
[Computing Pi]: http://en.wikipedia.org/wiki/Computing_π "Wikipedia"
[online calculator]: http://milan.milanovic.org/math/english/pi/picalculator.html
[032_JNI.zip]: /pub/032_JNI.zip
[Core Java APIs on Mac OS X]: http://developer.apple.com/documentation/Java/Conceptual/Java14Development/05-CoreJavaAPIs/CoreJavaAPIs.html
[Important Java Directories on Mac OS X]: http://developer.apple.com/qa/qa2001/qa1170.html
[Java on Intel-based Macs]: http://developer.apple.com/qa/qa2005/qa1295.html