# Terraform AWS ElastiCache Module

This module provisions an AWS ElastiCache (Redis) cluster.

## Usage

### Cluster Mode Disabled

```hcl
module "elasticache" {
  source = "github.com/footprint-it-solutions/terraform-module-elasticache"

  name               = "my-elasticache-cluster"
  subnet_ids         = ["subnet-12345", "subnet-67890"]
  security_group_ids = ["sg-12345"]
  tags = {
    Environment = "production"
    Project     = "my-project"
  }
}
```

### Cluster Mode Enabled

```hcl
module "elasticache" {
  source = "github.com/footprint-it-solutions/terraform-module-elasticache"

  name                    = "my-elasticache-cluster"
  subnet_ids              = ["subnet-12345", "subnet-67890"]
  security_group_ids      = ["sg-12345"]
  cluster_mode            = "enabled"
  num_node_groups         = 2
  replicas_per_node_group = 1
  tags = {
    Environment = "production"
    Project     = "my-project"
  }
}
```

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| encryption_at_rest_enabled | Specifies whether to enable encryption at rest. | `bool` | `true` | no |
| automatic_failover_enabled | Specifies whether a read-only replica is automatically promoted to read/write primary if the existing primary fails | `bool` | `true` | no |
| cluster_mode | Specifies whether Redis Cluster mode is enabled. | `string` | `"disabled"` | no |
| data_tiering_enabled | Specifies whether to enable data tiering. Data tiering is only supported for replication groups using the r6gd node type | `bool` | `false` | no |
| description | The description of the ElastiCache replication group. | `string` | `"ElastiCache replication group"` | no |
| engine_version | The version number of the cache engine to be used for this cluster | `string` | `"6.0.5"` | no |
| multi_az_enabled | Specifies whether to enable Multi-AZ Support for the replication group | `bool` | `true` | no |
| name | The name of the ElastiCache cluster | `string` | - | yes |
| node_type | The compute and memory capacity of the nodes in the node group | `string` | `"cache.t2.micro"` | no |
| num_cache_clusters | The number of cache clusters (nodes) in this replication group. Only used when cluster_mode is disabled. | `number` | `2` | no |
| num_node_groups | The number of node groups (shards) for this Redis replication group. Only used when cluster_mode is enabled. | `number` | `1` | no |
| preferred_cache_cluster_azs | A list of EC2 availability zones in which the replication group's cache clusters will be created. The first item in the list will be the primary node. Ignored when updating. | `list(string)` | `null` | no |
| replicas_per_node_group | The number of replicas per node group. Only used when cluster_mode is enabled. | `number` | `1` | no |
| parameter_group_name | The name of the parameter group to associate with this cache cluster | `string` | `"default.redis6.x"` | no |
| security_group_ids | A list of security group IDs to associate with this cache cluster | `list(string)` | - | yes |
| subnet_ids | A list of subnet IDs to associate with the ElastiCache cluster | `list(string)` | - | yes |
| tags | A mapping of tags to assign to the resource | `map(string)` | `{}` | no |
| encryption_in_transit_enabled | Specifies whether to enable encryption in transit. | `bool` | `true` | no |

## Outputs

| Name | Description |
|------|-------------|
| primary_endpoint_address | The address of the primary endpoint |
| reader_endpoint_address | The address of the reader endpoint |
| port | The port number on which each of the cache nodes accepts connections |
