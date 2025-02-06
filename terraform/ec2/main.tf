variable "vpc_id" {
  type = string
}

variable "public_subnets" {
  type = list(string)
}

resource "aws_security_group" "web_sg" {
  name        = "web-sg"
  description = "Security group for web server with HTTP access"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

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

  tags = {
    Name = "WebServerSG"
  }
}

resource "aws_instance" "web" {
  ami           = "ami-04b4f1a9cf54c11d0"
  instance_type = "t2.micro"
  subnet_id     = element(var.public_subnets, 0)
  security_groups = [aws_security_group.web_sg.name]

  user_data = <<-EOF
                #!/bin/bash
                sudo apt update
                sudo apt install -y nginx tomcat9
                sudo systemctl start nginx
                sudo systemctl enable nginx
                sudo systemctl start tomcat9
                sudo systemctl enable tomcat9
                EOF

  tags = {
    Name = "NginxTomcatServer"
  }
}

output "web_instance_ip" {
  value = aws_instance.web.public_ip
}
