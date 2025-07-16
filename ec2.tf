#key pair
resource aws_key_pair my_key{
  key_name = "ec2-key"
  public_key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIPOC1YIWMB+0vB+FJsk880FytvH7lDgmicwOygMjeNbH surya@surya"
}

#VPC and  security group

resource aws_default_vpc default {}


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
    # count = 2
    for_each = tomap({
        tws-suraj-instance = "t2.micro"
        tws-anuj-instance = "t2.micro"
    })
    depends_on = [ aws_security_group.my_security_group]
    security_groups = [aws_security_group.my_security_group.name]    # check kro isko ek baar 
    # instance_type = var.ec2_instance_type
    instance_type = each.value
    ami = var.ec2_ami_id
    user_data = file("nginx.sh")
    root_block_device {
        # volume_size = var.ec2_storage_size
        volume_size = var.env == "prod" ? 25 : var.ec2_default_storage_size
        volume_type = "gp3"
    }
    tags = {
        # Name = "terraform-ec2-instance"
        Name = each.key
    }
}


# count  is a meta keyword and number of element in the coount is teh number of inctance that will create but the problem is about the same name of each element to tackel this we  are having for each\

# for each it is just  key-pair format and teh key and values can be used as interpolation  but using the each.value and each.key 
# while using meat character in coount we have added [*] but for_each we dont use it 

# depends_on just like docker after what we will run this 


# we are also having conditional formatting as in react 

# now going to learn teh tfstate using the s3 and dynamodb for secure tfstate file usage