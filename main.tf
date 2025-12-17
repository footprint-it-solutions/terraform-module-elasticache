resource "aws_elasticache_subnet_group" "default" {
  name       = "${var.name}-elasticache-subnet-group"
  subnet_ids = var.subnet_ids
}

resource "aws_elasticache_replication_group" "cluster_disabled" {
  count = var.cluster_mode == "disabled" ? 1 : 0

  at_rest_encryption_enabled    = var.encryption_at_rest_enabled
  automatic_failover_enabled    = var.automatic_failover_enabled
  cluster_mode                  = "disabled"
  data_tiering_enabled          = var.data_tiering_enabled
  description                   = var.description
  engine                        = "redis"
  engine_version                = var.engine_version
  multi_az_enabled              = var.multi_az_enabled
  node_type                     = var.node_type
  num_cache_clusters            = var.num_cache_clusters
  parameter_group_name          = var.parameter_group_name
  preferred_cache_cluster_azs   = var.preferred_cache_cluster_azs
  replication_group_id          = var.name
  security_group_ids            = var.security_group_ids
  subnet_group_name             = aws_elasticache_subnet_group.default.name
  tags                          = local.tags
  transit_encryption_enabled    = var.encryption_in_transit_enabled
}

resource "aws_elasticache_replication_group" "cluster_enabled" {
  count = var.cluster_mode == "enabled" ? 1 : 0

  at_rest_encryption_enabled    = var.encryption_at_rest_enabled
  automatic_failover_enabled    = var.automatic_failover_enabled
  cluster_mode                  = "enabled"
  data_tiering_enabled          = var.data_tiering_enabled
  description                   = var.description
  engine                        = "redis"
  engine_version                = var.engine_version
  multi_az_enabled              = var.multi_az_enabled
  node_type                     = var.node_type
  num_node_groups               = var.num_node_groups
  replicas_per_node_group       = var.replicas_per_node_group
  parameter_group_name          = var.parameter_group_name
  replication_group_id          = var.name
  security_group_ids            = var.security_group_ids
  subnet_group_name             = aws_elasticache_subnet_group.default.name
  tags                          = local.tags
  transit_encryption_enabled    = var.encryption_in_transit_enabled
}
