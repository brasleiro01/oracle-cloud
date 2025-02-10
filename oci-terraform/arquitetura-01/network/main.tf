# main.tf
resource "oci_core_vcn" "vcn01" {
  compartment_id = var.compartment_id
  cidr_block     = var.vcn_cidr_block
  display_name   = "vcn-01"
}

resource "oci_core_subnet" "subnet_01" {
  cidr_block     = var.subnet_01_cidr
  compartment_id = var.compartment_id
  vcn_id         = oci_core_vcn.vcn01.id
  display_name   = "subnet-01-public"
}

resource "oci_core_subnet" "subnet_02" {
  cidr_block     = var.subnet_02_cidr
  compartment_id = var.compartment_id
  vcn_id         = oci_core_vcn.vcn01.id
  display_name   = "subnet-02-public"
}

resource "oci_core_subnet" "subnet_03" {
  cidr_block     = var.subnet_03_cidr
  compartment_id = var.compartment_id
  vcn_id         = oci_core_vcn.vcn01.id
  display_name   = "subnet-03-private"
}

resource "oci_core_internet_gateway" "internet_gateway" {
  compartment_id = var.compartment_id
  vcn_id         = oci_core_vcn.vcn01.id
  enabled        = true
  display_name   = "IG-vcn-01"
}

resource "oci_core_route_table" "route_table_01" {
  compartment_id = var.compartment_id
  vcn_id         = oci_core_vcn.vcn01.id
  display_name   = "RT-01-vcn-01"

  route_rules {
    network_entity_id = oci_core_internet_gateway.internet_gateway.id
    destination       = "0.0.0.0/0"
  }
}

resource "oci_core_security_list" "security_list_01" {
  compartment_id = var.compartment_id
  vcn_id         = oci_core_vcn.vcn01.id
  display_name   = "security-list-01"

  egress_security_rules {
    protocol    = "all"
    destination = "0.0.0.0/0"
  }

  ingress_security_rules {
    protocol = "6"
    source   = "0.0.0.0/0"
  }
}