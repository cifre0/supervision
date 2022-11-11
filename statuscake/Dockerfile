FROM ubuntu
#ENV DEBIAN_FRONTEND="noninteractive"
#ENV DEBCONF_NOWARNINGS="yes"
#RUN apt-get update && apt-get install -y --no-install-recommends apt-utils && apt-get install -y nginx jq
#RUN mkdir -p -m 0644 /etc/script
RUN apt-get -y update && apt-get -y install nginx
EXPOSE 80/tcp
CMD ["/usr/sbin/nginx", "-g", "daemon off;"]

# Create the log file to be able to run tail
RUN touch /var/log/cron.log
# Add the script
ADD https://raw.githubusercontent.com/cifre0/supervision/main/statuscake/scriptCrontab.sh /etc/script/scriptCrontab.sh
# Give execution rights on the cron scripts
RUN chmod 0644 /etc/script/scriptCrontab.sh
# Install Cron
RUN apt-get -y install cron curl
# Add the cron job
RUN crontab -l | { cat; echo "* * * * * bash /etc/script/scriptCrontab.sh"; } | crontab -
#ADD https://raw.githubusercontent.com/cifre0/supervision/main/statuscake/pushCrontabStatuscake /etc/cron.d/pushCrontabStatuscake
#RUN chmod 0644 /etc/cron.d/pushCrontabStatuscake
#RUN crontab /etc/cron.d/pushCrontabStatuscake
# Run the command on container startup
RUN cron
