#creating ec2 vm
resource "aws_instance" "example" {
    ami = "ami-0a25a306450a2cba3"
    instance_type = "t2.nano"
    key_name = "roche-key"
    tags_all = {
        "Name" = "kd-vm-1" 
    }
  
}

resource "local_file" "ec2_ip_file" {
  content  = aws_instance.example.public_ip
  filename = "ec2_public_ip.txt ."

}