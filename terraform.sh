set -ex
docker run -it \
-v $(pwd):/go/src/github.com/mikhailadvani/terraform-workshop \
-w /go/src/github.com/mikhailadvani/terraform-workshop terraform-workshop:latest \
$@
