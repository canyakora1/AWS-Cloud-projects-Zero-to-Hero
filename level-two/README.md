## Building a 3 tier AWS architecture ##

![image](/level-two/images/AWS-Architecture-Diagram%20.jpeg)


**In this second project, we will be configuring a three tier AWS Architecture that comprises of:**

- One Virtual Private Cloud (VPC) in one region (e.g us-east-1)
    - the CIDR block range for your VPC, 
    - And any additional options such as DNS support or tenancy.

- Three (6) subnets which would include, one (4) private subnet and two (2) public subnets
    - Typically, we would create at least one public subnet for your web tier, and one or more private subnets for your application and database tiers.

- An Internet Gateway for public connections via the public internet.
    - Use the aws_internet_gateway resource to create an internet gateway for your VPC. This will allow resources in your public subnets to communicate with the internet.

- A public route table for the IGW (Internet GateWay)
    - Associate your public subnet with this route table, and add a default route to the internet gateway.

- Two (2) private route table for the two (2) private subnet.
    - Associate your privte subnet with this route table, and add a default route to the internet gateway.

- An ACL (Access Control List) for our three (3) subnets (This is entirely optional)

- Create security groups: Use the aws_security_group resource to create security groups for your instances. we'll need separate security groups for your web, application, and database tiers, and you'll need to specify the appropriate inbound and outbound rules for each group.

**Connect the tiers: Configure your application tier instances to connect to the database instance, using the appropriate connection string and credentials. You may also need to configure your security groups and network ACLs to allow the necessary traffic.**

These are the basic steps involved in building a three-tier AWS architecture using the AWS Management console. Depending on your specific requirements, you may need to add additional resources or configuration options. Be sure to refer to the AWS documentation for detailed guidance and best practices.

## Lessons covered ##
* Security Groups
* Network Access Control Lists (NACL)


