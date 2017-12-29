#!/bin/sh

#alias cp=cp
/opt/lod/scripts/initblazegraph.sh stop
sleep 10
cp -rf /datos/lod/backup/blazegraph.jnl /datos/lod/blazegraph_query_11/blazegraph.jnl
/opt/lod/scripts/initblazegraph.sh start
