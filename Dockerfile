FROM tomcat:8.0.20-jre8
MAINTAINER Mikel Egaña Aranguren <mikel.egana.aranguren@gmail.com>

RUN sed -i s/sid/stretch/ /etc/apt/sources.list
RUN apt-get update && apt-get install -y vim man cron

COPY backup.sh /usr/local/tomcat/
RUN chmod +x /usr/local/tomcat/backup.sh

RUN sed -i '$d' /etc/crontab
RUN "echo '00 * * * * root /usr/local/tomcat/backup.sh  2>&1|tee -a /usr/local/data/backup.log' >> /etc/crontab"

COPY blazegraph-war/target/blazegraph-war-2.1.4.war /usr/local/tomcat/webapps/blazegraph.war

EXPOSE 8080
