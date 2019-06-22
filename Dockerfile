FROM hashicorp/terraform:0.11.14 AS terraform
FROM golang:1.12.6-alpine3.10
COPY --from=terraform /bin/terraform /bin
RUN apk add --update git python3 && \
    python3 -m pip install --upgrade pip && \
    python3 -m pip install awscli
RUN go version && \
    aws --version && \
    terraform version
