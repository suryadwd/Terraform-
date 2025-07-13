#key pair
resource aws_key_pair my_key{
  key_name = "ec2-key"
  public_key = ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIPOC1YIWMB+0vB+FJsk880FytvH7lDgmicwOygMjeNbH surya@surya
}

#VPC security group

resource aws_default_vpc default {

}

resource aws_security_group my_security_group {
    name = "adding security group"
    description = "using tf we are adding the vpc and security group which are added during the creation of ec2 instances automatically"
    vpc_id = aws_default_vpc.default.id # this is known as interpolation

    

    tags = {
        Name = "sg"        
    }
}