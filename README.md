# GraphLab Create Benchmarks 

This repository is full of resources related to GLC benchmarks over the largest public datasets we managed to put our hands on.

These benchmarks are intended to run on top of an AWS EC2 r3.8xlarge instance (32 cores, 244 GBs of RAM, 2 SSD drives of 320 GBs each). This way you can benchmark GraphLab using a trial license and the cost of EC2 hours (rather than buying the real baremetal equipment, mind you!).

PDF instructions for launching the EC2 instance:
https://github.com/guy4261/glc_pagerank_benchmark/blob/master/commoncrawl_benchmark_ec2_instructions/guide.pdf

Script for installing Python, GraphLab Create and Jupyter
on the benchmark machine: https://raw.githubusercontent.com/guy4261/glc_pagerank_benchmark/master/install.sh


## PageRank over the Common Crawl 2012 Graph

In this benchmark, GraphLab Create would be used for
* running PageRank
* over the 3.5 billion nodes, 128 billion links of the CommonCrawl Graph
* in ~5 hours.

The *"blog post"* IPython/Jupyter Notebook explanation of this benchmark:
* Rendered version: https://github.com/guy4261/glc_pagerank_benchmark/blob/master/CommonCrawl2012PageRankBenchmarkBlogPost.ipynb
* Downloadable version: https://raw.githubusercontent.com/guy4261/glc_pagerank_benchmark/master/CommonCrawl2012PageRankBenchmarkBlogPost.ipynb

The benchmark notebook:
* Rendered version: https://github.com/guy4261/glc_pagerank_benchmark/blob/master/commoncrawl_benchmark.ipynb
* Downloadable version: https://raw.githubusercontent.com/guy4261/glc_pagerank_benchmark/master/commoncrawl_benchmark.ipynb


## Gradient Boosted Decision Trees Classification of the Criteo Terabyte Dataset

In this benchmark, GraphLab Create would be used for
* running a Gradient Boosted Decision Trees classifier
* and a Count Featurizer feature extractor
* over the 1TB clicks dataset from Criteo Labs
* In ~4 hours per iteration.

The *"blog post"* IPython/Jupyter Notebook explanation of this benchmark:
* Rendered version: https://github.com/guy4261/glc_pagerank_benchmark/blob/master/CriteoBenchmarkBlogPost.ipynb
* Downloadable version: https://raw.githubusercontent.com/guy4261/glc_pagerank_benchmark/master/CriteoBenchmarkBlogPost.ipynb

The benchmark notebook:
* Rendered version: https://github.com/guy4261/glc_pagerank_benchmark/blob/master/criteo_benchmark.ipynb
* Downloadable version: https://raw.githubusercontent.com/guy4261/glc_pagerank_benchmark/master/criteo_benchmark.ipynb

## Predictive Services Benchmark

A notebook for benchmarking the Predictive Services
[is available here](ps_benchmark.ipynb).

This is a good starting point for those who would like to actually
run a predictive service for the first time
(train a model, deploy it, query it). But it also extends to
run a stress-test on the deployed service using Apache Bench (`ab`).

