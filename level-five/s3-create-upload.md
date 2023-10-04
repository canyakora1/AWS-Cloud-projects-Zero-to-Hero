# Amazon Simple Storage Service

## Amazon s3 bucket creation using the Management Console

## Steps in creating an s3 bucket
* Open the AWS Management Console.
* Use the search bar and search for "s3".
* Click "S3."
* Click on create bucket
AWS S3 bucket names are globally unique. Meaning no two accounts can have the same bucket name. 
* Set "AWS region" e.g us-east-1
AWS s3 bucket are created "Private" by default, and can be made "Public" with additional setup or configurations.
* Bucket versioning: Though optional it allows you to preserve, retrieve, and restore every version of every object stored in a bucket
* Click "Create bucket" to complete the creation

![create-s3-bucket](/level-five/images/Create-S3-bucket.png)


## Amazon s3 bucket creation via the AWS CLI
I'll assume you already have the AWS Cli installed and configure using the "aws configure" on your terminal locally or if you are using the AWS Cloud shell, there is not need to run the configuration, the shell is already configured automatically.

run:
aws s3api create-bucket \
--bucket <REPLACED_FOR_BUCKET_NAME> \
--region us-east-1 \
--profile <REPLACED_FOR_PROFILE_NAME>
