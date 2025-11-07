resource "tls_private_key" "rsa_key_4096" {
  algorithm = var.key-algo-rsa
  rsa_bits  = var.rsa-bits
}

resource "aws_key_pair" "ec2_key_pair" {
  key_name   = var.aws-pair-key-name
  public_key = tls_private_key.rsa_key_4096.public_key_openssh
  depends_on = [ tls_private_key.rsa_key_4096 ]
}

resource "local_file" "ec2_ip_rsa" {
  content  = tls_private_key.rsa_key_4096.private_key_openssh
  filename = "${path.module}/kd-key.pem"
  file_permission = var.file-perm
  # making manual dependancy
  depends_on = [ tls_private_key.rsa_key_4096 ]
}