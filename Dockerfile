FROM tomcat:8.0.20-jre8
MAINTAINER Mikel Egaña Aranguren <mikel.egana.aranguren@gmail.com>

RUN mkdir -p /opt/tomcat/database

COPY backup.sh /usr/local/tomcat/
RUN chmod +x /usr/local/tomcat/backup.sh

# TODO: cron
# TODO: cp to shared volume

COPY blazegraph-war/target/blazegraph-war-2.1.4.war /usr/local/tomcat/webapps/blazegraph.war

