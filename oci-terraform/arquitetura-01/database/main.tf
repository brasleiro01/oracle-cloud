resource "oci_database_autonomous_database" "test_autonomous_database" {
  admin_password = var.autonomous_database_admin_password
  compartment_id = var.compartment_id
  display_name   = var.autonomous_database_display_name
  db_name        = var.autonomous_database_db_name
  is_free_tier   = var.autonomous_database_is_free_tie
  db_workload    = var.autonomous_database_db_workload
}
