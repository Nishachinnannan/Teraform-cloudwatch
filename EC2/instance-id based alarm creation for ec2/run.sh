#!/bin/bash

var-1=$1
var-2=$2

echo $var-1
echo $var-2

#terraform init -input=false
#terraform plan -input=false -var-file 'instance=${var}' -lock=false
#terraform apply -input=false -var-file 'instance=${var}' -auto-approve




#terraform init -input=false
#terraform plan -input=false -var-file 'sns_topic_name=${var}' -lock=false
#terraform apply -input=false -var-file 'sns_topic_name=${var}' -auto-approve
