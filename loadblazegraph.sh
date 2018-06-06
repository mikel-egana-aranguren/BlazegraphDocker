#!/bin/sh

cp -rf /usr/local/data/blazegraph.jnl /opt/blazegraph.jnl

/opt/apache-tomcat-8.0.52/bin/catalina.sh run &
