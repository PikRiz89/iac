resource "aws_security_group" "wikimedia_sg" {
  name        = "wikimedia-sg"
  description = "Add firewall rules HTTP, HTTPS, SSH"

  ingress {
    description = "HTTP"
    protocol    = "tcp"
    from_port   = 80
    to_port     = 80
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTPS"
    protocol    = "tcp"
    from_port   = 443
    to_port     = 443
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "SSH"
    protocol    = "tcp"
    from_port   = 22
    to_port     = 22
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    protocol    = "-1"
    from_port   = 0
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "wikimediadb_sg" {
  name        = "wikimediadb-sg"
  description = "ssh limited externe interne depuis wikimedia"
  ingress {
    description = "SSH depuis IP admin"
    protocol    = "tcp"
    from_port   = 22
    to_port     = 22
    cidr_blocks = [
      "82.65.78.207/32"
    ]
  }

  ingress {
    description       = "interne depuis wikimedia"
    protocol          = "-1"
    from_port         = 0
    to_port           = 0
    security_groups   = [aws_security_group.wikimedia_sg.id]
  }

  egress {
    protocol    = "-1"
    from_port   = 0
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }
}
