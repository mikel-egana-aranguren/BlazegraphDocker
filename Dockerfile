FROM tomcat:8.0.20-jre8
MAINTAINER Mikel Egaña Aranguren <mikel.egana.aranguren@gmail.com>

COPY blazegraph-war/target/blazegraph-war-2.1.4.war /usr/local/tomcat/webapps/blazegraph.war
