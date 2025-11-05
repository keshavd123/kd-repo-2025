#creating ec2 vm
resource "aws_instance" "example" {
    #ami = "ami-0a25a306450a2cba3"
    ami = var.kd-ami-id
    instance_type = var.vm-size
    key_name = aws_key_pair.ec2_key_pair.key_name
    depends_on = [ aws_key_pair.ec2_key_pair ]
    tags = {
        "Name" = var.vm-name 
    }
    provisioner "remote-exec" {
      inline = [ 
        "sudo dnf install git httpd -y",
        "mkdir -p hello/terraform"
       ]
      
    }
    connection {
        type = "ssh"
        user = "ec2-user"
        host = self.public_ip
        private_key = tls_private_key.rsa_key_4096.private_key_pem
    }
  
}



resource "local_file" "ec2_ip_file" {
  content  = aws_instance.example.public_ip
  filename = "${path.module}/ec2_public_ip.txt"
  # making manual dependancy
  depends_on = [ aws_key_pair.ec2_key_pair ]
}

resource "local_file" "ec2_ip_rsa" {
  content  = tls_private_key.rsa_key_4096.private_key_openssh
  filename = "${path.module}/kd-key.pem"
  file_permission = var.file-perm
  # making manual dependancy
  depends_on = [ aws_instance.example ]
}