# resource "aws_docdb_cluster" "docdb" {
#   cluster_identifier      = "robot-${var.ENV}-docdb"
#   engine                  = "docdb"
#   master_username         = "admin1"
#   master_password         = "roboshop1"
#   # backup_retention_period = 5       // Commenting this in lab we don't need it.
#   # preferred_backup_window = "07:00-09:00"
#   skip_final_snapshot     = true
# }

# Create Subnet Group needed to host the docdb cluster

resource "aws_docdb_subnet_group" "docdb_sgbnet_group" {
  name       = "robot-${var.ENV}-docdb_sgbnet_group"
  subnet_ids = data.terraform_remote_state.vpc.PRIVATE_SUBNET_IDS
  tags = {
    Name = "robot-${var.ENV}-docdb-subnet-group"
  }
}

output "output_ref"{
  value = data.terraform_remote_state.vpc
}