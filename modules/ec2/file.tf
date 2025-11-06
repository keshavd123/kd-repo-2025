resource "local_file" "ec2_ip_file" {
  content  = join("\n",aws_instance.example[*].public_ip)
  filename = "${path.module}/ec2_public_ip.txt"
  # making manual dependancy
  depends_on = [ aws_instance.example ]
}

resource "local_file" "ec2_ip_rsa" {
  content  = tls_private_key.rsa_key_4096.private_key_openssh
  filename = "${path.module}/kd-key.pem"
  file_permission = var.file-perm
  # making manual dependancy
  depends_on = [ aws_instance.example ]
}