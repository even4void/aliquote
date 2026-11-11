---
title: "Boarding Pass Problem"
date: 2026-11-11T20:13:56+01:00
draft: true
tags: ["math", "recreations"]
categories: ["2026"]
---

Over at [Programming Praxis][1], the author once asked about the Boarding Pass
Problem:

> One hundred people line up to board an airplane. Each has a boarding pass with
> assigned seat. However, the first person to board has lost his boarding pass
> and takes a random seat. After that, each person takes the assigned seat if it
> is unoccupied, and one of unoccupied seats at random otherwise. What is the
> probability that the last person to board gets to sit in his assigned seat?

The author offers a nice [simulation in Scheme][2] to solve this mathematical recreation, which comes from P. Winkler.[^1]

Once we get the recurrence relations, it is easy to call Mathematica to the rescue:

```wolfram
RSolve[{n*p[n] - (n - 1)*p[n - 1] == p[n - 1], p[2] == 1/2}, p[n], n]
(* {{p[n] -> 1/2}} *)
```


{{% music %}}Mirror of Haze • *Listen to the Trees*{{% /music %}}

[^1]: Peter Winkler. [Mathematical puzzles][3] (revised edition). A K Peters/CRC Press, New York, 2024

[1]: https://programmingpraxis.com
[2]: https://programmingpraxis.com/2020/07/21/lost-boarding-pass/2/
[3]: https://math.dartmouth.edu/news-resources/electronic/puzzlebook/book/book.pdf