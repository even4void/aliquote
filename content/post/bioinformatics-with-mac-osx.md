+++
title = "Bioinformatics with Mac OS X"
description = ""
date = 2008-06-15T09:27:38+01:00
draft = false
tags = ["apple"]
categories = []
[[gallery_item]]
album = "1"
image = "20080620101315.png"
caption = ""
[[gallery_item]]
album = "1"
image = "20080620101330.png"
caption = ""
[[gallery_item]]
album = "1"
image = "20080620101341.png"
caption = ""
+++

Doing Bioinformatics on a Mac OS X isn't really difficult given the number of software that currently support this platform. Here are some useful links for the biocomputer scientist who likes efficient and fast programming language:

<!--more-->

- [Beginning Python for Bioinformatics][Beginning Python for Bioinformatics]
- [Ruby Bioinformatics code][Ruby Bioinformatics code]
- [Beginning Bioinformatics for Perl Programmers][Beginning Bioinformatics for Perl Programmers]

The [BioPerl Project][BioPerl Project] contains a lot of scripts, as well as the [Biopython Project][Biopython Project].

As computing skills aren't the sole competence required for Bioinformatics, I'd like recommend some more theoretical or pragmatic lectures, such as:

- M. Moorhouse and P. Barry. *Bioinformatics, Biocomputing and Perl*. Wiley, 2004. 
- C. Gibas and P. Jambeck. *Developing Bioinformatics Computer Skills*. O'Reilly, 2001.

{{< gallery album="1" >}}

Additional material related to Moorhouse &amp; Barry's book can be found on the [companion website]. Vincent Zoonekynd also wrote some interesting notes, oriented toward the [algorithmic approach to Bioinformatics][algorithmic approach to Bioinformatics]. Two excellent books were also wrote about Perl and Bioinformatics (see also Tisdall's article [Beginning Bioinformatics][Beginning Bioinformatics]), namely :

- J. Tisdall. *Beginning Perl for Bioinformatics*. O'Reilly, 2001. 
- J. Tisdall. *Mastering Perl for Bioinformatics*. O'Reilly, 2003.

Working with such kind of data involves dedicated visualization techniques, in particular for viewing molecules or proteins in 3D. Fortunately, there are a lot of solutions, among which:

- [RasMol][RasMol] and [OpenRasMol][OpenRasMol], the standard toolkit for molecular graphics visualization 
- [emboss][emboss], an integrated package including several computational tools (sequence alignment, nucleotide sequence pattern analysis, etc.) 
- [PyMOL][PyMOL], a molecular visualization system 
- [CLC Combined Workbench][CLC Combined Workbench], Mac OS X only (not free!), provides an integrated solution to popular analyses: assembly for DNA sequence data, molecular cloning, advanced RNA structure prediction and editing, integrated 3D molecular view, etc.

Finally, as you are also likely to do some Proteins or DNA sequence analysis, you will need additional tools like [Fasta][Fasta] or [BLAST][BLAST].

More general software or libraries can be used for that purpose, of course. For example, you can read M.J. Morton's article, [3-D Data Visualization on Mac OS X][3-D Data Visualization on Mac OS X], to get an idea of how the open source [VTK software system][VTK software system] might help in building large-scale project for complex data visualization. For a more exhaustive list of available software, please have a look at the [Open Directory Project][Open Directory Project]. However, a growing list of open source solutions can be found on the [BioConductor Project][BioConductor Project] webpage. Interestingly, it is interfaced with the open source [R][R] statistical software package.


[Beginning Python for Bioinformatics]: http://www.onlamp.com/pub/a/python/2002/10/17/biopython.html
[Ruby Bioinformatics code]: http://macresearch.org/script_tags/language/ruby
[Beginning Bioinformatics for Perl Programmers]: http://www.perl.com/pub/a/2002/01/02/bioinf.html
[BioPerl Project]: http://www.bioperl.org/wiki/Main_Page
[Biopython Project]: http://biopython.org/wiki/Main_Page
[companion website]: http://glasnost.itcarlow.ie/~biobook/
[algorithmic approach to Bioinformatics]: http://zoonek2.free.fr/UNIX/49_bioinfo/Cours.html
[Beginning Bioinformatics]: http://www.perl.com/pub/a/2002/01/02/bioinf.html
[RasMol]: http://www.umass.edu/microbio/rasmol/
[OpenRasMol]: http://openrasmol.org/
[emboss]: http://emboss.sourceforge.net/
[PyMOL]: http://pymol.sourceforge.net/
[CLC Combined Workbench]: http://www.clcbio.com/index.php?id=92
[3-D Data Visualization on Mac OS X]: http://www.macdevcenter.com/pub/a/mac/2002/06/28/data_visualization.htm
[VTK software system]: http://www.vtk.org/
[Open Directory Project]: http://www.dmoz.org/Science/Biology/Bioinformatics/Software/
[BioConductor Project]: http://www.bioconductor.org
[R]: http://www.cran.r-project.org
[Fasta]: http://fasta.bioch.virginia.edu/fasta_www2/fasta_list2.shtml
[BLAST]: http://blast.ncbi.nlm.nih.gov/Blast.cgi