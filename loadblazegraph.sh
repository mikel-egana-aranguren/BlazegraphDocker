#!/bin/sh

#alias cp=cp
/opt/lod/scripts/initblazegraph.sh stop
sleep 10
cp -rf /usr/local/data/backup.jnl /opt/blazegraph.jnl
/opt/lod/scripts/initblazegraph.sh start
