# Dynamic and Consistent Doubly Stochastic Similarity Learning for Multi-view and Multi-order Clustering （DCDS）
This is a Matlab implementation of  paper "Dynamic and Consistent Doubly Stochastic Similarity Learning for Multi-view and Multi-order Clustering", which is accepted by Pattern Recognition in 2026. 



# Usage of this code

## To reproduce  the results
Run "test_DCDS.m", the clustering results and visual graph will be reported.

## For hyperparamters
You should notice the hyperparameters. There are in total four hyperparameters for our model. $o$ is the maximum order of graph. $Z$ is the retained number of graph after adaptive selection. $\alpha$  and $\beta$ are two hyperparameters for low-rank tensor learning.

The value of $o$ and $Z$ is easy to set. In order to ensure the effectiveness of graph selection, we only need to set $o$ is relatively large and $Z$ is relatively small. For $\alpha$   and $\beta$ , we found when their values in [10,100,1000], the best clusteing performance is always achieved.


# For more  works
If you are interested at my works, you can get more papers and codes at my [Homepage](https://nianwang-hjjgcdx.github.io/).

# Citation
If you think our work is helpful,  considering to give a star for this repository. Thanks!
If you use our code or nois data sets, please kindly cite our paper by
```
@article{DCDS,
title = {Dynamic and Consistent Doubly Stochastic similarity learning for multi-view and multi-order clustering},
journal = {Pattern Recognition},
pages = {113698},
year = {2026},
issn = {0031-3203},
author = {Nian Wang and Zhigao Cui and Yanzhao Su and Aihua Li and Yuanliang Xue and Wenqi Ren},
}
```
