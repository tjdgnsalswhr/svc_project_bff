FROM openjdk:8-jdk-alpine
ADD target/svc-2.0.1-SNAPSHOT.war svc-project-web-bff.war
ENV JAVA_OPTS=""
ENTRYPOINT ["java","-war","/svc-project-web-bff.war"]