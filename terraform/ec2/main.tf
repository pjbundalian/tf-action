variable "vpc_id" {
  type = string
}

variable "private_subnets" {
  type = list(string)
}

resource "aws_security_group" "ec2_sg" {
  name        = "ec2-security-group"
  description = "Security group for EC2 instances"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    security_groups = [aws_security_group.alb_sg.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "app_server" {
  ami           = "ami-04b4f1a9cf54c11d0"
  instance_type = "t2.micro"
  subnet_id     = var.private_subnets[0]
  security_groups = [aws_security_group.ec2_sg.id]

  user_data = <<-EOF
                #!/bin/bash
                sudo apt update
                sudo apt install -y nginx
                echo 'Hello from Nginx on EC2!' > /var/www/html/index.html
                sudo systemctl start nginx
                sudo systemctl enable nginx
              EOF

  tags = {
    Name = "NginxInstance"
  }
}

