# variables.tf
variable "tenancy_ocid" {}

variable "user_ocid" {}

variable "fingerprint" {}

variable "private_key_path" {}

variable "region" {}

variable "compartment_id" {}

variable "vcn_cidr_block" {
  description = "Bloco CIDR para a VCN"
  type        = string
  default     = "10.0.0.0/16"
}

variable "subnet_01_cidr" {
  description = "Bloco CIDR para a sub-rede pública (bastion)"
  type        = string
  default     = "10.0.0.0/24"
}

variable "subnet_02_cidr" {
  description = "Bloco CIDR para a sub-rede pública (loadbalance)"
  type        = string
  default     = "10.0.1.0/24"
}

variable "subnet_03_cidr" {
  description = "Bloco CIDR para a sub-rede privada (webserv)"
  type        = string
  default     = "10.0.2.0/24"
}