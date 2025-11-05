#creating ec2 vm
resource "aws_instance" "example" {
    #ami = "ami-0a25a306450a2cba3"
    ami = var.kd-ami-id
    instance_type = var.vm-size
    key_name = var.ec2-key-name
    tags = {
        "Name" = var.vm-name 
    }
  
}

resource "local_file" "ec2_ip_file" {
  content  = aws_instance.example.public_ip
  filename = "${path.module}/ec2_public_ip.txt"
  # making manual dependancy
  depends_on = [ aws_instance.example ]
}