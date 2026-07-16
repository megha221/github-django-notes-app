output "instance_id" {
  value = aws_instance.notes_instance.public_dns

}

output "db_instance_endpoint" {
  value = aws_db_instance.django-notes-db.endpoint
}

output "bucket_name" {
  value = aws_s3_bucket.django-notes-bucket.bucket
}