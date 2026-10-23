---
title: "Wolfram Arranging Plots"
date: 2026-10-09T20:13:46+02:00
draft: true
tags: ["mathematica", "dataviz"]
categories: ["2026"]
---

You can even plot a pivot table directly using `BarChart`:

```wolfram
titanic = ResourceData["Sample Tabular Data: Titanic"];
PivotTable[titanic, Mean[#age] &, "class", "sex"]
BarChart[Normal[%]]
```

{{% music %}}XXX • _XXX_{{% /music %}}
