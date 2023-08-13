#run "git clone https://github.com/Forward489/thesis-cloud.git && cd thesis-cloud && sh bdl.sh && cd .. && sudo rm -r thesis-cloud"

aws cloudformation deploy \
--template-file ./yamls/bdl.yaml \
--stack-name InstanceBDL