# Creating Amazon s3 bucket and uploading objects

It is important to know that Amazon S3 (Simple Storage Service) is a scalable storage service provided by Amazon Web Services (AWS). It allows you to store and retrieve any amount of data from anywhere on the web. S3 is designed to offer durability, availability, and security for your data.

## Summary of the features offered by Amazon s3 ##
- Object Storage: S3 is an object storage service, meaning it allows you to store and retrieve any type of data, such as documents, images, videos, and application backups, as objects.

- Scalability: S3 is highly scalable. You can store virtually unlimited amounts of data, and the service automatically scales to handle growing amounts of data.

- Durability and Reliability: S3 provides high durability by storing data redundantly across multiple facilities and servers within AWS data centers. It is designed to sustain the loss of data in one or more facilities.

- Data Consistency: S3 provides strong read-after-write consistency for all objects, ensuring that once an object is written, it can be read immediately.

- Access Control: You can control access to your S3 buckets and objects using AWS Identity and Access Management (IAM) policies and S3 bucket policies. This allows you to manage who can upload, download, or delete objects.

- Data Security: S3 supports data encryption both in transit (using SSL/TLS) and at rest (using server-side encryption). You can choose to manage your own encryption keys or use AWS Key Management Service (KMS).

- Versioning: S3 supports versioning, which allows you to preserve, retrieve, and restore every version of every object stored in a bucket.

- Lifecycle Policies: You can define lifecycle policies to automatically transition objects to different storage classes or delete them after a specified period of time.

- Event Notifications: S3 can send event notifications when objects are created, deleted, or restored, allowing you to automate workflows and respond to changes in your data.

- Static Website Hosting: S3 can be used to host static websites. You can configure your bucket as a static website and use it to serve HTML, CSS, JavaScript, and other web assets.

- Data Transfer Acceleration: S3 Transfer Acceleration utilizes Amazon CloudFront’s globally distributed edge locations to accelerate the transfer of files to and from S3 over HTTPS.

- Data Replication: S3 offers features like Cross-Region Replication (CRR) and Same-Region Replication (SRR) to replicate data between buckets across different AWS regions or within the same region for compliance, disaster recovery, or performance requirements.

## Additional Reading:
- [Amazon s3](https://aws.amazon.com/s3/)
- [What is Amazon s3](https://docs.aws.amazon.com/AmazonS3/latest/userguide/Welcome.html)
- [Getting started with Amazon S3](https://docs.aws.amazon.com/AmazonS3/latest/userguide/GetStartedWithS3.html)





