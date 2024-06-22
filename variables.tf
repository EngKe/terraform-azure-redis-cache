variable "name" {
  description = "The name of the Redis cache."
  type        = string
}

variable "location" {
  description = "The location where the Redis cache will be created."
  type        = string
}

variable "redis_rg_name" {
  description = "The name of the resource group for the Redis cache."
  type        = string
}

variable "capacity" {
  description = "The size of the Redis cache to deploy."
  type        = number
}

variable "family" {
  description = "The family of the Redis cache to deploy."
  type        = string
}

variable "sku" {
  description = "The SKU of the Redis cache to deploy."
  type        = string
}

variable "enable_non_ssl_port" {
  description = "Specifies whether the non-ssl port is enabled."
  type        = bool
  default     = false
}

variable "redis_version" {
  description = "Specifies the Redis version."
  type        = string
}

variable "public_network_access_enabled" {
  description = "Specifies whether public network access is enabled."
  type        = bool
  default     = true
}

variable "tags" {
  description = "A mapping of tags to assign to the resource."
  type        = map(string)
  default     = {}
}

variable "redis_configuration" {
  description = "Configuration options for the Redis cache."
  type = object({
    aof_backup_enabled                      = optional(bool, false)
    aof_storage_connection_string_0         = optional(string)
    aof_storage_connection_string_1         = optional(string)
    enable_authentication                   = optional(bool, true)
    active_directory_authentication_enabled = optional(bool, false)
    maxmemory_reserved                      = optional(number)
    maxmemory_delta                         = optional(number)
    maxmemory_policy                        = optional(string, "volatile-lru")
    data_persistence_authentication_method  = optional(string, "SAS")
    maxfragmentationmemory_reserved         = optional(number)
    rdb_backup_enabled                      = optional(bool, false)
    rdb_backup_frequency                    = optional(number)
    rdb_backup_max_snapshot_count           = optional(number)
    rdb_storage_connection_string           = optional(string)
  })
  default = null
}
