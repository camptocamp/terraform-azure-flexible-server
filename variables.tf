variable "location" {
  description = "Location of resource(s)."
  type        = string
}

variable "pg_version" {
  description = "Postgresql engine version"
  type        = string
  default     = "13"
}

variable "administrator_login" {
  description = "Postgresql admin name"
  type        = string
  default     = "psqladmin"

}

variable "sku_name" {
  description = "Postgresql vm size"
  type        = string
  default     = "GP_Standard_D2s_v3"
}

variable "storage_mb" {
  description = "Postgresql size storage in megabytes"
  type        = number
  default     = 32768
}

variable "resource_group_name" {
  description = "Resource group name."
  type        = string
}

variable "tenant_id" {
  description = "Tenant ID."
  type        = string
}

variable "virtual_network_name" {
  description = "Virtual Network Name where Subnet will be created."
  type        = string
}

variable "virtual_network_id" {
  description = "Virtual Network ID where Subnet will be created."
  type        = string
}

variable "virtual_network_pipeline_id" {
  description = "Virtual Network ID where Subnet will be created."
  type        = string
}

variable "name" {
  description = "Name for the PostgreSQL Flexible Server."
  type        = string
}

variable "subnet_name" {
  description = "Subnet Name for to be created."
  type        = string
}

variable "subnet_address_prefixes" {
  description = "Address prefixes of Subnet to be created."
  type        = list(string)
}

variable "backup_retention_days" {
  description = "Backup retention days for the PostgreSQL Flexible Server."
  type        = number
  default     = 7
}

variable "maintenance_window" {
  description = "Cron maintenance window (default sunday midnight)."
  type = object({
    day_of_week  = number
    start_hour   = number
    start_minute = number
  })
  default = {
    day_of_week  = 0
    start_hour   = 0
    start_minute = 0
  }
}

variable "private_dns_zone_name" {
  description = ""
  type        = string
}

variable "postgresql_config" {
  type = map(string)
  default = {
    max_connections                  = "1600"
    shared_buffers                   = "1048576" # 8KB => 8GB
    effective_cache_size             = "3145728" # 8KB => 24GB
    maintenance_work_mem             = "2097151" # KB => 2GB
    checkpoint_completion_target     = "0.9"
    wal_buffers                      = "2048" # 8KB => 16MB
    default_statistics_target        = "100"
    random_page_cost                 = "1.1"
    effective_io_concurrency         = "200"
    work_mem                         = "59392" # KB => 58MB
    min_wal_size                     = "1024"  # MB => 1GB
    max_wal_size                     = "4096"  # MB => 4GB
    max_worker_processes             = "4"
    max_parallel_workers_per_gather  = "2"
    max_parallel_workers             = "4"
    max_parallel_maintenance_workers = "2"
    "azure.extensions"               = "DBLINK,PG_STAT_STATEMENTS,UNACCENT,POSTGIS,PG_TRGM"
  }
}
