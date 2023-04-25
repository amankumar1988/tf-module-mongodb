resource "aws_docdb_cluster" "docdb" {
  cluster_identifier      = "robot-${var.ENV}-docdb"
  engine                  = "docdb"
  master_username         = "admin1"
  master_password         = "roboshop1"
  # backup_retention_period = 5       // Commenting this in lab we don't need it.
  # preferred_backup_window = "07:00-09:00"
  skip_final_snapshot     = true
}

# Create Subnet Group needed to host the docdb cluster

resource "aws_docdb_subnet_group" "docdb_sgbnet_group[]" {
  name       = "robot-${var.ENV}-docdb_sgbnet_group"
  subnet_ids = [aws_subnet.frontend.id, aws_subnet.backend.id]

  tags = {
    Name = "My docdb subnet group"
  }
}