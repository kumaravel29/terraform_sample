provider "aws" {
  region = var.region
}

module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  cluster_name    = var.cluster_name
  cluster_version = "1.18"
  subnets         = module.vpc.private_subnets
  version         = "14.0.0"
  tags = {
    Environment = "personal"
  }

  vpc_id = module.vpc.vpc_id

  worker_groups = [
    {
      name                          = "node-1"
      instance_type                 = "t2.small"
      #additional_userdata           = "echo foo bar"
      asg_desired_capacity          = 1
      #additional_security_group_ids = [aws_security_group.worker_group_mgmt_one.id]
      root_volume_type              = "gp2"
    },
  ]
}

data "aws_eks_cluster" "cluster" {
  name = module.eks.cluster_id
}

data "aws_eks_cluster_auth" "cluster" {
  name = module.eks.cluster_id
}

data "aws_availability_zones" "available" {}
