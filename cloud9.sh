# sh install-command-runner.sh

aws cloudformation deploy \
--template-file ./yamls/cloud-9.yaml \
--stack-name OfficialTekwebIDE

security=`aws ec2 describe-instances --filters 'Name=tag:Name,Values=*cloud9*' --output text --query 'Reservations[*].Instances[*].[InstanceId,NetworkInterfaces[*].Groups[*].GroupId,NetworkInterfaces[*].SubnetId][0][1]'`

aws ec2 authorize-security-group-ingress \
--group-id $security \
--protocol tcp \
--port 80 \
--cidr 0.0.0.0/0