# https://github.com/mikel-egana-aranguren/BlazegraphDocker/tree/origin/READWRITE-WAR-BLAZEGRAPH_RELEASE_2_1_4

FROM mlaccetti/docker-oracle-java8-ubuntu-16.04
MAINTAINER Mikel Egaña Aranguren <mikel.egana.aranguren@gmail.com>

RUN apt-get update && apt-get install -y cron curl

COPY backup.sh /root/
RUN chmod +x /root/backup.sh
COPY cronblzgbackup /etc/cron.d/cronblzgbackup
RUN chmod a-w /etc/cron.d/cronblzgbackup
RUN cron -f &

WORKDIR /opt
RUN wget http://ftp.cixug.es/apache/tomcat/tomcat-8/v8.0.48/bin/apache-tomcat-8.0.48.tar.gz
RUN tar -xvzf apache-tomcat-8.0.48.tar.gz
COPY blazegraph-war/target/blazegraph-war-2.1.4.war /opt/apache-tomcat-8.0.48/webapps/blazegraph.war
EXPOSE 8080
CMD apache-tomcat-8.0.48/bin/catalina.sh run


