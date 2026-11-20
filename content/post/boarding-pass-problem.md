---
title: "Boarding pass problem"
date: 2026-11-11T20:13:56+01:00
draft: false
tags: ["math", "recreations", "mathematica"]
categories: ["2026"]
---

Over at [Programming Praxis][1], the author once asked about the Boarding Pass
Problem:

> One hundred people line up to board an airplane. Each has a boarding pass with
> assigned seat. However, the first person to board has lost his boarding pass
> and takes a random seat. After that, each person takes the assigned seat if it
> is unoccupied, and one of unoccupied seats at random otherwise. What is the
> probability that the last person to board gets to sit in his assigned seat?

The author offers a nice [simulation in Scheme][2] to solve this mathematical
recreation, which comes from P. Winkler.[^1]

Once we get the recurrence relations, it is easy to call Mathematica to the
rescue:

```wolfram
RSolve[{n*p[n] - (n - 1)*p[n - 1] == p[n - 1], p[2] == 1/2}, p[n], n]
(* {{p[n] -> 1/2}} *)
```

Here's a more direct and brute force approach, using a Monte Carlo simulation:

```wolfram
SeedRandom[101];
simulate[n_] := Module[{xs = ConstantArray[False, n], value},
  xs[[RandomInteger[{1, n}]]] = True;
  Do[
    If[!xs[[i]],
      xs[[i]] = True,
      value = RandomChoice[Flatten[Position[xs, False]]];
      xs[[value]] = True
    ],
    {i, 2, n - 1}
  ];
  !xs[[n]]
]
```

Here's the result on 10,000 trials:

```wolfram
N[Mean[Boole[Table[simulate[100], {10000}]]]]
(* 0.5095 *)
```

For the interested reader, see also [The lost boarding pass, and other practical
problems][4] by Geoffrey R. Grimmett and David R. Stirzaker. David Robinson
wrote a [simulation in R][5] as well.

{{% music %}}Mirror of Haze • *Listen to the Trees*{{% /music %}}

[^1]: Peter Winkler. [Mathematical puzzles][3] (revised edition). A K Peters/CRC
    Press, New York, 2024

[1]: https://programmingpraxis.com
[2]: https://programmingpraxis.com/2020/07/21/lost-boarding-pass/2/
[3]: https://math.dartmouth.edu/news-resources/electronic/puzzlebook/book/book.pdf
[4]: https://arxiv.org/abs/1910.02515
[5]: http://varianceexplained.org/r/boarding-pass-simulation/
