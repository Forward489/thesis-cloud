#run "git clone https://github.com/Forward489/thesis-cloud.git && cd thesis-cloud && sh bdl.sh"

aws cloudformation deploy \
--template-file ./yamls/bdl.yaml \
--stack-name BDL

cd ..
sudo rm -r thesis-cloud

# security=`aws ec2 describe-instances --filters 'Name=tag:Name,Values=*-*' --output text --query 'Reservations[*].Instances[*].[InstanceId,NetworkInterfaces[*].Groups[*].GroupId,NetworkInterfaces[*].SubnetId][0][1]'`