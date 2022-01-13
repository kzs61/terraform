data "aws_availability_zones" "azs" {
    state = "available"
}

resource "aws_subnet" "demo_public_subnet" {
    count = length(data.aws_availability_zones.azs.names)
    vpc_id = aws_vpc.demo_vpc.id
    cidr_block = cidrsubnet(var.cidr_block, 8, count.index)
    availability_zone = data.aws_availability_zones.azs.names[count.index]

    tags = {
        Name = "PublicSubnet-${count.index +1}"
    }

}