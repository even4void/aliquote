+++
title = "Data cleaning techniques"
date = 2015-10-14T17:11:47+01:00
draft = false
tags = ["statistics", "database"]
categories = ["2015"]
+++

Here are some resources to learn data cleaning techniques.

While browsing [Leanpub](http://leanpub.com) yesterday[^1], I came across this little book: [Practical Data Cleaning](https://leanpub.com/practicaldatacleaning), by Lee Baker. This is the second edition of a book that was updated on October 2015. The author assumes that data are managed using MS Excel, and emphasizes the importance of quality control and data trails. However, I find this book a little scarce as it merely fly over the main points of data cleaning and, in particular, does not discuss technical issues (except when suggesting some Excel function like `TRIM()` or `SUBSTITUTE()`). By technical details, I mean tabulating a categorical variable to check for duplicate or mispelled categories, which is the only working case I happened to find in the book. However, this book is available for free and it will certainly help those who have no experience with data entry and data checking. The author also developed the [data kleenr](http://chi2innovations.com/datakleenr/) software.

Karl Broman also wrote a complete guide on how to [organize data in spreadsheets](http://kbroman.org/dataorg/). This is from the perspective of a statistician who receives some raw data, not the data manager who need to handle data collection and data entry from scratch. To date, this remains one of the most useful description of how to [tidy data](http://www.jstatsoft.org/v59/i10/paper) (Hadley Wickham's JSS paper), together with [How to share data with a statistician](https://github.com/jtleek/datasharing) (Jeff Leek).

*Exploratory Data Mining and Data Cleaning*, by Dasu and Johnson (Wiley, 2003), that I discussed briefly in [another post]({{< ref "/post/exploratory-data-mining-and-data-cleaning.md" >}}), provides interesting discussion about database management and exploratory data analysis. Yet, as I said in the other post, it is not about tools or basic techniques. Likewise, in *Data Analysis with Open Source Tools* (O'Reilly, 2001), a very nice book written well before the 'data science' wave, the appendix on data cleaning only covers essential steps (missing values, outliers, junk, formatting and normalizing, duplicate records, merging data sets).

[OpenRefine](http://refinepro.com) (formerly, Google Refine) offers a rich set of tools for data extraction and data cleaning. For more details and examples, see *Using OpenRefine*, by Verborgh and De Wilde (Packt Publishing, 2013), or [External Resources](https://github.com/OpenRefine/OpenRefine/wiki/External-Resources) on GitHub. Of note, there is an [online course](http://refinepro.com/blog/online-openrefine-foundation-course-now-available/) starting soon.

I finally came across the following book, which looks really great: [Clean Data](https://www.packtpub.com/big-data-and-business-intelligence/clean-data), by M. Squire (Packt Publishing, 2015).


[^1]: As a sidenote, while I was on [Leanpub](http://leanpub.com), I just found this nice gem from the JHU guys: [The Art of Data Science](https://leanpub.com/artofdatascience).
