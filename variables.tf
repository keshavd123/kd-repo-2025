variable "kd-ami-id" {
    type = string
    description = "this is ami id"

}

variable "vm-size" {
    type = string
}

variable "vm-name" {
    type = string
}

variable "ec2-key-name" {
    type = string
  
}

variable "key-algo-rsa" {
    type = string
}

variable "rsa-bits" {
    type = number
}

variable "file-perm" {
   type = number
}

variable "aws-pair-key-name" {
  type = string
}