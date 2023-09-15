## Creating an AWS Account with security best practices

You can always refer to [AWS-account-creation](https://docs.aws.amazon.com/SetUp/latest/UserGuide/setup-AWSsignup.html), or [here](https://docs.aws.amazon.com/SetUp/latest/UserGuide/setup-AWSsignup.html)

**But I'll be showcasing how to protect the root account and create an IAM user that would be used in our demos.** 

After creating your AWS account, to IAM [Identity and Access Management](https://docs.aws.amazon.com/IAM/latest/UserGuide/introduction.html)

## Identity and Access Management
AWS Identity and Access Management (IAM) is a service provided by Amazon Web Services (AWS) that allows you to manage access to your AWS resources securely. IAM enables you to control who can access your AWS resources (authentication) and what actions they can perform on those resources (authorization).

# Here are some key concepts and features of AWS IAM:

- Users: IAM allows you to create individual user accounts for people, applications, or services that need access to your AWS resources. Each user has a unique set of security credentials.

- Groups: You can organize users into groups, which makes it easier to manage permissions. Permissions assigned to a group are automatically applied to all users in that group.

- Roles: IAM roles are similar to users, but they are not associated with specific people or applications. Instead, they are assumed by AWS services or resources. Roles are used to grant temporary permissions to AWS resources, such as EC2 instances or Lambda functions.

- Policies: IAM policies are JSON documents that define the permissions for users, groups, or roles. Policies specify what actions are allowed or denied on which AWS resources. AWS provides managed policies that you can attach to your IAM entities, and you can also create custom policies.

- Access Keys: Users can have access keys (access key ID and secret access key) that are used for programmatic access to AWS services via APIs and command-line tools.

- Multi-Factor Authentication (MFA): You can enable MFA for additional security, requiring users to provide an authentication code from a hardware device or app in addition to their password.

- Security Token Service (STS): STS allows you to grant temporary, limited-privilege credentials to users or roles. This is useful for cross-account access or providing access to resources without exposing long-term credentials.

- Resource-Based Policies: Some AWS resources (e.g., S3 buckets, SQS queues) have their own resource-based policies that allow you to control access to those resources independently of IAM.

- Fine-Grained Permissions: IAM allows you to specify fine-grained permissions based on the principle of least privilege, ensuring that users or roles have only the permissions necessary for their tasks.

- Audit Logging: AWS provides CloudTrail, which records all API calls made on your AWS account. This helps with auditing and compliance.

- Identity Federation: You can integrate IAM with your existing identity systems (e.g., Active Directory) to provide single sign-on (SSO) and centralized identity management.

- Cross-Account Access: IAM allows you to delegate access to your AWS resources to users or roles in other AWS accounts. This is often used for sharing resources across organizational boundaries.

IAM is a fundamental component of AWS security, and proper IAM configuration is critical for securing your AWS environment. It's essential to follow best practices, regularly review and update permissions, and ensure that only authorized users and resources have access to your AWS resources.

## Step One:
You will notice that the root account doesn't have mfa (Multi-factor authentication) configured
![root-mfa](/level-one/images/root-mfa.png)

Click "Set-up MFA" and proceed with the next step

## Step two:
Give the MFA device name is suitable name and for MFA device, we will go with "Authenticator App". Feel free to select an MFA device that is applicable to you.

![mfa-device-name](/level-one/images/configure-mfa1.png)

Click next to proceed

## Step Three: 
Click "Show QR Code" to reveal secret key. By then you should have download the "authenticator app" on your phone. 
Scan the QR code and fill in two consecutive code from your MFA device

![Scan-QRCODE](/level-one/images/configure-mfa2.png)

Click "add MFA" to proceed

## Step four:
Now you should havee MFA configured for the root account: :-)

![mfa-done](/level-one/images/configure-mfa3.png)


