resource "oci_core_instance" "flex_instance" {
  compartment_id      = var.compartment_id
  availability_domain = var.availability_domain
  display_name        = "Instancia_Flexível_OCI"
  shape               = var.instance_shape

  source_details {
    source_type = "image"
  }

  create_vnic_details {
    subnet_id        = var.subnet_ocid # Subnet já existente
    assign_public_ip = true            # Se quiser atribuir um IP público
    display_name     = "vnic_bastion_01"
  }

  shape_config {
    ocpus         = var.min_cpu_core
    memory_in_gbs = var.memory_in_gb
  }
}