output "redis_cache_id" {
  description = "The ID of the Redis cache."
  value       = azurerm_redis_cache.rediscache.id
}

output "redis_cache_name" {
  description = "The name of the Redis cache."
  value       = azurerm_redis_cache.rediscache.name
}
