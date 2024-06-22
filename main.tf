resource "azurerm_redis_cache" "rediscache" {
  name                          = var.name
  location                      = var.location
  resource_group_name           = var.redis_rg_name
  capacity                      = var.capacity
  family                        = var.family
  sku_name                      = var.sku
  enable_non_ssl_port           = var.enable_non_ssl_port
  minimum_tls_version           = "1.2"
  redis_version                 = var.redis_version
  public_network_access_enabled = var.public_network_access_enabled
  tags                          = var.tags

  dynamic "redis_configuration" {
    for_each = var.redis_configuration != null ? [var.redis_configuration] : []
    content {
      aof_backup_enabled                      = lookup(redis_configuration.value, "aof_backup_enabled", false)
      aof_storage_connection_string_0         = lookup(redis_configuration.value, "aof_storage_connection_string_0", null)
      aof_storage_connection_string_1         = lookup(redis_configuration.value, "aof_storage_connection_string_1", null)
      enable_authentication                   = lookup(redis_configuration.value, "enable_authentication", true)
      active_directory_authentication_enabled = lookup(redis_configuration.value, "active_directory_authentication_enabled", false)
      maxmemory_reserved                      = lookup(redis_configuration.value, "maxmemory_reserved", null)
      maxmemory_delta                         = lookup(redis_configuration.value, "maxmemory_delta", null)
      maxmemory_policy                        = lookup(redis_configuration.value, "maxmemory_policy", "volatile-lru")
      data_persistence_authentication_method  = lookup(redis_configuration.value, "data_persistence_authentication_method", "SAS")
      maxfragmentationmemory_reserved         = lookup(redis_configuration.value, "maxfragmentationmemory_reserved", null)
      rdb_backup_enabled                      = lookup(redis_configuration.value, "rdb_backup_enabled", false)
      rdb_backup_frequency                    = lookup(redis_configuration.value, "rdb_backup_frequency", null)
      rdb_backup_max_snapshot_count           = lookup(redis_configuration.value, "rdb_backup_max_snapshot_count", null)
      rdb_storage_connection_string           = lookup(redis_configuration.value, "rdb_storage_connection_string", null)
    }
  }
}
