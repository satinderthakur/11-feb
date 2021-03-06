variable "AWS_REGION"{
  default = "ap-south-1"
}

variable "AWS_ACCESS_KEY"{}

variable "AWS_SECRET_KEY"{}

variable "AMIS" {
  default = {
    ap-south-1 = "ami-0d9462a653c34dab7"
    eu-west-1 = "eu-west-1 ami"
    
  }
}

variable "AWS_INSTANCE"{}

variable "PATH_TO_PUBLIC_KEY" {
  default = "ec2-key.pub"
}

variable "PATH_TO_PRIVATE_KEY" {
  default = "ec2-key"
}

variable "CIDR_BLOCK"{
  default = "10.0.0.0/16"
}

variable "SUB_1_CIDR"{
  default = "10.0.1.0/24"
}
