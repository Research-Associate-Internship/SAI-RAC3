terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}
provider "aws" {
  region= "us-east-2"
}
resource "aws_instance" "example" {
  ami="ami-0aec300fa613b1c92"
  instance_type= "t2.micro"
  tags={
      Name= "Sai-Server1"
  }
}
resource "aws_ec2_instance_state" "example"{
  instance_id=aws_instance.first.id
  state="stopped"
}
