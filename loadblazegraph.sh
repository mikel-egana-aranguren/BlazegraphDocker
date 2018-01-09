#!/bin/sh

#alias cp=cp
/opt/lod/scripts/initblazegraph.sh sto


/opt/apache-tomcat-8.0.48/bin/catalina.sh stop

sleep 10

cp -rf /usr/local/data/backup.jnl /opt/blazegraph.jnl

/opt/lod/scripts/initblazegraph.sh start

/opt/apache-tomcat-8.0.48/bin/catalina.sh run
