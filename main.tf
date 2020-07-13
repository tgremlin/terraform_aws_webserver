provider "aws" {
    region = var.region
}

module "vpc" {
    source = "./modules/vpc"
    
    vpc_name = "Allan-Test"
    vpc_cidr = "10.0.0.0/16"
    priv_sub = "10.0.1.0/24"
}

module "sg" {
    source = "./modules/sg"

    vpc_id = module.vpc.vpc_id
    sg_name = "Allan-Test-Security-Group"
    sg_description = "Allow web traffic into VPC"
    
    ingress_from_port = 80
    ingress_to_port = 80
    ingress_protocol = "tcp"
    ingress_cidr_blocks = ["10.0.1.0/24"]
}

resource "aws_key_pair" "ssh" {
    key_name    = "ssh_key"
    public_key  = file("./secrets/ubuntu_rsa.pub")
}

resource "aws_instance" "web" {
    ami = "ami-0f330b426f35ac7f4"
    instance_type = "t2.micro"

    key_name        = aws_key_pair.ssh.public_key
}