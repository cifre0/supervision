#!/bin/bash

# variable
TagName="vscript"
dockerFileName="dockerfile"
TokenPwdDocker=$(cat tokenTest)
login="achaib"
repoDockerHub="achaib/supervi"

# build an image
docker build -t $TagName -<<EOF
FROM ubuntu
EXPOSE 8080
ENV DEBIAN_FRONTEND="noninteractive"
ENV DEBCONF_NOWARNINGS="yes"
RUN apt-get update && apt-get install -y --no-install-recommends apt-utils && apt-get install -y nginx jq
EOF

# logout and login to the dockerHub
docker logout
echo $TokenPwdDocker | docker login --username $login --password-stdin
# tag images and then push into the repo dockerhub
docker tag $TagName $repoDockerHub":"$TagName
docker push $repoDockerHub":"$TagName