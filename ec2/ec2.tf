resource "aws_instance" "business_logic" {
  count = length(var.availability_zones)
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id = var.private_subnet_ids[count.index]
  availability_zone = var.availability_zones[count.index]
  security_groups = [aws_security_group.bl_sg.id]

  tags = merge(var.tags,{
    Name = "${var.tags["project"]}-${var.tags["application"]}-${var.tags["environment"]}-business-logic"
  })
}

resource "aws_security_group" "bl_sg" {
  name        = "business_logic-sg"
  description = "Allow traffic within VPC"
  vpc_id      = var.vpc_id

  ingress {
    description      = "TLS from VPC"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = var.vpc_cidr_block
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = merge(var.tags,{
    Name = "${var.tags["project"]}-${var.tags["application"]}-${var.tags["environment"]}-bl"
  })
}