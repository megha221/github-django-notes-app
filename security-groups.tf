resource "aws_security_group" "django-notes-security-group" {
  name        = "django-notes-security-group"
  description = "security group for django notes"
  vpc_id      = "vpc-03486abcae956919e"

  ingress {
    description = "ssh access"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]


  }
  ingress {
    description = "http access"
    from_port   = 80
    to_port     = 80
    cidr_blocks = ["0.0.0.0/0"]
    protocol    = "tcp"
  }
  ingress {
    from_port   = 8000
    to_port     = 8000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "django access"
  }
  ingress {
    description = "https access"
    from_port   = 443
    to_port     = 443
    cidr_blocks = ["0.0.0.0/0"]
    protocol    = "tcp"
  }
  ingress {
    from_port   = 3000
    to_port     = 3000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "frontend access"
  }
  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    self        = true
    description = "mysql access from this security group"
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

}