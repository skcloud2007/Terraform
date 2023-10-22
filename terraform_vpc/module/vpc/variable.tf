variable "vpc_cidr" {
    description = "VPC_CIDR_Range"
    type = string   
}

variable "subnet_cidr" {
    description = "subnets data"
    type = list(string)
}

variable "subnet_names" {
    description = "Subnet_cidrs"
    type = lsit(string)
    default = ["PublicSubnet1", "PublicSubnet2"]
    
}