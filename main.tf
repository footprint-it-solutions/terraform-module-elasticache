resource "aws_elasticache_subnet_group" "default" {
  name       = "${var.name}-elasticache-subnet-group-${var.name}"
  subnet_ids = var.subnet_ids
}

resource "aws_elasticache_replication_group" "default" {
  automatic_failover_enabled    = var.automatic_failover_enabled
  cluster_mode                  = var.cluster_mode
  data_tiering_enabled          = var.data_tiering_enabled
  engine                        = "redis"
  engine_version                = var.engine_version
  multi_az_enabled              = var.multi_az_enabled
  node_type                     = var.node_type
  number_cache_clusters         = var.number_cache_clusters
  num_node_groups               = var.num_node_groups
  replicas_per_node_group       = var.replicas_per_node_group
  parameter_group_name          = var.parameter_group_name
  replication_group_description = "ElastiCache replication group for ${var.name}"
  replication_group_id          = var.name
  security_group_ids            = var.security_group_ids
  subnet_group_name             = aws_elasticache_subnet_group.default.name
  tags                          = local.tags
}
