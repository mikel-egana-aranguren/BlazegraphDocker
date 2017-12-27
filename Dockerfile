FROM tomcat:8.0.20-jre8
MAINTAINER Mikel Egaña Aranguren <mikel.egana.aranguren@gmail.com>

RUN sed -i s/sid/stretch/ /etc/apt/sources.list
RUN apt-get update && apt-get install -y vim man cron

COPY backup.sh /etc/cron.hourly

COPY blazegraph-war/target/blazegraph-war-2.1.4.war /usr/local/tomcat/webapps/blazegraph.war

EXPOSE 8080
