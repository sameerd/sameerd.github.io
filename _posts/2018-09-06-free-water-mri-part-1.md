---
layout: post
title:  "Free Water and MRI Part 1"
date:   2018-09-06 06:17:04 -0600
mathjax: true
tags: MRI
---

# Writing in progress...

[Magnetic resonance imaging
(MRI)](https://en.wikipedia.org/wiki/Magnetic_resonance_imaging) is a medical
imaging technique which uses magnetic fields to look at organs in a living
body. This post describes the math behind a particular MRI imaging technique
called Diffusion Tensor Imaging (DTI). DTI is used to map the structure of the
brain by measuring how restricted the water molecules are in their local
environment. It is a clever technique as it relies on taking a bunch of
overexposed images from many different directions and then using a statistical
model to try and recover what the water molecules are doing. If we can figure
out how the water molecules move, we get an idea of the local environment that
the water molecules are in and thus build a map of the brain. 

<!--more-->

### Magnetic Resonance Imaging (MRI)

<a title="By KieranMaher at English Wikibooks [Public domain], via Wikimedia Commons" href="https://commons.wikimedia.org/wiki/File:T1t2PD.jpg"><img width="512" alt="T1t2PD" src="https://upload.wikimedia.org/wikipedia/commons/0/03/T1t2PD.jpg#img-center"></a>

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

The image above has different weighting schemes (T1, T2, and PD) which show the
same region of the brain. See how the images look very different as the
different MRI sequences bring different structures of the brain into focus. 

### Diffusion Weighting

Diffusion weighting differs the weighting schemes above to give images that are
overexposed and then tries to use statistics to reconstruct an image. 

Here is an analogy. Suppose we have to design an algorithm to look at a picture
of a soccer player playing a soccer game. We want the algorithm to look at this
single picture and tell us whether the player runs around alot or doesn't run
around much.  This would be almost impossible to do using a single picture -
wouldn't it? If we were able to take multiple pictures in sequence of the same
player in action we could get something similar to video and then it would be
an easier task.  But what if you were forced to only use a single picture to
make this decision.  One thing you could do would be to lengthen the exposure
the single picture you take. If the player is running around alot then you
should see a streak across your overexposed image. If the player is mostly
standing in a single spot then the overexposed image will appear blurry but you
should mostly be able to detect the player at a single location.  ![Running
Fast -
https://www.flickr.com/photos/artant/3247451570](/figure/posts/2018-09-06-free-water-mri-part-1/blurry_runner.jpg#img-floatright
"Copyright CC BY-NC-ND 2.0") This is quite a clever idea and using statistics
we can make guesses about how the player is moving. This is analogous to what
Diffusion imaging is doing to figure out how the water molecules are moving in
the brain.

The math here depends on complicate physics (which I do not understand) however
the final answers are easy to understand and interpret. For a given `voxel` (3d
version of a pixel), we have the following formula that relates the signal
for a short exposure \\(S_0\\) to a signal with a longer exposure \\(S_t\\). 

$$\frac{S_t}{S_0} = exp(-b ADC). $$

Here the \\(b\\) term depends on the direction of the pulse, the time duration
of the pulse, the time duration between two pulses, the strength of the pulse
etc.  All these can be fixed and so for a given sequence we can gather all
those terms into a constant \\(b\\). The \\(ADC\\) term is also a constant and
is called the _apparent diffusion coefficient_. It can be estimated if we
know the values of \\(S_t\\), \\(S_0\\) and \\(b\\). 

<a title="By Jian-Min Shen, Xian-Wu Xia, Wu-Gen Kang, Jian-Jun Yuan and Liang Sheng [CC BY 2.0]" href="https://commons.wikimedia.org/wiki/File:Cerebral_infarction_after_4_hours_on_ADC_MRI.jpg"><img width="128" alt="Cerebral infarction after 4 hours on ADC MRI" src="https://upload.wikimedia.org/wikipedia/commons/f/f3/Cerebral_infarction_after_4_hours_on_ADC_MRI.jpg#img-floatright"></a>

There is greater loss of signal with the long exposures \\( S_t < S_0 \\) and
so the left hand side of the equation above is between 0 and 1. This gives us a
map of ADC values at every voxel and we can plot that to get a diffusion
weighted image.  (see the image on the right) This is something new and
interesting and gives us different information from just the short exposures.

The diffusion coefficient of water at body temperature is \\( d = 3 x 10^{-3}
mm^2/s  \\). `Free water` is water that is not restricted by surrounding
tissue. If we have a voxel that contains free water then we will probably get
an _ADC_ value for that voxel that is close to the diffusion coefficient of
water. 

### Diffusion Tensor Imaging (DTI)

Diffusion tensor imaging extends this concept of an _apparent diffusion
coefficient_ to three dimensions. This will tell us how the diffusion is
happening in 3D space.  Here we let \\(b\\) be a constant that depends on the
pulse strength, duration and timing between pulses but we do not let it depend
on the gradient direction. It is a constant for a given pulse sequence and it
can be calculated quite precisely. We now have a slightly different formula for
the signal decay. 

$$\frac{S_t}{S_0} = exp(-b q^T D q). $$

Here, just like before, \\( S_t \\) and \\( S_0 \\) are the signal intensities
for the long exposure and the short exposure respectively. \\(q\\) is now a 3x1
vector that represents the direction of the pulse (gradient). \\( D \\) is now
a 3x3 positive definite symmetric matrix that generalizes the apparent
diffusion coefficient.  

Now, instead of trying to estimate one ADC coefficient per voxel we need to
estimate a whole 3x3 matrix \\(D\\) for each voxel. 

$$ D = \begin{bmatrix} D_{xx} & D_{xy} & D_{xz} \\ D_{xy} & D_{yy} & D_{yz} \\
D_{xz} & D_{yz} & D_{zz}\end{bmatrix} $$

Since the 3x3 matrix is symmetric we only need to estimate 6 values instead of 9. 
Also, we have the additional problem of making sure that the values we
estimate form a positive definite matrix i.e. \\(q^T D q > 0 \\) for all
non-zero values of q.

We know what \\(b\\) is and also the value of \\(S_0\\). If we have atleast 6
different values of \\(q\\) and have the corresponding values of \\(S_t \\),
then we can estimate \\(D\\) via regression and a system of equations. Making
sure that the answer is positive definite is a harder and will require
constraints on the solutions. 

If we have a voxel with water unconstrained by surrounding tissue then we
expect $$D = d I $$ where \\(d = 3 x 10^{-3} \\) and I is an identity 3x3
matrix.

### Free water Elimination 

One problem we have is that voxels are quite large in practice (2mm x 2mm x
2mm) isn't uncommon. This is large enough that the diffusion coefficient inside
the voxel isn't homogenous. There might be a mixture of free water and tissue
in that voxel and we need to figure out how to estimate how much free water and
how much tissue. 

$$\frac{S_t}{S_0} = f * exp(-b q^T D q) + (1 - f) * exp(-b d). $$

Here all the symbols mean the same as above and the only new symbol is \\(f\\)
which measure the volume fraction of this voxel that is made up of tissue. Now
if we can find out what the value of $f$ is and also find the value of \\(D\\)
then we can figure out how much free water \\( 1-f \\) is contained in each
voxel. 

If you have just one value of \\(b\\) then it is hard to estimate \\(f\\) and
\\(D\\) as many solutions are likely to fit the equations. Choosing among them
is hard. There are two approaches. 
1. *Multi-shell* diffusion tensor imaging - where we vary the sequences of
   pulses and so have different values of b. This reduces the number of
   solutions down to 1 again. However this is more expensive and takes more time
   in the MRI machine.  
2. *Single-shell* diffusion tensor imaging with *constraints* - where we put
   constraints on the possible solutions and reduce it down to one again. Of
   course, we have the additional problem of trying to figure out whether the
   solution we have is accurate or not as in most cases there is no ground truth. 

In the next post we will look at some of the math behind a single shell free
water elimination model. 


### References

1. [Wikipedia - Magnetic Resonance Imaging](https://en.wikipedia.org/wiki/Magnetic_resonance_imaging)
1. [Wikipedia - Diffusion MRI](https://en.wikipedia.org/wiki/Diffusion_MRI)
1. [Free Water elimination and Mapping from Diffusion MRI - Pasternak et al. 2009](https://onlinelibrary.wiley.com/doi/epdf/10.1002/mrm.22055)

