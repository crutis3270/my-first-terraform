terraform {
    backend "remote" {
      organization = "gary-hashicorp-learn"
      workspaces {
        name = "Gary-Workspace"
      }
    }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "2.7.0, < 4.3.0"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region  = "us-east-1"
}

resource "aws_instance" "app_server" {
  ami           = "ami-06678428e7358dad1"
  instance_type = "t2.micro"

  tags = {
    Name = var.instance_name
  }
}
