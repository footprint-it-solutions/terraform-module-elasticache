output "primary_endpoint_address" {
  description = "The address of the primary endpoint"
  value       = aws_elasticache_replication_group.default.primary_endpoint_address
}

output "reader_endpoint_address" {
  description = "The address of the reader endpoint"
  value       = aws_elasticache_replication_group.default.reader_endpoint_address
}

output "port" {
  description = "The port number on which each of the cache nodes accepts connections"
  value       = aws_elasticache_replication_group.default.port
}
