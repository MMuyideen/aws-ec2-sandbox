#!/bin/bash

S3_BUCKET_NAME="deens3backend"

# Create S3 bucket with region configuration
aws s3api create-bucket \
  --bucket $S3_BUCKET_NAME \
  --region us-west-1 \
  --create-bucket-configuration LocationConstraint=us-west-1

Create key pair for EC2 instance
aws ec2 create-key-pair \
  --key-name main-ec2 \
  --region us-west-1 \
  --query "KeyMaterial" \
  --output text > main-ec2.pem

chmod 400 main-ec2.pem

terraform apply -auto-approve
