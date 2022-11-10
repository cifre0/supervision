FROM ubuntu
ENV DEBIAN_FRONTEND="noninteractive"
ENV DEBCONF_NOWARNINGS="yes"
RUN apt-get update && apt-get install -y --no-install-recommends apt-utils && apt-get install -y nginx jq
RUN mkdir -p -m 0644 /etc/script
# Add the script 
ADD ADD https://raw.githubusercontent.com/cifre0/supervision/main/statuscake/scriptCrontab.sh /etc/script/scriptCrontab.sh
# Give execution rights on the cron scripts
RUN chmod 0644 /etc/script/scriptCrontab.sh
# Install Cron
RUN apt-get -y install cron 
# Add the cron job
# RUN crontab -l | { cat; echo '3  *  *  *  * root curl -X POST "https://push.statuscake.com/?PK=7eed99d04845a40&TestID=6678247&time=0"'; } | crontab -
ADD https://raw.githubusercontent.com/cifre0/supervision/main/statuscake/pushCrontab /etc/cron.d/pushCrontabStatuscake
RUN chmod 0644 /etc/cron.d/pushCrontabStatuscake
CMD crontab /etc/cron.d/pushCrontabStatuscake
# Run the command on container startup
CMD cron
