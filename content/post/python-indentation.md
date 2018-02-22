+++
title = "Python and significant indentation"
description = ""
date = 2010-04-17T17:58:11+01:00
draft = false
tags = ["python"]
categories = []
+++

I don't really like significant indentation, as implemented in [Python][Python]. A good starting point for discussion can be found here: http://www.secnetix.de/olli/Python/block_indentation.hawk, but for the time being I will rather focus on the way indentation pattern is checked within Python. It is worth remembering that both tabs and soft wrap will honor the definition of a correct indentation level. According to the reference documentation, but see also [PEP 8][PEP 8]:

> Leading whitespace (spaces and tabs) at the beginning of a logical line is used to compute the indentation level of the line, which in turn is used to determine the grouping of statements. First, tabs are replaced (from left to right) by one to eight spaces such that the total number of characters up to and including the replacement is a multiple of eight (this is intended to be the same rule as used by Unix). The total number of spaces preceding the first non-blank character then determines the line’s indentation. Indentation cannot be split over multiple physical lines using backslashes; the whitespace up to the first backslash determines the indentation.
>
> - http://docs.python.org/reference/lexical_analysis.html#indentation

For example, the following snippet is correctly indented:

```python
def perm(l):
# Compute the list of all permutations of l
if len(l) <= 1:
  return [l]
r = []
for i in range(len(l)):
  s = l[:i] + l[i+1:]
  p = perm(s)
  for x in p:
    r.append(l[i:i+1] + x)
return r
```

About balancing indentation, a colleague of mine lets me realize that in fact Python is just storing (I assume this is done with a stack) a counter for the number of leading spaces. For example, we could have something like `[24466442]` which actually reflects the following code structure:

```
  ..
  ....
  ....
  ......
  ......
  ....
  ....
  ..
```

Here is a short solution to the *balanced parentheses* problem. This is taken litterally from Miller and Ranum, *Problem Solving with Algorithms and Data Structures using Python*, 2006. The complete <i class="fa fa-file-code-o fa-1x"></i> [source code][source code] can be downloaded.

```python
class Stack:
  def __init__(self):
    self.items = []
  def isEmpty(self):
    return self.items == []
  def push(self, item):
    self.items.append(item)
  def pop(self):
    return self.items.pop()
  def peek(self):
    return self.items[len(self.items)-1]
  def size(self):
    return len(self.items)
  
def parChecker(symbolString):
  s = Stack()
  balanced = True
  index = 0
  while index < len(symbolString) and balanced:
    symbol = symbolString[index]
    if symbol in "([{":
      s.push(symbol)
    else:
      if s.isEmpty():
        balanced = False
      else:
        top = s.pop()
        if not matches(top,symbol):
          balanced = False
    index = index + 1
  if balanced and s.isEmpty():
    return True
  else:
    return False
			
def matches(open,close):
  opens = "([{"
  closers = ")]}"
  return opens.index(open) == closers.index(close)
```

Now, you understand why I don't like significant indentation: You have to read your code one line after the other to be sure that block are well formed, especially with complex `if`-`else` statements like the ones above.

Here are examples of use of these functions:

```
>>> st1 = '((()))'
>>> parChecker(st1)
True
>>> st2 = '((()()))'
>>> parChecker(st2)
True
>>> st3 = '((()(()))'
>>> parChecker(st3)
False
```

Obviously, this code can be adapted to count the number of spaces without much effort.

[Python]: http://www.python.org "Python" 
[PEP 8]: http://www.python.org/dev/peps/pep-0008/ "PEP 8"
[source code]: http://www.aliquote.org/pub/par_checker.py