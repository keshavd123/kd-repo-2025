# ec2 public IP
output "my-ec2-publicIP" {
    value = aws_instance.example.public_ip
  
}

# ec2 instance ip
output "my-ec2ID" {

    value = aws_instance.example.id
  
}