#!/bin/bash
git clone https://github.com/aws-cloudformation/aws-cloudformation-resource-providers-awsutilities-commandrunner.git
cd aws-cloudformation-resource-providers-awsutilities-commandrunner
curl -LO https://github.com/aws-cloudformation/aws-cloudformation-resource-providers-awsutilities-commandrunner/releases/latest/download/awsutility-cloudformation-commandrunner.zip
./scripts/register.sh --set-default