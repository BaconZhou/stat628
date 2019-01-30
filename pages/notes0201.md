---
layout: page
title: Discussion 2 - 02/01
description: notes, links, example code and exercises
---

<script type="text/javascript" src="http://cdn.mathjax.org/mathjax/latest/MathJax.js?config=TeX-AMS-MML_HTMLorMML"></script>

## Module 1 presentation

**I recommend to use PPT or PDF for you presentation. Easier for my laptop to present your group work.**

## Jupyter notebook
---------------------

Jupyter has lots of cool features, in this discussion, we are get familiar with Python language.

Please check this [post](http://arogozhnikov.github.io/2016/09/10/jupyter-features.html?utm_content=bufferb0c6b&utm_medium=social&utm_source=twitter.com&utm_campaign=buffer) about features of Jupyter notebook. You can download the notebook from [here](https://github.com/arogozhnikov/arogozhnikov.github.io/tree/master/notebooks)

**First try some basic python**

### Anaconda

[Download](https://www.anaconda.com/download/)

**SKIP** if you already have jupyter notebook

1. **SKIP** if you have anaconda, Download anaconda with Python3.7

2. Open anaconda, go to *Environments*, create a new enviroments call `stat628` with R kernel, and Python3.7
![](../assets/video/create_env.gif)

3. Go to home, install **Jupyter notebook** or **Jupyter lab**
![](../assets/video/install_jupyter.gif)

4. Launch jupyter
![](../assets/video/launch_jupyter.gif)

Start your jupyter notebook

### library or module

In R we call `library` package, in python we call `import` module

| R                              | Python                              |
| :----------------------------- | :---------------------------------- |
| install.packages()             | pip install (bash)                  |
| library(ggplot2)               | import pandas                       |
| ggplot2::ggplot                | from pandas import DataFrame        |
| source('script.R')             | import script                       |
| ...                            | ...                                 |
|--------------------------------|-------------------------------------|
|                                |                                     |
{: rules="groups"}

In R, we use `install.package()` in the `R` console to install packages. In python, we can use [`pip`](https://pip.pypa.io/en/stable/user_guide/#running-pip) to install python packages. 

```shell
# shell
pip install numpy
```

or 

```python
# Python
import pip
pip.main(['install', 'numpy'])

import numpy
import pandas as pd
```

```R
# R
install.packages('ggplot2')
library(ggplot2)
```

**You can choose python or R kernel in your jupyter notebook**


## Practice questions
--------------------

Downloads

- [Python notebook](../assets/notebooks/dis2_python.ipynb)
- [R notebook](../assets/notebooks/dis2_R.ipynb)

### Linear regression

$$y \sim N(X\beta, \sigma^2) $$

$$\hat{\beta} = argmin_{\beta} ||Y - X\beta||^2$$

**Questions**:
    
1. What are the basic assumptions for linear regression
2. What are the consistent estimators for $$\beta$$ and $$\sigma^2$$
    
**Practice**: Python version
    
1. Generate a dataset $$X\sim N(0, 1)$$, with 300 observations, dimensions is 3.   
    Use `numpy.random.randn` or call `np.random.randn`. [More distributions](https://docs.scipy.org/doc/numpy-1.15.0/reference/routines.random.html)
2. Set $$\beta = (1, 2, 3)$$ and set $$\sigma^2 = 1$$
3. Generate $$y \sim N(X\beta, \sigma^2)$$
4. Create a function `lm`, and give the estimates $$\hat{\beta}_{lm}$$, $$var(\hat{\beta}_{lm})$$ and $$\hat{\sigma}$$


### [Ridge regression](https://newonlinecourses.science.psu.edu/stat508/lesson/5/5.1)

**Questions**:


1. If you have too many predictors, what are the problems?
2. How do you solve it? List at least 3 methods.
3. What are the properties these methods?

**Programming**:

1. Implement a function ridge, which is used to solve ridge regression problem

$$\hat{\beta}_{ridge} = argmin_{\beta} ||Y - X\beta||^2 + \lambda ||\beta||^2$$

2. Give the estimates of $$\hat{\beta}_{ridge}$$ and $$var(\hat{\beta}_{ridge})$$
3. Consider what is the relationship between $$\beta_{lm}$$ and $$\beta_{ridge}$$
4. What if $$X'X$$ is an orthogonal matrix?
5. What is the equivalent Bayesian formulation?
