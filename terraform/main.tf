provider "aws" {
  region = "eu-central-1"
}

data "aws_ami" "reference-ubuntu" {
  most_recent = true

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  filter {
    name   = "name"
    values = ["ubuntu-16-04-reference"]
  }

  owners = ["self"]
}

data "aws_vpc" "vpc" {
  default = true
}

resource "aws_security_group" "ssh" {
  name        = "ssh"
  description = "Allow SSH from Internet"
  vpc_id      = "${data.aws_vpc.vpc.id}"

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

resource "aws_instance" "test" {
  ami           = "${data.aws_ami.reference-ubuntu.id}"
  instance_type = "t2.micro"

  vpc_security_group_ids = [
    "${aws_security_group.ssh.id}",
  ]
}

output "addresses" {
  value = ["${aws_instance.test.public_ip}"]
}
