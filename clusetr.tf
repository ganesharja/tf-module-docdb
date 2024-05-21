# Creates DOCDB cluster
resource "aws_docdb_cluster" "docdb" {
  cluster_identifier      = "roboshop-${var.ENV}-docdb"
  engine                  = "docdb"
  master_username         = "admin1"
  master_password         = "roboshop1"
  preferred_backup_window = "07:00-09:00"
  skip_final_snapshot     = true                          # Value will be false in production. In lab, we will be using true
}

# Creates DocDB Subnet Group
resource "aws_docdb_subnet_group" "docdb" {
  name       = "roboshop-${var.ENV}-docdb-subnet-group"
  subnet_ids = data.terraform_remote_state.vpc.outputs.PRIVATE_SUBNET_IDS 

  tags = {
    Name = "roboshop-${var.ENV}-docdb-subnet-group"
  }
