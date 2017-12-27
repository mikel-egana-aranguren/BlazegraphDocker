# https://github.com/mikel-egana-aranguren/BlazegraphDocker/tree/origin/READWRITE-WAR-BLAZEGRAPH_RELEASE_2_1_4

FROM tomcat:8.0.20-jre8
MAINTAINER Mikel Egaña Aranguren <mikel.egana.aranguren@gmail.com>

COPY backup.sh /root/
RUN chmod +x /root/backup.sh
COPY cronblzgbackup /etc/cron.d/cronblzgbackup

COPY blazegraph-war/target/blazegraph-war-2.1.4.war /usr/local/tomcat/webapps/blazegraph.war

#RUN sed -i s/sid/stretch/ /etc/apt/sources.list
RUN apt-get update && apt-get install -y cron

RUN crontab /etc/cron.d/cronblzgbackup

CMD ["cron", "-f"]

EXPOSE 8080
