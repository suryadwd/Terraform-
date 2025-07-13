#key pair
resource aws_key_pair my_key{
  key_name = "ec2-key"
  public_key = ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIPOC1YIWMB+0vB+FJsk880FytvH7lDgmicwOygMjeNbH surya@surya
}

#VPC and  security group

resource aws_default_vpc default {

}

resource aws_security_group my_security_group {
    name = "adding security group"
    description = "using tf we are adding the vpc and security group which are added during the creation of ec2 instances automatically"
    vpc_id = aws_default_vpc.default.id # this is known as interpolation

    #inbound rules
    ingress{
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
        description = "ssh open"
    }
    ingress{
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
        description = "http open"
    }
    ingress{
        from_port = 7000
        to_port = 7000
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
        description = "server open"
    }

    #outbound rules
    egress{
        from_port = 0
        to_port = 0
        protocol = "-1"         
        cidr_blocks = ["0.0.0.0/0"]
        description = "outbound open to all "
    }


    tags = {
        Name = "sg"        
    }
}


resource "aws_instance" "my_instance"{
    key_name = aws_key_pair.my_key.key_name
    security_groups = [aws_security_group.my_security_group.name]
    instance_type = "t2.micro"
    ami = ami-01f23391a59163da9  # ubuntu 

    root_block_device {
        volume_size = 15
        volume_type = "gp3"
    }

    tags = {
        Name = "terraform-ec2-instance"
    }

}
