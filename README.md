## Introduction

This Terraform module deploys an Azure Redis Cache instance with various configuration options.

## Usage

```
module "redis_cache" {
  source                        = "path/to/redis-module"
  name                          = "example-redis-cache"
  location                      = "eastus"
  redis_rg_name                 = "example-rg"
  capacity                      = 2
  family                        = "C"
  sku                           = "Basic"
  enable_non_ssl_port           = true
  redis_version                 = "6.0"
  public_network_access_enabled = true
  tags                          = {
    environment = "production"
  }
  redis_configuration = {
    aof_backup_enabled              = true
    enable_authentication           = true
    active_directory_authentication_enabled = false
    maxmemory_reserved              = 256
    maxmemory_delta                 = 512
    data_persistence_authentication_method = "ManagedIdentity"
    rdb_backup_max_snapshot_count   = 5
  }
}
```

### Variables - Required

## Variables

### Required

#### `name`

- **Description**: The name of the Redis cache.
- **Type**: `string`

#### `location`

- **Description**: The location where the Redis cache will be created.
- **Type**: `string`

#### `redis_rg_name`

- **Description**: The name of the resource group for the Redis cache.
- **Type**: `string`

#### `capacity`

- **Description**: The size of the Redis cache to deploy.
- **Type**: `number`

#### `family`

- **Description**: The family of the Redis cache to deploy.
- **Type**: `string`

#### `sku`

- **Description**: The SKU of the Redis cache to deploy.
- **Type**: `string`

#### `redis_version`

- **Description**: Specifies the Redis version.
- **Type**: `string`

### Optional

#### `enable_non_ssl_port`

- **Description**: Specifies whether the non-ssl port is enabled.
- **Type**: `bool`
- **Default**: `false`

#### `public_network_access_enabled`

- **Description**: Specifies whether public network access is enabled.
- **Type**: `bool`
- **Default**: `true`

#### `tags`

- **Description**: A mapping of tags to assign to the resource.
- **Type**: `map(string)`
- **Default**: `{}`

#### `redis_configuration`

- **Description**: Configuration options for the Redis cache.
- **Type**: `object`
- **Default**: `null`

## Redis Configuration Options

### `aof_backup_enabled`

- **Description**: Enable or disable AOF persistence for this Redis Cache.
- **Type**: `bool`
- **Default**: `false`
- **Note**: `aof_backup_enabled` can only be set when SKU is Premium.

### `aof_storage_connection_string_0`

- **Description**: First Storage Account connection string for AOF persistence.
- **Type**: `string`

### `aof_storage_connection_string_1`

- **Description**: Second Storage Account connection string for AOF persistence.
- **Type**: `string`

### `enable_authentication`

- **Description**: If set to `false`, the Redis instance will be accessible without authentication.
- **Type**: `bool`
- **Default**: `true`
- **Note**: `enable_authentication` can only be set to `false` if a `subnet_id` is specified; and only works if there aren't existing instances within the subnet with `enable_authentication` set to `true`.

### `active_directory_authentication_enabled`

- **Description**: Enable Microsoft Entra (AAD) authentication.
- **Type**: `bool`
- **Default**: `false`

### `maxmemory_reserved`

- **Description**: Value in megabytes reserved for non-cache usage e.g. failover.
- **Type**: `number`

### `maxmemory_delta`

- **Description**: The max-memory delta for this Redis instance.
- **Type**: `number`

### `maxmemory_policy`

- **Description**: How Redis will select what to remove when maxmemory is reached.
- **Type**: `string`
- **Default**: `volatile-lru`

### `data_persistence_authentication_method`

- **Description**: Preferred auth method to communicate to storage account used for data persistence.
- **Type**: `string`
- **Default**: `SAS`
- **Possible values**: `SAS`, `ManagedIdentity`

### `maxfragmentationmemory_reserved`

- **Description**: Value in megabytes reserved to accommodate for memory fragmentation.
- **Type**: `number`

### `rdb_backup_enabled`

- **Description**: Is Backup Enabled? Only supported on Premium SKUs.
- **Type**: `bool`
- **Default**: `false`
- **Note**: If `rdb_backup_enabled` is set to `true`, `rdb_storage_connection_string` must also be set.

### `rdb_backup_frequency`

- **Description**: The Backup Frequency in Minutes. Only supported on Premium SKUs.
- **Type**: `number`
- **Possible values**: `15`, `30`, `60`, `360`, `720`, `1440`

### `rdb_backup_max_snapshot_count`

- **Description**: The maximum number of snapshots to create as a backup. Only supported for Premium SKUs.
- **Type**: `number`

### `rdb_storage_connection_string`

- **Description**: The Connection String to the Storage Account. Only supported for Premium SKUs.
- **Type**: `string`
- **Format**: `DefaultEndpointsProtocol=https;AccountName=${STORAGE_ACCOUNT_NAME};AccountKey=${STORAGE_ACCOUNT_KEY};EndpointSuffix=core.windows.net`