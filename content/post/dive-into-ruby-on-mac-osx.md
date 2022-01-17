---
title: "Dive into Ruby on Mac OS X"
date: 2009-12-01T08:30:34+01:00
draft: false
tags: ["apple"]
categories: ["2009"]
---

I would like to be able to use different versions of Ruby without getting in trouble with load paths. I currently have two versions of Ruby installed on my system.

The base package comes with my Snow Leopard install:

```
ruby 1.8.7 (2008-08-11 patchlevel 72) [universal-darwin10.0]
```

It is installed as a Mac framework in `/System/Library/Frameworks/Ruby.framework`, whereas [MacRuby][MacRuby] is located in `/Library/Frameworks/MacRuby.framework`. On Mac OS X, `/usr/bin` only contains symlinks to the Ruby framework, e.g.:

```
$ ls -l /usr/bin/rub*
lrwxr-xr-x  1 root  wheel  76 29 aoû 14:37 /usr/bin/ruby@ -> \
../../System/Library/Frameworks/Ruby.framework/Versions/Current/usr/bin/ruby
```

I also installed a more recent Ruby from CVS which actually has all extensions in `/usr/local/lib/ruby.no/`:

```
ruby 1.9.2dev (2009-10-09 trunk 25266) [x86_64-darwin10]
```

If I put `/usr/local/bin` at the end of my `PATH` variable, I get the original configuration:

```
$ ruby -e 'puts $:'
/Library/Ruby/Site/1.8
/Library/Ruby/Site/1.8/powerpc-darwin10.0
/Library/Ruby/Site/1.8/universal-darwin10.0
/Library/Ruby/Site
/System/Library/Frameworks/Ruby.framework/Versions/1.8/usr/lib/ruby/vendor_ruby/1.8
/System/Library/Frameworks/Ruby.framework/Versions/1.8/usr/lib/ruby/vendor_ruby/1.8/universal-darwin10.0
/System/Library/Frameworks/Ruby.framework/Versions/1.8/usr/lib/ruby/vendor_ruby
/System/Library/Frameworks/Ruby.framework/Versions/1.8/usr/lib/ruby/1.8
/System/Library/Frameworks/Ruby.framework/Versions/1.8/usr/lib/ruby/1.8/powerpc-darwin10.0
/System/Library/Frameworks/Ruby.framework/Versions/1.8/usr/lib/ruby/1.8/universal-darwin10.0
```

But, my path is set up such that `/usr/local/bin` comes before `/usr/bin`. Therefore, default Ruby is Ruby 1.9 and the load paths are:

```
/usr/local/lib/ruby/site_ruby/1.9.1
/usr/local/lib/ruby/site_ruby/1.9.1/x86_64-darwin10
/usr/local/lib/ruby/site_ruby
/usr/local/lib/ruby/vendor_ruby/1.9.1
/usr/local/lib/ruby/vendor_ruby/1.9.1/x86_64-darwin10
/usr/local/lib/ruby/vendor_ruby
/usr/local/lib/ruby/1.9.1
/usr/local/lib/ruby/1.9.1/x86_64-darwin10
```

However, these aren't the correct path anymore! I can force Ruby to look at the right place by setting the `RUBYLIB` environment variable but I am not convinced by the results it gave:

```
$ irb
/usr/local/bin/irb:9:in `require': no such file to load -- irb (LoadError)
	from /usr/local/bin/irb:9:in `<main>'
```

The problem is that I permanently encounter problems with my configuration. This may be due to conflicting load paths or applications that don't access the same environment variables:

```
$ irb
irb(main):001:0> $"
=> ["enumerator.so", "e2mmap.rb", "irb/init.rb", "irb/workspace.rb", "irb/context.rb",
"irb/extend-command.rb", "irb/output-method.rb", "irb/notifier.rb", "irb/slex.rb",
"irb/ruby-token.rb", "irb/ruby-lex.rb", "readline.bundle", "irb/input-method.rb",
"irb/locale.rb", "irb.rb", "prettyprint.rb", "pp.rb", "rubygems/rubygems_version.rb",
"rubygems/defaults.rb", "thread.bundle", "thread.rb", "rbconfig.rb", "rubygems/exceptions.rb",
"rubygems/requirement.rb", "rubygems/version.rb", "rubygems/dependency.rb", "rubygems/gem_path_searcher.rb",
"rubygems/user_interaction.rb", "rubygems/platform.rb", "rubygems/specification.rb",
"rubygems/source_index.rb", "rubygems/builder.rb", "stringio.bundle", "yaml/error.rb",
"syck.bundle", "yaml/ypath.rb", "yaml/basenode.rb", "yaml/syck.rb", "yaml/tag.rb",
"yaml/stream.rb", "yaml/constants.rb", "rational.rb", "date/format.rb", "date.rb",
"yaml/rubytypes.rb", "yaml/types.rb", "yaml.rb", "rubygems/config_file.rb", "rubygems/custom_require.rb",
"rubygems.rb", "etc.bundle", "fileutils.rb"]
```

Likewise, I have cloned version of some programs in two `bin/` directories

```
$ diff -rqu /usr/bin /usr/local/bin | grep "^Files"
```

I came to the following solution: Just append the frameworkized version of Ruby to my `PATH` settings:

```
export PATH=/System/Library/Frameworks/Ruby.framework/Versions/1.8/usr/bin:$PATH
```

which seems to me very sad because `/usr/bin` is already in my path, or reverse the order of `/usr/local/bin` and `/usr/bin` when exporting my `PATH` variable.

[MacRuby]: http://www.macruby.org/
