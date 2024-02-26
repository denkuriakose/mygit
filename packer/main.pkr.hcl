packer {
  required_plugins {
    amazon = {
      source  = "github.com/hashicorp/amazon"
      version = "~> 1"
    }
  }
}

source "amazon-ebs" "ocean-calling" {

access_key = "AKIA6L5PPUMFHJ3IBA6F"
  secret_key = "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"

    region = var.region
    ami_name = var.ami_name
    source_ami = var.source_ami
    instance_type = var.instance_type
    ssh_username = "ec2-user"

 tags = {

     Name = var.ami_name
 }
}

build {

  sources = [ "source.amazon-ebs.ocean-calling" ]
  provisioner "shell" {

script = "./script.sh"

execute_command = "sudo {{.Path}}"

}
}
