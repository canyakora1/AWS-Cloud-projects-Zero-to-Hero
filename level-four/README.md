# Create a wordpress site on our Ec2 Instances and enable load-balancing

Just like in the [level-three](/level-three/README.md) demo exercise, where we deployed an ec2 Instance with a user-data script that would install apache and load a basic html website. A load balancer was also deployed for load distribution, fault tolerance and security.

This week, we will use the same logic and configure a WordPress website that would be deployed on two (2) ec2 Instances using user-data and a load balancer configured on the target group.

