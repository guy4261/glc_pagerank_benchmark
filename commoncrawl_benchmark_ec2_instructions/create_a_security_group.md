### Create a Security Group

In AWS, EC2 instances are assigned a security group. Without getting into details, this is equivalent to a set of firewall rules. We will need to login to our EC2 machine via SSH, and also to use IPython Notebook. So let's create an appropriate Security Group. In the left sidebar, under the NETWORK & SECURITY section, choose the **Security Groups** option.
 
Click on the **Create Secutiy Group** button. ![](button_create_security_group.png =100x)

The **Create Security Group** screen will appear.
![](create_security_group_beginning.png =400x)

Fill the inbound rules accordingly:

**Inbound:** add rules of the types **SSH, HTTP, HTTPS**, and another rule of type **Custom TCP Rule**, for which you should choose the port 8888 (defualt port of IPython Notebook). You can choose **Anywhere** as the source of all rules (this will appear as 0.0.0.0/0).
 
<table>
	<tr>
		<th>Type</th>
		<th>Protocol</th>
		<th>Port Range</th>
		<th>Source</th>
	</tr>
	<tr>
		<td>HTTP</td>
		<td>TCP</td>
		<td>80</td>
		<td>0.0.0.0/0</td>
	</tr>
	<tr>
		<td>HTTPS</td>
		<td>TCP</td>
		<td>443</td>
		<td>0.0.0.0/0</td>
	</tr>
	<tr>
		<td>SSH</td>
		<td>TCP</td>
		<td>22</td>
		<td>0.0.0.0/0</td>
	</tr>
	<tr>
		<td>Custom TCP Rule</td>
		<td>TCP</td>
		<td>8888</td>
		<td>0.0.0.0/0</td>
	</tr>	
</table>

![](create_security_group_inbound.png =400x)

**Outbound:** By default, All traffic should be allowed on all protocols, all port ranges and all destination IPs (0.0.0.0/0). Change this if this is not the situation.

<table>
	<tr>
		<th>Type</th>
		<th>Protocol</th>
		<th>Port Range</th>
		<th>Destination</th>
	</tr>
	<tr>
		<td>All traffic</td>
		<td>All</td>
		<td>All</td>
		<td>0.0.0.0/0</td>
	</tr>
</table>
![](create_security_group_outbound.png =400x)
When done adding all the rules, click on the **Create** button. ![](button_create.png =50x)
You are done creating the Security Group required for your instance.