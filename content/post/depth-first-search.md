---
title: "Depth first search"
date: 2026-11-23T16:36:43+01:00
draft: true
tags: ["python", "racket"]
categories: ["2026"]
---

Over at [Rosalind][1] you will find a nice explanation of the [depth-first search][2] algorithm for undirected graphs. There was a time where I solved some of Rosalind problems using Python. I recently came across this Python script which is about connected components:[^1]

```python
def cc(g):
    """
    >>> graph = [[1, 4], [0], [3, 6, 7], [2, 7], [0, 8, 9], [], [2, 10], \
                 [2, 3, 10, 11], [4, 9], [4, 8], [6, 7, 11], [10, 7]]
    >>> cc(graph)
    3
    """
    def dfs(g, t, seen):
        for v in g[t]:
            if v not in seen:
                seen.add(v)
                dfs(g, v, seen)

    seen = set()
    cnt = 0
    for v in range(len(g)):
        if v in seen:
            continue
        dfs(g, v, seen)
        cnt += 1
    return cnt
```

At that time I was using the `doctest` module, so you can either run the script
(dataset, [cc.txt][4]) or simply the doctest:

```python
if __name__ == '__main__':
    import doctest
    doctest.testmod()

    with open('cc.txt') as f:
        line = f.readline()
        n, m = [int(x.strip()) for x in line.strip().split()]
        graph = [[] for _ in range(n)]
        for edge in range(m):
            line = f.readline()
            i, j = [int(x.strip()) for x in line.strip().split()]
            graph[i-1].append(j-1)
            graph[j-1].append(i-1)

    value = cc(graph)
    print(value)
```

I was wondering how much it would take to write the same routine in Racket.

{{% music %}}XXX • _XXX_{{% /music %}}

[^1]: I also like [this algorithm][3].

[1]: https://rosalind.info
[2]: https://rosalind.info/glossary/algo-depth-first-search/
[3]: https://stackoverflow.com/a/13837045
[4]: /pub/cc.txt
