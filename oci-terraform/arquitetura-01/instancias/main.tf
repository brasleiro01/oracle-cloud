resource "oci_core_instance" "flex_instance" {
  compartment_id     = var.compartment_id
  availability_domain = var.availability_domain
  display_name       = "Instancia_Flexível_OCI"
  shape              = var.instance_shape

  source_details {
    source_type = "image"
    image_id    = var.image_ocid  # OCID da imagem
  }

  create_vnic_details {
    subnet_id         = var.subnet_ocid   # Subnet já existente
    assign_public_ip  = true  # Se quiser atribuir um IP público
    display_name      = "vnic_instancia_flex"
  }

  shape_config {
    ocpus     = var.min_cpu_core
    memory_in_gbs = var.memory_in_gb
  }

  # Quando você deseja usar a flexibilidade do shape, você pode configurar "min" e "max" CPUs
  instance_configuration {
    ocpus     = var.min_cpu_core
    memory_in_gbs = var.memory_in_gb
  }
}

# VNIC para a instância
resource "oci_core_vnic" "vnic" {
  subnet_id = var.subnet_ocid
  display_name = "vnic_instancia_flex"
  assign_public_ip = true
}