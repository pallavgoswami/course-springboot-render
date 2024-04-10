FROM maven:3.8.7-eclipse-temurin-19 AS build
COPY . .
RUN mvn clean package -DskipTests

FROM openjdk:19-ea-19-jdk-slim
COPY --from=build /target/springrest-0.0.1-SNAPSHOT.jar springrest.jar
EXPOSE 9091
ENTRYPOINT [ "java","-jar","springrest.jar"  ]