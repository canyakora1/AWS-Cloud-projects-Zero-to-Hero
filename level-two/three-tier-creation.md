## Building a three (3) tier architecture on AWS ##

# Resource Creation:

We will be creating:
- A Custom VPC
- 6 Subnets .i.e two public subnets and four (4) private subnets
- One Public route table and four (4) private route table for each private subnets

Click [here](/level-two/images/AWS-Architecture-Diagram%20.jpeg) to see what we will be configuring on AWS

# Step One:
* Go to the search box and type "VPC"
* You will be brought to the VPC Dashboard, Click "create VPC"
* On the VPC create screen, click the  "VPC and more" radio button 

**You can click the "Auto-generate" icon to auto-populate subnet names, route-table names and Igw**

For the projects requirements, we should have:
* Cidr block, I'll use the defaults, 10.0.0.0/16
* Default tenancy
* Number of Availability zones: 2
* Number of public subnets: 2
* Number of private subnets: 4
* Nat Gateway: None
* VPC endpoints: None
* Remember to check "Enale DNS hostnames" and "Enable DNS resolution" if unchecked.

[image2](/level-two/images/dcgmedia-vpc.png)

* Click create VPC

**Wait till your resources are fully created before proceeding**

[image3](/level-two/images/view-vpc.png)

* Click view VPC