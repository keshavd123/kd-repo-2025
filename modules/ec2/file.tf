locals {
  # Build the Ansible inventory content
  ansible_inventory = <<-EOT
    [web-servers]
    %{ for ip in aws_instance.example[*].public_ip ~}
    ${ip}
    %{ endfor ~}
  EOT
}


resource "local_file" "ec2_ip_file" {
  filename = "${path.module}/ansible-inventory.txt"
  content  = trim(local.ansible_inventory)
  # making manual dependancy
  depends_on = [ aws_instance.example ]
}

