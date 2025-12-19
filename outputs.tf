output "primary_endpoint_address" {
  description = "The address of the primary endpoint"
  value       = var.cluster_mode == "disabled" ? aws_elasticache_replication_group.cluster_disabled[0].primary_endpoint_address : aws_elasticache_replication_group.cluster_enabled[0].primary_endpoint_address
}

output "reader_endpoint_address" {
  description = "The address of the reader endpoint"
  value       = var.cluster_mode == "disabled" ? aws_elasticache_replication_group.cluster_disabled[0].reader_endpoint_address : aws_elasticache_replication_group.cluster_enabled[0].reader_endpoint_address
}

output "port" {
  description = "The port number on which each of the cache nodes accepts connections"
  value       = var.cluster_mode == "disabled" ? aws_elasticache_replication_group.cluster_disabled[0].port : aws_elasticache_replication_group.cluster_enabled[0].port
}
