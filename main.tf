provider "aws" {
	region 			= "ap-southeast-1"
}

resource "aws_instance" "test-reza"{
	ami				= "ami-cb757ab7"
	instance_type	= "t2.micro"
	tags {
		Name	= "terraform-test"
	}
}