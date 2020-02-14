resource "aws_instance" "my_instance_1"{
  ami = var.AMIS[var.AWS_REGION]
  instance_type = var.AWS_INSTANCE

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
