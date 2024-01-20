resource "null_resource" "local_exec_chrome_website_opening"{

triggers = {
	mytest = timestamp()
}



provisioner "local-exec" {
    command = "chrome http://${aws_instance.os1.public_ip}/index.html "
  }

depends_on = [
	null_resource.vol_format_null
]

}