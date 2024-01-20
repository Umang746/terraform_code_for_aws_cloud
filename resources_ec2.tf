resource "aws_instance" "os1" {
  ami           = var.amiId
  instance_type = lookup(var.instance_type , terraform.workspace)
  key_name = "terraformkey"
  vpc_security_group_ids = [ "sg-01c943070298c5166" ]

  tags = {
    Name = "webos1"
  }

}



resource "aws_ebs_volume" "myvol1" {
  availability_zone = aws_instance.os1.availability_zone
  size              = 1

  tags = {
    Name = "myebsvol1"
  }
}



resource "aws_volume_attachment" "my_ebs_attach_ec2" {
  force_detach = true
  device_name = "/dev/sdh"
  volume_id   = aws_ebs_volume.myvol1.id
  instance_id = aws_instance.os1.id
}


