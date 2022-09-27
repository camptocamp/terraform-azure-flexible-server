variable "location" {
  description = "Location of resource(s)."
  type        = string
}

variable "principal_id" {
  description = "Service principal"
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
  default     = 35
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
    max_connections                  = ""
    shared_buffers                   = ""
    effective_cache_size             = ""
    maintenance_work_mem             = ""
    checkpoint_completion_target     = ""
    wal_buffers                      = ""
    default_statistics_target        = ""
    random_page_cost                 = ""
    effective_io_concurrency         = ""
    work_mem                         = ""
    min_wal_size                     = ""
    max_wal_size                     = ""
    max_worker_processes             = ""
    max_parallel_workers_per_gather  = ""
    max_parallel_workers             = ""
    max_parallel_maintenance_workers = ""
    "azure.extensions"               = ""
  }
}

variable "instance_lock" {
  description = "If true, it’s not possible to remove the flexible-server"
  type        = bool
  default     = true
}