set -ex
ROOT_MODULE=$1
shift
docker run -it \
-v $(pwd):/go/src/github.com/mikhailadvani/terraform-workshop \
-w /go/src/github.com/mikhailadvani/terraform-workshop/$ROOT_MODULE \
mikhailadvani/terraform-workshop:latest \
$@
