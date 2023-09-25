# Deploying Ec2 Instances and Load-balancer #

In this demo, I will be deploying two EC2 Instances with a bootstrap [script](/bootstrap.sh) to install and deploy an apache server that would be running inside both EC2 Instances.

## Step 1: Create a Bootstrap Script ##

Create a bootstrap script (User Data script) that installs and configures your web server. Here's an example script for installing and configuring Apache on an Amazon Linux 2 instance:

Attached a bootstrap [script](/bootstrap.sh), you can either use that or write yours.

## Step 2: Launch an EC2 Instance with the Bootstrap Script ##

* Open the AWS Management Console.
* Navigate to the EC2 service.
* Click "Launch Instance."
* Choose an Amazon Machine Image (AMI) that suits your needs (e.g., Amazon Linux 2).
* Select an instance type based on your requirements.
* Complete the instance configuration (security groups, key pair, tags, etc.).
* In the "Networking Setting" section:
    * Choose your desired VPC and subnet.
    * Enable "Auto-assign Public IP" to allow external access. (if not enabled automatically)
    * Use an existing security group or created a new one. (make sure there is http access to the public)
* In the "Advanced details" section:
    * Paste your bootstrap script into the "User Data" field.
* Under "Summary section":
    * Number of Instances: 1
* Review and launch the instance.
The instance will launch with the specified bootstrap script, which installs and configures Apache server.


## Step 3: Create an Elastic Load Balancer (ELB) ##

* In the AWS Management Console, navigate to the EC2 service.
* Under the "Load Balancing" section in the left sidebar, click "Load Balancers."
* Click "Create Load Balancer."
* Choose the type of load balancer based on your needs (e.g., Application Load Balancer).
* Configure the load balancer settings, including the VPC and availability zones.
* Configure security settings, listener settings (e.g., HTTP on port 80), and configure any SSL certificates if needed.
* Configure routing and target groups:
* Create a target group and specify the target instances (your EC2 instances).
* Configure health checks based on your application's requirements.
* Review and create the load balancer.

Step 4: Register EC2 Instances

* Once the ELB is created, register your EC2 instances with the load balancer:
    * In the EC2 console, select your instances.
    * From the "Actions" menu, choose "Instance Settings," and then "Add to Load Balancer."
    * Select the load balancer you created and specify the target group.