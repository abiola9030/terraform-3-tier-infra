variable "ami_id" {
    type = string
    description = "ami of instance"
    default = "ami-0e8a34246278c21e4"
}

variable "instance_type" {
    type = string
    description = "instance type of instance"
    default = "t2.micro"
}



variable "availability_zones" {
    type = list(string)
    description = "AZ for instances"
    default = ["us-east-1a", "us-east-1b"]
}

variable "private_subnet_ids" {
    type = list(string)
    description = "private subnets to launch instance"
}

variable "tags" {
    type = map(string)
    description = "tags"
}

variable "vpc_id" {
    type = string
    description = "vpc id"
}

variable "vpc_cidr_block" {
    type = list (string)
    description = "vpc cidr block"
}