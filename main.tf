variable "aws_access_key" {}
variable "aws_secret_key" {}
variable "aws_region" {}
variable "aws_zone" {}

# https://www.terraform.io/docs/providers/aws/index.html
provider "aws" {
    access_key = "${var.aws_access_key}"
    secret_key = "${var.aws_secret_key}"
    region     = "${var.aws_region}"
}

resource "aws_key_pair" "auth" {
    key_name   = "${var.key_name}"
    public_key = "${var.public_key}"
}

# https://www.terraform.io/docs/providers/aws/d/security_group.html
# https://www.terraform.io/docs/providers/aws/r/security_group.html
resource "aws_security_group" "default" {
    name        = "terraform_security_group"
    description = "Used in the terraform"
    ingress {
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
    egress {
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_blocks = ["0.0.0.0/0"]
    }
}





