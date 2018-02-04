+++
title = "lost+found 2011"
date = 2012-01-01T21:17:32+01:00
draft = false

tags = ["misc"]
categories = []

[header]
image = ""
caption = ""
preview = true

+++


## A short implementation of the `shuf` program for Mac OS X.
<small>(August 2011)</small>

Based on a solution posted on Stack Overflow.

<!--more-->

```perl
use List::Util 'shuffle';

@list = <STDIN>;
@shuffled = shuffle(@list);
$n = $#ARGV+1 == 1?$ARGV[0]-1:$#shuffled;
print @shuffled[0..$n];
```

## Testing Mahout
<small>(August 2011)</small>

```
[INFO] ------------------------------------------------------------------------
[INFO] Reactor Summary:
[INFO] 
[INFO] Apache Mahout ..................................... SUCCESS [18.464s]
[INFO] Mahout Build Tools ................................ SUCCESS [11.130s]
[INFO] Mahout Math ....................................... SUCCESS [34.161s]
[INFO] Mahout Core ....................................... SUCCESS [1:06:19.256s]
[INFO] Mahout Integration ................................ SUCCESS [2:45.826s]
[INFO] Mahout Examples ................................... SUCCESS [1:29.287s]
[INFO] Mahout Release Package ............................ SUCCESS [0.026s]
[INFO] ------------------------------------------------------------------------
[INFO] BUILD SUCCESS
[INFO] ------------------------------------------------------------------------
[INFO] Total time: 1:11:39.255s
[INFO] Finished at: Sat Aug 06 01:59:43 CEST 2011
[INFO] Final Memory: 25M/97M
[INFO] ------------------------------------------------------------------------
```
