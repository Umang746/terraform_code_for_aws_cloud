resource "null_resource" "sshnull"{

triggers = {
	mytest = timestamp()
}

connection {
    type     = "ssh"
    user     = "ec2-user"
    private_key = file("G:/Terraform Programs/terraformkey.pem")
    host     = aws_instance.os1.public_ip
  }

provisioner "remote-exec" {
    inline = [
      "sudo yum install httpd -y",
      "sudo systemctl enable httpd --now",
    ]
  }

depends_on = [
	aws_instance.os1
]

}