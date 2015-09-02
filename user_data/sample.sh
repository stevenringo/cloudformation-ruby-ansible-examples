#!/bin/bash -xe
yum update -y aws-cfn-bootstrap
/opt/aws/bin/cfn-init -v  --stack {{aws_stack_name}} --resource LaunchConfig  --region  {{aws_region_name}}
/opt/aws/bin/cfn-signal -e $?  --stack  {{aws_stack_name}} --resource WebServerGroup  --region  {{aws_region_name}}
