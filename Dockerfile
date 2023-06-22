FROM gradle:7.1.1 AS build
COPY --chown=gradle:gradle . /home/ubuntu
WORKDIR /home/ubuntu

HEALTHCHECK NONE

FROM openjdk:8-jre-slim

RUN mkdir /app

COPY --from=build home/ubuntu/build/libs/*.jar /app/vulnerable-application.jar

ENTRYPOINT ["java", "-XX:+UnlockExperimentalVMOptions", "-XX:+UseCGroupMemoryLimitForHeap", "-Djava.security.egd=file:/dev/./urandom","-jar","/app/vulnerable-application.jar"] 
