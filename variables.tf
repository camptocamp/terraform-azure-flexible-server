variable "location" {
  description = "Location of resource(s)."
  type        = string
}

variable "contributors" {
  description = "List of service principal ID to have Contributor role for the PostgreSQL Flexible Server."
  type        = list(string)
  default     = []
}

variable "users_on_keyvault" {
  description = "List of object ID (user, service principal or security group in the AD tenant) to have predifined user-like required access to kv."
  type        = list(string)
  default     = []
}

variable "terraformers_on_keyvault" {
  description = "List of object ID (user, service principal or security group in the AD tenant) to have predifined terraform-like required access to kv."
  type        = list(string)
  default     = []
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
  description = "Name for the PostgreSQL Flexible Server. This is also used for the DNS private zone name."
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

variable "geo_redundant_backup_enabled" {
  description = "(Optional) Is Geo-Redundant backup enabled on the PostgreSQL Flexible Server. Defaults to false. Changing this forces a new PostgreSQL Flexible Server to be created."
  type        = bool
  default     = false
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

variable "create_mode" {
  description = "(Optional) The creation mode which can be used to restore or replicate existing servers. Possible values are Default and PointInTimeRestore. Changing this forces a new PostgreSQL Flexible Server to be created."
  type        = string
  default     = "Default" # Or PointInTimeRestore
}

variable "point_in_time_restore_time_in_utc" {
  description = "Optional) The point in time to restore from source_server_id when create_mode is PointInTimeRestore. Changing this forces a new PostgreSQL Flexible Server to be created."
  type        = string
}

variable "source_server_id" {
  description = "(Optional) The resource ID of the source PostgreSQL Flexible Server to be restored. Required when create_mode is PointInTimeRestore. Changing this forces a new PostgreSQL Flexible Server to be created."
  type        = string
}
