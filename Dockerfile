# Use an OpenJDK base image
FROM maven:3.6.3-openjdk-11-slim AS build

# Set the working directory in the container
WORKDIR /usr/src/app

# Copy the source code from the host into the container
COPY src/ /usr/src/app/src
COPY pom.xml /usr/src/app

# Resolve Maven dependencies and compile the Java code
RUN mvn -B -f /usr/src/app/pom.xml clean package -DskipTests

# Use a lightweight base image
FROM openjdk:11-jre-slim

# Set the working directory in the container
WORKDIR /usr/src/app

# Copy the compiled Java application from the build stage
COPY --from=build /usr/src/app/target/spring-boot-app.jar /usr/src/app/spring-boot-app.jar

# Expose the port the Spring Boot application will run on
EXPOSE 8080

# Define the command to run your Spring Boot application when the container starts
CMD ["java", "-jar", "spring-boot-app.jar"]
