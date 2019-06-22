set -ex

docker run -it \
-v ~/.aws/credentials:/root/.aws/credentials \
-e AWS_PROFILE=$AWS_PROFILE \
--entrypoint bash \
terraform-workshop:latest \
-c "aws --version; aws sts get-caller-identity; aws s3 ls"
