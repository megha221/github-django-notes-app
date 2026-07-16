provider "aws" {
  region = "us-east-1"

}

resource "aws_instance" "notes_instance" {
  ami                    = "ami-0b6d9d3d33ba97d99"
  instance_type          = "t3.micro"
  key_name               = "django-key"
  vpc_security_group_ids = [aws_security_group.django-notes-security-group.id]
  tags = {
    name = "django-notes-instances"
  }

}