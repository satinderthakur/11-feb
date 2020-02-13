provider "aws" {
  profile    = "default"
  region     = "ap-south-1"
}
resource "aws_instance" "example_1" {
  ami           = "ami-2757f631"
  instance_type = "t2.micro"
  }


