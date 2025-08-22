---
title: "Mathematica shorthand notation"
date: 2025-08-22T10:23:40+02:00
draft: true
tags: ["mathematica"]
categories: ["2025"]
---

Like APL, J or Haskell, Wolfram comes up with a lot of shorthand notation, in addition to the prefix, postfix or infix notation. For instance, you can write `Normal[•]` or `• // Normal`, where `•` is any valid Wolfram expression. Here is a brief list of what I've collected over the years, [from](https://mathematica.stackexchange.com/questions/18393/what-are-the-most-common-pitfalls-awaiting-new-users/25616#25616) [various](https://reference.wolfram.com/language/howto/UseShorthandNotations.html) [sources](http://xahlee.info/M/WolframLang_syntax.html).

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
<tr><td><code>@@</code></td><td><code>Apply[f, •]</code></td><td>Apply list to function</td></tr>
<tr><td><code>@@@</code></td><td><code>Apply[f, •, {1}]</code></td><td>Apply list to function at first level</td></tr>
<tr><td><code>@*</code></td><td><code>Composition[f, g]</code></td><td>composition of functions, e.g. <code>f[g[x]]</code></td></tr>
<tr><td><code>/*</code></td><td><code>RightComposition[f, g]</code></td><td>right composition of functions, e.g. <code>g[f[x]]</code></td></tr>
</tbody>
</table>
</small>

{{% alert note %}}
I may update this post from time to time.
{{% /alert %}}

{{% music %}}Evanescence • _Bring Me to Life_{{% /music %}}
