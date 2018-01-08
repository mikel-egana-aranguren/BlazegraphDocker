#!/bin/sh

cron -f &
/opt/apache-tomcat-8.0.48/bin/catalina.sh run
sleep infinity 

