
# puppet master
resource "aws_instance" "puppet" {
    ami = "ami-408c7f28"
    instance_type = "t1.micro"

    provisioner "remote-exec" {
      script = "scripts/bootstrap.sh"
    }
}

resource "aws_eip" "ip" {
    instance = "${aws_instance.puppet.id}"
}
