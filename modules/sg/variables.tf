variable "sg_name" {
    type = string
}
variable "sg_description" {
    type = string
}
variable "vpc_id" {
    type = string
}
variable "ingress_from_port" {
    type = number
}
variable "ingress_to_port" {
    type = number
}
variable "ingress_protocol" {
    type = string
}
variable "ingress_cidr_blocks" {
    type = list(string)
}
variable "egress_from_port" {
    type = number
    default = 0
}
variable "egress_to_port" {
    type = number
    default = 0
}
variable "egress_protocol" {
    type = string
    default = "-1"
}
variable "egress_cidr" {
    type = list(string)
    default = ["0.0.0.0/0"]
}
