## Build Blazegraph WAR 

Change:

`/bigdata-war-html/src/main/resources/RWStore.properties`
`/bigdata-war-html/src/main/webapp/WEB-INF/RWStore.properties`

Adding to both: 

`com.bigdata.journal.AbstractJournal.file=/opt/blazegraph.jnl`

Set readOnly to true at `/bigdata-war-html/src/main/webapp/WEB-INF/web.xml`: 

```
  <context-param>
   <description>When true, the REST API will not permit mutation operations.</description>
   <param-name>readOnly</param-name>
   <param-value>true</param-value>
  </context-param>
```
   
Run as maven install in this order:
1. `/bigdata-war-html/pom.xml`
2. `/blazegraph-war/pom.xml`

Deploy the war at `blazegraph-war/target/blazegraph-war-2.1.4.war` in Tomcat.