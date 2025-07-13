variable "ec2_instance_type" {
    default = "t2.micro"
    type = string
}

variable "ec2_storage_size" {
  default = 15
  type = number
}

variable "ec2_ami_id" {
  default = "ami-046070fb756e4377e"
  type = string
}