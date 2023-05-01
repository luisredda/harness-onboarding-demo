FROM tomcat

ADD demo/target/demo-1.0.0-STABLE.war /usr/local/tomcat/webapps/
ADD demo/src/main/webapp /usr/local/tomcat/webapps/webapp

CMD ["catalina.sh", "run"]
EXPOSE 8080
