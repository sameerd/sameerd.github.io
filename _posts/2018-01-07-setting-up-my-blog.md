---
layout: post
title:  "Setting up my Blog!"
date:   2018-01-07 06:17:04 -0600
mathjax: true
tags: blog
---

I'm trying to setup a blog with with many moving parts : `jekyll`, `blogdown`,
`mathjax`, `R`, `python`, `jupyter`, `github-pages`. I'm optimistic that if I
keep it simple they will all play well together. Time will tell..

<!--more-->

### Mathjax
Lets test out [mathjax](https://www.mathjax.org) so that `LaTeX`  equations
will render in a browser. 

$$ \sum_{n=1}^{\infty} \frac{1}{2^n} = 1. $$

Here is a test of mathjax inline \\( e^{i\pi} + 1 = 0 \\).

### Syntax highlighting

Let's try out `R` syntax highlighting

```R
# Testing hello world
library(MASS)
x <- "This is a string : Hello world!"
print(x)
```


How about `python` syntax highlighting
```python
# Testing hello world
import datetime
x = "This is a string : Hello world!"
print(x)
```

