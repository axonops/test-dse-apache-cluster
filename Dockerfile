# Use a base image with Java
FROM openjdk:11-jre-slim

# Set the working directory in the container
WORKDIR /app

# Copy the executable JAR into the container
COPY target/executable-jar-1.0-jar-with-dependencies.jar /app

# Set the entry point to run your application
ENTRYPOINT ["java", "-jar", "executable-jar-1.0-jar-with-dependencies.jar", "10.7.1.11:9042", "omega", "LOCAL_QUORUM", "cassandra", "cassandra"]
