resource "local_file" "ec2_ip_file" {
  content  = join("\n",aws_instance.example[*].public_ip)
  filename = "${path.module}/ansible-inventory.txt"
  # making manual dependancy
  depends_on = [ aws_instance.example ]
}

