output "vm_public_ip" {
 value = aws_instance.demo1.public_ip
}

output "s3_bucket_domain" {
  value = aws_s3_bucket.s3-bucket.sam-demo-bucket
}