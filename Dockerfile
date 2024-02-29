# Use an OpenJDK base image
FROM openjdk:11-jdk-slim AS build

# Set the working directory in the container
WORKDIR /usr/src/app

# Copy the Maven project files
COPY pom.xml .
COPY src ./src

# Build the project with Maven
RUN mvn clean package -DskipTests

# Use a lightweight base image
FROM openjdk:11-jre-slim

# Set the working directory in the container
WORKDIR /usr/src/app

# Copy the JAR file from the build stage
COPY --from=build /usr/src/app/target/your-project-name.jar ./app.jar

# Define the command to run your Java application when the container starts
CMD ["java", "-jar", "app.jar"]
