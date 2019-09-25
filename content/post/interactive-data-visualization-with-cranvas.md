---
title: "Interactive Data Visualization With Cranvas"
date: 2012-10-27T14:28:50+01:00
draft: false
tags: ["rstats", "dataviz"]
categories: ["2012"]
---

One of the advantage of R over other popular statistical packages is that it now has "natural" support for interactive and dynamic data visualization. This is, for instance, something that is lacking with the Python ecosystem for scientific computing ([Mayavi](http://mayavi.sourceforge.net) or Enthought [Chaco](http://code.enthought.com/chaco/) are just too complex for what I have in mind).

Some time ago, I started drafting some tutors on interactive graphics with R. The idea was merely to give an overview of existing packages for interactive and dynamic plotting, and it was supposed to be a three-part document: first part presents basic capabilities like `rgl`, `aplpack`, and `iplot` (aka Acinonyx)--this actually ended up as a very [coarse draft](/pub/iplots.pdf) (PDF); second part should present `ggobi` and its R interface; third and last part would be about the Qt interface, with `qtpaint` and `cranvas`. I hope I will find some time to finish this project as it might provide useful complements to my introductory statistical course on data visualization and statistics with R.

I recently updated the Qt interface (during the summer I had some problems with the linking stage, probably because of external dependencies on the Qt framework, but it seems it has been solved in the meantime), and I'm really happy with what [cranvas](https://github.com/ggobi/cranvas) has to offer. On a Mac, the follwoing shortcuts are useful:

- <kbd>Del</kbd>/<kbd>F5</kbd> to delete/undelete observations
- <kbd>?</kbd> for identify mode
- <kbd>S</kbd> followed by <kbd>Ctrl</kbd>-click to vary brushing size; <kbd>S</kbd> then click to release and return to dynamic brushing
- <kbd>PageUp</kbd>/<kbd>PageDown</kbd> gives access to brushing history

Of course, it does not necessarily compete with what can be achieved using [D3](http://d3js.org) (but see [mbostock’s blocks](http://bl.ocks.org/mbostock)), although we soon reach the limit between [data visualization and info visualization](http://bit.ly/QIlQkk) (joint newsletter of the Statistical Computing & Statistical Graphics Sections of the ASA, PDF). While browsing some of Mike Bostock's demos, I came across this paper which suggest that animated transitions can significantly improve graphical perception:
Heer, J and Robertson, G (2007). [Animated Transitions in Statistical Data Graphics](http://vis.berkeley.edu/papers/animated_transitions/). *IEEE Information Visualization (InfoVis)*

I'm not a big fan of such animated graphics, unless they intend to be displayed during a talk to emphasize a specific point. For day-to-day statistical stuff, we don't really need that level of sophistication. We just want to be able to link plots together and highlight observations according to, say, an auxiliary variable or the magnitude of residuals from a regression model, and study multidimensional datasets with projection techniques and efficient multivariate visualization techniques. However, I should note that the [r2d3](https://github.com/hadley/r2d3) project (by [Hadley Wickham](http://had.co.nz/)) looks promising and it will probably allow more interactivity with data displays. It looks like Python aficionados are going into the same direction, e.g. [IPython Notebook and d3.js Mashup](https://github.com/cschin/ipython_d3_mashup), but see [d3 Wiki](https://github.com/mbostock/d3/wiki/Gallery) (§ Interoperability).
