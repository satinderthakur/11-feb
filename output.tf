output "instance_ips"{
  value = aws_instance.my_instance_1.public_ip
}