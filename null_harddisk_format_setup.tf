resource "null_resource" "vol_format_null"{

connection {
    type     = "ssh"
    user     = "ec2-user"
    private_key = file("G:/Terraform Programs/terraformkey.pem")
    host     = aws_instance.os1.public_ip
  }

provisioner "remote-exec" {
    on_failure = continue
    inline = [
      "sudo mkfs.ext4 /dev/xvdh",
      "sudo mount /dev/xvdh /var/www/html",
      "sudo sh -c 'echo This is the final web page!! > /var/www/html/index.html'",
    
    ]
  }

depends_on = [
	aws_volume_attachment.my_ebs_attach_ec2,null_resource.sshnull
]

}