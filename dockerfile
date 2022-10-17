FROM ubuntu
EXPOSE 8080
ENV DEBIAN_FRONTEND="noninteractive"
ENV DEBCONF_NOWARNINGS="yes"
RUN apt-get update && apt-get install -y --no-install-recommends apt-utils && apt-get install -y nginx jq
