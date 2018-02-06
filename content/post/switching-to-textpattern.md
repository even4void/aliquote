+++
title = "Switching to Textpattern"
description = ""
date = 2010-09-12T22:10:30+01:00
draft = false
tags = ["misc"]
categories = []
+++

Again, I just moved my "blog" over a new managing system, in this case [Textpattern](http://textpattern.com/). I quote the term blog because this is not really a blog, but rather my *entrepôt à idées*.

So why switching to a fully-featured blogging interface. In August I give [Posterous](http://posterous.com/) a try. Posterous is a nice idea for people who just need to store quotes or photos on a personal website. Since you can write your post and upload them by email, this is really the shortest path. However, there is actually no support for Javascript, whereas I was looking for a cleaner way to embed my LaTEX chunks, through, e.g., [jsMath](http://www.math.union.edu/~dpvc/jsMath/) or [MathJax](http://www.mathjax.org/) (actually, I am running the last one on my website). I must admit, however, that photos looks great on Posterous, with an auto-generated slimbox-like gallery. Embedding code chunks with syntax highlighting was also not so painful, thanks to [CodeRay](http://coderay.rubychan.de/).

Now, what? I have plenty of options to customize my posts (I’ll summarize some of them later), but I feel like I am getting to keep on my old habbits: just use links to my [Dropbox](http://www.dropbox.com/) for images, use a minimal amount of Javascript and rely on CSS for the layout, etc. I don’t really like the idea that all the content and the layout (templates, stylesheets, etc.) are stored in a SQL database. Also, as I must use categories for tagging, I am limited to two tags. Ok, this should be sufficient in most cases, but who knows? I find this critical review, [What’s Wrong with TextPattern?](http://scott.yang.id.au/2006/03/whats-wrong-with-textpattern/), helpful in that it highlights the major drawbacks of TXP, including this stupid idea of storing everything in the database. Another great review is: [Textpattern versus Wordpress](http://txpmag.com/article/textpattern-versus-wordpress).

I discover that there is a Textmate bundle for TXP. Provided you [activate XML-RPC](http://textpattern.com/download-rpc) for TXP, you can even blog from within Textmate! Not that I dislike the TXP admin interface, but if I can rest on my Mac without opening Safari, I’m happy. It’s seems to work but I didn’t manage to get textile formatting works actually (Ok, I just tried with one post!).
