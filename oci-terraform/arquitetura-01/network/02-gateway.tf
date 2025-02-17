resource "oci_core_internet_gateway" "internet_gateway" {
  compartment_id = var.compartment_id
  vcn_id         = oci_core_vcn.vcn01.id
  enabled        = true
  display_name   = "IG-vcn-01"
}

resource "oci_core_nat_gateway" "nat_gateway" {
  compartment_id = var.compartment_id
  vcn_id         = oci_core_vcn.vcn01.id
  display_name   = "NG-vcn-01"
}