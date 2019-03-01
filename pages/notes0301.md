---
layout: page
title: Discussion 5 - 03/01
description: notes, links, example code and exercises
---

<script src='https://cdnjs.cloudflare.com/ajax/libs/mathjax/2.7.5/MathJax.js?config=TeX-MML-AM_CHTML' async></script>

### split
----

In the unix shell, you can type `man split` to see the manual of split function.

Yelp data, the json file is large for a personal laptop. One option, store files sperately on the disk, and process each file once a time.

```shell
man split
split -l 100000 review_train.json
```

It will split review_train.json into small pieces, make your life much easier.

### Gradient Descent
----

- [jupyter notebook](../assets/python/SGD-discussion.ipynb)

[Wiki: gradient descent](https://en.wikipedia.org/wiki/Gradient_descent)

In general, our optimization problem can be viewd as following: we are minimizing the **Objective** function with respect to $$\theta$$:

$$\text{argmin}_{\theta}\ L(\theta , x) \quad \textbf{Objective}\ \text{function},$$

for simplicity, we only consider the class of convex function. (Only one minimal point)

**Goal**

Generate a sequence of $$\theta_{i}$$, such that

$$L(\theta_{1}, x) \ge L(\theta_{2}, x) \ge \dots \ge L(\theta_i, x) \ge L(\theta_{i+1}, x) \ge \dots$$

**Steps**

1. Calculate the gradient of objective function $$\nabla L(\theta_i)$$
2. Move to the negative direction of derivative $$-\nabla L(\theta_i)$$.
3. Update $$\theta_{i + 1}=\theta_{i}-\gamma\nabla L(\theta_{i}, x) \gamma > 0$$
4. Check whether converge. Does $$\nabla L(\theta_i)$$ close to zero? Since if it is a minimal point, $$\nabla L(\theta) = 0$$

#### Examples

The gradient descent algorithm is applied to find a local minimum of the function $$f(x)=x^{4}-3x^{3}+2$$, with derivative $$f'{(x)}=4x^{3}-9x^{2}$$. Here is an implementation is:

```python
# from wiki: https://en.wikipedia.org/wiki/Gradient_descent
# From calculation, it is expected that the local minimum occurs at x=9/4

cur_x = 3 # The algorithm starts at x=6
gamma = 0.01 # step size multiplier
precision = 0.00001
previous_step_size = 1 
max_iters = 10000 # maximum number of iterations
iters = 0 #iteration counter

ff = lambda x: x**4 - 3*x**3 + 2
df = lambda x: 4 * x**3 - 9 * x**2

xpath = []
ypath = []

while previous_step_size > precision and iters < max_iters:
    xpath.append(cur_x)
    ypath.append(ff(cur_x))
    prev_x = cur_x
    cur_x -= gamma * df(prev_x)
    previous_step_size = abs(cur_x - prev_x)
    iters+=1

print("The local minimum occurs at", cur_x)
```

#### Linear regression

Let's first start with a simple example, the coefficient estimation in linear regression (OLS)

$$Y = X\beta + \epsilon, \epsilon \sim N(0, \sigma^2 I) \quad \text{// Statistical Model}$$
    
$$\text{argmin}_{\theta} L(\beta, X) = \frac{1}{2N}(Y - X\beta)^T(Y - X\beta) \quad \text{// Negative log-likelihood}$$
    
$$= \frac{1}{2N} (Y^TY - 2Y^TX\beta + \beta^T X^T X \beta)$$

$$N$$ is the sample size

- OLS exact solution: $$\hat{\beta} = (X^TX)^{-1}X^TY$$
- Gradient descent:

$$\nabla L(\beta_i , X) = \frac{-X^T(Y - X \beta_i)}{N} = \frac{-X^T Y + X^TX\beta_i}{N}\quad \text{// Gradient of } \beta_i$$

$$\theta_{i + 1} = \beta_i -\gamma\nabla L(\beta_i, x) \quad \text{// Update step}$$

$$\text{Check }\nabla L(\beta_i, X)$$

##### Data

We use a simple example to perform the task. Here we set `N = 100000` and `p = 5`. 

$$\beta = \begin{bmatrix} 1\\ 2\\ 3\\ -2\\ -3\end{bmatrix} \quad \text{True}$$

$$X \sim N(0, I)$$

```python
N = 100000
p = 5
beta_true = np.array([1., 2.0, 3.0, -2.0, -3.0])
x = np.random.randn(N, p)
y = x @ beta_true + np.random.randn(N)

def lm(X, y):
    return np.linalg.inv(X.T @ X) @ X.T @ y

lm(x, y)
```

##### GD for linear regression

Let's first define function `loss`, `derivative`. 

**Please** note here, these implementations are not smart, some of the computations are duplicated. 
You can easily make it much faster by moving some lines around. :)

```python
def loss(beta, x, y):
    N = len(y)
    xtx = x.T @ x # c
    xty = x.T @ y # c
    yty = y.T @ y # c
    return (yty - 2 * beta.T @ xty + beta.T @ xtx @ beta) / (2 * N)

def derivative(beta, x, y):
    N = len(y)
    xtx = x.T @ x # c
    xty = x.T @ y # c
    return (-xty + xtx @ beta) / N

```

```python
def gdescent_lm(init, x, y, derivative, loss,
                precision = 0.001, gamma = 0.001,
                previous_step_size = 1, max_iters = 10000):
    
    cur_x = init # Initial points
    loss_path = [loss(cur_x, x, y)]
    
    iters = 1 #iteration counter
    
    while previous_step_size > precision and iters < max_iters:
        
        delta = #write yourself, step
        cur_x = #update as new step
        
        previous_step_size = np.linalg.norm(delta, ord=2) # check step size
        
        cur_y = loss(cur_x, x, y)
        
        if cur_y > loss_path[-1]:
            print("Current stepsize {} maybe too large, change to {}".format(gamma, gamma * 0.9))
            gamma *= 0.9
        
        iters += 1
        
        if iters % 50 == 0:
            print("Current iteration: {}".format(iters))
        
        loss_path.append(cur_y)

    return cur_x, loss_path, iters
```

#### Stochastic Gradient Descent

`@` is a very expensive step, also `.T` in the gradient evaluation. Because it involves summation of **all the data points**. 

Stochastic gradient descent only evaluate one data point at once or a batch ($$\ll N$$) of data points at once, so that it will lower the cost of summation overall all the data. 

##### Steps:

1. Set batch i = some numbers. The batch means a chunk of (x, y) where the batch size usually $$\ll N$$
2. Calculate the gradient $$\nabla L(\theta_i, X_{\text{batch i}})$$
3. Move the negative step of the $$-\gamma\nabla L(\theta_i, X_{\text{batch i}})$$
4. Update $$\theta_{i + 1} = \theta_i -\gamma\nabla L(\theta_i, X_{\text{batch i}})$$
5. Check convergence
6. get another batch, go back to step 1

```python
def sgd_lm(init, x, y, derivative, loss, 
           batchSize = 500, epoch = 10,
           precision = 0.001, gamma = 0.001,
           previous_step_size = 1):
    N = len(y)
    if N < batchSize:
        print("Current sample size: {}, batch size: {}\nUpdate batch size to 10% samples: {}".format(N, batchSize, N // 10))
        batchSize = N // 10
    
    cur_x = init
    e = 0 ## Start from first epoch
    indexN = np.arange(N)
    print(loss_path)
    while e < epoch and previous_step_size > precision:
        
        np.random.shuffle(indexN) ## give a random sequence of index
        parts = np.array_split(indexN, N // batchSize)
        cur_y = 0
        preloss = loss_path[-1] 
        for index in parts:
            delta = #write yourself
            cur_x = #write yourself
            curloss = loss(cur_x, x[index,], y[index]) 
            cur_y += curloss * len(index)
            
            
            if curloss > preloss:
                # print("Current stepsize {} maybe too large, change to {}".format(gamma, gamma * 0.99))
                gamma *= 0.99
            loss_path.append(curloss)
        #loss_path.append(cur_y / N)
        
        previous_step_size = np.linalg.norm(delta, ord=2)
        print("Finished epoch: {}".format(e))
                
        e += 1
    return cur_x, loss_path, e
```

### Practice

How to perfom this in ridge regression?

Other optimizer: [Admm](http://stanford.edu/~boyd/admm.html), [CS231n-parameters update](http://cs231n.github.io/neural-networks-3/#sgd)

---

