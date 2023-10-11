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

## Upload objects into Amazon s3 via Mgt Console
Steps:
* On the AWS console, go to the search bar and type "s3"
* Locate the newly create s3 bucket, in my case it is test-bucket1212
* Click on the newly created bucket and located the upload button.
* Click the upload button
* You would be presented with a few options, "remove", "Add file" and "Add folder"
* Click add file and upload an object stored on your device.
* Click upload

## Upload objects via the AWS CLI
run:
aws s3 cp index.html s3://test-bucket1212
- index.html is a file stored on my local device
- s3://test-bucket1212 is the uri for the target bucket
