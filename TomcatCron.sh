#!/bin/sh

cron -f &
/opt/apache-tomcat-8.0.49/bin/catalina.sh run 

