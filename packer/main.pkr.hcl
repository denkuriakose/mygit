source "amazon-ebs" "ocean-website" {
region = var.region
ami_name = var.ami_name
source_ami = var.source_ami
instance_type = var.instance_type
ssh_username = "ec2-user"

tags = {
Name = "ocean_website"
}
}

build {

sources = [ "source.amazon-ebs.ocean-website" ]
provisioner "shell" {
script = "./script.sh"
execute_command = "sudo {{.Path}}"
}

provisioner "file" {
  source = "../website"
  destination = "/tmp/"
}
 
provisioner "shell" {

 inline = ["sudo cp -r /tmp/website/* /var/www/html"]
}

}
