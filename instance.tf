resource "aws_instance" "my_instance_1"{
  ami = var.AMIS[var.AWS_REGION]
  instance_type = var.AWS_INSTANCE

  # Public Key SSH
  key_name = aws_key_pair.mykeypair.key_name

  # VPC Subnet
  subnet_id = aws_subnet.test-public-1.id

  # Security Group
  vpc_security_group_ids = [aws_security_group.allow-ssh.id]

  # Provisoner
  provisioner "remote-exec"{
    connection{
      type = "ssh"
      host = self.public_ip
      private_key = file("D:/Activity/Newfolder/ec2-key")
      user = "ec2-user"
    }
    inline = [
      "sudo yum update -y",
      "sudo amazon-linux-extras install docker -y",
      "sudo service docker start",
      "sudo usermod -a -G docker ec2-user",
      "sudo service docker enable",
      "sudo $(aws ecr get-login --no-include-email --region ap-south-1)",
      "sudo docker pull 506844237526.dkr.ecr.ap-south-1.amazonaws.com/demo:latest",
      "sudo docker run -itd -p 8080:8080 506844237526.dkr.ecr.ap-south-1.amazonaws.com/demo:latest",
    ]
  }

  tags = {
    Name = "Terraform Instance"
    Class = "Test"
  }
} 
 
