#!/bin/bash
# Run the notebook
nohup jupyter notebook --no-browser --ip="*" & > pid

echo "Get the instance's public DNS/IP address from the AWS Management Console,"
echo "and browser to http://<instance-address>:8888"
echo "The jupter notebook will continue running after you disconnect."
echo "To kill it, run the following shell command:"
echo "\$ kill -9 `cat pid`"

