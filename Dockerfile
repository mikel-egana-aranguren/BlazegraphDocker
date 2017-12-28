# https://github.com/mikel-egana-aranguren/BlazegraphDocker/tree/origin/READWRITE-WAR-BLAZEGRAPH_RELEASE_2_1_4
# Heavily reusing parts from https://github.com/cmoro-deusto/docker-tomcat8

FROM ubuntu:16.04
MAINTAINER Mikel Egaña Aranguren <mikel.egana.aranguren@gmail.com>

RUN rm /bin/sh && ln -s /bin/bash /bin/sh

RUN apt-get update && \
apt-get install -y build-essential curl wget software-properties-common cron

RUN \
echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | debconf-set-selections && \
add-apt-repository -y ppa:webupd8team/java && \
apt-get update && \
apt-get install -y oracle-java8-installer wget unzip tar && \
rm -rf /var/lib/apt/lists/* && \
rm -rf /var/cache/oracle-jdk8-installer

ENV JAVA_HOME /usr/lib/jvm/java-8-oracle

RUN wget --quiet --no-cookies http://ftp.cixug.es/apache/tomcat/tomcat-8/v8.0.48/bin/apache-tomcat-8.0.48.tar.gz -O /tmp/tomcat.tgz && \
tar xzvf /tmp/tomcat.tgz -C /opt && \
mv /opt/apache-tomcat-8.0.48 /opt/tomcat && \

RUN mkdir /usr/local/data
COPY backup.sh /usr/local/data/
RUN chmod +x /usr/local/data/backup.sh

COPY cronblzgbackup /etc/cron.d/cronblzgbackup
RUN chmod a-w /etc/cron.d/cronblzgbackup
CMD service cron restart

COPY blazegraph-war/target/blazegraph-war-2.1.4.war /opt/tomcat/webapps/blazegraph.war

RUN /opt/tomcat/bin/shutdown.sh
RUN /opt/tomcat/bin/startup.sh

EXPOSE 8080
