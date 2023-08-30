#run "git clone https://github.com/Forward489/thesis-cloud.git && cd thesis-cloud && sh bdl.sh"

aws cloudformation deploy \
--template-file ./yamls/bdl.yaml \
--stack-name BDL

security=`aws ec2 describe-instances --filters 'Name=tag:Name,Values=*BDL*' --output text --query 'Reservations[*].Instances[*].[InstanceId,NetworkInterfaces[*].Groups[*].GroupId,NetworkInterfaces[*].SubnetId][0][1]'`

aws ec2 authorize-security-group-ingress \
--group-id $security \
--protocol tcp \
--port 3389 \
--cidr 0.0.0.0/0

cd ..
sudo rm -r thesis-cloud