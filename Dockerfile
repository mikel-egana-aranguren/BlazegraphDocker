# https://github.com/mikel-egana-aranguren/BlazegraphDocker/tree/origin/READWRITE-WAR-BLAZEGRAPH_RELEASE_2_1_4

FROM tomcat:8.0.20-jre8
MAINTAINER Mikel Egaña Aranguren <mikel.egana.aranguren@gmail.com>

USER root

RUN sed -i s/sid/stretch/ /etc/apt/sources.list
RUN apt-get update && apt-get install -y cron vim rsyslog

COPY backup.sh /root/
RUN chmod +x /root/backup.sh

COPY cronblzgbackup /etc/cron.d/cronblzgbackup
RUN chmod a-w /etc/cron.d/cronblzgbackup
CMD service cron restart

COPY blazegraph-war/target/blazegraph-war-2.1.4.war /usr/local/tomcat/webapps/blazegraph.war

EXPOSE 8080
