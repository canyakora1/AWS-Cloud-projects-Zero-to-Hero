## Configuring Security groups and NACL ##

So far we have been able to deploy our Virtual private networks with cidr range 100.0.0.0/16, attached an Internet gateway to the VPC, created 6 subnets, two public subnets and four private subnets 

# Internet Gateway #

Our Internet gateway should be already to be attached to the custom VPC we created earlier, if not.
- click the radio button beside the VPC name and 
- Seclect "Action" tab at the top right of your screen and click "Attach to VPC"
- Choose which VPC you want the Internet gateway to be attached and select attach.
![igw]()

# Network Access Control List #
* Stateless: NACLs are stateless, meaning they do not keep track of the state of active connections. Each rule in a NACL applies independently to incoming or outgoing traffic.

* Rule Evaluation Order: Rules in a NACL are evaluated in numerical order, starting with the lowest rule number. AWS evaluates all rules for a subnet's inbound or outbound traffic and takes the action of the first matching rule.

* Allow and Deny Rules: NACLs allow you to create both allow and deny rules. You can use deny rules to explicitly block certain traffic while using allow rules to permit specific traffic.

I went ahead and created two NACL's, one for the public subnets and another for the private subnets and associated the subnets to it 
![nacl-2](/level-two/images/nacl-2.png)
![nacl-1](/level-two/images/nacl-1.png)

**We are still not sure what we will deploying on each subnets, we will add a rule (100) that allows all traffic into the subnet. subsequently, we will only allow the required protocols and deny all others.**

# Route Table #
In Amazon Web Services (AWS), a route table is a key component of Amazon Virtual Private Cloud (Amazon VPC) networking. Route tables are used to determine where network traffic is directed within a VPC. Each subnet in a VPC is associated with a route table, which controls the routing of traffic in and out of that subnet. Here are some important aspects of AWS route tables:

* Association with Subnets: Each subnet in a VPC is associated with a specific route table. This association determines how traffic is routed for instances in that subnet.

* Default Route Table: When you create a VPC, AWS automatically creates a default route table for that VPC. This default route table is associated with all new subnets unless you explicitly specify a different route table.

* Custom Route Tables: You can create custom route tables to define specific routing requirements for your subnets. This allows you to customize the routing behavior based on your network architecture.

* Route Entries: A route table consists of route entries, each of which specifies a destination IP address range and a target. The target can be another instance, a network gateway, an internet gateway, a Virtual Private Gateway (VPN), or a Direct Connect gateway. These entries determine where traffic is directed based on its destination.

Our custom VPC should have already have the Internet gateway configured, if not, just click "Edit routes" and make Destination(0.0.0.0/0)   Target(<The_custom-igw-name>)  

![iqw](/level-two/images/igw.png)

# Security Groups #

Amazon Web Services (AWS) Security Groups are a fundamental component of the network security model in AWS. They act as virtual firewalls for your Amazon Elastic Compute Cloud (Amazon EC2) instances and other resources, controlling both inbound and outbound traffic to and from these resources. Here are some key points and features of AWS Security Groups:

* Stateful: Security Groups are stateful, meaning if you allow inbound traffic from a specific IP address or range, the corresponding outbound reply traffic is automatically allowed. You don't need to create separate rules for return traffic.

* Instance-Level Firewall: Unlike Network Access Control Lists (NACLs), which operate at the subnet level, Security Groups are associated with individual EC2 instances. Each EC2 instance can have one or more Security Groups associated with it.

* Default Deny: By default, Security Groups follow a "default deny" model, meaning all inbound traffic is denied unless explicitly allowed. Outbound traffic is allowed by default unless explicitly denied.

* Rule Criteria: Security Group rules are based on IP address ranges (source or destination), IP protocols (TCP, UDP, ICMP, etc.), and port ranges. You can specify rules for specific ports (e.g., TCP port 80 for HTTP) and protocols.

* Dynamic Updates: You can modify Security Group rules at any time, and changes take effect immediately. This allows for dynamic security adjustments as your application's needs change.

* Inbound and Outbound Rules: Security Groups have both inbound and outbound rules. Inbound rules control traffic coming into the instance, while outbound rules control traffic leaving the instance.

* Rule Evaluation: All rules are evaluated in the order they are defined, and the rule with the most specific match is applied. If no rule matches, the default "deny" rule is applied.

* Multiple Security Groups: EC2 instances can belong to multiple Security Groups. When multiple Security Groups are associated with an instance, the rules from all groups are combined. If any group allows the traffic, it is permitted.

* Logging: Security Groups themselves do not provide logging, but you can use other AWS services like Amazon CloudWatch Logs to monitor and analyze traffic and events.

* Zero Trust Security: Security Groups follow the "zero trust" security model, where you explicitly specify who or what is allowed to access your resources. This approach enhances security by minimizing the attack surface.

* Dynamic IP Addresses: Security Groups can reference other Security Groups, allowing you to create rules based on the source or destination being another group. This is particularly useful when dealing with dynamic IP addresses, such as those used by Auto Scaling groups.

* Elastic Load Balancers (ELB): ELBs can also be associated with Security Groups to control incoming traffic to load-balanced resources.

I have gone ahead and create three (3) Security groups:
* One for both public subnets (webserver security grouyp)
* One for both Application (private) subnets (Application security group)
* One for both Database (private) subnets (Database security groups)

# Walk-through #

# Public (Webserver) security group:
* Search for VPC in the search bar and on the left column, under Security, select Security groups
* Click create security group
* Fill in your details
    - Security group name: dcgmedia_public_sg
    - Description: Allow http and https access to webserver
    - VPC: Cick the dropdown and select our custom VPC
    - Inbound rules: 
        - type (https) protocol(TCP) Port range(443) Source(anywhere) (0.0.0.0/0) Description(Allow public access)
        - type (http) protocol(TCP) Port range(80) Source(anywhere) (0.0.0.0/0) Description(Allow public access)
* Click "Create security group"

# Private (Applicaton) security group:

Click create security group
* Fill in your details
    - Security group name: dcgmedia_application_sg
    - Description: Allow only traffic from webserver security group
    - VPC: Cick the dropdown and select our custom VPC
    - Inbound rules: 
        - type (https) protocol(TCP) Port range(443) Source(custom) (<webserver-security-group>)  Description(Allow webserver-SG Access)
        - type (http) protocol(TCP) Port range(80) Source(custom) (<webserver-security-group>) Description(Allow webserver-SG Access)
* Click "Create security group"

![app-sg](/level-two/images/app-sg.png)

# Private (Database) security group: #

Click create security group
* Fill in your details
    - Security group name: dcgmedia_database_sg
    - Description: Allow only traffic from applicaton security group
    - VPC: Cick the dropdown and select our custom VPC
    - Inbound rules: 
        - type (All traffic) protocol(All) Port range(All) Source(custom) (<application-security-group>)  Description(Allow Application-SG Access)
        
* Click "Create security group"

![db-sg](/level-two/images/db-sg.png)