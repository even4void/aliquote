---
title: "Playing With Docbook Again"
date: 2011-11-14T23:47:47+01:00
draft: false
tags: ["apple"]
categories: ["2011"]
---

Some notes about installing DocBook tools on OS X Lion.

I used to write my documents and slides almost exclusively with $\LaTeX$ and Context. Needless to say, this means tweaking default layout a lot (who said that $\LaTeX$ allows for a perfect separation between layout and content?!), so that for small-size documents I now tend to rely on [Pandoc](http://johnmacfarlane.net/pandoc/).

Lastly, I tried to use Pandoc for outputing [DocBook](http://www.docbook.org/) document which I find pretty convenient for web display. It's been almost three years now since the latest time I wrote xml files. Pandoc is already very helpful for $\LaTeX$ (with or without the `xetex` backend), and I even created basic templates for writing Beamer slides in Markdown. For DocBook, I can produce a fairly decent output using [xsltproc](http://xmlsoft.org/XSLT/xsltproc2.html) which comes with OS X. In the `Makefile` for a tutorial on exploratory data analysis with R, I put something like:

```
xsltproc --xinclude --stringparam html.stylesheet docbook-xsl.css -o eda_r.html \
  http://docbook.sourceforge.net/release/xsl/current/html/docbook.xsl eda_r.xml
```

It works like a charm. However, I would like to use [xmlto](http://cyberelk.net/tim/software/xmlto/) which is built around `xsltproc` but handles everything in a smoother way. 

## Installing the pre-requisites

We need to install `gettext` and `getopt` (with support for `--longoptions`, contrary to the default `/usr/bin/getopt` that ships with OS X).

First of all, get the latest source tarball of `gettext` from GNU website.

To compile `gettext` 0.18.1.1, you have to run the classical combo:

```
$ ./configure
$ make
$ make check
$ sudo make install
```

I had to patch `gettext-tools/gnulib-lib/stpncpy.c` as follows:

```
 #ifndef weak_alias
-# define __stpncpy stpncpy
+# define __stpncpy gnu_stpncpy
 #endif
```

Then, go forward with `getopt`, which is available at <http:/software.frodo.looijaard.name/getopt/>:

```
$ wget http://software.frodo.looijaard.name/getopt/files/getopt-1.1.4.tar.gz
$ tar xzvf getopt-1.1.4.tar.gz
$ cd getopt-1.1.4
```

In the `Makefile`, update the `LDFLAGS` so it reads `LDFLAGS=-lintl` (which is used for internationalization support in other packages). An alternative would be to type directly `LDFLAGS="-lintl" make -e`. Yes, that's a bunch of external dependencies for a small program that basically acts as a wrapper around [xsltproc](http://xmlsoft.org/XSLT/xsltproc2.html).

Now, we can install `xmlto`. Before that, we need to install the Docbook stylesheets, as well as DocBook 4.2 files. This is well explained [here](https://wincent.com/wiki/Installing_Git_1.5.2.3_on_Mac_OS_X_Tiger) and I follow those instructions. Basically, this means to:

- Create a catalog file in `/etc`:
  
    ```
    $ sudo mkdir /etc/xml
    $ sudo xmlcatalog --noout --create /etc/xml/catalog
    ```
    
- Install the latest `xsl` and `xml` in `/usr/local/share/docbook/` (I only download 4.2 and 4.4). In my case, it is

    ```
    xml/4.2
    xml/4.4
    xsl/1.76.1
    ```

- Update the XML catalog

    ```
    $ sudo xmlcatalog --noout --add 'nextCatalog' '' \
      'file:///usr/local/share/docbook/xsl/1.76.1/catalog.xml' --create /etc/xml/catalog
    $ sudo xmlcatalog --noout --add 'nextCatalog' '' \
      'file:///usr/local/share/docbook/xml/4.2/catalog.xml' --create /etc/xml/catalog
    $ sudo xmlcatalog --noout --add 'nextCatalog' '' \
      'file:///usr/local/share/docbook/xml/4.4/catalog.xml' --create /etc/xml/catalog
    ``` 
    
This results in `/etc/xml/catalog` now reading like this:

```
$ less /etc/xml/catalog 
<?xml version="1.0"?>
<!DOCTYPE catalog PUBLIC "-//OASIS//DTD Entity Resolution XML Catalog V1.0//EN"
"http://www.oasis-open.org/committees/entity/release/1.0/catalog.dtd">
<catalog xmlns="urn:oasis:names:tc:entity:xmlns:xml:catalog">
<nextCatalog catalog="file:///usr/local/share/docbook/xsl/1.76.1/catalog.xml"/>
<nextCatalog catalog="file:///usr/local/share/docbook/xml/4.2/catalog.xml"/>
<nextCatalog catalog="file:///usr/local/share/docbook/xml/4.4/catalog.xml"/>
</catalog>
```

That's it!

## Testing the installation

I used a [template](http://www.freebsd.org/doc/en/books/fdp-primer/examples-docbook-article.html) (article) I found and tested `xmlto` by running the following command:

```
$ xmlto html-nochunks sample.xml
```

Trying `pdf` backend gave me some error that I need to investigate, though. However, it works well with `fop`.

```
$ xsltproc --xinclude --output sample.fo \
  /usr/local/share/docbook/xsl/1.76.1/fo/docbook.xsl \
  sample.xml
$ fop sample.fo sample.pdf
```

### Sidenote

There are other tools that can be installed for those interested in managing DocBook documents, especially when PDF is the expected output format. I can think of `jade`, but there are also `dblatex` and `dbcontext`, see [DocBook to LaTeX Publishing](http://dblatex.sourceforge.net/). Apache [fop](http://xmlgraphics.apache.org/fop) works well too.
