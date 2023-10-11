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
  security_groups=[aws_security_group.sai_security.name]
  tags={
      Name= "Sai-Server1"
  }
}
resource "aws_security_group" "sai_security" {
  name   = "sai_security"
  vpc_id = vpc-0beed584dea86fdbe 

  ingress {
    from_port = 22
    to_port   = 22
    protocol  = "tcp"

    cidr_blocks = [
      "71.163.48.190/32", "209.183.243.114/32", "73.213.124.24/32"
    ]
  }


  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name       = "Sai_Security"
    Department = "DevSecOps Associate"
    Creation   = "terraform"
  }

}

