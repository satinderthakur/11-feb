provider "aws" {
  profile    = "default"
  region     = "ap-south-1"
}
resource "aws_instance" "example_1" {
  ami           = "ami-2757f631"
  instance_type = "t2.micro"
  }

  # Public Key SSH
  key_name = aws_key_pair.mykeypair.key_name

  # VPC Subnet
  subnet_id = aws_subnet.test-public-1.id

  # Security Group
  vpc_security_group_ids = [aws_security_group.allow-ssh.id]

  #User Data
  user_data = file("userData.sh")

  tags = {
    Name = "Terraform Instance"
    Class = "Test"
  }
}
