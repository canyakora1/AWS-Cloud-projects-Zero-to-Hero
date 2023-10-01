# Deploying a wordpress site on ec2 Instances and enabling load balancers

Just like in the [level-three](/level-three/README.md) demo exercise, where we deployed an ec2 Instance with a user-data script that would install apache and load a basic html website. A load balancer was also deployed for load distribution, fault tolerance and security.

This week, we will use the same logic and configure a WordPress website that would be deployed on two (2) ec2 Instances using user-data and a load balancer configured on the target group.

**We will use the same configurations as the one used for level-three demo**

Attached a bootstrap [script](/level-four/bootstrap-wordpress.sh), you can either use that or write yours.

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

**There would be a slight change from the previous configurtion, as we will be deploying two ec2 instances in two different availability zones**

Pick any two (2) separate AZ's in any particular region (e.g. us-east-1) and deploy your ec2 instances (e.g. us-east-1a and us-east-1b)

**Make sure your word-press site is fully functional on both ec2 instances.**
Copy the public IP address of the instances and paste in your browser, click send and make sure the wordPress default page shows up. Confirm that before proceeding to the next step.


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

## Step 4: Register EC2 Instances ##

* Once the ELB is created, register your EC2 instances with the load balancer:
    * In the EC2 console, select your instances.
    * From the "Actions" menu, choose "Instance Settings," and then "Add to Load Balancer."
    * Select the load balancer you created and specify the target group.