# Flexible-server module

A terraform module to provision and configure PostgreSQL server on Azure.
The azure service used for this it’s call FLEXIBLE-SERVER.

## Usage

### Server creation

```hcl
module "flexible_server" {
  source                      = "git::https://github.com/camptocamp/terraform-azure-flexible-server?ref=v0.0.1"
  name                        = "my-psq-fx-srv"
  resource_group_name         = "default"
  location                    = "France Central"
  subnet_address_prefixes     = ["10.10.0.0/24"]
  sku_name                    = "GP_Standard_D4s_v3"
  storage_mb                  = 32768
  tenant_id                   = "<my-tenant-id>"
  instance_lock               = false
  postgresql_config = {
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
```

### Server restoration
