#!/bin/sh

alias cp=cp
/opt/lod/scripts/query_11.sh stop
sleep 10
cp -rf /datos/lod/backup/blazegraph.jnl
/datos/lod/blazegraph_query_11/blazegraph.jnl
/opt/lod/scripts/query_11.sh start
