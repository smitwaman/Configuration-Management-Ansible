# Use an OpenJDK base image
FROM maven:3.8.3-openjdk-17

# Set the working directory in the container
WORKDIR /usr/src/app

# Copy the Maven project files
COPY pom.xml .
COPY src ./src

# Build the project with Maven
RUN mvn clean package -DskipTests

# Copy the JAR file from the build stage
COPY --from=build /usr/src/app/target/spring-boot-app.jar ./app.jar

# Define the command to run your Java application when the container starts
CMD ["java", "-jar", "app.jar"]
