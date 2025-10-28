#!/bin/bash

terraform destroy -auto-approve

aws ec2 delete-key-pair \
  --key-name main-ec2 \
  --region us-west-1

S3_BUCKET_NAME="deens3backend"

aws s3 rm s3://$S3_BUCKET_NAME --recursive

# delete S3 bucket
aws s3api delete-bucket \
  --bucket $S3_BUCKET_NAME \
  --region us-west-1