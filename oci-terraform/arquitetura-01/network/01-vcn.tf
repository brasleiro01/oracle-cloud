resource "oci_core_vcn" "vcn01" {
  compartment_id = var.compartment_id
  cidr_block     = var.vcn_cidr_block
  display_name   = "vcn-01"
}