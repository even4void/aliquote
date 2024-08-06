---
title: "Life in a few words"
date: 2022-08-09T11:07:46+02:00
draft: false
tags: ["self", "mathematica"]
categories: ["2022"]
---

Just out of curiosity, I made a quick wordcloud using Mathematica with very few normalization (capital letters, punctuation characters, stop words, short words, etc.) to summarize some personal stuff I wrote during the last 15 years or so, and I thought I will just put it right there.

{{< figure src="/img/wordcloud_poesie.png" >}}

My very basic script is shown below: (More solutions are available on [Stack Exchange].)

```mathematica
data = Import["~/Documents/home/writings/combined.txt"];
junk = {"comme", "quand", "enfin", "lorsque", "après", "jusqu",
   "sinon", "aujourd", "autour", "entre", "aussi", "toute", "petit",
   "avoir", "encore", "aurais", "étais", "avais", "juste", "leurs",
   "parce"};
cleanedData =
  StringReplace[#, RegularExpression[
       "\\b[0-9]+[/-][0-9]+([/-][0-9]+)?\\b"] -> ""] & /@
   DeleteStopwords[ToLowerCase[TextWords[data]]];
cleanedData =
  Select[Flatten[
    StringSplit[
     StringReplace[cleanedData, PunctuationCharacter -> " "]]],
   StringLength[#] > 4 && # != "comme" &];
cleanedData = DeleteCases[cleanedData, x_ /; MemberQ[junk, x]];
WordCloud[cleanedData, Disk[],
 ColorFunction -> ColorData["AtlanticColors"]]
```

<small>The sieve for junk words was quickly devised by trial and error. Nothing's perfect to be expected.</small>

{{% music %}}Bod Dylan • _Changing of the Guards_{{% /music %}}

[stack exchange]: https://mathematica.stackexchange.com/questions/2334/how-to-create-word-clouds
