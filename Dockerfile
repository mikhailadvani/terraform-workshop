FROM hashicorp/terraform:0.11.14 AS terraform
FROM golang:1.12.6-alpine3.10
COPY --from=terraform /bin/terraform /bin
RUN apk add --update git python3 bash gcc && \
    python3 -m pip install --upgrade pip && \
    python3 -m pip install awscli
RUN go get -v github.com/stretchr/testify/assert && \
    go get -v github.com/gruntwork-io/terratest/modules/aws && \
    go get -v github.com/gruntwork-io/terratest/modules/random && \
    go get -v github.com/gruntwork-io/terratest/modules/terraform
ENV CGO_ENABLED=0
RUN go version && \
    aws --version && \
    terraform version
ENTRYPOINT ["terraform"]
