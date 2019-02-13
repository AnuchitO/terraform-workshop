provider "aws" {
  region = "ap-southeast-1"
}

resource "aws_instance" "hello" {
  ami                    = "ami-04677bdaa3c2b6e24"
  instance_type          = "t2.micro"
  user_data              = "${file("userdata.sh")}"
  vpc_security_group_ids = ["${aws_security_group.sg_hello.id}"]
}

resource "aws_security_group" "sg_hello" {
  name = "sg_hello"

  ingress {
    from_port   = 8000
    to_port     = 8000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

output "ip" {
  value = "${aws_instance.hello.public_ip}"
}
