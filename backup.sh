#!/bin/sh


curl \
          --data-urlencode "file=/usr/local/tomcat/backup.jnl" \
          --data-urlencode "compress=true" \
          --data-urlencode "block=true" \
          http://localhost:8080/blazegraph/backup  

# todo!
# cp /usr/local/tomcat/backup.jnl /path of shared volume
