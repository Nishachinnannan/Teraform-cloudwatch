#!/bin/bash

id=$1
sns=$2

terraform init -input=false
terraform plan -input=false -var=instance="${id}" -var=sns_topic_name="${sns}" -lock=false
terraform apply -input=false -var=instance="${id}" -var=sns_topic_name="${sns}" -auto-approve
