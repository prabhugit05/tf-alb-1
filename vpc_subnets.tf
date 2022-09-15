resource "aws_vpc" "vpc" {
  cidr_block = var.vpc_cidr
  enable_dns_hostnames = true
}
resource "aws_subnet" "pubsubnet"{
    for_each = var.pubsubnets
    vpc_id = aws_vpc.vpc.id
    cidr_block = each.value
    availability_zone = each.key
    tags = {
        Name = "TF-pubsubnet"
    }
  }
  resource "aws_internet_gateway" "igw" {
    vpc_id = aws_vpc.vpc.id
    tags = {
        Name = "tf-igw"
    }
}
  resource "aws_route_table" "pubrt" {
    vpc_id = aws_vpc.vpc.id
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.igw.id
    }
    tags = {
        Name = "tf-route-public"
    }
  }
resource "aws_route_table_association" "rta"{
    count = length(local.pub_sub_ids)
    route_table_id = aws_route_table.pubrt.id
    subnet_id = local.pub_sub_ids[count.index]
}
