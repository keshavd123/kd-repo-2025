#creating ec2 vm
resource "aws_instance" "example" {
    #ami = "ami-0a25a306450a2cba3"
    count = var.vmcount
    ami = var.kd-ami-id
    instance_type = var.vm-size
    key_name = aws_key_pair.ec2_key_pair.key_name
    #security_groups =  [aws_security_group.allow_tls.name]
    vpc_security_group_ids = [aws_security_group.allow_tls.id]
    depends_on = [ aws_key_pair.ec2_key_pair ]
    tags = {
        "Name" = "${var.vm-name}-${count.index}"
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
        #timeout = "3m"
        private_key = tls_private_key.rsa_key_4096.private_key_pem
    }
  
}

