---
title: "Statalist"
date: 2026-10-26T20:19:45+01:00
draft: false
tags: ["stata"]
categories: ["2026"]
---

[Statalist][1] is gone since 2014 and it has been replaced with a forum. The
[archives][2] are still around, though. And I also have a local copy of all the
emails since 2002 on my HD.

There are about 160,551 emails lurking around, in plain HTML format. To get an
idea of how posting evolved over this period of 12 years, I quickly visited all
subdirectories and counted the number of messages in there:

```shell
» find . ! -name . -prune -type d -exec sh -c '
  for dir do
    dir="${dir#./}"
    printf "%s:\t" "$dir"
    find ".//$dir" -type f | grep -c //
  done' sh {} +
```

Here's the result, with a 3-month moving average (orange):[^1]

{{< figure src="/img/statalist.png" >}}

As can be seen, the number of posted messages has increased at a almost a
constant rate during the first 8 years, and then the rate of posting per month
reached a steady state before slowing done after 2012.

There's more to analyzing the posting rate on statalist. All I wanted ultimately
was to have the archives in a readable plain text format. What about a maildir
than can be loaded in Neomutt? *I'm almost there*. I wrote a quick and dirty
Python script that converts raw HTML messages to properly formatted emails with
the help of the `mailbox` module and, of course, [beautifulsoup4][4]. I say
"almost" because there are still some edge cases from the past decade that need
some specific treatment. But for a one-hour coding session, statistics included,
I feel this is not so bad for a fifty-year-old who's not versed into
vide-coding. And yes, probably than one hour is already way too much, but I did
a lot of mistakes along the way. There's still room to learn, which is good
after all.

{{< figure src="/img/2026-10-26-20-47-19.png" >}}

{{% music %}}Nina Hagen • *Move Over*{{% /music %}}

[^1]: Mathematica code based on this [dataset][3]:

    ```
    data = Import["statalist.txt", "Table"];
    mavg = MovingAverage[data[[All, 2]], 3];
    xs = data[[All, 1]];
    mavgData = Transpose[{Take[xs, Length[mavg]], mavg}];
    DateListPlot[{data, mavgData}, Joined -> {False, True}]
    ```

[1]: https://www.statalist.org
[2]: https://www.stata.com/statalist/archive/
[3]: https://aliquote.org/pub/statalist.txt
[4]: https://www.crummy.com/software/BeautifulSoup/
