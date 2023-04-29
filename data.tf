# Retrives the information from the remote state file

data "terraform_remote_state" "vpc" {
  backend = "s3"

  config = {
    bucket = "b53-tfstate-bucket-1"
    key    = "vpc/${var.ENV}/terraform.tfstate"
    region = "us-east-1"
    }
  }


data "aws_secretsmanager_secret" "secrets" {
  name = "roboshop/secrets"
}

data "aws_secretsmanager_secret_version" "secrets" {
  secret_id     = data.aws_secretsmanager_secret.secrets.id
}

output "example" {
  value = jsondecode(data.aws_secretsmanager_secret_version.secrets.secret_string)["DOCDB_USERNAME"]
}