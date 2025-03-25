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

variable "vnet_resource_group_name" {
  description = "VNET Resource group name"
  type        = string
}

variable "tenant_id" {
  description = "Tenant ID."
  type        = string
}

variable "create_subnet" {
  description = "Create Subnet for PostgreSQL Flexible Server."
  type        = bool
  default     = false
}

variable "create_private_dns_zone" {
  description = "Create Private dns zone for PostgreSQL Flexible Server."
  type        = bool
  default     = false
}


variable "delegated_subnet_id" {
  description = "Delegated Subnet ID for PostgreSQL Flexible Server."
  type        = string
  default     = null
}

variable "virtual_network_name" {
  description = "Virtual Network Name where Subnet will be created."
  type        = string
  default     = null
}

variable "virtual_network_id" {
  description = "Virtual Network ID where Subnet will be created."
  type        = string
  default     = null
}

variable "virtual_network_pipeline_id" {
  description = "Virtual Network ID where Subnet will be created."
  type        = string
  default     = null
}

variable "name" {
  description = "Name for the PostgreSQL Flexible Server. This is also used as default for DNS private zone, keyvault and snet names."
  type        = string
}

variable "private_dns_zone_name_prefix" {
  description = "Private DNS private zone name prefix, if undefined  then `name` is used"
  type        = string
  default     = null
}

variable "subnet_name_prefix" {
  description = "Subnet name prefix, if undefined  then `name` is used"
  type        = string
  default     = null
}

variable "subnet_address_prefixes" {
  description = "Address prefixes of Subnet to be created."
  type        = list(string)
}

variable "keyvault_name_prefix" {
  description = "Keyvault name prefix, if undefined  then `name` is used"
  type        = string
  default     = null
}

variable "public_network_access_enabled" {
  description = "Is public network access enabled on the PostgreSQL Flexible Server."
  type        = bool
  default     = false
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

variable "zone" {
  description = "(Optional) Specifies the Availability Zone in which the PostgreSQL Flexible Server should be located."
  type        = string
  default     = ""
}

variable "maintenance_window" {
  description = "Cron maintenance window (default sunday 23:59."
  type = object({
    day_of_week  = number
    start_hour   = number
    start_minute = number
  })
  default = {
    day_of_week  = 0
    start_hour   = 23
    start_minute = 59
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
  description = "The mode to create a new PostgreSQL Flexible Server. useful for PointInTimeRestore"
  type        = string
  default     = "Default"
}

variable "source_server_id" {
  description = "The source PostgreSQL Flexible Server ID to restore from. Required when create_mode is PointInTimeRestore."
  type        = string
  default     = null
}

variable "point_in_time_restore_time_in_utc" {
  description = "The point in time to restore the PostgreSQL Flexible Server to. Required when create_mode is PointInTimeRestore."
  type        = string
  default     = null
}
