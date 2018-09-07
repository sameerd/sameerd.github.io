---
layout: post
title:  "Free Water and MRI Part 1"
date:   2019-09-06 06:17:04 -0600
mathjax: true
tags: MRI
---

[Magnetic resonance imaging
(MRI)](https://en.wikipedia.org/wiki/Magnetic_resonance_imaging) is a medical
imaging technique which uses magnetic fields to look at organs in a living
body. This post describes the math behind a particular MRI imaging technique
called Diffusion Tensor Imaging (DTI). DTI is sort of like taking a bunch of
overexposed and blurry images of the _shadows_ of an object from various
angles. Then we try to apply statistical models to try to reconstruct what the
object looks like from these overexposed shadows. This is crazy but it is also
crazy cool because we can get more information this way. 

<!--more-->

### MRI

[Magnetic resonance imaging
(MRI)](https://en.wikipedia.org/wiki/Magnetic_resonance_imaging) is a medical
imaging technique which uses magnetic fields to look at organs in a living
body. Sometimes we cannot cut up someone to see what they look like on the
inside and that is when we stick them inside an MRI machine. These machines are
huge and expensive but they work on a simple principle -  _when certain atoms
are inside a large and varying magnetic field they absorb and emit radio
frequency energy which can be detected._ 

Most MRI scans try to excite the hydrogen atoms in the water and fat molecules
in your body with magnetic fields. They vary the duration and also the
direction of the magnetic fields in what is known as an `MRI sequence`. There
are many different types of sequences and they give us different images for the
same object. 

![T1 vs T2 vs PD weighting](/figure/posts/2018-09-06-free-water-mri-part-1/T1t2PD.jpg)



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

