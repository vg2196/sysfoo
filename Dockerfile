FROM maven:3.6.3-jdk-11-slim as build1
WORKDIR /opt/demo
COPY . /opt/demo
RUN mvn package -DskipTests

FROM tomcat:jre8-openjdk-slim-buster as run
WORKDIR /usr/local/tomcat
COPY --from=build1 /opt/demo/target/sysfoo.war webapps/ROOT.war