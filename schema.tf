resource "null_resource" "schema" {

  provisioner "local-exec" {
        command = <<EOF
        cd /tmp 
        curl -s -L -o /tmp/mongodb.zip "https://github.com/stans-robot-project/mongodb/archive/main.zip"
        unzip -o mongodb.zip
        cd mongodb-main
        wget https://s3.amazonaws.com/rds-downloads/rds-combined-ca-bundle.pem
        mongo --ssl --host ${aws_docdb_cluster.docdb.endpoint} --sslCAFile rds-combined-ca-bundle.pem --username admin1 --password Roboshop1 < catalogue.js
        mongo --ssl --host ${aws_docdb_cluster.docdb.endpoint} --sslCAFile rds-combined-ca-bundle.pem --username admin1 --password Roboshop1 <  users.js
        EOF
    }
}