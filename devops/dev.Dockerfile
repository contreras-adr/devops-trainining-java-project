#
# Build stage
#
FROM scalian_training-java-hello-world-build:0.0.1 AS build

#
# Package stage
#
FROM openjdk:11-jre-slim
COPY --from=build /home/app/target/spring-boot-2-hello-world-1.0.2-SNAPSHOT.jar /usr/local/lib/app.jar
ENTRYPOINT ["java","-jar","/usr/local/lib/app.jar"]