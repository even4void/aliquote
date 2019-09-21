---
title: "Blogging about this Jekyll blog"
date: 2010-04-15T17:39:14+01:00
draft: false
tags: ["misc", "ruby", "perl"]
categories: ["2010"]
---

I've tried several blogging systems since 2006, but none gave me entire satisfaction. The latest was Wordpress but I had to stop blogging 6 months after my first post (for reasons not related to blog, but anyway), and I never came back to it. Now, I just noticed that the management interface has been considerably enhanced and it is simply too much for my needs. Hence, I was looking for a static content generator and I stopped by [Jekyll][Jekyll].

*Pros*:

1. As we work with [Markdown][Markdown] syntax, all static files can be converted to HTML, PDF (with or without XeLaTeX backend), TXT, and even RTF (but see [MultiMarkdown][MultiMarkdown]). 
2. This is a template-based system, so we can change the layout without worrying about the content. Moreover, the generated HTML code is quite clean, compared to what I have seen from other CMS. 
3. It supports code highlighting through [Pygments][Pygments]. 

*Cons*:

1. No tags, no categories, no comments/trackbacks. 
2. Hardly configurable if we want complex layout. 
3. See below

The problem with [Jekyll][Jekyll] is that it assumes that your blog stands at the root
of your website, and that all links are relative to a tree structure as illustrated
below:

```
+-_config.yml
+-_layouts/ 
| +-default.html
| +-post.html
+-atom.xml
+-_posts/
| +-2010-04-10-toto.txt
| +-2010-04-15-titi.txt
+-css/
| +-screen.css
| +-syntax.css
+-images/
+-index.html
```

If this is put as is in your web root, obviously it will erase your own `index.html` page, but all links become broken if your posts and `index.html` sit in a subfolder. The latest case is, however, the one I prefer because I like keeping things somewhat ordered on my web server. I didn't find any relevant suggestion on Google, and I have no time to look inside the Ruby code. So, I just post this on-the-fly post-processing hack to change all relative links into "corrected" relative links.

Here is the core of the script I use:

```perl
while ( my $token = $stream->get_token ) {
  if ( $token->is_start_tag( 'a' ) ) {
    # test if the link starts with a date, e.g. 2010/ or css
    if ( $token->as_is =~ /(\/[0-9]{4,4}\/|css)/ or $token->is_start_tag( 'link' ) ) {
      if ( $verbose ) {
        my (@next) = ( $stream->get_token );
        print $next[0]->as_is, "\n";
      }
      $token->set_attr( href => $basename . $token->get_attr( 'href' ) );
    }
  }
  $fh->print( $token->as_is );
}
```

The regex looks sad because I need to fix only CSS and posts, but not images which come from my [Dropbox][Dropbox] account and are automatically timestamped using an Applescript that I wrote.

The Perl script is then called in a Bash script that recursively visit all HTML pages:

```sh
for dir in $(find . -type d); do
  echo "Visiting $dir";
  for item in $(ls $dir/*.html); do
    rewrite_url.pl $item;
  done
done
```

That's all. How comes I used Perl when Jekyll is pure Ruby? Go figure. Now, how does site management look like?

1. First, I hold several static HTML files which I edit manually, because I don't want to go through any CMS or things like that; I must admit that the [Liquid][Liquid] templating system is appealing (because it does not rely on PHP!). 
2. My posts are edited using Markdown syntax and are then transformed to pretty HTML by [Jekyll]; the blog directory is moved at the root of my website.
3. The rewriting rules are then applied to all relevant HTML files. 
4. I then update the modifications using [sitecopy][sitecopy].

Of course, I wrapped all these steps into a `Makefile` (because I tend to forget the commands I used).

[Jekyll]: github.com/mojombo/jekyll "Jekyll"
[Markdown]: daringfireball.net/projects/markdown/ "Markdown language"
[MultiMarkdown]: http://fletcherpenney.net/multimarkdown/ "MultiMarkdown language"
[Pygments]: http://pygments.org/ "Pygments — Python syntax highlighter"
[Dropbox]: http://getdropbox.com "Dropbox"
[Liquid]: http://www.liquidmarkup.org/ "Liquid"
[sitecopy]: http://www.manyfish.co.uk/sitecopy/ "sitecopy"