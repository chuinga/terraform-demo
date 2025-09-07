# Specify the provider and access details

provider "aws" {
  
}

# Generate random suffix for bucket name
resource "random_id" "bucket_suffix" {
  byte_length = 4
}

# Create an S3 bucket
resource "aws_s3_bucket" "udabucket" {
  bucket = "cicd-terraform-demo-bucket-${random_id.bucket_suffix.hex}"

  tags = {
    Name        = "CICD test bucket"
    Environment = "Dev"
  }
}

# Create an EC2 instance
resource "aws_instance" "ec2_instance" {
  ami           = "ami-04a0ae173da5807d3"
  instance_type = "t2.micro"

  tags = {
    Name = "CICD test instance"
  }
}
