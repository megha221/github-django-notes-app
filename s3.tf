resource "aws_s3_bucket" "django-notes-bucket" {
  bucket = "django-notes-bucket"

  tags = {
    Name        = "django-notes-bucket"
    Environment = "production"
  }

}