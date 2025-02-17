resource "oci_core_security_list" "security_list_01" {
  compartment_id = var.compartment_id
  vcn_id         = oci_core_vcn.vcn01.id
  display_name   = "SL-Bastion"

  egress_security_rules {
    protocol    = "all"
    destination = "0.0.0.0/0"
  }

  ingress_security_rules {
    protocol = "1"
    source   = "0.0.0.0/0"
  }

  ingress_security_rules {
    protocol = "6"
    source   = "0.0.0.0/0"
    tcp_options {
      source_port_range {
        max = "22"
        min = "22"
      }
    }
  }
}

resource "oci_core_security_list" "security_list_02" {
  compartment_id = var.compartment_id
  vcn_id         = oci_core_vcn.vcn01.id
  display_name   = "SL-LB"

  egress_security_rules {
    protocol    = "all"
    destination = "0.0.0.0/0"
  }

  ingress_security_rules {
    protocol = "6"
    source   = "0.0.0.0/0"
    tcp_options {
      source_port_range {
        max = "80"
        min = "80"
      }
    }
  }
}

resource "oci_core_security_list" "security_list_03" {
  compartment_id = var.compartment_id
  vcn_id         = oci_core_vcn.vcn01.id
  display_name   = "SL-Web-Server"

  egress_security_rules {
    protocol    = "all"
    destination = "0.0.0.0/0"
  }

  ingress_security_rules {
    protocol = "all"
    source   = "10.0.0.0/24"
  }

  ingress_security_rules {
    protocol = "all"
    source   = "10.0.1.0/24"
  }

  ingress_security_rules {
    protocol = "all"
    source   = "10.0.2.0/24"
  }
}