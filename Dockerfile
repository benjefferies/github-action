FROM node:current-alpine3.11

ENV LC_ALL C.UTF-8
ENV LANG C.UTF-8

LABEL version="1.0.0"
LABEL repository="https://github.com/serverless/github-action"
LABEL homepage="https://github.com/serverless/github-action"
LABEL maintainer="Serverless, Inc. <hello@serverless.com> (https://serverless.com)"

LABEL "com.github.actions.name"="Serverless"
LABEL "com.github.actions.description"="Wraps the Serverless Framework to enable common Serverless commands."
LABEL "com.github.actions.icon"="zap"
LABEL "com.github.actions.color"="red"

RUN npm i -g serverless@1.54.0 && \
  apk update && apk add bash && \
  apk add --no-cache --repository=http://dl-cdn.alpinelinux.org/alpine/v3.10/main/ python3=3.7.5-r1 && \
  pip3 install pipenv
ENTRYPOINT ["serverless"]
