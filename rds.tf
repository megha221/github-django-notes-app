resource "aws_db_instance" "django-notes-db" {
  engine                 = "mysql"
  engine_version         = "8.0"
  instance_class         = "db.t3.micro"
  db_name                = "django_notes_db"
  username               = "admin"
  password               = "admin123"
  parameter_group_name   = "default.mysql8.0"
  skip_final_snapshot    = true
  vpc_security_group_ids = [aws_security_group.django-notes-security-group.id]
  allocated_storage      = 10

}
