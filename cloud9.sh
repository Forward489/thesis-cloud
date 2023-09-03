#run "git clone https://github.com/Forward489/thesis-cloud.git && cd thesis-cloud && sh cloud9.sh

aws cloudformation deploy \
--template-file ./yamls/cloud-9.yaml \
--stack-name TekwebCloud9 \
--capabilities CAPABILITY_NAMED_IAM

security=`aws ec2 describe-instances --filters 'Name=tag:Name,Values=*cloud9*' --output text --query 'Reservations[*].Instances[*].[InstanceId,NetworkInterfaces[*].Groups[*].GroupId,NetworkInterfaces[*].SubnetId][0][1]'`

aws ec2 authorize-security-group-ingress \
--group-id $security \
--protocol tcp \
--port 80 \
--cidr 0.0.0.0/0


# instance=`aws ec2 describe-instances --filters "Name=tag:Name,Values=*cloud9*" --query "Reservations[].Instances[].InstanceId" --output text`

# aws ec2 associate-iam-instance-profile --iam-instance-profile Name=LabInstanceProfile --instance-id $instance

# aws ssm send-command --document-name "AWS-RunShellScript" --instance-ids $instance --parameters commands="bash ./startup-kit-cloud9.sh" --output text

# aws ssm send-command --document-name "AWS-RunShellScript" --instance-ids i-055db2074119005a1 --parameters commands="bash ./startup-kit-cloud9.sh"

cd ..

sudo rm -r thesis-cloud