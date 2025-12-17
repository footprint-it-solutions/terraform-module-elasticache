variable "encryption_at_rest_enabled" {
  description = "Specifies whether to enable encryption at rest."
  type        = bool
  default     = true
}

variable "automatic_failover_enabled" {
  description = "Specifies whether a read-only replica is automatically promoted to read/write primary if the existing primary fails"
  type        = bool
  default     = true
}

variable "cluster_mode" {
  description =<<EOF
    Specifies whether Redis Cluster mode is enabled.
    when you set cluster_mode = "enabled", you are telling AWS ElastiCache to provision a Redis cluster with sharding enabled.
    You can then use the num_node_groups variable to specify the number of shards and replicas_per_node_group to specify the number of replicas for each shard.
  EOF

  type        = string
  default     = "disabled"
}

variable "data_tiering_enabled" {
  description = "Specifies whether to enable data tiering. Data tiering is only supported for replication groups using the r6gd node type"
  type        = bool
  default     = false
}

variable "description" {
  description = "The description of the ElastiCache replication group."
  type        = string
  default     = "ElastiCache replication group"
}

variable "engine_version" {
  description = "The version number of the cache engine to be used for this cluster"
  type        = string
  default     = "6.0.5"
}

variable "multi_az_enabled" {
  description = "Specifies whether to enable Multi-AZ Support for the replication group"
  type        = bool
  default     = true
}

variable "name" {
  description = "The name of the ElastiCache cluster"
  type        = string
}

variable "node_type" {
  description = "The compute and memory capacity of the nodes in the node group"
  type        = string
  default     = "cache.t2.micro"
}

variable "number_cache_clusters" {
  description = "The number of cache clusters (nodes) in this replication group. Only used when cluster_mode is disabled."
  type        = number
  default     = 2
}

variable "num_node_groups" {
  description = "The number of node groups (shards) for this Redis replication group. Only used when cluster_mode is enabled."
  type        = number
  default     = 1
}

variable "preferred_cache_cluster_azs" {
  description = "A list of EC2 availability zones in which the replication group's cache clusters will be created. The first item in the list will be the primary node. Ignored when updating."
  type        = list(string)
  default     = null
}

variable "replicas_per_node_group" {
  description = "The number of replicas per node group. Only used when cluster_mode is enabled."
  type        = number
  default     = 1
}

variable "parameter_group_name" {
  description = "The name of the parameter group to associate with this cache cluster"
  type        = string
  default     = "default.redis6.x"
}

variable "security_group_ids" {
  description = "A list of security group IDs to associate with this cache cluster"
  type        = list(string)
}

variable "subnet_ids" {
  description = "A list of subnet IDs to associate with the ElastiCache cluster"
  type        = list(string)
}

variable "tags" {
  description = "A mapping of tags to assign to the resource"
  type        = map(string)
  default     = {}
}

variable "encryption_in_transit_enabled" {
  description = "Specifies whether to enable encryption in transit."
  type        = bool
  default     = true
}
