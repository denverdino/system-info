# System Info of JVM

This is sample project to display the CPU/Memory resources for JVM of Tomcat.


## Sample

```
docker run -v $PWD:/usr/local/tomcat/webapps/system-info -p 8080:8080 tomcat:9-jre8
```