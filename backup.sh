#!/bin/sh

rm -Rf /usr/local/data/backup.jnl
curl \
          --data-urlencode "file=/usr/local/data/backup.jnl" \
          --data-urlencode "compress=false" \
          --data-urlencode "block=true" \
          http://localhost:8080/blazegraph/backup  

