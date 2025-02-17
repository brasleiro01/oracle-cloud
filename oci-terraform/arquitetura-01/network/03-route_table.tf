resource "oci_core_route_table" "route_table_01" {
  compartment_id = var.compartment_id
  vcn_id         = oci_core_vcn.vcn01.id
  display_name   = "RT-Bastion"

  route_rules {
    network_entity_id = oci_core_internet_gateway.internet_gateway.id
    destination       = "0.0.0.0/0"
  }
}

resource "oci_core_route_table" "route_table_02" {
  compartment_id = var.compartment_id
  vcn_id         = oci_core_vcn.vcn01.id
  display_name   = "RT-LB"

  route_rules {
    network_entity_id = oci_core_internet_gateway.internet_gateway.id
    destination       = "0.0.0.0/0"
  }
}

resource "oci_core_route_table" "route_table_03" {
  compartment_id = var.compartment_id
  vcn_id         = oci_core_vcn.vcn01.id
  display_name   = "RT-Web"

  route_rules {
    network_entity_id = oci_core_nat_gateway.nat_gateway.id
    destination       = "0.0.0.0/0"
  }
}