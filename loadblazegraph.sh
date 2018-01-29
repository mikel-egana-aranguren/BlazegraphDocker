#!/bin/sh

/opt/apache-tomcat-8.0.49/bin/catalina.sh stop

sleep 20

cp -rf /usr/local/data/backup.jnl /opt/blazegraph.jnl

/opt/apache-tomcat-8.0.49/bin/catalina.sh run &
