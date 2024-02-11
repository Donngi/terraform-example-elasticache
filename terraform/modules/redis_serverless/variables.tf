variable "vpc_id" {
  type        = string
  description = "vpc id"
}

variable "vpc_cidr_block" {
  type = string
  description = "vpc cidr block"
}

variable "subnet_ids" {
  type        = list(string)
  description = "Subnet ids"
}
