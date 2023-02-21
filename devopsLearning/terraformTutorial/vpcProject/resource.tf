resource aws_instance web {
    ami           = "ami-0557a15b87f6559cf"
    instance_type = "t2.micro"
}
resource aws_instance db {
    ami           = "ami-0557a15b87f6559cf"
    instance_type = "t2.micro"
}

resource aws_vpc webDbVpc{
  cidr_block = "10.0.0.0/16"
  tags = {
    Name =  "webDbVpc"
  }
}

resource aws_subnet pblcSubnet {
  vpc_id     = aws_vpc.webDbVpc.id
  cidr_block = "10.0.1.0/24"
}

resource aws_subnet prvtSubnet {
  vpc_id     = aws_vpc.webDbVpc.id
  cidr_block = "10.0.2.0/24"
}

resource aws_internet_gateway webPublicGateway {
  vpc_id = aws_vpc.webDbVpc.id
  tags =  {
    Name = "devopsKnowledge-igw"
    }
}

# data aws_nat_gateway dbNatGateway {
#   subnet_id = aws_subnet.prvtSubnet.id
# }

# resource aws_route_table prvtRoute {
#   vpc_id = aws_vpc.webDbVpc.id

#   route {
#     cidr_block = "10.0.2.0/24"
#     gateway_id = aws_nat_gateway.dbNatGateway.id
#   }
# }

resource aws_route_table pblcRoute {
  vpc_id = aws_vpc.webDbVpc.id

  route {
    cidr_block = "0.0.0.0/24"
    gateway_id = aws_internet_gateway.webPublicGateway.id
  }

  tags = {
    Name =  "pblcRoute"
  }
}
resource aws_security_group devopsKnowledge {
  name        = "allow_tls"
  description = "Allow TLS inbound traffic"
  vpc_id      = aws_vpc.webDbVpc.id

  ingress {
    description      = "TLS from VPC"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "devopsKnowledge-sg"
  }
}

resource "aws_route_table_association" "publicAssociation" {
  subnet_id      = aws_subnet.pblcSubnet.id
  route_table_id = aws_route_table.pblcRoute.id
}