FROM tomcat:8.0.20-jre8
MAINTAINER Mikel Egaña Aranguren <mikel.egana.aranguren@gmail.com>

# I will need vim
RUN sed -i s/sid/stretch/ sources.list
RUN apt-get update && apt-get install vim 

ADD crontab /etc/cron.d/blazegraph

COPY backup.sh /usr/local/tomcat/
RUN chmod +x /usr/local/tomcat/backup.sh

COPY blazegraph-war/target/blazegraph-war-2.1.4.war /usr/local/tomcat/webapps/blazegraph.war


EXPOSE 8080
