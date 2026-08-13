# Changelog

## [1.8.0](https://github.com/camptocamp/terraform-azure-flexible-server/compare/v1.7.0...v1.8.0) (2026-08-13)


### Features

* added configuration to enabled logs on azure for postgresql ([848559a](https://github.com/camptocamp/terraform-azure-flexible-server/commit/848559a2c364df264da83a272aa859a2ab19078e))
* added configuration to enabled logs on azure for postgresql ([adbc86e](https://github.com/camptocamp/terraform-azure-flexible-server/commit/adbc86e5cb3aa230e0b85c207c5638d4f808c48a))
* added variable to set logs conf ([3178a06](https://github.com/camptocamp/terraform-azure-flexible-server/commit/3178a068abfeb10c22093354189c00892efaf314))
* apply the configuration only to the server postgresql ([868cb8c](https://github.com/camptocamp/terraform-azure-flexible-server/commit/868cb8ce833fb39e5e0e58b4b07cf6c9961ee8c6))


### Bug Fixes

* **ci:** bump deprecated release-please action version ([cb20b16](https://github.com/camptocamp/terraform-azure-flexible-server/commit/cb20b16821c28fab3155226dc47da5c22c8be8e6))
* **ci:** config files ([f07a7cb](https://github.com/camptocamp/terraform-azure-flexible-server/commit/f07a7cb59bd15de4b2fdf0420cb9feab7de249a2))
* **ci:** config files ([f8cf7ba](https://github.com/camptocamp/terraform-azure-flexible-server/commit/f8cf7ba5b1cc72d7c826406304482d29df6dce66))
* **ci:** create config file ([f579b7c](https://github.com/camptocamp/terraform-azure-flexible-server/commit/f579b7c31810d77fd603dd8129c0daa026a4a5a9))

## [1.7.0](https://github.com/camptocamp/terraform-azure-flexible-server/compare/v1.6.0...v1.7.0) (2026-06-09)


### Features

* allow tagging resources ([7749b3f](https://github.com/camptocamp/terraform-azure-flexible-server/commit/7749b3f80b466651e76fc6d980b2d8e9df6cf153))


### Bug Fixes

* **ci:** bump deprecated release-please action version ([cb20b16](https://github.com/camptocamp/terraform-azure-flexible-server/commit/cb20b16821c28fab3155226dc47da5c22c8be8e6))
* **ci:** config files ([f07a7cb](https://github.com/camptocamp/terraform-azure-flexible-server/commit/f07a7cb59bd15de4b2fdf0420cb9feab7de249a2))
* **ci:** config files ([f8cf7ba](https://github.com/camptocamp/terraform-azure-flexible-server/commit/f8cf7ba5b1cc72d7c826406304482d29df6dce66))
* **ci:** create config file ([f579b7c](https://github.com/camptocamp/terraform-azure-flexible-server/commit/f579b7c31810d77fd603dd8129c0daa026a4a5a9))

## [1.7.0](https://github.com/camptocamp/terraform-azure-flexible-server/compare/v1.6.0...v1.7.0) (2026-04-21)


### Features

* allow tagging resources ([7749b3f](https://github.com/camptocamp/terraform-azure-flexible-server/commit/7749b3f80b466651e76fc6d980b2d8e9df6cf153))

## [1.6.0](https://github.com/camptocamp/terraform-azure-flexible-server/compare/v1.5.0...v1.6.0) (2025-03-25)


### Features

* **secret:** add server name and ressource group name to keyvault ([b9c93a3](https://github.com/camptocamp/terraform-azure-flexible-server/commit/b9c93a30b3ff05e1a765d1b04bc7d12127cd6460))


### Bug Fixes

* delete comment ([83c94a9](https://github.com/camptocamp/terraform-azure-flexible-server/commit/83c94a98ce15933baaa107ce6639c36177737d48))
* **providers:** do not require kubernetes provider ([aac0680](https://github.com/camptocamp/terraform-azure-flexible-server/commit/aac0680eecd4ba10cc7f4e96e16c7e7d521d26e3))

## [1.5.0](https://github.com/camptocamp/terraform-azure-flexible-server/compare/v1.4.1...v1.5.0) (2024-10-14)


### Features

* allow to opt-out from vnet pipeline id dns integration ([dab7d71](https://github.com/camptocamp/terraform-azure-flexible-server/commit/dab7d71bb5871a0cf47e384a509dde580e29b5d9))

## [1.4.1](https://github.com/camptocamp/terraform-azure-flexible-server/compare/v1.4.0...v1.4.1) (2024-09-05)


### Bug Fixes

* pemit to disable public network ([6d32fae](https://github.com/camptocamp/terraform-azure-flexible-server/commit/6d32fae7f29648cc429e0eb6189aa8084e8ee619))

## [1.4.0](https://github.com/camptocamp/terraform-azure-flexible-server/compare/v1.3.0...v1.4.0) (2024-05-27)


### Features

* **subnet:** permit to use default subnet ([38e7457](https://github.com/camptocamp/terraform-azure-flexible-server/commit/38e74578cb9946ef8a41de096516e870179a8cb4))

## [1.3.0](https://github.com/camptocamp/terraform-azure-flexible-server/compare/v1.2.0...v1.3.0) (2024-04-30)


### Features

* **output:** add id output ([75c7957](https://github.com/camptocamp/terraform-azure-flexible-server/commit/75c7957fcc3fbd6d8a1c616821336b80a8e9d126))

## [1.2.0](https://github.com/camptocamp/terraform-azure-flexible-server/compare/v1.1.1...v1.2.0) (2024-04-30)


### Features

* **vnet:** permit to specify a vnet ([059c9c6](https://github.com/camptocamp/terraform-azure-flexible-server/commit/059c9c62fe7d36b22667f834982d8dec7d2d5cd7))

## [1.1.1](https://github.com/camptocamp/terraform-azure-flexible-server/compare/v1.1.0...v1.1.1) (2023-12-13)


### Bug Fixes

* **maintenance:** change default maintenance window ([5084b58](https://github.com/camptocamp/terraform-azure-flexible-server/commit/5084b586b71ea2270a767d0638305ec79c7eeb8c))

## [1.1.0](https://github.com/camptocamp/terraform-azure-flexible-server/compare/v1.0.4...v1.1.0) (2023-02-23)


### Features

* allow kv, dns zone and snet names to be defined by user ([#12](https://github.com/camptocamp/terraform-azure-flexible-server/issues/12)) ([d9a66dc](https://github.com/camptocamp/terraform-azure-flexible-server/commit/d9a66dc17fcff87022937d62028854cddf766f9c))

## [1.0.3](https://github.com/camptocamp/terraform-azure-flexible-server/compare/v1.0.2...v1.0.3) (2023-01-10)


### Continuous Integration

* add replease-please workflow ([#9](https://github.com/camptocamp/terraform-azure-flexible-server/issues/9)) ([bc815b0](https://github.com/camptocamp/terraform-azure-flexible-server/commit/bc815b0ab5961505e7ee6a25b4cefb596552486a))
