---
title: "Site redesign"
date: 2019-09-22T11:38:07+02:00
draft: false
tags: ["misc"]
categories: ["2019"]
---

It tooks a while but I finally made it: I redesigned the website few days ago. I am more than happy with the new design: it remains minimalistic but easier to manage, and a lot of old stuff has been cleaned up along the way.

<!--more-->

The previous design was derived from the [even theme](https://themes.gohugo.io/hugo-theme-even/). It has served me well during the past two years, but over time I found it hard to maintain in a decent state. Hugo changed a lot in later releases, leading to [pesky errors](/micro/hugo-update.md) with old Go statements. I ended up freazing my Hugo program to the latest version that was actually working with my current settings, but I knew this would not last forever. Three days ago, I decided to upgrade Hugo to the last version available in Homebrew tap, and update the Even theme with the newly released one. I fixed things here and there, and just gave up as soon as I realized that I wanted to build my own package. Most importantlty, I wanted to fix annoying things like image displays, preformatted code blocks and syntax highlighting, Hugo pagination (which was actually too large).

While browsing existing Hugo themes and frameworks, I came across the [Ezhil](https://github.com/vividvilla/ezhil) theme. This was just what I was looking for to get started: A sober theme, with minimal CSS and div layout. I worked on it a bit, and finally ended up with the slightly altered version you are currently browsing. Overall, this is mostly Ezhil, but with different structured views, and above all new fonts.

Here is what is under the hood:

- Ezhil comes with [normalize.css](https://necolas.github.io/normalize.css/), a responsive stylesheet and [feather](https://feathericons.com) icons. That's really great because these are lightweight settings that still provide very acceptable rendering across browsers, OSs and media.

- I added [purecss](https://purecss.io) to manage the positioning and resizing of images on blog posts. The idea comes from the [blackburn](https://github.com/yoshiharuyamashita/blackburn) theme. This allowed me to replace my old "gallery" shortcode (probably inherited from the Academic theme, that I tried first when I set up the new blog) by a much simpler construct. To put two images side by side (assuming the media screen is large enough), I now use: (Note that I omitted the enclosing brackets, `{{` and `}}`, in order to avoid proper rendering of the shortcode.)

      ```
      < fluid_imgs
        "pure-u-1-2|/img/xxx.png"
        "pure-u-1-2|/img/xxx.png" >
      ```

      If I want to display three images, then `pure-u-1-3` will do it. I just altered the original code to add an enclosing `<a href` so that we can still access the original image without lossing too much quality (and get the correct sizing). In some cases, images become quite tiny, especially on mobile device. There are certainly a lot of other nifty CSS tricks in this library, but I haven't explore it in depth.

- I changed the default fonts. As there is no way to use a Google API to import fonts, I have uploaded a subset of the IBM Plex fonts in WOFF format on my server. I keep control as much as I can, you know. The original idea came from [BSAG](https://www.rousette.org.uk/about/).

- An internal search engine is now available. Previously, I was relying on DuckDuckGo, but of course it was a patch of some kind, for Hugo has no such functionalities at present. Now, I found a very [easy setup](https://gist.github.com/eddiewebb/735feb48f50f0ddd65ae5606a1cb41ae) that cost nothing but a few hacks and a small JS file. That's really a big plus for the site, since it provides the reader with a quick way to check for existing content without leaving the site. And this is all good for me: We don't use Google, nor any other hard-coded solution which consists in building a database first, using lot of JS packages, and then update it on a regular basis.

- Typesetting mathematical expressions using MathJax is always fun, except when you have to escape underscores followed by bracket. Yes, it sucks, but the version of MathJax I am presently using (2.7.2) just works, while most recent ones would require more hacks than I'm willing to accept. In case you wonder, I just added the following requests in my footer partial:

      ```
      <script type="text/javascript">
        window.MathJax = {
          tex2jax: {inlineMath: [['$','$'], ['\\(','\\)']]},
          showProcessingMessages: false,
          messageStyle: 'none'
        };
      </script>
      <script type="text/javascript" async
        src="https://cdnjs.cloudflare.com/ajax/libs/mathjax/2.7.2/MathJax.js?config=TeX-MML-AM_CHTML">
      </script>
      ```

Hopefully, nothing will change for the reader. This is juts that the homepage is now set to point to the flux of my micro-posts, instead of the summary view I used to use beforehand. All posts are listed in reverse chronological order, without any preview of any kind. I just report the publication date and word count. The RSS feed remains the same, but I may eventually remove micro-posts from it since RSS readers may suffer from such noisy activity.
