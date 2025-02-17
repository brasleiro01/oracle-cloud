resource "oci_core_subnet" "subnet_01" {
  cidr_block        = var.subnet_01_cidr
  compartment_id    = var.compartment_id
  vcn_id            = oci_core_vcn.vcn01.id
  display_name      = "subnet-01"
  route_table_id    = oci_core_route_table.route_table_01.id
  security_list_ids = [oci_core_security_list.security_list_01.id]
}

resource "oci_core_subnet" "subnet_02" {
  cidr_block        = var.subnet_02_cidr
  compartment_id    = var.compartment_id
  vcn_id            = oci_core_vcn.vcn01.id
  display_name      = "subnet-02"
  route_table_id    = oci_core_route_table.route_table_02.id
  security_list_ids = [oci_core_security_list.security_list_02.id]
}

resource "oci_core_subnet" "subnet_03" {
  cidr_block        = var.subnet_03_cidr
  compartment_id    = var.compartment_id
  vcn_id            = oci_core_vcn.vcn01.id
  display_name      = "subnet-03"
  route_table_id    = oci_core_route_table.route_table_03.id
  security_list_ids = [oci_core_security_list.security_list_03.id]
  prohibit_public_ip_on_vnic = true
}