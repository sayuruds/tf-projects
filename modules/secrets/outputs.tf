output "bas-ec2-key" {
  value = aws_key_pair.web-key_pair.key_name
}