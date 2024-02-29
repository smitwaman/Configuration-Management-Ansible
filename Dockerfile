# Use Maven to build the application
FROM maven:3.8.3-openjdk-17 AS build

# Set the working directory in the container
WORKDIR /usr/src/app

# Copy the Maven project files
COPY pom.xml .
COPY src ./src

# Build the application
RUN mvn clean package -DskipTests

# Use AdoptOpenJDK as base image for runtime
FROM adoptopenjdk/openjdk17:alpine-jre

# Set the working directory in the container
WORKDIR /usr/src/app

# Copy the compiled JAR file from the build stage to the runtime image
COPY --from=build /usr/src/app/target/springboot.jar ./app.jar

# Expose the port the Spring Boot application will listen on
EXPOSE 8080

# Define the command to run the application when the container starts
CMD ["java", "-jar", "app.jar"]
