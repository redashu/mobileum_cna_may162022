FROM  oraclelinux:8.4  as Stage1 
LABEL email=ashutoshh@linux.com
RUN yum install -y java-1.8.0-openjdk.x86_64 java-1.8.0-openjdk-devel.x86_64  maven && mkdir  /webapp
COPY .  /webapp/
WORKDIR  /webapp
RUN mvn clean package  
# above will build java web using maven and create target/WebApp.war  

FROM  tomcat 
COPY  --from=Stage1  /webapp/target/WebApp.war  /usr/local/tomcat/webapps/
# from first build stage i am taking a specific date 
EXPOSE 8080
# optional but just to tell docker engine that default port is 8080 for tomcat internal to docker only

