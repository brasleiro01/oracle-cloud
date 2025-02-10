variable "tenancy_ocid" {}

variable "user_ocid" {}

variable "fingerprint" {}

variable "private_key_path" {}

variable "region" {}

variable "compartment_id" {}

# compute instance parameters
variable "instance_ad_number" {
  description = "O número do domínio de disponibilidade da instância. Se nenhum for fornecido, ele começará com AD-1 e continuará em round-robin."
  type        = number
  default     = 1
}

variable "instance_count" {
  description = "Número de instâncias idênticas a serem iniciadas a partir de um único módulo."
  type        = number
  default     = 1
}

variable "instance_display_name" {
  description = "(Atualizável) Um nome amigável para a instância. Não precisa ser exclusivo e é alterável."
  type        = string
  default     = "Bastion"
}

variable "instance_flex_memory_in_gbs" {
  type        = number
  description = "(Atualizável) A quantidade total de memória disponível para a instância, em gigabytes."
  default     = null
}

variable "instance_flex_ocpus" {
  type        = number
  description = "(Atualizável) O número total de OCPUs disponíveis para a instância."
  default     = null
}

variable "instance_state" {
  type        = string
  description = "(Atualizável) O estado de destino para a instância. Pode ser definido como RUNNING ou STOPPED."
  default     = "RUNNING"

  validation {
    condition     = contains(["RUNNING", "STOPPED"], var.instance_state)
    error_message = "Accepted values are RUNNING or STOPPED."
  }
}

variable "shape" {
  description = "The shape of an instance."
  type        = string
  default     = "VM.Standard.A1.Flex"
}

variable "baseline_ocpu_utilization" {
  description = "(Atualizável) A utilização de OCPU de linha de base para uma instância de VM de subnúcleo com capacidade de burst"
  type        = string
  default     = "BASELINE_1_1"
}

variable "source_ocid" {
  description = "O OCID de uma imagem ou volume de inicialização a ser usado, dependendo do valor de source_type."
  type        = string
  default     = "ocid1.image.oc1.sa-saopaulo-1.aaaaaaaaykvirs4bqtdfwsudapfnmgafbn7dkuv3vz3nqfnktx7nypktmk2q"
}

variable "source_type" {
  description = "O tipo de origem da instância."
  type        = string
  default     = "image"
}

# operating system parameters
variable "ssh_public_keys" {
  description = "Chaves SSH públicas a serem incluídas no arquivo ~/.ssh/authorized_keys para o usuário padrão na instância. Para fornecer várias chaves, consulte docs/instance_ssh_keys.adoc"
  type        = string
  default     = null
}

# networking parameters
variable "public_ip" {
  description = "Se deve criar um IP público para anexar ao vnic primário e qual tempo de vida. Os valores válidos são NONE, RESERVED ou EPHEMERAL."
  type        = string
  default     = "NONE"
}

# storage parameters
variable "boot_volume_backup_policy" {
  description = "Escolha entre as políticas de backup padrão: ouro, prata, bronze. Use desabilitado para afetar nenhuma política de backup no Boot Volume."
  type        = string
  default     = "disabled"
}

variable "block_storage_sizes_in_gbs" {
  description = "Tamanhos de volumes a serem criados e anexados a cada instância."
  type        = list(string)
  default     = [50]
}
