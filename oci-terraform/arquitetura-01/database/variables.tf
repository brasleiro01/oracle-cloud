variable "tenancy_ocid" {}

variable "user_ocid" {}

variable "fingerprint" {}

variable "private_key_path" {}

variable "region" {}

variable "compartment_id" {}

variable "autonomous_database_display_name" {
  description = "Nome que será exibido após ser criado"
  type        = string
  default     = "PrimeiroDB"
}

variable "autonomous_database_is_free_tie" {
  description = "Define se será incluido no free tier ou não"
  type        = string
  default     = "true"
}

variable "autonomous_database_admin_password" {
  description = "Define senha de administrador"
  type        = string
  default     = "P@$$w0rd2024"
}

variable "autonomous_database_db_name" {
  description = "Nome da base de dados"
  type        = string
  default     = "primeirodb"
}

variable "autonomous_database_db_workload" {
  description = "Tipo de workload"
  type        = string
  default     = "DW"
}