resource "null_resource" "local_exec_null"{

triggers = {
	mytest = timestamp()
}



provisioner "local-exec" {
    command = "echo ${aws_instance.os1.public_ip} > inventory"
  }

depends_on = [
	null_resource.vol_format_null
]

}