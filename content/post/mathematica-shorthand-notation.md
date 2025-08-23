---
title: "Mathematica shorthand notation"
date: 2025-08-23T10:23:40+02:00
draft: false
tags: ["mathematica"]
categories: ["2025"]
---

Like APL, J or Haskell, Wolfram comes up with a lot of shorthand notation, in addition to the prefix, postfix or infix notation. For instance, you can write `Normal[•]` or `• // Normal`, where `•` is any valid Wolfram expression. Here is a brief list of what I've collected over the years, [from](https://mathematica.stackexchange.com/questions/18393/what-are-the-most-common-pitfalls-awaiting-new-users/25616#25616) [various](https://reference.wolfram.com/language/howto/UseShorthandNotations.html) [sources](http://xahlee.info/M/WolframLang_syntax.html). Usually, I tend to stick to plain text expression (so called circumfix notation), i.e. `Length[{1,2,3}]` rather than `Length@{1,2,3}` or `{1,2,3}//Length`. I tend to use the `//` postfix notation for things like `Normal` or `MatrixForm`. The only exception is for pure function and `Apply` (`@@`) or `Map` (`/@`). Sometimes I combine them all, like in the example provided on Wolfram [Howto's](https://reference.wolfram.com/language/howto/UseShorthandNotations.html):

```mathematica
(#^3 + a) & /@ {1, 2, 4, 6, 5, 8}
```

Anyway, here's the list of expression that I am aware of:

<small>
<table border="0">
<tbody>
<tr>
<td><em>Expression</em></td>
<td><em>Alternative</em></td>
<td><em>Role</em></td>
</tr>
<tr><td><code>@</code></td><td><code>f[•]</code><td>function application</td></tr>
<tr><td><code>/@</code></td><td><code>Map[f, •]</code></td><td>map function to list</td></tr>
<tr><td><code>//@</code></td><td><code>MapAll[f, •]</code></td><td>map function to every subexpression</td></tr>
<tr><td><code>@@</code></td><td><code>Apply[f, •]</code></td><td>Apply list to function</td></tr>
<tr><td><code>@@@</code></td><td><code>Apply[f, •, {1}]</code></td><td>Apply list to function at first level</td></tr>
<tr><td><code>@*</code></td><td><code>Composition[f, g]</code></td><td>composition of functions, e.g. <code>f[g[x]]</code></td></tr>
<tr><td><code>/*</code></td><td><code>RightComposition[f, g]</code></td><td>right composition of functions, e.g. <code>g[f[x]]</code></td></tr>
<tr><td><code><></code></td><td><code>StringJoin[•, •]</code></td><td>concatenate string</td></tr>
<tr><td><code>/.</code></td><td><code>Replace[•, •]</code></td><td>replace expression by pattern</td></tr>
<tr><td><code>//=</code></td><td><code>ApplyTo[•, f]</code></td><td>assignment with function application</td></tr>
<tr><td><code>+=</code></td><td><code>AddTo[•, •]</code></td><td>like in C or Python</td></tr>
<tr><td><code>++</code></td><td><code>Increment[•]</code></td><td>like in C</td></tr>
<tr><td><code>/.</code></td><td><code>ReplaceAll[•, •]</code></td><td>applies a rule to transform each subpart of an expression</td></tr>
<tr><td><code>;;</code></td><td><code>Span[•, •]</code></td><td>span of elements from start to stop</td></tr>
<tr><td><code>{}</code></td><td><code>List[•]</code><td>create a list</td></tr>
<tr><td><code>#^2&[3]</code></td><td><code>Function[x, x^2][3]</code><td>example of a pure function</td></tr>
</tbody>
</table>
</small>

I don't know of any shortcut for `Thread` or `MapThread`

{{% music %}}Evanescence • _Bring Me to Life_{{% /music %}}
