variable "vpc_cidr" {
    description = "VPC_CIDR_Range"
    type = string
    
}

variable "subnet_cidr" {
    description = "subnets data"
    type = list(string)
}