output "vpc_id" {
    value = aws_vpc.vpc.id
}
output "vpc_gateway_id" {
    value = aws_internet_gateway.gw.id
}
output "vpc_priv_subnet_id" {
    value = aws_subnet.subnet.id
}