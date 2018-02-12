+++
title = "Networks, graphs and visualization"
description = ""
date = 2008-05-19T09:10:49+01:00
draft = false
tags = ["dataviz"]
categories = []
[[gallery_item]]
album = "1"
image = "20100418215136.png"
caption = ""
[[gallery_item]]
album = "1"
image = "20100418215902.png"
caption = ""
[[gallery_item]]
album = "2"
image = "20100418221523.png"
caption = ""
[[gallery_item]]
album = "2"
image = "20100418221559.png"
caption = ""
+++


Before talking about social networks or graph visualization, let's look at the article written by Matthew Bloch and Jonathan Corum for the New York Times (May 5, 2008): [Mapping the Human Diseasome][Mapping the Human Diseasome].

{{< gallery album="1" >}}

Surprisingly, this gives a very clear picture of the links between various disorders, mostly of genetic origin. This original scientific work, entitled [The human disease network][The human disease network], has been published in PNAS and the abstract is reproduced below:
Goh, K., Cusick, M.E., Valle, D., Childs, B., Vidal, M., and Barabasi, A-L (2007). [The human disease network](http://www.pnas.org/content/104/21/8685.full.pdf+html). *Proceedings of the National Academy of Sciences*, **104(21)**, 8685–8690.

> A network of disorders and disease genes linked by known disorder–gene associations offers a platform to explore in a single graph-theoretic framework all known phenotype and disease gene associations, indicating the common genetic origin of many diseases. Genes associated with similar disorders show both higher likelihood of physical interactions between their products and higher expression profiling similarity for their transcripts, supporting the existence of distinct disease-specific functional modules. We find that essential human genes are likely to encode hub proteins and are expressed widely in most tissues. This suggests that disease genes also would play a central role in the human interactome. In contrast, we find that the vast majority of disease genes are nonessential and show no tendency to encode hub proteins, and their expression pattern indicates that they are localized in the functional periphery of the network. A selection-based model explains the observed difference between essential and disease genes and also suggests that diseases caused by somatic mutations should not be peripheral, a prediction we confirm for cancer genes.

Another example of spatial representation of a connected network is the now well-known [Nexus][Nexus] application that can access any [Facebook][Facebook] account. More generally, [social networks] rely on similar facilities for geometric visualization of relationships. The following example has been found on [Jeffrey Heer's webpage][Jeffrey Heer]:

![](/img/20100418221053.png)

Also, on [Flickr][Flickr] one can found a very [big network][big network] including only people
with at least 50 or 10 mutual contacts. By not allowing overlaps between the
nodes, the network is spread out, and relationships are made clearer. There
are four very distinct clusters for the first case (50 mutuals friends).

{{< gallery album="2" >}}

[Processing][Processing] is an open-source programming language and environment allowing for dynamic graphics. I have to give it a try. It will probably save time doing some sophisticated animation of 3D data with [Python][Python] and [Pygame][Pygame]… I also heard about [Prefuse][Prefuse], which seems basically to provide similar functionalities, albeit for Java programming.

### Additional references

- [visualcomplexity.com][visualcomplexity.com]: a visual exploration on mapping complicated and complex networks
- [Netvis Module][Netvis Module]: dynamic visualization of social networks
- Viégas, F.B. and Donath, J. (2004). [Social network visualization: Can we go beyond the graph][Social network visualization: Can we go beyond the graph]
- [vizster][vizster]: visualizing online social networks

By the way, I also found the next links very interesting. These are good examples of effective dynamic multivariate graphics: [How Different Groups Voted in the 2008 Democratic Presidential Primaries](http://www.nytimes.com/2008/06/04/us/politics/04margins_graphic.html?_r=1&adxnnl=1&oref=slogin&adxnnlx=1214644831-qeylfyYWD94KlCriI9qINA) and [Election 2008](http://politics.nytimes.com/election-guide/2008/finances/map/index.html).

[Mapping the Human Diseasome]: http://www.nytimes.com/interactive/2008/05/05/science/20080506_DISEASE.html
[The human disease network]: http://www.pnas.org/content/104/21/8685.full.pdf+html
[Nexus]: http://nexus.ludios.net/
[Facebook]: http://www.facebook.com
[social networks]: http://en.wikipedia.org/wiki/Social_network "Wikipedia"
[Jeffrey Heer]: http://www.cs.berkeley.edu/~jheer/socialnet/
[Flickr]: http://www.flickr.com
[big network]: http://www.flickr.com/photos/gustavog/4499404/in/set-113313/
[Processing]: http://www.processing.org/
[Python]: http://www.python.org/
[Pygame]: http://www.pygame.org/
[Prefuse]: http://prefuse.org/
[visualcomplexity.com]: http://www.visualcomplexity.com/vc/
[Netvis Module]: http://www.netvis.org/resources.php
[Social network visualization: Can we go beyond the graph]: http://alumni.media.mit.edu/~fviegas/papers/viegas-cscw04.pdf
[vizster]: http://jheer.org/vizster/
[big network]: http://www.flickr.com/photos/gustavog/4499404/in/set-113313/