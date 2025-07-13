#key pair
resource aws_key_pair mykey{
  key_name = "ec2-key"
  public_key = ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIPOC1YIWMB+0vB+FJsk880FytvH7lDgmicwOygMjeNbH surya@surya
}