export ENV="dev"

echo "Create s3 bucket for state resources"
cd aws/state_resources/s3
rm -rf .terraform
terraform init
terraform workspace new $ENV || terraform workspace select $ENV
terraform plan
terraform apply -input=false -auto-approve

echo "dynamo"
cd ../dynamoDB
rm -rf .terraform
terraform init
terraform workspace new $ENV || terraform workspace select $ENV
terraform plan
terraform apply -input=false -auto-approve

echo "cicd user"
cd ../../iam/ci-deployment-user
rm -rf .terraform
terraform init
terraform workspace new $ENV || terraform workspace select $ENV
terraform plan
terraform apply -input=false -auto-approve
terraform output -json

echo "Generating acccess key for cicd"
# aws iam create-access-key --user-name glasgow-cannon-2-ci-user-$ENV
terraform state pull | jq '.resources[] | select(.type == "aws_iam_access_key") | .instances[0].attributes'
echo "Copy the keys to github secrets"

echo "Create s3 bucket for pipe to use"
cd ../../s3
rm -rf .terraform
terraform init
terraform workspace new $ENV || terraform workspace select $ENV
terraform plan
terraform apply -input=false -auto-approve
