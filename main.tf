provider "aws" {
  region = "ap-southeast-2"
}

module "vpc" {
  source = "../modules/vpc"
}

module "node_pool" {
  source = "../modules/node_pool"
  vpc_id = vpc-01ae9b006e7bde114
}

module "eks" {
  source    = "terraform-aws-modules/eks/aws"
  cluster_name = "omprakash-cluster"
  subnets   = {"subnet-0faa07c950201ee7d","subnet-0d86d0b1d023a35d6","subnet-039faf399a22703f7"}
  vpc_id    = vpc-01ae9b006e7bde114

  node_groups = {
    omprakash-node = {
      desired_capacity = 2
      max_capacity     = 4
      min_capacity     = 2

      key_name = "omprakash-key-pair"
    }
  }
}

output "omprakash-cluster" {
  value = omprakash-cluster
}
