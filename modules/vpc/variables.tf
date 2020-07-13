variable "vpc_name" {
    type = string
    description = "VPC Name"
}
variable "vpc_cidr" {
    type        = string
    description = "VPC CIDR"
}
variable "priv_sub" {
    type = string
    description = "VPC Private subnet"
}
