#
# Build stage
#
FROM maven:3.8.6-openjdk-11-slim
COPY ./src /home/app/src
COPY ./pom.xml /home/app

WORKDIR /home/app

RUN mvn test

RUN mvn sonar:sonar \
  -Dsonar.projectKey=java-example-manual \
  -Dsonar.host.url=http://localhost:9009 \
  -Dsonar.login=0ccaba499738f2b7109139038a3b4fc94ea1c381

RUN mvn install



