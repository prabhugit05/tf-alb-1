variable "pubsubnets" {
  type = map(any)
  default = {
    "ap-south-1a" : "10.0.0.0/24",
    "ap-south-1b" : "10.0.1.0/24",
  }
}
variable "region" {
  type        = string
  default     = "ap-south-1"
  description = "Choose region for your stack"
}
variable "vpc_cidr" {
  type        = string
  default     = "10.0.0.0/16"
  description = "Choose CIDR block for VPC"
}
variable "ami_id" {
  type    = string
  default = "ami-068257025f72f470d"
}