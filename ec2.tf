resource "aws_instance" "ec2" {
  ami    = var.ami_id
  instance_type = "t2.micro"
  key_name = "gitnewkey"
  associate_public_ip_address = true 
  user_data = file("./userdata.sh")
  tags = {
     Name = "Ubantu-instance"
  }
}