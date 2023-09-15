## Creating an IAM User and assigning appropriate policies

**This is the beginning architecture of the series of demos**
**At every level, we will be building on-top of the existing architecture till we have a semi-fully functional, distributed, resillient and secure AWS environment.**

![aws-design](/level-one/iam-images/iam.jpg)

# Creating an IAM User:
What are IAM Users? IAM allows you to create individual user accounts for people, applications, or services that need access to your AWS resources. Each user has a unique set of security credentials. For more information click [here.](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_users.html)

Let us start by creating the IAM user that would be used for the remainder of the project

Name: Bruce Banner (You are free to choose any username that you want)

# Step one:
![iam-username](/level-one/iam-images/iam1.png)

Click next

# Step two:
![iam-userDetails](/level-one/iam-images/iam2.png)

- I choose a username: bruce_banner
- The IAM user should have access to the console
- Please create a strong password and this user would have administrative policies attached
- Uncheck "User must create a new password at next sign-in"

Then click Next

# Step three:
![iam-policy](/level-one/iam-images/iam3.png)
 - Under "Set permissions", choose "Attach policies directly"
 - Under Permissions policies, search for "AdministratorAccess", click the radio button next to AdministratorAccess

 Click Next

 **It is not security best pratice that attach policies directly on users, but instead create an IAM group (logical groupings for multiple users and then policies are assigned as a group)** 

## IAM POLICY for the Administrator Access

{
    "Version": "2012-10-17",              <!----------- Shows the version of the policy --------------->
    "Statement": [                          <!------ A policy can contain single or multiple statements ------------>
        {
            "Effect": "Allow",              <!----------- Effect is either an allow or deny --------------->
            "Action": "*",                  <!----- Shows what actions are allowed or denied. * means all actions  ------>
            "Resource": "*"             <!----- Shows the resource(s) included in this policy --------->
        }
    ]
}

# Step four:
**Review and create**
![iam-review](/level-one/iam-images/iam4.png)