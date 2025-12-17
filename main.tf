resource "aws_elasticache_subnet_group" "default" {
  name       = "${var.name}-elasticache-subnet-group-${var.name}"
  subnet_ids = var.subnet_ids
}

resource "aws_elasticache_replication_group" "default" {
  at_rest_encryption_enabled    = var.encryption_at_rest_enabled
  automatic_failover_enabled    = var.automatic_failover_enabled
  cluster_mode                  = var.cluster_mode
  data_tiering_enabled          = var.data_tiering_enabled
  description                   = var.description
  engine                        = "redis"
  engine_version                = var.engine_version
  multi_az_enabled              = var.multi_az_enabled
  node_type                     = var.node_type
  num_node_groups               = var.cluster_mode == "enabled" ? var.num_node_groups : null
  number_cache_clusters         = var.cluster_mode == "disabled" ? var.number_cache_clusters : null
  parameter_group_name          = var.parameter_group_name
  replicas_per_node_group       = var.cluster_mode == "enabled" ? var.replicas_per_node_group : null
  replication_group_id          = var.name
  security_group_ids            = var.security_group_ids
  subnet_group_name             = aws_elasticache_subnet_group.default.name
  tags                          = local.tags
  transit_encryption_enabled    = var.encryption_in_transit_enabled
}
