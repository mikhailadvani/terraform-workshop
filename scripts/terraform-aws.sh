set -ex
ROOT_MODULE=$1
shift
docker run -it \
-v $(pwd):/go/src/github.com/mikhailadvani/terraform-workshop \
-v ~/.aws/credentials:/root/.aws/credentials \
-e AWS_PROFILE=$AWS_PROFILE \
-w /go/src/github.com/mikhailadvani/terraform-workshop/$ROOT_MODULE \
terraform-workshop:latest \
$@
