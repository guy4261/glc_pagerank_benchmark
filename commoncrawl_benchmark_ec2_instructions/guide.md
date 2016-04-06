# GraphLab Create CommonCrawl Benchmark Instructions

## Part 1: Creating an AWS EC2 Instance

### Sign In to the AWS Console
Sign In to the AWS console: [https://console.aws.amazon.com/console/home](https://console.aws.amazon.com/console/home)

You will get to the AWS Sign In screen:

![](s01_login_to_aws.png =400x)

Enter your credentials and Sign In. The next screen shows the big list of AWS services:

![](s02_aws_management_console.png =400x)

Note the top-right corner: between your account (*guy @ graphlab* in this example) and the **Support** dropdown, you should see your AWS region. In this example, the region is **Oregon**. If your region is different, click on the regions dropdown and select **US West (Oregon)**. This is the region where we stored the dato for this benchmark. If you'll use the same region as we did, then pulling the data from S3 will be much, much faster.

![](aws_regions.png =300x)

Now that your region is properly set, click on the EC2 icon (first item in first column, top-left icon.)

![](ec2_icon.png =200x)

You will be presented with the EC2 Management Console.

![](ec2_management_console.png =400x)

### Create the Instance
On the left sidebar, under ths **INSTANCES** category, choose the **Instances** option.
Click on the **Launch Instnace** button. ![](button_launch_instance.png =100x)


#### Step 1: Choose AMI
You will now follow a set of steps necessary for launching an instance. This is the screen of **Step 1: Choose an Amazon Machine Image (AMI)**.![](launch_instance_step1.png =400x)
Scroll the list of AMIs down to **Ubuntu Server** (the current version is **Ubuntu Server 14.04 LTS (HVM), SSD Volume Type - ami-9abea4fb**). Click on the **Select** button. ![](button_select.png =70x)

#### Step 2: Choose Instance Type

Scroll down the list of instance types and choose **r3.8xlarge**. That's a strong machine, with 32 cores, 244 Gigabytes of RAM, and 2 SSD drives, each sized 320 GBs.

![](launch_instance_step2.png =400x)

After you chose the type, in the breadcrumb list of steps, skip to **4. Add Storage**.

#### Step 4: Add Storage (yes, we skipped Step 3!)

![](launch_instance_step4_add_storage_16gb.png =400x)

#### Step 5: Tag Instance![](launch_instance_step5_tag.png =400x)#### Step 6: Configure Security Group![](launch_instance_step6_security_group.png =400x)![](launch_instance_step6_security_group_my_ip.png =200x)

Button
![](button_review_and_launch.png =130x)

#### Launch Your Instance!

You can review your instance's configuration. When finished, click on the **Launch** button to finally launch your instance! ![](button_launch.png =50x)

![](launch_instance_step7_key_pairs.png =400x)

But how will you connect to your instance? Upon Launch, AWS immediately asks you to
provide an SSH key pair. If you don't have such a key pair, you can choose the
**Create a new key pair** option. Give it a **Key pair name**, then click on
the **Download Key Pair** button. ![](button_download_key_pair.png =70x)

After the key pair we downloaded, click on the **Launch Instances** button. ![](button_launch_instances.png =100x)
You will get the following status screen:

![](launch_instance_status_ok.png =400x)

In my case, it says:
```The following instance launches have been initiated: i-84dea55c```
Click on the instance name (**i-84dea55c** in this example) to get to your instance's status screen.

From OS X or Linux, simply run the following command in your terminal:

![](screen_instance.png =400x)Click on the **Connect** button. ![](button_connect.png =50x)You will see AWS' instructions for connecting to your instance.
![](screen_connect_to_your_instance.png =400x)

Follow the instructions, and note the public DNS assigned to your instance
(in the example above, it is ```ec2-52-37-124-80.us-west-2.compute.amazonaws.com```).

If you are in OS X or Linux, you can connect to your instance from the shell:

```
ssh -i "/PATH/TO/DOWNLOADED/KEY_FILE.pem" ubuntu@<your-ec2-public-dns>.compute.amazonaws.com
# In my case, the command is:
ssh -i "/Users/dato/Downloads/guy_commoncrawl_benchmark.pem" ubuntu@ec2-52-37-124-80.us-west-2.compute.amazonaws.com
```

You can also follow AWS' online instructions at: 
[https://docs.aws.amazon.com/console/ec2/instances/connect/docs](https://docs.aws.amazon.com/console/ec2/instances/connect/docs)

They also have [instructions written specifically for PuTTY](https://docs.aws.amazon.com/console/ec2/instances/connect/putty), a famous Windows SSH client.

## Part 2: Installing Requirements on your InstanceNow that you are logged into your instance via ssh, run each of the following commands.

Note: pasting all the commands will only run the first one.
Please run each command separately. 
The instructions for securing the notebook server are taken from [Jupyter's website](http://jupyter-notebook.readthedocs.org/en/latest/public_server.html).

```
# Install Python, VirtualEnv
sudo apt-get update
sudo apt-get install -y build-essential python-setuptools zlib1g-dev
sudo easy_install pip
sudo pip install virtualenv

# Create a VirtualEnv for GraphLab Create
virtualenv graphlab_venv
cd graphlab_venv
source bin/activate
pip install graphlab-create
cd ~

# Install Jupyter (IPython-Notebook)
sudo apt-get install -y python-dev
pip install jupyter

# Password protect Jupyter
jupyter notebook --generate-config
python -c "from notebook.auth import passwd; password = passwd(); open('/home/ubuntu/.jupyter/jupyter_notebook_config.py', 'a').write('c.NotebookApp.password = u\'%s\'' % (password))"

# Download the Benchmark's IPython Notebook
wget <public address of the notebook>

# Run the notebook
nohup jupyter notebook --no-browser --ip="*" & > pid
```
The Jupyter server is now running. You should browse to [http://\<your instance address\>:8000](http://<your instance address>:8000) .This is what you're supposed to see in your browser:
![](jupyter_login.png =400x) 
Use the password you entered in order to log into the notebook server.

The rest of the benchmark can be executed via your browser.