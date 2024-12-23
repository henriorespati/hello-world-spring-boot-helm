# Use an official Maven image as the base image
FROM docker.io/maven:3.8.5-openjdk-17-slim AS build

# Set the working directory in the container
WORKDIR /app

# Copy the pom.xml and the project files to the container
COPY pom.xml .
COPY src ./src

# Build the application using Maven
RUN mvn clean package -DskipTests

# Use Red Hat UBI 8 with OpenJDK 17 as base image
FROM registry.access.redhat.com/ubi8/openjdk-17-runtime

# Set the working directory in the container
WORKDIR /deployments

# Copy the built JAR file from the previous stage to the container
COPY --from=build /app/target/*.jar ./application.jar

# Expose the port for client access
EXPOSE 8080

# Set the command to run the application
CMD ["java", "-jar", "application.jar"]