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
called Diffusion Tensor Imaging (DTI). DTI is used to map the structure of the
brain by measuring how restricted the water molecules are in their local
environment. It is a clever technique as it relies on taking a bunch of
overexposed images from many different directions and then using a statistical
model to try and recover what the water molecules are doing. 

<!--more-->

### MRI

[Magnetic resonance imaging
(MRI)](https://en.wikipedia.org/wiki/Magnetic_resonance_imaging) machines are
huge and expensive but they work on a simple principle -  _when certain atoms
are inside a large and varying magnetic field they absorb and emit radio
frequency energy which can be detected._ 

Most MRI scans try to excite the hydrogen atoms in the water and fat molecules
in your body with magnetic fields. They vary the duration and also the
direction of the magnetic fields in what is known as an `MRI sequence`. There
are many different types of sequences and they give us different images for the
same object. 

![T1 vs T2 vs PD weighting](/figure/posts/2018-09-06-free-water-mri-part-1/T1t2PD.jpg)


### Analogy for Diffusion Imaging

Here is an analogy to what Diffusion imaging is trying to do. Suppose we have
to figure out what is going on in a soccer game by only using photographs from
a bunch of cameras. These are special cameras that can take exactly one
photograph. Once we take a photograph it takes some time for us to walk over to
the next camera to take the next photograph. How do we set these cameras up to
figure out _which players run up and down the field and which players
stay in their zone_.

Say we set these cameras up at the periphery of the soccer field and walk
around it taking one photograph per camera. We will get several snapshots of
the soccer game in progress. However, using just the snapshots, it is hard to
figure out who is running up and down the field and who is saying put in a
zone. We could get some information. For example, if we see a player in some
pictures in roughly the same place this does mean that they are likely to be
staying in their zone. Likewise if we see a player in different places it does
mean that they are likely to be moving around. 

It would be nice if we had video to see what was going on. Each camera can only
take one picture, however video is just a series of still images taken
sequentially. We could set up one camera and take a picture and then set up the
next camera in the same place and take a picture and so on. We will get video
from a certain direction and this will help however it is not so easy to figure
out what is going on in the places that the video doesn't point to. So lets
take video from multiple vantage points. Unfortunately that is impossible
because we can only use one camera at a time.

What we do is lengthen the exposure on each camera so that it takes an
overexposed image. This will be blurry and also since the players are moving
about they will show up as streaks on the overexposed image. Since we have
images from different directions we can sort of infer how the players are
moving. The players that run up and down the field will show up as a little
blurry on images that came from the short end of the field. However they will
show up as very burry and as streaks on images that taken from the long end of
the field. Also the players that mainly stay in one place won't show up as
streaks on any images and will look a little blurry on all the images. 

Using statistics we can make guesses about how the players are moving. This is
analogous to what Diffusion Tensor imaging is doing to figure out how the water
molecules are moving in the brain.


### References

1. [Wikipedia - Magnetic Resonance Imaging](https://en.wikipedia.org/wiki/Magnetic_resonance_imaging)


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

