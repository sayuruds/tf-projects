# Generate a private key
resource "tls_private_key" "my_key" {
  algorithm = "RSA"
  rsa_bits  = 2048
}


# create web-ec2 pem
resource "aws_key_pair" "web-key_pair" {
  key_name   = "${var.project}-bas_ec2-kp"
  public_key = tls_private_key.my_key.public_key_openssh
}

# output web-ec2 pem
resource "local_file" "local-web_ec2-key" {
  filename = "${var.project}-bas_ec2-kp.pem"
  content  = tls_private_key.my_key.private_key_pem
}
