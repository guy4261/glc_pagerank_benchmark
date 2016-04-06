#!/bin/bash

# Install Python, VirtualEnv, GraphLab Create inside VirtualEnv
sudo apt-get update
sudo apt-get install -y build-essential python-setuptools zlib1g-dev
sudo easy_install pip
sudo pip install virtualenv
virtualenv graphlab_venv
cd graphlab_venv
source bin/activate
pip install graphlab-create
cd ~

# Install Jupyter (IPython-Notebook)
sudo apt-get install -y python-dev
pip install jupyter

# Download the commoncrawl benchmark notebook
wget https://raw.githubusercontent.com/guy4261/glc_pagerank_benchmark/master/commoncrawl_benchmark.ipynb

# Run the notebook
nohup jupyter notebook --no-browser --ip="*" & > pid

echo "Get the instance's public DNS/IP address from the AWS Management Console,"
echo "and browser to http://<instance-address>:8888"
echo "The jupter notebook will continue running after you disconnect."
echo "To kill it, run the following shell command:"
echo "\$ kill -9 `cat pid`"
