FROM tomcat:8.0.20-jre8
MAINTAINER Mikel Egaña Aranguren <mikel.egana.aranguren@gmail.com>

COPY backup.sh /root/
RUN chmod +x /root/backup.sh

COPY cron /etc/cron.d

COPY blazegraph-war/target/blazegraph-war-2.1.4.war /usr/local/tomcat/webapps/blazegraph.war

RUN sed -i s/sid/stretch/ /etc/apt/sources.list
RUN apt-get update && apt-get install cron
RUN service cron start

EXPOSE 8080
