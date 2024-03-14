# resource "aws_eks_cluster" "MicroService" {
#   name     = "Python-MicroService"
#   role_arn = "arn:aws:iam::307000127327:role/eksClusterRole"
#   version  = "1.29"
#   access_config {
#     authentication_mode                         = "API"
#     bootstrap_cluster_creator_admin_permissions = true
#   }

#   vpc_config {
#     subnet_ids             = [aws_subnet.traccarSubnets[0].id, aws_subnet.traccarSubnets[1].id, aws_subnet.traccarSubnets[2].id]
#     endpoint_public_access = true
#   }
# }

# resource "aws_eks_node_group" "NodeGroup" {
#   cluster_name    = aws_eks_cluster.MicroService.name
#   node_group_name = "NodeGroup"
#   node_role_arn   = "arn:aws:iam::307000127327:role/AmazonEKSNodeRole"
#   subnet_ids      = [aws_subnet.traccarSubnets[0].id, aws_subnet.traccarSubnets[1].id, aws_subnet.traccarSubnets[2].id]
#   ami_type        = "AL2_x86_64"
#   capacity_type   = "ON_DEMAND"
#   instance_types  = ["t2.micro"]
#   disk_size       = 10

#   scaling_config {
#     desired_size = 1
#     max_size     = 1
#     min_size     = 1
#   }

#   update_config {
#     max_unavailable = 1
#   }
# }