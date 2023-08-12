sh install-command-runner.sh

aws cloudformation create-stack --stack-name "Tekweb IDE" --template-body ./yamls/cloud-9.yaml