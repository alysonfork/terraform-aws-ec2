# https://www.terraform.io/docs/providers/aws/d/instance.html
resource "aws_instance" "worker" {
    count         = 2
    ami           = "ami-07ad4b1c3af1ea214"
    instance_type = "t2.micro"
    key_name      = "${aws_key_pair.auth.id}"
    vpc_security_group_ids = ["${aws_security_group.default.id}"]
    tags = {
      Name = "worker-${count.index}"
    }
    user_data     = "${file("install.yml")}"    
}

output "worker_public_ip" {
  value = "${aws_instance.worker.*.public_ip}"
}

output "worker_hostname" {
  value = "${aws_instance.worker.*.public_dns}"
}
  
