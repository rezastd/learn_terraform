provider "aws" {
	region 			= "ap-southeast-1"
}

resource "aws_instance" "test-reza"{
	ami				= "ami-667b048c"
	instance_type	= "t2.micro"
	vpc_security_group_ids = ["${aws_security_group.instance.id}"]
	user_data		= <<-EOF
					  #!/bin/bash
					  echo "Hello world" > index.html
					  nohup busybox nginx -f -p 8080 &
					  EOF

	tags {
		Name	= "terraform-test"
	}
}

resource "aws_security_group" "instance" {
	Name			= "terraform-test-instance"

	ingress {
		from_port	= 8080
		to_port		= 8080
		protocol	= "tcp"
		cidr_blocks	= ["0.0.0.0/0"]
	}
}