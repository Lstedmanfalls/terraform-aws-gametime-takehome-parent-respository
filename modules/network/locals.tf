locals {
  vpc_cidr = "10.0.0.0/16"
  azs      = slice(data.aws_availability_zones, 0, 3)
}
