resource "null_resource" "destroy_null"{

provisioner "local-exec" {
    when = destroy
    command = "echo Destroyed!!! > destroy.txt"
  }



}