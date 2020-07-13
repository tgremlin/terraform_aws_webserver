resource "aws_vpc" "vpc" {
    cidr_block  = var.vpc_cidr

    tags = {
        Name = var.vpc_name
    }
}

resource "aws_subnet" "subnet" {
    vpc_id = aws_vpc.vpc.id
    cidr_block = var.priv_sub

    tags = {
        Name = "${var.vpc_name}_Private_Subnet"
    }
}

resource "aws_internet_gateway" "gw" {
    vpc_id = aws_vpc.vpc.id

    tags = {
        Name = "${var.vpc_name}_Internet_Gateway"
    }
}

resource "aws_route_table" "route" {
    vpc_id  = aws_vpc.vpc.id

    route   {
        cidr_block = var.vpc_cidr
        gateway_id = aws_internet_gateway.gw.id
    }

    tags = {
        Name = "${var.vpc_name}_Route_Table"
    }
}

resource "aws_route_table_association" "gw_association" {
    gateway_id = aws_internet_gateway.gw.id
    route_table_id = aws_route_table.route.id
}

resource "aws_route_table_association" "subnet_association" {
    subnet_id = aws_subnet.subnet.id
    route_table_id = aws_route_table.route.id
}
