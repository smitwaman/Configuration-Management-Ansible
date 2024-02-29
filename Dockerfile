# Use an OpenJDK base image
FROM openjdk:11-jdk-slim

# Set the working directory in the container
WORKDIR /usr/src/app

# Copy the source code from the host into the container
COPY /ansible/src /usr/src/app/src

# Compile the Java code
RUN javac /usr/src/app/src/java/hello/Application.java

# Define the command to run your Java application when the container starts
CMD ["java", "-cp", "src","main", "Application.java"]
